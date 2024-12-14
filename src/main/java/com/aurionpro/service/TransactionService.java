package com.aurionpro.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.aurionpro.entity.PassbookEntity;

public class TransactionService {

	private Connection connection;

	public TransactionService(Connection connection) {
		this.connection = connection;
	}

	public boolean performTransaction(PassbookEntity transaction) throws SQLException {
		connection.setAutoCommit(false);
		try {
			switch (transaction.getTransactionType()) {
			case "CREDIT":
				return handleCredit(transaction);
			case "DEBIT":
				return handleDebit(transaction);
			case "TRANSFER":
				return handleTransfer(transaction);
			default:
				throw new SQLException("Invalid transaction type");
			}
		} catch (SQLException e) {
			connection.rollback();
			throw e;
		} finally {
			connection.setAutoCommit(true);
		}
	}

	private boolean handleCredit(PassbookEntity transaction) throws SQLException {
		// Update account balance
		String updateBalanceSQL = "UPDATE accounts SET balance = balance + ? WHERE account_number = ?";
		try (PreparedStatement pstmt = connection.prepareStatement(updateBalanceSQL)) {
			pstmt.setDouble(1, transaction.getAmount());
			pstmt.setString(2, transaction.getSenderAccountNumber());
			pstmt.executeUpdate();
		}

		// Get updated balance
		double newBalance = getAccountBalance(transaction.getSenderAccountNumber());
		transaction.setClosingBalance(newBalance);

		// Record in passbook
		return recordTransaction(transaction);
	}

	private boolean handleDebit(PassbookEntity transaction) throws SQLException {
		// Check sufficient balance
		double currentBalance = getAccountBalance(transaction.getSenderAccountNumber());
		if (currentBalance < transaction.getAmount()) {
			throw new SQLException("Insufficient balance");
		}

		// Update account balance
		String updateBalanceSQL = "UPDATE accounts SET balance = balance - ? WHERE account_number = ?";
		try (PreparedStatement pstmt = connection.prepareStatement(updateBalanceSQL)) {
			pstmt.setDouble(1, transaction.getAmount());
			pstmt.setString(2, transaction.getSenderAccountNumber());
			pstmt.executeUpdate();
		}

		// Get updated balance
		double newBalance = getAccountBalance(transaction.getSenderAccountNumber());
		transaction.setClosingBalance(newBalance);

		// Record in passbook
		return recordTransaction(transaction);
	}

	private boolean handleTransfer(PassbookEntity transaction) throws SQLException {
		// Check sufficient balance
		double currentBalance = getAccountBalance(transaction.getSenderAccountNumber());
		if (currentBalance < transaction.getAmount()) {
			throw new SQLException("Insufficient balance");
		}

		// Check if receiver account exists
		if (!accountExists(transaction.getReceiverAccountNumber())) {
			throw new SQLException("Receiver account does not exist");
		}

		// Debit from sender
		String debitSQL = "UPDATE accounts SET balance = balance - ? WHERE account_number = ?";
		try (PreparedStatement pstmt = connection.prepareStatement(debitSQL)) {
			pstmt.setDouble(1, transaction.getAmount());
			pstmt.setString(2, transaction.getSenderAccountNumber());
			pstmt.executeUpdate();
		}

		// Credit to receiver
		String creditSQL = "UPDATE accounts SET balance = balance + ? WHERE account_number = ?";
		try (PreparedStatement pstmt = connection.prepareStatement(creditSQL)) {
			pstmt.setDouble(1, transaction.getAmount());
			pstmt.setString(2, transaction.getReceiverAccountNumber());
			pstmt.executeUpdate();
		}

		// Get updated balance
		double newBalance = getAccountBalance(transaction.getSenderAccountNumber());
		transaction.setClosingBalance(newBalance);

		// Record in passbook
		return recordTransaction(transaction);
	}

	private boolean recordTransaction(PassbookEntity transaction) throws SQLException {
		String sql = "INSERT INTO passbook (sender_account, receiver_account, amount, transaction_type, "
				+ "transaction_date, closing_balance, description) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setString(1, transaction.getSenderAccountNumber());
			pstmt.setString(2, transaction.getReceiverAccountNumber());
			pstmt.setDouble(3, transaction.getAmount());
			pstmt.setString(4, transaction.getTransactionType());
			pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			pstmt.setDouble(6, transaction.getClosingBalance());
			pstmt.setString(7, transaction.getDescription());

			return pstmt.executeUpdate() > 0;
		}
	}

	public double getAccountBalance(String accountNumber) throws SQLException {
		String sql = "SELECT balance FROM accounts WHERE account_number = ?";
		try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setString(1, accountNumber);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getDouble("balance");
			}
			throw new SQLException("Account not found");
		}
	}

	private boolean accountExists(String accountNumber) throws SQLException {
		String sql = "SELECT 1 FROM accounts WHERE account_number = ?";
		try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
			pstmt.setString(1, accountNumber);
			ResultSet rs = pstmt.executeQuery();
			return rs.next();
		}
	}
}

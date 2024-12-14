package com.aurionpro.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aurionpro.entity.PassbookEntity;
import com.aurionpro.service.DatabaseConnection;
import com.aurionpro.service.TransactionService;

@WebServlet("/TransactionController")
public class TransactionController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String transactionType = request.getParameter("transactionType");
		double amount = Double.parseDouble(request.getParameter("amount"));
		String description = request.getParameter("description");
		String senderAccount = request.getParameter("accountNumber");
		String receiverAccount = request.getParameter("recipientAccount");

		PassbookEntity transaction = new PassbookEntity();
		transaction.setAmount(amount);
		transaction.setDescription(description);
		transaction.setSenderAccountNumber(senderAccount);
		transaction.setTransactionType(transactionType.toUpperCase());

		if ("TRANSFER".equals(transactionType.toUpperCase())) {
			transaction.setReceiverAccountNumber(receiverAccount);
		} else if ("CREDIT".equals(transactionType.toUpperCase())) {
			transaction.setReceiverAccountNumber(senderAccount);
		} else {
			transaction.setReceiverAccountNumber(senderAccount);
		}

		try (Connection conn = DatabaseConnection.getConnection()) {
			TransactionService transactionService = new TransactionService(conn);

			if (transactionService.performTransaction(transaction)) {
				request.setAttribute("successMessage", "Transaction completed successfully!");

				double newBalance = transactionService.getAccountBalance(senderAccount);
				request.getSession().setAttribute("balance", newBalance);
			} else {
				request.setAttribute("errorMessage", "Transaction failed!");
			}

		} catch (Exception e) {
			request.setAttribute("errorMessage", "Transaction failed: " + e.getMessage());
		}

		request.getRequestDispatcher("Transaction.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

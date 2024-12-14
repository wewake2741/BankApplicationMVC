package com.aurionpro.entity;

import java.security.Timestamp;

public class PassbookEntity {
	 private int id;
	    private String senderAccountNumber;
	    private String receiverAccountNumber;
	    private double amount;
	    private String transactionType;  // CREDIT, DEBIT, TRANSFER
	    private Timestamp transactionDate;
	    private double closingBalance;
	    private String description;

	    // Constructors, getters, and setters
	    public PassbookEntity() {}
	    

		public PassbookEntity(int id, String senderAccountNumber, String receiverAccountNumber, double amount,
				String transactionType, Timestamp transactionDate, double closingBalance, String description) {
			super();
			this.id = id;
			this.senderAccountNumber = senderAccountNumber;
			this.receiverAccountNumber = receiverAccountNumber;
			this.amount = amount;
			this.transactionType = transactionType;
			this.transactionDate = transactionDate;
			this.closingBalance = closingBalance;
			this.description = description;
		}


		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getSenderAccountNumber() {
			return senderAccountNumber;
		}

		public void setSenderAccountNumber(String senderAccountNumber) {
			this.senderAccountNumber = senderAccountNumber;
		}

		public String getReceiverAccountNumber() {
			return receiverAccountNumber;
		}

		public void setReceiverAccountNumber(String receiverAccountNumber) {
			this.receiverAccountNumber = receiverAccountNumber;
		}

		public double getAmount() {
			return amount;
		}

		public void setAmount(double amount) {
			this.amount = amount;
		}

		public String getTransactionType() {
			return transactionType;
		}

		public void setTransactionType(String transactionType) {
			this.transactionType = transactionType;
		}

		public Timestamp getTransactionDate() {
			return transactionDate;
		}

		public void setTransactionDate(Timestamp transactionDate) {
			this.transactionDate = transactionDate;
		}

		public double getClosingBalance() {
			return closingBalance;
		}

		public void setClosingBalance(double closingBalance) {
			this.closingBalance = closingBalance;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}


}

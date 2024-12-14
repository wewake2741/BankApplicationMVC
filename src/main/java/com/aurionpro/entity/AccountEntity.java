package com.aurionpro.entity;

public class AccountEntity {
	
	private int id;
	private int accountno;
	private double balance;
	public AccountEntity(int id, int accountno, double balance) {
		super();
		this.id = id;
		this.accountno = accountno;
		this.balance = balance;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAccountno() {
		return accountno;
	}
	public void setAccountno(int accountno) {
		this.accountno = accountno;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	

}

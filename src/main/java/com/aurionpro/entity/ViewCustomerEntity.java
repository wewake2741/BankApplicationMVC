package com.aurionpro.entity;

public class ViewCustomerEntity {
    private int id;
    private String fname;
    private String lname;
    private String email;
    private Integer accountNumber;
    private Double balance;

    public ViewCustomerEntity(int id, String fname, String lname, String email, Integer accountNumber, Double balance) {
        this.id = id;
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.accountNumber = accountNumber;
        this.balance = balance;
    }

    public int getId() {
        return id;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getEmail() {
        return email;
    }

    public Integer getAccountNumber() {
        return accountNumber;
    }

    public Double getBalance() {
        return balance;
    }
}


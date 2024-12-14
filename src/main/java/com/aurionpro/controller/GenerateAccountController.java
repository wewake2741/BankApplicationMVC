package com.aurionpro.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.entity.AccountEntity;
import com.aurionpro.service.AccountService;

/**
 * Servlet implementation class GenerateAccountController
 */
@WebServlet("/GenerateAccountController")
public class GenerateAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		int customerId = Integer.parseInt(request.getParameter("customerId"));
        String email = request.getParameter("email");
        double initialBalance = Double.parseDouble(request.getParameter("balance"));
        System.out.println("------servlet"+customerId+email+initialBalance);
        AccountService accountService = new AccountService();
        System.out.println("account added");
        // Create a new account in the database
        boolean isAccountCreated = accountService.createAccount(customerId, initialBalance);
        
        if (isAccountCreated) {
            // Fetch the newly created account details
        	System.out.println("final");
            AccountEntity account = accountService.getAccountDetails(customerId);
            
            if (account != null) {
                System.out.println(" generated account");
                response.getWriter().write("<script>alert('Account added Successful!'); window.location='AddCustomer.jsp';</script>");
            }
        } else {
        	response.getWriter().write("<script>alert('Account not generated !'); window.location='AddCustomer.jsp';</script>");
        }
        
        request.getRequestDispatcher("AddBankAccount.jsp").forward(request, response);
    }
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

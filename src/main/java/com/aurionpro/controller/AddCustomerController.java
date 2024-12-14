package com.aurionpro.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.entity.CustomerEntity;
import com.aurionpro.service.AddCustomerService;

/**
 * Servlet implementation class AddCustomerController
 */
@WebServlet("/AddCustomerController")
public class AddCustomerController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter write = response.getWriter();
		

        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        System.out.println(firstName+lastName+email+password);

        
        Random random = new Random();
        int customerId = 1000 + random.nextInt(9000); // Generate a 4-digit number

        
        CustomerEntity customer = new CustomerEntity(customerId, firstName, lastName, email, password);

        
        AddCustomerService customerService = new AddCustomerService();

        // Check if email exists
        if (customerService.isEmailExists(email)) {
            System.out.println("inside email validation");
            request.setAttribute("error", "Email already exists. Please use a different email.");
            request.getRequestDispatcher("AddCustomer.jsp").forward(request, response);
            return;
        }

        
        boolean isAdded = customerService.addCustomer(customer);
        
        
        if (isAdded) {
        	request.setAttribute("successMessage", "Customer added successfully!");
            // Forward back to the AddCustomer page with success message
        	response.getWriter().write("<script>alert('Customer added Successful!'); window.location='AddCustomer.jsp';</script>");
            request.getRequestDispatcher("AddCustomer.jsp").forward(request, response);

        } else {
            // If adding the customer fails, show an error message and stay on the AddCustomer page
            request.setAttribute("error", "Failed to add customer. Please try again.");
            request.getRequestDispatcher("AddCustomer.jsp").forward(request, response);
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

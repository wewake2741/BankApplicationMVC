package com.aurionpro.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.entity.Admin;
import com.aurionpro.service.AdminRegistrationConnection;


@WebServlet("/AdminRegistrationController")
public class AdminRegistrationController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter write=response.getWriter();
		
		int id=Integer.parseInt(request.getParameter("adminId"));
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		Admin admin1=new Admin(id, name, email, password);
		
		
		AdminRegistrationConnection registration=new AdminRegistrationConnection();
		boolean isRegistered=registration.registerAdmin(admin1);
		//response.getWriter().write("<script>alert('Registered Successful!'); window.location='HomePage.jsp';</script>");

		
		if (isRegistered) {
			System.err.println("success");
            response.sendRedirect("BankHomePage.jsp");
        } else {
            // If registration failed, show error message
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            request.getRequestDispatcher("AdminRegistration.jsp").forward(request, response);
        }
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

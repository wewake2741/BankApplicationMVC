package com.aurionpro.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aurionpro.entity.AdminLoginEntity;
import com.aurionpro.entity.CustomerLoginEntity;
import com.aurionpro.service.LoginService;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	

        // Print for debugging
        
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		LoginService loginService = new LoginService();
		System.out.println(email + password +" "+ role+" this is login");

		if ("admin".equals(role)) {
			AdminLoginEntity admin = new AdminLoginEntity(email, password);
			if (loginService.authenticateAdmin(admin)) {

				HttpSession session = request.getSession();
				session.setAttribute("adminName", admin.getEmail());

				request.getRequestDispatcher("AdminHomePage.jsp").forward(request, response);
			} else { 
				

				request.setAttribute("errorMessage", "Invalid email or password for Admin.");
				request.getRequestDispatcher("BankHomePage.jsp").forward(request, response);
			}
		}
		
		else if ("user".equals(role)) {
			System.out.println("inside user controler");
			CustomerLoginEntity user = new CustomerLoginEntity(email, password);
			System.out.println("5.inside controler");
			if (loginService.authenticateUser(user)) {
				System.out.println("inside controler if");
				HttpSession session = request.getSession();
				session.setAttribute("userName", user.getEmail());

				request.getRequestDispatcher("UserHomePage.jsp").forward(request, response);
			} else {

				request.setAttribute("errorMessage", "Invalid email or password for User.");
				request.getRequestDispatcher("BankHomePage.jsp").forward(request, response);
			}
		}

		else {
			request.setAttribute("errorMessage", "Invalid role selected.");
			request.getRequestDispatcher("BankHomePage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);
	}

}

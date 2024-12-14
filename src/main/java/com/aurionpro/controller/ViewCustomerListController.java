package com.aurionpro.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aurionpro.entity.ViewCustomerEntity;
import com.aurionpro.service.ViewCustomerService;


@WebServlet("/ViewCustomerListController")
public class ViewCustomerListController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    ViewCustomerService service = new ViewCustomerService();
	        List<ViewCustomerEntity> customerList = service.getAllCustomers();

	        request.setAttribute("customerList", customerList);
	        request.getRequestDispatcher("ViewCustomer.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.localdairy.dbc;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginDBC")
public class LoginDBC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		boolean isValidUser = false;

		try {
			isValidUser = DataBaseActions.validateUser(username, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		if (isValidUser) {
			if (username.equals("admin1") && password.equals("admin1")) {
				response.sendRedirect("clintmanage.jsp");
			} else {
				response.sendRedirect("login.html");
			}
		} else {
			response.sendRedirect("login.html");
		}

	}
}

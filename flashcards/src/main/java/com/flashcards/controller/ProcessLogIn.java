package com.flashcards.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flashcards.dao.database.connection.UserDAO;
import com.flashcards.model.User;

@WebServlet(urlPatterns = "/ProcessLogIn")
public class ProcessLogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProcessLogIn() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("username");
		String pass = request.getParameter("password");

		User kh = new UserDAO().getAccountInformation(username);
		System.out.println(kh);
		if (new UserDAO().checkLogIn(username, email, pass)) {
			HttpSession session = request.getSession();
			session.setAttribute("user", kh);
			response.sendRedirect("index.jsp");
		} else {
			System.out.println("Loi dang nhap");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

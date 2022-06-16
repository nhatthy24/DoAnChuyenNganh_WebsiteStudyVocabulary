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

@WebServlet(urlPatterns = "/ProcessSignUp")
public class ProcessSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProcessSignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int id = request.getContentLength();
		String date = request.getParameter("dateOfBirth");
		String role = request.getParameter("role");
		String username = request.getParameter("username");
		String pass = request.getParameter("password");
		String email = request.getParameter("email");
		
		User kh = new User(id, pass, email, date, role, username);
		if(new UserDAO().addAccount(kh)) {
			HttpSession session = request.getSession();
			session.setAttribute("user", kh);
			response.sendRedirect("login.jsp");
		} else {
			System.out.println("Loi dang ky");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

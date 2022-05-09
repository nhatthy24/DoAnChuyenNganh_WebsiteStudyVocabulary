package com.flashcards.controller;

import com.flashcards.dao.database.connection.CourseDAO;
import com.flashcards.model.Card;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/created-term")
public class CreatedTermDirect extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("title", "Tạo học phần");
        String courseName = req.getParameter("title");
        String description = req.getParameter("description");
        String[] words = req.getParameterValues("word");
        String[] means = req.getParameterValues("mean");
        List<Card> cards = new ArrayList<>();

        boolean isInsert = CourseDAO.insertCourse(courseName, description);
        if(isInsert){
            System.out.println("Tạo học phần thành công");
            req.getRequestDispatcher("term_details.jsp").forward(req,resp);
        }
        req.getRequestDispatcher("create_term.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

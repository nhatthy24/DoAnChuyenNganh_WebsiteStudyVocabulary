package com.flashcards.controller;

import com.flashcards.dao.database.connection.CardDAO;
import com.flashcards.dao.database.connection.CourseDAO;
import com.flashcards.model.Card;
import com.flashcards.model.Course;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/check-card")
public class CheckCardDirect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int course_id = Integer.parseInt(request.getParameter("course_id"));
        request.setAttribute("title","Kiểm tra");
        Course course = CourseDAO.loadCourseById(course_id);
        List<Card> cards = course.getCards();
        request.setAttribute("course", course);
        request.setAttribute("cards", cards);
        request.getRequestDispatcher("check_card.jsp").forward(request,response);
    }
}

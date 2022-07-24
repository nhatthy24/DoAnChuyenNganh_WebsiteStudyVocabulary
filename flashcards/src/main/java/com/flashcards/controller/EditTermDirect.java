package com.flashcards.controller;

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

@WebServlet(urlPatterns = "/edit-term-page")
public class EditTermDirect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("title", "Sửa học phần");
        int id = Integer.parseInt(request.getParameter("course_id"));
        Course course = CourseDAO.loadCourseById(id);
        List<Card> cards = course.getCards();
        request.setAttribute("course", course);
        request.setAttribute("cards", cards);
        request.getRequestDispatcher("edit_term.jsp").forward(request,response);
    }
}

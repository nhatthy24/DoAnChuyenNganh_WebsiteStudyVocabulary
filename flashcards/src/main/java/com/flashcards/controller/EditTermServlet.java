package com.flashcards.controller;

import com.flashcards.dao.database.connection.CourseDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/edit-term")
public class EditTermServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("course_id"));
        String courseName = request.getParameter("title");
        String description = request.getParameter("description");
        String[] words = request.getParameterValues("word");
        String[] means = request.getParameterValues("mean");
        boolean isUpdate = CourseDAO.updateCourse(courseName, description);
    }
}

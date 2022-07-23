package com.flashcards.controller;

import com.flashcards.dao.database.connection.CardDAO;
import com.flashcards.dao.database.connection.CourseDAO;
import com.flashcards.dao.database.connection.UserDAO;
import com.flashcards.model.Card;
import com.flashcards.model.Course;
import com.flashcards.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/detail-term")
public class DetailedTermDirect extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int courseId = Integer.parseInt(req.getParameter("course_id"));
        Course course = CourseDAO.loadCourseById(courseId);
        User creator = UserDAO.loadUserById(course.getCreatorId());
        List<Card> cards = CardDAO.loadListCardByCourseId(courseId);
        req.setAttribute("course", course);
        req.setAttribute("cards", cards);
        req.setAttribute("creator", creator);
        System.out.println(course);
        System.out.println(cards.get(0));
        req.getRequestDispatcher("term_details.jsp").forward(req,resp);
    }
}

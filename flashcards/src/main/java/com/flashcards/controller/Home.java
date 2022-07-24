package com.flashcards.controller;

import com.flashcards.dao.database.connection.CourseDAO;
import com.flashcards.model.Course;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Home", value = "/home")
public class Home extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("title","Trang chủ");
        HttpSession session = request.getSession();

        if(session.getAttribute("user_id")!=null){
            int user_id = (int) session.getAttribute("user_id");
            List<Course> courses = CourseDAO.loadCourseByCreatorId(user_id);
            request.setAttribute("courses", courses);
            request.getRequestDispatcher("index.jsp").forward(request,response);
        } else if(session.getAttribute("user_id")==null){
            List<Course> courses = CourseDAO.loadCourseHome();
            request.setAttribute("courses", courses);
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

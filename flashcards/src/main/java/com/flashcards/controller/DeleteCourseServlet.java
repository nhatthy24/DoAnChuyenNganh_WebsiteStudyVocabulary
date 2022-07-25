package com.flashcards.controller;

import com.flashcards.dao.database.connection.CardDAO;
import com.flashcards.dao.database.connection.CourseDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/delete-term")
public class DeleteCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("course_id"));
        boolean isDelCourseInFolder = CourseDAO.deleteCourseInFolder(courseId);
        boolean isDelCourseInClass = CourseDAO.deleteCourseInClass(courseId);
        if(isDelCourseInFolder && isDelCourseInClass){
            boolean isDelCard = CardDAO.deleteCardByCourseId(courseId);
            if(isDelCard){
                boolean isDelete = CourseDAO.deleteCourse(courseId);
                System.out.println("Xoa hoc phan thanh cong");
                request.getRequestDispatcher("home").forward(request, response);
            }
        } else
            System.out.println("Chua xoa dc hoc phan");
    }
}

package com.flashcards.controller;

import com.flashcards.dao.database.connection.ClassroomDAO;
import com.flashcards.model.Classroom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/create-class")
public class CreateClassServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int user_id = (int) session.getAttribute("user_id");
        String className = request.getParameter("cname");
        String classDescription = request.getParameter("cdescription");
        String schoolName = request.getParameter("schoolname");

        boolean isCreate = ClassroomDAO.insertClassroom(className,classDescription,schoolName,user_id);
        if(isCreate){
            Classroom classroom = ClassroomDAO.loadNewstClass();
            request.setAttribute("title", "Lớp");
            request.setAttribute("classroom", classroom);
            request.getRequestDispatcher("library_class.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

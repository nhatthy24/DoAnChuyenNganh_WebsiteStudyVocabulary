package com.flashcards.controller;

import com.flashcards.dao.database.connection.ClassroomDAO;
import com.flashcards.dao.database.connection.CourseDAO;
import com.flashcards.dao.database.connection.FolderDAO;
import com.flashcards.dao.database.connection.UserDAO;
import com.flashcards.model.Classroom;
import com.flashcards.model.Course;
import com.flashcards.model.Folder;
import com.flashcards.model.User;

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
            // header thư viện của tôi
            List<Course> courses = CourseDAO.loadCourseByCreatorId(user_id);
//            List<Folder> listfolders = FolderDAO.loadFolderByCreatorId(user_id);
//            List<Classroom> listclassrooms = ClassroomDAO.loadClassByCreatorId(user_id);
            request.setAttribute("courses", courses);
//            request.setAttribute("listfolders", listfolders);
//            request.setAttribute("listclassrooms", listclassrooms);
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

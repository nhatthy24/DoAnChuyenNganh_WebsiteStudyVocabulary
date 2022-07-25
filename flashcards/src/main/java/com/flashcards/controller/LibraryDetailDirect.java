package com.flashcards.controller;

import com.flashcards.dao.database.connection.ClassroomDAO;
import com.flashcards.dao.database.connection.CourseDAO;
import com.flashcards.dao.database.connection.FolderDAO;
import com.flashcards.model.Classroom;
import com.flashcards.model.Course;
import com.flashcards.model.Folder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/library-detail")
public class LibraryDetailDirect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("title","Thư viện của bạn");
        HttpSession session = request.getSession();
        int user_id = (int) session.getAttribute("user_id");
        List<Course> courses = CourseDAO.loadCourseByCreatorId(user_id);
        List<Folder> folders = FolderDAO.loadFolderByCreatorId(user_id);
        List<Classroom> classrooms = ClassroomDAO.loadClassByCreatorId(user_id);
        request.setAttribute("courses", courses);
        request.setAttribute("folders", folders);
        request.setAttribute("classrooms", classrooms);
        request.getRequestDispatcher("library_details.jsp").forward(request,response);
    }
}

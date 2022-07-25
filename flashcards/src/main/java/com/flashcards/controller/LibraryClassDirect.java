package com.flashcards.controller;

import com.flashcards.dao.database.connection.*;
import com.flashcards.model.Classroom;
import com.flashcards.model.Course;
import com.flashcards.model.Folder;
import com.flashcards.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/library-class")
public class LibraryClassDirect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("class_id"));
        request.setAttribute("title", "Lớp");
        Classroom classroom = ClassroomDAO.loadClassById(id);
        List<Course> courses = classroom.getCourses();
        List<Folder> folders = classroom.getFolders();
//        System.out.println("Gia tri cua folder la"+folders);
//        List<User> members = classroom.getMembers();
        request.setAttribute("classroom", classroom);
        request.setAttribute("folders", folders);
        request.setAttribute("courses", courses);
        HttpSession session_user = request.getSession();
        if(session_user.getAttribute("user")!=null){
            User user_session=(User)session_user.getAttribute("user");
            int user_id_session=user_session.getId();
            List<Course> coursesInAddBox= CourseDAO.loadCourseByCreatorId(user_id_session);
            List<Folder> foldersInAddBox= FolderDAO.loadFolderByCreatorId(user_id_session);
            request.setAttribute("coursesInAddBox", coursesInAddBox);
            request.setAttribute("foldersInAddBox", foldersInAddBox);
            if(request.getParameter("type")!=null){
                String type = request.getParameter("type");
                if(type.equalsIgnoreCase("addcourse")){
                    int course_id = Integer.parseInt(request.getParameter("course_id"));
                   CourseInClassDAO.insertCourseInClass(course_id,id);

                    id = Integer.parseInt(request.getParameter("class_id"));
                    request.setAttribute("title", "Lớp");
                    classroom = ClassroomDAO.loadClassById(id);
                    courses = classroom.getCourses();
                    folders = classroom.getFolders();
                    request.setAttribute("classroom", classroom);
                    request.setAttribute("folders", folders);
                    request.setAttribute("courses", courses);
                }
                if(type.equalsIgnoreCase("addfolder")){
                    int folder_id = Integer.parseInt(request.getParameter("folder_id"));
                    FolderInClassDAO.insertFolderInClass(folder_id,id);

                    id = Integer.parseInt(request.getParameter("class_id"));
                    request.setAttribute("title", "Lớp");
                    classroom = ClassroomDAO.loadClassById(id);
                    courses = classroom.getCourses();
                    folders = classroom.getFolders();
                    request.setAttribute("classroom", classroom);
                    request.setAttribute("folders", folders);
                    request.setAttribute("courses", courses);
                }
                if(type.equalsIgnoreCase("deletecourse")){
                    int course_id = Integer.parseInt(request.getParameter("course_id"));
                    CourseInClassDAO.deleteCourseInClass(course_id,id);

                    id = Integer.parseInt(request.getParameter("class_id"));
                    request.setAttribute("title", "Lớp");
                    classroom = ClassroomDAO.loadClassById(id);
                    courses = classroom.getCourses();
                    folders = classroom.getFolders();
                    request.setAttribute("classroom", classroom);
                    request.setAttribute("folders", folders);
                    request.setAttribute("courses", courses);
                }
                if(type.equalsIgnoreCase("deletefolder")){
                    int folder_id = Integer.parseInt(request.getParameter("folder_id"));
                    FolderInClassDAO.deleteFolderInClass(folder_id,id);

                    id = Integer.parseInt(request.getParameter("class_id"));
                    request.setAttribute("title", "Lớp");
                    classroom = ClassroomDAO.loadClassById(id);
                    courses = classroom.getCourses();
                    folders = classroom.getFolders();
                    request.setAttribute("classroom", classroom);
                    request.setAttribute("folders", folders);
                    request.setAttribute("courses", courses);
                }
            }
        }

        request.getRequestDispatcher("library_class.jsp").forward(request, response);

    }
}

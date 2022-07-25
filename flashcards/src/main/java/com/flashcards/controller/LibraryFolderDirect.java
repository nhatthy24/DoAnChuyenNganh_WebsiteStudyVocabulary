package com.flashcards.controller;

import com.flashcards.dao.database.connection.CourseDAO;
import com.flashcards.dao.database.connection.CourseInFolderDAO;
import com.flashcards.dao.database.connection.FolderDAO;
import com.flashcards.dao.database.connection.UserDaoForSetting;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/library-folder")
public class LibraryFolderDirect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("folder_id"));
        request.setAttribute("title", "Thư mục");
        Folder folder = FolderDAO.loadFolderById(id);
        List<Course> courses = folder.getCourseList();
        request.setAttribute("folder", folder);
        request.setAttribute("courses", courses);

        HttpSession session_user = request.getSession();
        if(session_user.getAttribute("user")!=null){
            User user_session=(User)session_user.getAttribute("user");
            int user_id_session=user_session.getId();
            List<Course> coursesInAddBox=CourseDAO.loadCourseByCreatorId(user_id_session);
//            List<Integer> listIdCourseAlreadyADD =  new ArrayList<Integer>();
//            for(Course course:courses){
//                for(Course course1: coursesInAddBox){
//                    if(course.getId()==course1.getId()){
//                        System.out.println("Co vao day:"+course.getId()+"/"+course1.getId());
//                        System.out.println("index of remove course:"+coursesInAddBox.indexOf(course1));
////                        int indexCourseRemove=coursesInAddBox.indexOf(course1);
//                        listIdCourseAlreadyADD.add(course.getId());
//                    }
//                }
//            }
//            for(Integer integer:listIdCourseAlreadyADD){
////                System.out.println("Gia gia interger la:"+integer);
////                coursesInAddBox.remove((int)integer);
////                System.out.println("Xoa thanh cong");
//                for(Course course1: coursesInAddBox){
//                    if(course1.getId()==integer){
//                        int indexCourseRemove=coursesInAddBox.indexOf(course1);
//                        coursesInAddBox.remove(indexCourseRemove);
//                    }
//                }
//            }
//            for(Course course: coursesInAddBoxNeedRemove){
//                System.out.println("Index neeed remove is"+coursesInAddBox.indexOf(course));
//            }
            request.setAttribute("coursesInAddBox", coursesInAddBox);
            if(request.getParameter("type")!=null){
                String type = request.getParameter("type");
                if(type.equalsIgnoreCase("add")){
                    System.out.println("Gia tri cua folder id la"+id);
                    int course_id = Integer.parseInt(request.getParameter("course_id"));
                    CourseInFolderDAO.insertCourseInFolder(course_id,id);
                    id = Integer.parseInt(request.getParameter("folder_id"));
                    request.setAttribute("title", "Thư mục");
                    folder = FolderDAO.loadFolderById(id);
                    courses = folder.getCourseList();
                    request.setAttribute("folder", folder);
                    request.setAttribute("courses", courses);
                }
                if(type.equalsIgnoreCase("delete")){
                    int course_id = Integer.parseInt(request.getParameter("course_id"));
                    CourseInFolderDAO.deleteFolderInCourse(course_id,id);
                    id = Integer.parseInt(request.getParameter("folder_id"));
                    request.setAttribute("title", "Thư mục");
                    folder = FolderDAO.loadFolderById(id);
                    courses = folder.getCourseList();
                    request.setAttribute("folder", folder);
                    request.setAttribute("courses", courses);
                }
            }


        }

        request.getRequestDispatcher("library_folder.jsp").forward(request, response);

    }
}

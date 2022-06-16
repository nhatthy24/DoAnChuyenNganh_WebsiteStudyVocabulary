package com.flashcards.controller;

import com.flashcards.dao.database.connection.CardDAO;
import com.flashcards.dao.database.connection.CourseDAO;
import com.flashcards.model.Card;
import com.flashcards.model.Course;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

@MultipartConfig
@WebServlet(urlPatterns = "/created-term")
public class CreateTermServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("title", "Táº¡o há»�c pháº§n");
        int courseId = randomId();
        System.out.println(courseId);
        String courseName = req.getParameter("title");
        String description = req.getParameter("description");
        String[] words = req.getParameterValues("word");
        String[] means = req.getParameterValues("mean");
//        String[] images = req.getParameterValues("image");
        boolean isInsert = CourseDAO.insertCourse(courseId, courseName, description, 1);
        if(isInsert){
            System.out.println("Tạo học phần thành công");
            if(words != null && means != null){
                System.out.println("Kiểm tra words và  means != null");
                int count=0;
                for(int i=0; i< words.length; i++){
                    if(CardDAO.insertCard(words[i],means[i],null,courseId, 1 )){
                        count++;
                    }
                }
                if(count == words.length){
                  // nếu đúng thì chuyển sang trang chi tiết
                    Course course = CourseDAO.loadCourseById(courseId);
                    List<Card> cards = CardDAO.loadListCardByCourseId(courseId);
                    req.setAttribute("course", course);
                    req.setAttribute("cards", cards);
                    System.out.println(course);
                    System.out.println(cards.get(0));
                    req.getRequestDispatcher("term_details.jsp").forward(req,resp);
                }
            }
        } else{
//            System.out.println("Chưa tạo thành công");
            req.getRequestDispatcher("create_term.jsp").forward(req,resp);
        }
    }
    private int randomId(){
        Date dateTime = new Date();
        // ngay
        int day = dateTime.getDay();
        int month = dateTime.getMonth();
        int year = dateTime.getYear();
        int date = day;
        date |= month<<5;
        date |= year<<9;
        // gio
        int hour = dateTime.getHours();
        int minute = dateTime.getMinutes();
        int second = dateTime.getSeconds();
        int time = hour;
        time |= minute<<5;
        time |= second<<11;
        return day+time;
    }
}

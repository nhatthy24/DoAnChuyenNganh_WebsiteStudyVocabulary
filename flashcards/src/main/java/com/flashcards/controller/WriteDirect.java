package com.flashcards.controller;

import com.flashcards.dao.database.connection.CardDAO;
import com.flashcards.model.Card;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet(urlPatterns = "/writecard")
public class WriteDirect  extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int course_id = Integer.parseInt(request.getParameter("course_id"));
        List<Card> cards= CardDAO.loadListCardByCourseId(course_id);
        List<Card> cardsmarked= CardDAO.loadListCardWithMarkedByCourseId(course_id);

        for(Card c:cards){
            for (Card cm:cardsmarked){
                if(c.getId()==cm.getId()){
                    c.setMarkedCard(true);
                }
            }
        }
        request.setAttribute("course_id",course_id);
        request.setAttribute("count",cards.size());
        request.setAttribute("title","Viết");
        request.setAttribute("cards", cards);
        request.setAttribute("cardsmarked", cardsmarked);
        request.getRequestDispatcher("write_card.jsp").forward(request,response);
    }
}

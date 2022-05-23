package com.flashcards.controller;

import com.flashcards.dao.database.connection.CardDAO;
import com.flashcards.dao.database.connection.MarkedCardDAO;
import com.flashcards.model.Card;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/flashcard")
public class FlashCardDirect extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        if(type!=null){
            if(type.equalsIgnoreCase("edit")){
                String term = request.getParameter("term");
                String meaning = request.getParameter("meaning");
                int card_id = Integer.parseInt(request.getParameter("card_id"));
                int course_id = Integer.parseInt(request.getParameter("course_id"));
                CardDAO.updateCard(card_id,course_id,term,meaning);

                List<Card> cards= CardDAO.loadListCardByCourseId(1);
                List<Card> cardsmarked= CardDAO.loadListCardWithMarkedByCourseId(1);

                for(Card c:cards){
                    for (Card cm:cardsmarked){
                        if(c.getId()==cm.getId()){
                            c.setMarkedCard(true);
                        }
                    }
                }

                request.setAttribute("count",cards.size());
                request.setAttribute("title","Thẻ ghi nhớ");
                request.setAttribute("cards", cards);
                request.getRequestDispatcher("flash_card.jsp").forward(request,response);
            }
            if(type.equalsIgnoreCase("insertstar")){
                int user_id = Integer.parseInt(request.getParameter("user_id"));
                int card_id = Integer.parseInt(request.getParameter("card_id"));

                List<Card> cardsmarked= CardDAO.loadListCardWithMarkedByCourseId(1);
                //check card hasMarked
                boolean hasMarked=false;
                for (Card cm:cardsmarked){
                    if(card_id==cm.getId()){
                        hasMarked=true;
                    }
                }
                System.out.println(hasMarked);
                if(hasMarked){
                    MarkedCardDAO.deleteMarkedCard(user_id, card_id);
                }else {
                    MarkedCardDAO.insertMarkedCard(user_id, card_id);
                }
                List<Card> cards= CardDAO.loadListCardByCourseId(1);
                List<Card> cardsmarked2= CardDAO.loadListCardWithMarkedByCourseId(1);

                for(Card c:cards){
                    for (Card cm:cardsmarked2){
                        if(c.getId()==cm.getId()){
                            c.setMarkedCard(true);
                        }
                    }
                }



                request.setAttribute("count",cards.size());
                request.setAttribute("title","Thẻ ghi nhớ");
                request.setAttribute("cards", cards);
                request.getRequestDispatcher("flash_card.jsp").forward(request,response);
            }

        }else {
            List<Card> cards= CardDAO.loadListCardByCourseId(1);
            List<Card> cardsmarked= CardDAO.loadListCardWithMarkedByCourseId(1);

            for(Card c:cards){
                for (Card cm:cardsmarked){
                    if(c.getId()==cm.getId()){
                        c.setMarkedCard(true);
                    }
                }
            }

            request.setAttribute("count",cards.size());
            request.setAttribute("title","Thẻ ghi nhớ");
            request.setAttribute("cards", cards);
            request.setAttribute("cardsmarked", cardsmarked);
            request.getRequestDispatcher("flash_card.jsp").forward(request,response);
        }

}
}

package com.flashcards.dao.database.connection;

import com.flashcards.model.Card;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CardDAO {
    public static boolean insertCard(String word, String mean, String img, int courseId, int creator) {
        String sql = "INSERT INTO card(Term,Meaning,Image,CourseID,Creator) VALUES (?,?,?,?,?)";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, word);
            preparedStatement.setString(2, mean);
            preparedStatement.setString(3, img);
            preparedStatement.setInt(4, courseId);
            preparedStatement.setInt(5, creator);
            synchronized (preparedStatement){
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

//    public static void main(String[] args) {
//        System.out.println(insertCard("contract","hợp đồng","",7,1));
//    }

    public static List<Card> loadListCardByCourseId(int courseId) {
        String sql = "SELECT * FROM card WHERE CourseID=?";
        List<Card> cards = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,courseId);
            synchronized (preparedStatement){
                ResultSet rs = preparedStatement.executeQuery();
                while(rs.next()){
                    Card card = new Card();
                    card.setCourseId(courseId);
                    card.setId(rs.getInt(1));
                    card.setTerm(rs.getString(2));
                    card.setMeaning(rs.getString(3));
                    card.setImage(rs.getString(4));
                    card.setCreator(rs.getInt(6));
                    cards.add(card);
                }
                rs.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return cards;
    }
    public static boolean  updateCard(int cardID,int coursID, String term, String meaning){
        String sql = "UPDATE card SET term = ?, meaning= ? WHERE CardID = ? and CourseID = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, term);
            preparedStatement.setString(2, meaning);
            preparedStatement.setInt(3, cardID);
            preparedStatement.setInt(4, coursID);
            synchronized (preparedStatement){
                update = preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return update == 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    public static List<Card> loadListCardWithMarkedByCourseId(int courseId) {
        String sql = "SELECT c.CardID, c.term, c.meaning, c.image, c.courseid, c.creator, " +
                "m.cardid  FROM card c join marked_card m on c.creator=m.userid and c.cardid=m.cardid WHERE CourseID=?";
        List<Card> cards = new ArrayList<>();
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,courseId);
            synchronized (preparedStatement){
                ResultSet rs = preparedStatement.executeQuery();
                while(rs.next()){
                    Card card = new Card();
                    card.setCourseId(courseId);
                    card.setId(rs.getInt(1));
                    card.setTerm(rs.getString(2));
                    card.setMeaning(rs.getString(3));
                    card.setImage(rs.getString(4));
                    card.setCreator(rs.getInt(6));
                    card.setMarkedCard((rs.getInt(7)!=0?true:false));
                    cards.add(card);
                }
                rs.close();
            }
            preparedStatement.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return cards;
    }

    public static void main(String[] args) {
        List<Card> cards= CardDAO.loadListCardByCourseId(1);
        List<Card> cardsmarked= CardDAO.loadListCardWithMarkedByCourseId(1);

        for(Card c:cards){
            for (Card cm:cardsmarked){
                if(c.getId()==cm.getId()){
                    c.setMarkedCard(true);
                }
            }
        }
        for(Card c:cards){
            System.out.println(c.isMarkedCard());
        }
    }

}

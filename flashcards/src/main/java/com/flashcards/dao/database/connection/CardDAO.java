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

    public static void main(String[] args) {
        System.out.println(insertCard("contract","hợp đồng","",7,1));
    }

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
}

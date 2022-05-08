package flashcard.model.card;

import flashcard.model.database.connection_pool.DBCPDataSource;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Card_Con_DB {
    public static Card loadCard(int id){
        try {
            PreparedStatement pe = DBCPDataSource.preparedStatement("select * from card where id=?");
            pe.setInt(1,id);
            synchronized (pe){
                ResultSet rs = pe.executeQuery();
                Card card = null;
                if(rs.next()) {
                    card = getCard(rs);
                }
                rs.close();
                pe.close();
                return card;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public static Card getCard(ResultSet rs){
        if(rs == null)
            return null;
        Card card = new Card();
        try {
            card.setTerm_id(rs.getInt(1));
            card.setTerm(rs.getString(2));
            card.setMeaning(rs.getString(3));
            card.setCreator_id(rs.getInt(4));
            card.setImage(rs.getString(5));
            card.setCourse_id(rs.getInt(6));
            return card;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return  null;

    }
    public static List<Card> getAllCard(){
        String spl="select * from card";
        return loadFavoristListFormSql(spl);
    }
    public static List<Card> loadFavoristListFormSql(String sql){
        List<Card>list = new ArrayList<Card>();
        try {
            Statement statement = DBCPDataSource.getStatement();
            synchronized (statement){
                ResultSet resultSet = statement.executeQuery(sql);
                while(resultSet.next()) {
                    list.add(getCard(resultSet));
                }
                resultSet.close();
            }
            statement.close();
            return list;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
//    public static void main(String[] args) {
//        for(Card a:getAllCard()){
//            System.out.println(a.getTerm());
//        }
//
//    }
}



package com.flashcards.dao.database.connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CourseDAO {
    public static boolean insertCourse(String courseName, String description) {
        String sql = "INSERT INTO course(Creator, CourseName, Description) value (?,?,?)";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, "NThy");
            preparedStatement.setString(2, courseName);
            preparedStatement.setString(3, description);
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
}

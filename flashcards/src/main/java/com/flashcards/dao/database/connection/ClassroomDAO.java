package com.flashcards.dao.database.connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ClassroomDAO {

    // Tạo lớp học
    public static boolean insertClassroom(String title, String description, String school, int creator){
        String sql = "INSERT class(Title,Description,School,Creator) VALUES (?, ?, ?, ?)";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, school);
            preparedStatement.setInt(4, creator);
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

    // Sửa lớp học
    public static boolean updateClassroom(String title, String description, String school, int classID){
        String sql = "UPDATE class SET Title = ?, Description = ?, School = ? WHERE ClassID = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, school);
            preparedStatement.setInt(4, classID);
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
    // Xóa lớp học
    public static boolean deleteClassroom(int classID){
        String sql = "DELETE FROM class WHERE ClassID = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, classID);
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

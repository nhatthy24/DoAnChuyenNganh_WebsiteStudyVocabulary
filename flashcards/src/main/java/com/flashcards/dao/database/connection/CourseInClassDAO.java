package com.flashcards.dao.database.connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CourseInClassDAO {
    public static boolean insertCourseInClass(int courseId, int classId){
        String sql = "INSERT course_in_class(CourseId,ClassId) VALUES (?, ?)";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, courseId);
            preparedStatement.setInt(2, classId);
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
    public static boolean deleteCourseInClass(int courseId,int classId) {
        String sql = "DELETE FROM course_in_class WHERE CourseID=? and ClassID=?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, courseId);
            preparedStatement.setInt(2, classId);
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
        insertCourseInClass(1,1);
    }
}

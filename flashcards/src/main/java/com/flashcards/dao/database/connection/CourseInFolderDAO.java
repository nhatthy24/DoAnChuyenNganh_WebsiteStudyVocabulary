package com.flashcards.dao.database.connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CourseInFolderDAO {
    public static boolean insertCourseInFolder(int courseId, int folderId){
        String sql = "INSERT course_in_folder(Course,Folder) VALUES (?, ?)";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, courseId);
            preparedStatement.setInt(2, folderId);
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
    public static boolean deleteFolderInCourse(int courseId, int folderId) {
        String sql = "DELETE FROM course_in_folder WHERE Course=? and Folder=?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1,courseId);
            preparedStatement.setInt(2,folderId);
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
        insertCourseInFolder(52053,1);
    }

}

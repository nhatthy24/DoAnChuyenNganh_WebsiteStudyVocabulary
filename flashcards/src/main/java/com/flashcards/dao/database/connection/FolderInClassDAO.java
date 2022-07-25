package com.flashcards.dao.database.connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FolderInClassDAO {
    public static boolean insertFolderInClass(int folderId, int classId){
        String sql = "INSERT folder_in_class(FolderId,ClassId) VALUES (?, ?)";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, folderId);
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
    public static boolean deleteFolderInClass(int folderId,int classId) {
        String sql = "DELETE FROM folder_in_class WHERE FolderID=? and ClassID=?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, folderId);
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
        insertFolderInClass(1,1);
    }

}

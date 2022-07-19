package com.flashcards.dao.database.connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FolderDAO {

    // tạo thư mục
    public static boolean insertFolder(String title, String description, int creator){
        String sql = "INSERT folder(Title,Description,Creator) VALUES (?, ?, ?)";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, description);
            preparedStatement.setInt(3, creator);
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

    // sửa thư mục
    public static boolean updateFolder(String title, String description, int folderID){
        String sql = "UPDATE folder SET Title = ?, Description = ? WHERE FolderID = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, description);
            preparedStatement.setInt(3, folderID);
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

    // xóa thư mục
    public static boolean deleteFolder(int folderID){
        String sql = "DELETE FROM folder WHERE FolderID = ?";
        int update = 0;
        try{
            PreparedStatement preparedStatement = DBCPDataSource.preparedStatement(sql);
            preparedStatement.setInt(1, folderID);
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

package com.flashcards.dao.database.connection;

import org.apache.commons.dbcp.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBCPDataSource {
	
    private static BasicDataSource ds = new BasicDataSource();
    private static Connection connection;
    private static String sqlDB;
    static {
        ds.setDriverClassName(Config.DB_DRIVER);
        ds.setUrl(Config.CONNECTION_URL);
        ds.setUsername(Config.USER_NAME);
        ds.setPassword(Config.PASSWORD);
        ds.setMinIdle(Config.DB_MIN_CONNECTIONS); // minimum number of idle connections in the pool
        ds.setInitialSize(Config.DB_MIN_CONNECTIONS);
        ds.setMaxIdle(Config.DB_MAX_CONNECTIONS); // maximum number of idle connections in the pool
        ds.setMaxOpenPreparedStatements(100);
    }

    public DBCPDataSource() {
        super();
        sqlDB = Config.CONNECTION_URL;
    }

    public static Connection getConnection() throws SQLException {
        if(connection == null || connection.isClosed()) {
            connection=ds.getConnection();
            return connection;
        }
        return connection;

    }
    public static Statement getStatement() throws SQLException {
        return getConnection().createStatement();
    }
    public static PreparedStatement preparedStatement(String sql) throws SQLException {
        return getConnection().prepareStatement(sql);
    }
    
    public  void thucThiSQL(String sql) throws Exception{
		Connection connect = getConnection();
		Statement stmt = connect.createStatement();
		stmt.executeUpdate(sql);
	}
	public ResultSet chonDuLieu(String sql) throws Exception{
		Connection connect = getConnection();
		Statement stmt = connect.createStatement();
		ResultSet rs=	stmt.executeQuery(sql);
		return rs;
	}

}

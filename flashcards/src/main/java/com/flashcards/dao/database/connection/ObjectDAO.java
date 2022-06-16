package com.flashcards.dao.database.connection;

public interface ObjectDAO {
	
	//them tai khoan
	public boolean addAccount(Object obj);
	
	//kiem tra dang nhap
	public boolean checkLogIn(String username, String email, String pass);

}

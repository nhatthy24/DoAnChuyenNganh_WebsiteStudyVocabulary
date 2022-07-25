package com.flashcards.model;

import java.util.Date;

public class User {
    private int id;
    private String email;
    private String password;
    private String avatar;
    private String username;
    private String date;
    private String role;

    public User(int newId, String newPassword, String newEmail, String newDate, String newRole, String newUsername) {
    	super();
    	this.id = newId;
    	this.password = newPassword;
    	this.email = newEmail;
    	this.date = newDate;
    	this.role = newRole;
    	this.username = newUsername;
    }
    public User(int newId, String newPassword, String newEmail, String newDate, String newRole, String newUsername,String avatar) {
        super();
        this.id = newId;
        this.password = newPassword;
        this.email = newEmail;
        this.date = newDate;
        this.role = newRole;
        this.username = newUsername;
        this.avatar=avatar;
    }
    public User() {
    }

    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", email=" + email + ", password=" + password + ", username=" + username + ", date="
				+ date + ", role=" + role + "]";
	}

}

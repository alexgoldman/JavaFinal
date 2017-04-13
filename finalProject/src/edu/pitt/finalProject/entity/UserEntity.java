package edu.pitt.finalProject.entity;

import java.io.Serializable;
import java.lang.Integer;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: UserEntity
 *
 */
@Entity

public class UserEntity implements Serializable {

	@Id
	private int userID;
	private String username;
	private String password;
	private String fname;
	private String lname;
	private int credits;
	private static final long serialVersionUID = 1L;

	public UserEntity() {
		super();
	}   
	
	public int getId() {
		return this.userID;
	}

	public void setId(int id) {
		this.userID = userID;
	}   
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	} 
	
	public String getfname() {
		return this.fname;
	}

	public void setfname(String fname) {
		this.fname = fname;
	}   
	public String getlname() {
		return this.lname;
	}

	public void setlname(String lname) {
		this.lname = lname;
	}   
	public int getCredits() {
		return this.credits;
	}

	public void setCredits(int credits) {
		this.credits = credits;
	}
   
}

package edu.pitt.finalProject.entity;

import java.io.Serializable;
import java.lang.Integer;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: UserPurchases
 *
 */
@Entity

public class UserPurchases implements Serializable {

	@Id
	private int upID;
	private int fk_userID;
	private int fk_themeID;

	private static final long serialVersionUID = 1L;

	public UserPurchases() {
		super();
	}   
	
	public int getFk_userID() {
		return this.fk_userID;
	}

	public void setFk_userID(int id) {
		this.fk_userID = fk_userID;
	}
	
	public int getFk_themeID() {
		return this.fk_themeID;
	}

	public void setFk_themeID(int id) {
		this.fk_themeID = fk_themeID;
	}
	
}


package edu.pitt.finalProject.entity;

import java.io.Serializable;
import java.lang.Integer;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: BaseEntity
 *
 */
@Entity

public class BaseEntity implements Serializable {

	@Id
	private int Id;
	private String descripion;
	private static final long serialVersionUID = 1L;

	public BaseEntity() {
		super();
	}   
	
	public int getId() {
		return this.Id;
	}

	public void setId(int Id) {
		this.Id = Id;
	}   
	public String getDescripion() {
		return this.descripion;
	}

	public void setDescripion(String descripion) {
		this.descripion = descripion;
	}
   
}

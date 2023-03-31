package com.rt.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * @author rahul
 * Represents an officer in the online traffic system.
 * An officer has a unique ID, a name, a branch, a username, and a password.
 * This class is mapped to the 'Officer' table in the database using Hibernate annotations.
 */

@Entity
@Table(name = "Officer")
public class Officer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "officer_id")
    private int officerId;

    @Column(name = "officer_name")
    private String officerName;

    @Column(name = "branch")
    private String branch;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    
    //Constructors
	public Officer(String officerName, String branch, String username, String password) {
		
		this.officerName = officerName;
		this.branch = branch;
		this.username = username;
		this.password = password;
	}
    
	public Officer() {
		
		this("", "", "", "");
	}

	//Getters and Setters
	public int getOfficerId() {
		return officerId;
	}

	public String getOfficerName() {
		return officerName;
	}

	public String getBranch() {
		return branch;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public void setOfficerId(int officerId) {
		this.officerId = officerId;
	}

	public void setOfficerName(String officerName) {
		this.officerName = officerName;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    
}

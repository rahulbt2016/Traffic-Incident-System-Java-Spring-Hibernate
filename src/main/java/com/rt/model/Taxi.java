package com.rt.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Taxi {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int id;
	String source;
	String destination;
	String cost;
	public Taxi() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public Taxi(int id, String source, String destination, String cost) {
		super();
		this.id = id;
		this.source = source;
		this.destination = destination;
		this.cost = cost;
	}
	@Override
	public String toString() {
		return "Taxi [id=" + id + ", source=" + source + ", destination=" + destination + ", cost="
				+ cost + "]";
	}
	
	
}

package com.rt.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author rahul
 * Represents a vehicle in the system.
 */

@Entity
@Table(name = "Vehicle")
public class Vehicle {
    @Id
    @Column(name = "vehicle_id", nullable = false, unique = true)
    private String vehicleId;
    
    @Column(name = "make", nullable = false)
    private String make;
    
    @Column(name = "model", nullable = false)
    private String model;
    
    @Column(name = "year", nullable = false)
    private int year;
    
    @Column(name = "owner_name", nullable = false)
    private String ownerName;
    
    //Constructors
    public Vehicle(String vehicleId, String make, String model, int year, String ownerName) {
		this.vehicleId = vehicleId;
		this.make = make;
		this.model = model;
		this.year = year;
		this.ownerName = ownerName;
	}
    
    public Vehicle() {
		this("", "", "", 0, "");
	}

	//Getters and Setters
	public String getVehicleId() {
		return vehicleId;
	}

	public String getMake() {
		return make;
	}

	public String getModel() {
		return model;
	}

	public int getYear() {
		return year;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setVehicleId(String vehicleId) {
		this.vehicleId = vehicleId;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
    
    
}

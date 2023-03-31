package com.rt.model;

import javax.persistence.*;

/**
 * @author rahul
 * Represents a route in the system.
 */

@Entity
@Table(name = "Route")
public class Route {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "route_id")
    private int routeId;

    @Column(name = "route_name")
    private String routeName;

    @Column(name = "location")
    private String location;

    // Default constructor
    public Route() {}

    // Constructor with parameters
    public Route(String routeName, String location) {
        this.routeName = routeName;
        this.location = location;
    }

    // Getter and setter methods
    public int getRouteId() {
        return routeId;
    }

    public void setRouteId(int routeId) {
        this.routeId = routeId;
    }

    public String getRouteName() {
        return routeName;
    }

    public void setRouteName(String routeName) {
        this.routeName = routeName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}

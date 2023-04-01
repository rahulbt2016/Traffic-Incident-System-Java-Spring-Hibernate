package com.rt.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.rt.dao.*;
import com.rt.model.*;

@Controller
public class MainController {
	
	@Autowired
	private OfficerDao officerDao;
	
	@Autowired
	private IncidentDao incidentDao;
	
	@Autowired
	private VehicleDao vehicleDao;
	
	@Autowired
	private RouteDao routeDao;
	

	@RequestMapping("/")
	public String home(Model m) {
		return "login";
	}

	// handle login form
	@RequestMapping(value = "/handle-login", method = RequestMethod.POST)
	public String handleLogin(@ModelAttribute Officer officer, HttpServletRequest request, Model m) {
		List<Officer> officers = officerDao.getOfficers();
		Officer loggedInOfficer = new Officer();
		List<Incident> incidents = new ArrayList<>();
		boolean approved = false;
		for (Iterator iterator = officers.iterator(); iterator.hasNext();) {
			Officer officer2 = (Officer) iterator.next();
			
			if (officer2.getPassword().equals(officer.getPassword()) && officer.getUsername().equals(officer2.getUsername())) {
				approved = true;
				loggedInOfficer = officer2;
				incidents = incidentDao.getIncidentsByOfficer(loggedInOfficer);
			}

		}
		
		if (approved) {
			m.addAttribute("loggedinOfficer", loggedInOfficer);
			m.addAttribute("incidents", incidents);
			HttpSession session = request.getSession();
			session.setAttribute("loggedinOfficer", loggedInOfficer);
			return "incidents";
		} else {
			return "error";
		}

	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET) 
	public String logout(Model m, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "login";
	}

	
	@RequestMapping(value = "/incidents", method = RequestMethod.GET)
	public String displayIncidents(Model m, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loggedinOfficer") != null) {
			Officer loggedInOfficer = (Officer) session.getAttribute("loggedinOfficer");
			List<Incident> incidents = incidentDao.getIncidentsByOfficer(loggedInOfficer);
			m.addAttribute("incidents", incidents);
			return "incidents";
		}
		
		return "login";
	}
	
	@RequestMapping(value = "/new-incident", method = RequestMethod.GET)
	public String showNewIncidentPage(Model m, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loggedinOfficer") != null) {
			Officer loggedInOfficer = (Officer) session.getAttribute("loggedinOfficer");
			List<Vehicle> vehicles = (List<Vehicle>) vehicleDao.getVehicles();
			List<Route> routes = (List<Route>) routeDao.getRoutes();
			m.addAttribute("vehicles", vehicles);
			m.addAttribute("routes", routes);
			
			return "new-incident";
		}
		
		return "login";
	}
	
	@RequestMapping(value = "/add-incident", method = RequestMethod.POST)
	public String addIncident(Model m, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loggedinOfficer") != null) {
			Officer loggedInOfficer = (Officer) session.getAttribute("loggedinOfficer");
			String incidentDate = request.getParameter("incidentDate");
			int  routeId =  Integer.parseInt(request.getParameter("routeId"));
			String  vehicleId = request.getParameter("vehicleId");
			String description = request.getParameter("description");
			
			Route route = routeDao.getRoute(routeId);
			Vehicle vehicle = vehicleDao.getVehicle(vehicleId);
			Incident incident = new Incident(incidentDate, route, vehicle, description, loggedInOfficer);
			incidentDao.saveIncident(incident);
			
			List<Incident> incidents = incidentDao.getIncidentsByOfficer(loggedInOfficer);
			m.addAttribute("incidents", incidents);
			return "incidents";
		}
		
		return "login";
	}

}

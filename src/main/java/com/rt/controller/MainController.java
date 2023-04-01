package com.rt.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	private AdminDao adminDao;

	@Autowired
	private TaxiDao taxiDao;

	@Autowired
	private PassengerDao passengerDao;

	@Autowired
	private BookingDao bookingDao;
	
	@Autowired
	private OfficerDao officerDao;
	
	@Autowired
	private IncidentDao incidentDao;

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
			return "incidents";
		} else {
			return "error";
		}

	}

	
	@RequestMapping(value = "/incidents", method = RequestMethod.GET)
	public String displayIncidents(Model m) {
		return "login";
	}
	
	@RequestMapping(value = "/new-incident", method = RequestMethod.GET)
	public ModelAndView showNewIncidentPage(HttpServletRequest request) {
	    ModelAndView mav = new ModelAndView("new-incident");
	    mav.addObject("loggedinOfficer", request.getSession().getAttribute("loggedinOfficer"));
	    return mav;
	}

	
	@RequestMapping("/pathlistoftaxis")
	public String showListOfAllTaxis(Model m) {
		List<Taxi> allTaxis = this.taxiDao.getAll();
		m.addAttribute("listoftaxis", allTaxis);
		return "listoftaxis";
	}

	@RequestMapping(value = "/handle-filtertaxi", method = RequestMethod.POST)
	public String showListOfTaxisBySrcAndDest(@RequestParam String source, @RequestParam String destination, Model m) {
		List<Taxi> allTaxis = this.taxiDao.getTaxisBySourceAndDestination(source, destination);
		m.addAttribute("listoftaxis", allTaxis);
		if (source.equals("") || destination.equals("")) {
			allTaxis = this.taxiDao.getAll();
			m.addAttribute("listoftaxis", allTaxis);
		}
		return "listoftaxis";
	}

	@RequestMapping(value = "/handle-booktaxi", method = RequestMethod.POST)
	public String showRegistrationToBookTaxi(@RequestParam String taxiId, Model m) {
		Taxi taxiById = taxiDao.getById(Integer.valueOf(taxiId));
		m.addAttribute("taxibyid", taxiById);
		return "bookingform";
	}

	@RequestMapping(value = "/handle-booking", method = RequestMethod.POST)
	public String handleBookingRequest(@RequestParam String taxiId, @RequestParam String firstName,
			@RequestParam String lastName, @RequestParam String phoneNumber, @RequestParam String age, Model m) {
		Taxi taxiById = taxiDao.getById(Integer.valueOf(taxiId));
		Passenger passenger = new Passenger();
		passenger.setAge(age);
		passenger.setFirstName(firstName);
		passenger.setLastName(lastName);
		passenger.setPhoneNumber(phoneNumber);
		passengerDao.addPassenger(passenger);
		Booking booking = new Booking(taxiById, passenger);
		bookingDao.saveBooking(booking);
		m.addAttribute("booking", booking);
		return "success";
	}

}

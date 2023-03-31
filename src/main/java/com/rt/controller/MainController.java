package com.rt.controller;

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

	@RequestMapping("/")
	public String home(Model m) {
		return "login";
	}

	// handle login form
	@RequestMapping(value = "/handle-login", method = RequestMethod.POST)
	public String handleLogin(@ModelAttribute Officer officer, HttpServletRequest request, Model m) {
		List<Officer> officers = officerDao.getOfficers();
		Officer loggedInOfficer = new Officer();
		boolean approved = false;
		for (Iterator iterator = officers.iterator(); iterator.hasNext();) {
			Officer officer2 = (Officer) iterator.next();
			
			if (officer2.getPassword().equals(officer.getPassword()) && officer.getUsername().equals(officer2.getUsername())) {
				approved = true;
				loggedInOfficer = officer2;
			}

		}
		
		if (approved) {
			m.addAttribute("loggedinOfficer", loggedInOfficer);
			return "incidents";
		} else {
			return "loginfailed";
		}

	}
	
	// handle login form
//		@RequestMapping(value = "/handle-login2", method = RequestMethod.POST)
//		public RedirectView handleLogin2(@ModelAttribute Admin admin, HttpServletRequest request, Model m) {
//			List<Admin> admins = adminDao.getAdmins();
//			boolean approved = false;
//			for (Iterator iterator = admins.iterator(); iterator.hasNext();) {
//				Admin admin2 = (Admin) iterator.next();
//				System.out.println(admin2.getUsername());
//				System.out.println(admin2.getPassword());
//				System.out.println(admin.getPassword());
//				if (admin2.getPassword().equals(admin.getPassword()) && admin.getUsername().equals(admin2.getUsername())) {
//					System.out.println("HERE");
//					approved = true;
//				}
//
//			}
//			if (approved) {
//				// List<Student> students = studentDao.getStudents();
//				// m.addAttribute("students", students);
//				m.addAttribute("loggedinuser", admin.getUsername());
//				RedirectView redirectView = new RedirectView();
//				redirectView.setUrl(request.getContextPath() + "/pathlistoftaxis");
//				return redirectView;
//			} else {
//				RedirectView redirectView = new RedirectView();
//				redirectView.setUrl(request.getContextPath() + "/loginfailed");
//				return redirectView;
//			}
//
//		}


	@RequestMapping("/loginfailed")
	public String showLoginFailed(Model m) {
		return "error";
	}
	
	@RequestMapping("/incidents")
	public void displayIncidents(Model m) {
		
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

package com.inkarkapen.ninjaGold.controllers;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String index(HttpSession session) {
		return "index.jsp";
	}
	@RequestMapping(path="/process_money", method=RequestMethod.POST)
	public String process_money(@RequestParam(value="building", required=true) String building,
							    @RequestParam(value="min", required=true) String minVal,
							    @RequestParam(value="max", required=true) String maxVal,
							    	HttpSession session) {
		int min = Integer.parseInt(minVal);
		int max = Integer.parseInt(maxVal);
		int random = (int)(Math.random()*(max-min+1)+min);
		Date date = new Date();
		
		ArrayList<String> activities = new ArrayList<String>();;
		int total = 0;
		String activity;
		
		if(session.getAttribute("total") == null) {
			session.setAttribute("total", 0);
		}
		else {
			total = (int)session.getAttribute("total") + random;
			session.setAttribute("total", total);
		}
		
		if(random < 0) {
			activity = "lost";
		}else {
			activity = "earned";
		}
		if(session.getAttribute("activities") != null) {
			activities = (ArrayList<String>)session.getAttribute("activities");
		}
		activities.add("You entered a " + building + " and " + activity + " " + random + "gold " + date);
		session.setAttribute("activities", activities);
		return "redirect:/";
		
	}
}

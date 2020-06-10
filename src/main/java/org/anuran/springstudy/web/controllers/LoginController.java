package org.anuran.springstudy.web.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

//	@Autowired
//	SecurityContextHolderAwareRequestWrapper securityContextHolderAwareRequestWrapper;
	
	@RequestMapping(value="/loginAdmin", method=RequestMethod.GET)
	public String loginAdmin(@RequestParam(value="error", required=false) String error, 
			@RequestParam(value="logout", required=false) String logout, 
			HttpServletRequest request ,Model model) {
		System.err.println("login error = " + error);
		System.err.println("logout = " + logout);
		if (error != null) {
			model.addAttribute("error", "Invalid Credentials");
		}
		if (logout != null){
			model.addAttribute("message", "logout successfull");
		}
		if (request.isUserInRole("ROLE_ADMIN")) {
			System.err.println("Already logged in.. show logout");
		}
		return "login";
	}
}

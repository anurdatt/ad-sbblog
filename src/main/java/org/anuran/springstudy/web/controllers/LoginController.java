package org.anuran.springstudy.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	
	
	@RequestMapping(value="/loginAdmin", method=RequestMethod.GET)
	public String loginAdmin(@RequestParam(value="error", required=false) String error, 
			@RequestParam(value="logout", required=false) String logout, Model model) {
		System.err.println("login error = " + error);
		System.err.println("logout = " + logout);
		if (error != null) {
			model.addAttribute("error", "Invalid Credentials");
		}
		if (logout != null){
			model.addAttribute("message", "logout successfull");
		}
		return "login";
	}
}

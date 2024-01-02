package org.anuran.springstudy.web.controllers;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DbController {

	@Autowired
	private DataSource dataSource;

	@Autowired
	private String dbURL;
	
	@RequestMapping("/db")
	String db(Model model) {
		try (Connection connection = dataSource.getConnection()) {
			Statement stmt = connection.createStatement();
			stmt.executeUpdate("CREATE TABLE IF NOT EXISTS ticks (tick timestamp)");
			stmt.executeUpdate("INSERT INTO ticks VALUES (now())");
			ResultSet rs = stmt.executeQuery("SELECT tick FROM ticks");

			ArrayList<String> output = new ArrayList<String>();
			while (rs.next()) {
				output.add("Read from DB: " + rs.getTimestamp("tick"));
			}
			model.addAttribute("records", output);
			model.addAttribute("dbUrl", dbURL);
			return "db";
		} catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			return "error";
		}
	}

}

package org.anuran.springstudy.web.controllers;

import java.util.List;

import org.anuran.springstudy.data.entities.views.PostView;
import org.anuran.springstudy.services.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BlogController {
	
	@Autowired
	private BlogService blogService;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/blog")
	public String blog(Model model) {
		List<PostView> posts = blogService.getAllPosts();
		model.addAttribute("posts", posts);
		return "blog/blog";
	}
}

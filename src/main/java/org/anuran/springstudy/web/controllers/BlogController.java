package org.anuran.springstudy.web.controllers;

import java.util.List;

import org.anuran.springstudy.data.entities.views.PostView;
import org.anuran.springstudy.data.entities.views.TagView;
import org.anuran.springstudy.services.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BlogController {
	
	@Autowired
	private BlogService blogService;
	
	private final Sort sort = Sort.by(Direction.DESC, "postedDt");
			
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/blog")
	public String blog(Model model) {
		List<PostView> posts = blogService.getAllPosts();
		List<TagView> tags = blogService.getAllTags(Sort.by(Direction.ASC, "name"));
		model.addAttribute("posts", posts);
		model.addAttribute("tags", tags);
		return "blog/blog";
	}
	
	@RequestMapping("/blog/tag/{tagId}")
	public String blogByTag(Model model, @PathVariable Integer tagId) {
		List<PostView> posts = blogService.getPostsByTag(tagId);
		List<TagView> tags = blogService.getAllTags(Sort.by(Direction.ASC, "name"));
		model.addAttribute("posts", posts);
		model.addAttribute("tags", tags);
		return "blog/blog";
	}
	
}

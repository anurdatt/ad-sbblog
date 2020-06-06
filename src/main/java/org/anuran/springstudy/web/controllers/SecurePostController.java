package org.anuran.springstudy.web.controllers;

import java.util.Date;

import org.anuran.springstudy.data.entities.Post;
import org.anuran.springstudy.data.entities.PostPart;
import org.anuran.springstudy.data.repositories.PostRepository;
import org.anuran.springstudy.data.utils.TagCreatorUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/secure/post")
public class SecurePostController {
	
	@Autowired
	@Qualifier("postValidator")
	Validator validator;
	
	@Autowired
	PostRepository postRepository;
	
	@Autowired
	TagCreatorUtil tagCreatorUtil;
	
	@RequestMapping("/new")
	//@Secured("hasRole('ROLE_ADMIN')")
	public String newBlog(Model model) {
		Post post = new Post();
		post.setPostPart(new PostPart());
		model.addAttribute("post", post);
		return "blog/managePost";
	}
	
	@RequestMapping("/save")
	public String save(@Validated @ModelAttribute Post post, BindingResult result,
			@RequestParam("tags") String tags) {
		
		System.out.println("tags = " + tags);
		if(result.hasErrors()){
			return "blog/managePost";
		}
		
		//Do not overwrite posted date for existing posts
		if(post.getPostedDt() == null){
			post.setPostedDt(new Date());			
		}

		post.setAuthor("Anuran Datta");
		post.setTags(tagCreatorUtil.createTags(tags));

		postRepository.save(post);
		
		return "redirect:/blog/page/0";
	}
	
	@InitBinder()
	public void initBinder(WebDataBinder wdb) {
		wdb.setValidator(validator);
	}
}



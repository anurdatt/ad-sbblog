package org.anuran.springstudy.web.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.anuran.springstudy.data.entities.Post;
import org.anuran.springstudy.data.entities.PostPart;
import org.anuran.springstudy.data.repositories.PostRepository;
import org.anuran.springstudy.data.utils.TagCreatorUtil;
import org.anuran.springstudy.data.validators.PostValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/secure/post")
public class SecurePostController {
	
//	@Autowired
//	@Qualifier("postValidator")
//	Validator validator;
	
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

	@RequestMapping("/edit/{postId}")
	public String edit(@PathVariable Integer postId, Model model) {
		Post post = postRepository.findById(postId).get();
		model.addAttribute("post", post);
		return "blog/managePost";
	}
	
	@RequestMapping("/delete/{postId}")
	public String delete(@PathVariable Integer postId/*, Model model*/) {
		postRepository.deleteById(postId);
		return "redirect:/blog/page/0";
	}
	
	
	@RequestMapping("/save")
	public String save(@Validated @ModelAttribute Post post, BindingResult result,
			 //@RequestParam("postedDt") @DateTimeFormat(iso=ISO.DATE_TIME, pattern="yyyy-MM-dd HH:MI:SS.s") Date postedDt, 
			 @RequestParam("csvTags") String csvTags) {
		
		System.out.println("csvTags = " + csvTags);
		if(result.hasErrors()){
			System.out.println("result.getAllErrors()" + result.getAllErrors());
			return "blog/managePost";
		}
		
		//Do not overwrite posted date for existing posts
		if(post.getPostedDt() == null){
		//if(hasPostedDt != null && !hasPostedDt){
			post.setPostedDt(new Date());			
		}
		
		post.setAuthor("Anuran Datta");
		post.setTags(tagCreatorUtil.createTags(csvTags));

		System.out.println("Saving post = " + post.toString());
		postRepository.save(post);
		
		return "redirect:/blog/page/0";
	}
	
	@InitBinder("post")
	public void initBinder(WebDataBinder wdb) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:SS.s");
		sdf.setLenient(true);
		wdb.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
		wdb.setValidator(new PostValidator());
	}
	
}



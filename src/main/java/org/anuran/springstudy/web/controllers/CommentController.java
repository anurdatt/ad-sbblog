package org.anuran.springstudy.web.controllers;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.anuran.springstudy.data.entities.views.TagView;
import org.anuran.springstudy.data.entities.Comment;
import org.anuran.springstudy.data.entities.views.PostView;
import org.anuran.springstudy.services.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	BlogService blogService;
	
	@Autowired
	@Qualifier("commentValidator")
	Validator validator;
	
	@RequestMapping("/save")
	public String save(@Validated @ModelAttribute Comment comment, BindingResult result, Model model,
			HttpServletRequest request) {
		Integer postId = comment.getPost().getPostId();
		//System.out.println("request.getParameter(\"mandatory\") = " + request.getParameter("mandatory"));
		if (result.hasErrors() /*|| !request.getParameter("mandatory").isEmpty()*/) {
			PostView post = blogService.getOnePost(postId);
			List<TagView> tags = blogService.getAllTags(Sort.by(Direction.ASC, "name"));
			model.addAttribute("post", post);
			model.addAttribute("tags", tags);
			model.addAttribute("isSingle", true);
			return "blog/post";
		}
		else {
			comment.setPostedDt(new Date());
			comment.setIpAddress(request.getRemoteAddr());
			blogService.saveComment(comment);
			
			return "redirect:/post/"+postId.toString();
		}	
	}
	
	@InitBinder("comment")
	public void initBinder(WebDataBinder wdb) {
		wdb.setValidator(validator);
	}
	
}

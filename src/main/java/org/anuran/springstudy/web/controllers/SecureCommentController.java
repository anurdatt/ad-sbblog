package org.anuran.springstudy.web.controllers;

import org.anuran.springstudy.data.entities.Comment;
import org.anuran.springstudy.data.entities.views.PostView;
import org.anuran.springstudy.services.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/secure/comment")
public class SecureCommentController {

	@Autowired
	BlogService blogService;
	
	@RequestMapping("{commentId}/delete")
	public String delete(@PathVariable Integer commentId, Model model) {
		Comment comment = blogService.getOneComment(commentId);
		PostView post = blogService.getOnePost(comment.getPost().getPostId());
		blogService.deleteComment(comment);
		model.addAttribute("post", post);
		model.addAttribute("tags",blogService.getAllTags(Sort.by(Direction.ASC, "name")));
		model.addAttribute("isSingle", true);
		return "blog/post";
	}
}

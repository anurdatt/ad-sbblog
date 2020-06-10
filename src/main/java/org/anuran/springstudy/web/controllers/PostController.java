package org.anuran.springstudy.web.controllers;

import java.nio.file.DirectoryIteratorException;
import java.util.List;

import org.anuran.springstudy.data.entities.views.PostView;
import org.anuran.springstudy.data.entities.views.TagView;
import org.anuran.springstudy.services.BlogService;
import org.anuran.springstudy.web.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	BlogService blogService;
	
	@RequestMapping("/{postId}")
	public String post(Model model, @PathVariable Integer postId){
		PostView post = blogService.getOnePost(postId);
		List<TagView> tags = blogService.getAllTags(Sort.by(Direction.ASC, "name"));
		model.addAttribute("post", post);
		model.addAttribute("tags", tags);
		model.addAttribute("isSingle", true);
		return "blog/post";
	}
	
	@RequestMapping("/{postId}/tags")
	@ResponseBody
	public String tagsbyPost(@PathVariable Integer postId, Model model) {
		PostView post = blogService.getOnePost(postId);
		return JsonUtil.getJson(post.getTags());
	}
}

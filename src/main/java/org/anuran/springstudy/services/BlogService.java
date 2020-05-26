package org.anuran.springstudy.services;

import java.util.List;

import org.anuran.springstudy.data.entities.views.PostView;
import org.anuran.springstudy.data.repositories.PostViewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
public class BlogService {

	@Autowired
	PostViewRepository postViewRepository;
	
	public List<PostView> getAllPosts() {
		return postViewRepository.findAll();
	}
	
	/*public Page<PostView> getAllPosts(PageRequest pageRequest) {
		return postViewRepository.findAll(pageRequest);
	}
	
	public PostView getOnePost(Integer postid) {
		return postViewRepository.findById(postid).get();	
	}*/
	
}

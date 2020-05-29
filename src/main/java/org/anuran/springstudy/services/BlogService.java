package org.anuran.springstudy.services;

import java.util.List;

import org.anuran.springstudy.data.entities.views.TagView;
import org.anuran.springstudy.data.entities.Comment;
import org.anuran.springstudy.data.entities.views.PostView;
import org.anuran.springstudy.data.repositories.CommentRepository;
import org.anuran.springstudy.data.repositories.PostViewRepository;
import org.anuran.springstudy.data.repositories.TagViewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class BlogService {

	@Autowired
	PostViewRepository postViewRepository;
	
	@Autowired
	TagViewRepository tagViewRepository;
	
	@Autowired
	CommentRepository commentRepository;
	
	/*public List<PostView> getAllPosts() {
		return postViewRepository.findAll();
	}*/
	
	public Page<PostView> getAllPosts(PageRequest pageRequest) {
		return postViewRepository.findAll(pageRequest);
	}
	
	public PostView getOnePost(Integer postid) {
		return postViewRepository.findById(postid).get();	
	}

	
	public List<TagView> getAllTags(Sort sort) {
		return tagViewRepository.findAll(sort);
	}
	
	/*public List<PostView> getPostsByTag(int tagid) {
		return postViewRepository.findByTag(tagid);
	}*/
	
	public Page<PostView> getPostsByTag(int tagid, PageRequest pageRequest) {
		return postViewRepository.findByTag(tagid, pageRequest);
	}
	
	
	public Comment saveComment(Comment comment) {
		return commentRepository.save(comment);
	}
	
	/*public void deleteComment(Comment comment) {
		commentRepository.delete(comment);
	}
	
	public Comment getOneComment(Integer commentid) {
		return commentRepository.findById(commentid).get();	
	}*/
	
}

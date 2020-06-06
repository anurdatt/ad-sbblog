package org.anuran.springstudy.data.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.anuran.springstudy.data.entities.views.PostView;

@Entity
@Table(name="TAG")
public class Tag {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="TAG_ID")
	private Integer tagId;

	@Column(name="NAME")
	private String name;
	
	@ManyToMany(mappedBy="tags")
	private List<PostView> posts;
	
	public Tag() {

	}

	public Tag(String name) {
		this.name = name;
	}

	public Tag(Integer tagId, String name) {
		this.tagId = tagId;
		this.name = name;
	}
	
	public Integer getTagId() {
		return tagId;
	}

	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<PostView> getPosts() {
		return posts;
	}

	public void setPosts(List<PostView> posts) {
		this.posts = posts;
	}
	
}

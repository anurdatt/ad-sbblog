package org.anuran.springstudy.data.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="COMMENT")
public class Comment {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="COMMENT_ID")
	private Integer commentId;
	
	@Column(name="AUTHOR")
	private String author;
	
	@Column(name="EMAIL")
	private String email;
	
	@Column(name="SITE")
	private String site;
	
	@Column(name="BODY", columnDefinition="mediumtext")
	private String body;
	
	@Column(name="IP_ADDRESS")
	private String ipAddress;
	
	@Column(name="RATING")
	private Integer rating;
	
	@Column(name="POSTED_DT")
	private Date postedDt;
	
	@ManyToOne
	@JoinColumn(name="POST_ID")
	private Post post;

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

	public Date getPostedDt() {
		return postedDt;
	}

	public void setPostedDt(Date postedDt) {
		this.postedDt = postedDt;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}
	
}

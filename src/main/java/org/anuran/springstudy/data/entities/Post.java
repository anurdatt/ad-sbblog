package org.anuran.springstudy.data.entities;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name="POST")
public class Post {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="POST_ID") 
	private Integer postId;
	
	@Column(name="TITLE")
	private String title;
	
	@Column(name="AUTHOR")
	private String author;
	
	@OneToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinColumn(name="POST_PART_ID")
	private PostPart postPart;
	
	//@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(/*iso=ISO.DATE_TIME,*/ pattern="yyyy-MM-dd hh:mm:SS.s")
	@Column(name="POSTED_DT")
	private Date postedDt;
	
	@Column(name="SOURCE_CODE", columnDefinition="mediumtext")
	String sourceCode;
	
	@ManyToMany(cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH}, targetEntity=Tag.class)
	@JoinTable(name="POST_TAG", joinColumns={@JoinColumn(name="POST_ID", referencedColumnName="POST_ID")},
	inverseJoinColumns={@JoinColumn(name="TAG_ID", referencedColumnName="TAG_ID")})
	private List<Tag> tags = new ArrayList<Tag>();
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="post")
	@OrderBy("postedDt DESC")
	private List<Comment> comments = new ArrayList<Comment>();
	
	
	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	public PostPart getPostPart() {
		return postPart;
	}

	public void setPostPart(PostPart postPart) {
		this.postPart = postPart;
	}

	public Date getPostedDt() {
		return postedDt;
	}

	public void setPostedDt(Date postedDt) {
		this.postedDt = postedDt;
	}

	public String getSourceCode() {
		return sourceCode;
	}

	public void setSourceCode(String sourceCode) {
		this.sourceCode = sourceCode;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

}

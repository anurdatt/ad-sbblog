package org.anuran.springstudy.data.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="POST_PART")
public class PostPart {
	
	@Column(name="POST_PART_ID")
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer postPartId;
	
	@Column(name="BODY", columnDefinition="longtext")
	private String body;

	//@OneToOne(mappedBy = "postPart", cascade = CascadeType.ALL,
    //        fetch = FetchType.LAZY/*, optional = false*/)
	//private Post post;
	
	public Integer getPostPartId() {
		return postPartId;
	}

	public void setPostPartId(Integer postPartId) {
		this.postPartId = postPartId;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

//	public Post getPost() {
//		return post;
//	}
//
//	public void setPost(Post post) {
//		this.post = post;
//	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((body == null) ? 0 : body.hashCode());
//		result = prime * result + ((post == null) ? 0 : post.hashCode());
		result = prime * result + ((postPartId == null) ? 0 : postPartId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PostPart other = (PostPart) obj;
		if (body == null) {
			if (other.body != null)
				return false;
		} else if (!body.equals(other.body))
			return false;
//		if (post == null) {
//			if (other.post != null)
//				return false;
//		} else if (!post.equals(other.post))
//			return false;
		if (postPartId == null) {
			if (other.postPartId != null)
				return false;
		} else if (!postPartId.equals(other.postPartId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "PostPart [postPartId=" + postPartId + ", body=" + body + "]";
	}
	
	
}

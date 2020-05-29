package org.anuran.springstudy.data.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="POST_PART")
public class PostPart {
	
	@Column(name="POST_PART_ID")
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer postPartId;
	
	@Column(name="BODY", columnDefinition="text")
	private String body;

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
	
	
}

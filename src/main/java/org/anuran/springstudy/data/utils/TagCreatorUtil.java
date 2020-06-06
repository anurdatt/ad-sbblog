package org.anuran.springstudy.data.utils;

import java.util.ArrayList;
import java.util.List;

import org.anuran.springstudy.data.entities.Tag;
import org.anuran.springstudy.data.repositories.TagRepository;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class TagCreatorUtil {
	
	@Autowired
	private TagRepository tagRepository;
	
	public Tag createTag(String tag){
		List<org.anuran.springstudy.data.entities.Tag> tags =  this.createTags(tag);
		return (tags.isEmpty()) ? null : tags.get(0);
	}
	
	public List<Tag> createTags(String csvTags) {
		List<Tag> tags = new ArrayList<Tag>();
		String[] tagValues = csvTags.split(",");

		for (String tag : tagValues) {
			if (!StringUtils.isEmpty(tag)) {
				if (!NumberUtils.isCreatable(tag)) {
					tags.add(new Tag(tag));
				} else {
					tags.add(tagRepository.findById(new Integer(tag)).get());
				}
			}
		}
		return tags;
	}

}

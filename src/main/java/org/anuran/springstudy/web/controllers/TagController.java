package org.anuran.springstudy.web.controllers;

import java.util.List;

import org.anuran.springstudy.data.entities.Tag;
import org.anuran.springstudy.data.repositories.TagRepository;
import org.anuran.springstudy.web.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/tag")
public class TagController {
	
	@Autowired
	TagRepository tagRepository;
	
	@RequestMapping(value="/find/{namePart}"/*, method=RequestMethod.POST*/)
	@ResponseBody
	public String getTagsByNamePart(@PathVariable String namePart) {
		return JsonUtil.getJson(tagRepository.findByName(namePart));
		//return tagRepository.findByName(namePart);
	}
}

package org.anuran.springstudy.web.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.anuran.springstudy.annotations.PageableRequest;
import org.apache.commons.lang3.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class PageableRequestInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(PageableRequestInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.debug("In Interceptor postHandle - before HandlerMethod check");
		if (!(handler instanceof HandlerMethod)) {
			return;
		}
		logger.debug("In Interceptor postHandle - after HandlerMethod check");
		HandlerMethod method = (HandlerMethod) handler;
		PageableRequest annotation = method.getMethodAnnotation(PageableRequest.class);
		
		if ( annotation != null) {
			String path = annotation.path();
			String defaultPath;
			try {
				defaultPath = (String) PageableRequest.class.getMethod("path").getDefaultValue();
			} catch (Exception e) {
				defaultPath = "/";
			}
			
			int pageNumber = 0;
			if (!path.equalsIgnoreCase(defaultPath)) {
				pageNumber = parsePageNumber(path, request.getRequestURL());
			}
			else {
				pageNumber = parsePageNumber(defaultPath, request.getRequestURL());
			}
			modelAndView.addObject("nextPage", pageNumber+1);
			modelAndView.addObject("prevPage", pageNumber-1);
			
			logger.debug("Current page is {}", pageNumber);
		}
		super.postHandle(request, response, handler, modelAndView);
	}
	
	private int parsePageNumber(String path, StringBuffer url) {
		String [] parts = url.toString().split("/");
		
		for (int i=0; i<parts.length; i++) {
			if (parts[i].equalsIgnoreCase(path) && NumberUtils.isCreatable(parts[i+1])) {
				return Integer.parseInt(parts[i+1]);
			}
		}
		if("/".equals(path)) {
			String page = parts[parts.length - 1];
			if (NumberUtils.isCreatable(page))
				return Integer.parseInt(page);
		}
		return 0;
	}
}

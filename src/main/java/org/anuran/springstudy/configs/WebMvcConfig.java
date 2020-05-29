package org.anuran.springstudy.configs;

import org.anuran.springstudy.web.interceptors.PageableRequestInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	private static final Logger logger = LoggerFactory.getLogger(WebMvcConfig.class);
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		logger.info("I am in WebMvcConfig.addInterceptors().." );
		registry.addInterceptor(new PageableRequestInterceptor()).addPathPatterns("/blog/**");
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
	@Bean
	ResourceBundleMessageSource messageSource() {
		ResourceBundleMessageSource source = new ResourceBundleMessageSource();
		source.setBasename("messages/messages");
		return source;
	}
}

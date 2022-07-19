package com.carrot.marketapp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class MultipartResolverConfig {

	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver createMultipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		//최대사이즈 조절
		//resolver.setMaxUploadSize(10485760);
		resolver.setDefaultEncoding("utf-8");
		return resolver;
	}
}

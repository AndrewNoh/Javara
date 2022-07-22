package com.carrot.marketapp.config.web;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
public class AppConfig {

	@Bean
	public ObjectMapper objectMapper() {
		return new ObjectMapper().setSerializationInclusion(JsonInclude.Include.NON_NULL)
				.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		// JsonInclude.Include.NON_NULL = null은 변환안함
		// DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES = 선언되지 않은 모든 속성은 무시
	}
}

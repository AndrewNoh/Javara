package com.carrot.marketapp.config.security;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.multipart.support.MultipartFilter;

/* Spring Security를 사용하려면 AbstractSecurityWebApplicationInitializer를 
 * 상속받는 클래스를 반드시 작성해야 한다. 이 클래스가 있을 경우 
 * Spring Security가 제공하는 필터들을 사용할 수 있도록 활성화 해준다.
 */

public class WebSecurityApplicationInitializer extends AbstractSecurityWebApplicationInitializer {

	@Override
	protected void beforeSpringSecurityFilterChain(ServletContext servletContext) {
		FilterRegistration.Dynamic characterEncodingFilter = servletContext.addFilter("encodingFilter",
				new CharacterEncodingFilter());
		characterEncodingFilter.setInitParameter("encoding", "UTF-8");
		characterEncodingFilter.setInitParameter("forceEncoding", "true");
		characterEncodingFilter.addMappingForUrlPatterns(null, false, "/*");
		FilterRegistration.Dynamic springMultipartFilter = servletContext.addFilter("springMultipartFilter",
				new MultipartFilter());
		springMultipartFilter.addMappingForUrlPatterns(null, false, "/*");
	}
}

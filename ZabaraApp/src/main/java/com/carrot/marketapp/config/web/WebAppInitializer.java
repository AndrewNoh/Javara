package com.carrot.marketapp.config.web;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.ShallowEtagHeaderFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.carrot.marketapp.config.HikariConfig;
import com.carrot.marketapp.config.security.WebSecurityConfig;

public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] { HikariConfig.class, AppConfig.class, WebSecurityConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] { WebMvcConfig.class };
	}

	/*
	 * getServletMapping()은 DispatcherServlet이 매핑되기 위한 하나 혹은 여러 개의 패스를 지정한다. 위의
	 * 코드에서는 애플리케이션 기본 서블릿인 /에만 매핑이 되어 있다. 그리고 이것은 애플리케이션으로 들어오는 모든 요청을 처리한다. 원래
	 * 서블릿에서는 / 을 처리하는 DefaultServlet이 설정되어 있다.
	 */
	@Override
	protected String[] getServletMappings() {
		return new String[] { "/", "*.do" };
	}

	@Override
	protected Filter[] getServletFilters() {
		return new Filter[] { getCharacterEncodingFilter(), new ShallowEtagHeaderFilter() };
	};

	protected CharacterEncodingFilter getCharacterEncodingFilter() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter("utf-8");
		characterEncodingFilter.setForceEncoding(true);
		return characterEncodingFilter;
	};

}

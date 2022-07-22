package com.carrot.marketapp.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.zaxxer.hikari.HikariDataSource;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	public void configure(AuthenticationManagerBuilder auth, HikariDataSource dataSource) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource).usersByUsernameQuery(
				"SELECT m.email as username,m.password,enabled FROM members m JOIN AUTHORITY_SECURITY AU ON m.userno=au.userno WHERE m.email=?")
				.authoritiesByUsernameQuery(
						"SELECT m.email as username,authority FROM members m JOIN AUTHORITY_SECURITY AU ON m.userno=au.userno WHERE m.email=?");
	}

	@Override // 밑에 HttpSecurity 보다 우선 시, static 파일 (css, js 같은) 인증이필요없는 리소스는 이곳에서 설정
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}

	@Bean
	// BCryptPasswordEncoder는 Spring Security에서 제공하는 비밀번호 암호화 객체입니다.
	// Service에서 비밀번호를 암호화할 수 있도록 Bean으로 등록합니다.
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}

	@Override // 리소스 보안 부분
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests() // 요청에 의한 보안검사 시작
				.antMatchers("/board/**", "/auction/**", "/chat/**").hasAnyRole("USER").antMatchers("/", "/main")
				.permitAll().anyRequest().permitAll() // 어떤 요청에도 보안검사를 한다.

				.and().formLogin()// 보안 검증은 formLogin방식으로 하겠다.
				.loginPage("/location/login.do") // 사용자 정의 로그인 페이지
				.failureUrl("/location/login.do?error=true") // 로그인 실패 후 이동 페이지
				.loginProcessingUrl("/security/login.do") // 로그인 Form Action Url
				.defaultSuccessUrl("/") // 로그인 성공 후 이동 페이지
				.usernameParameter("id") // 아이디 파라미터명 설정
				.passwordParameter("pwd") // 패스워드 파라미터명 설정

				.and().logout().logoutUrl("/security/logout.do").logoutSuccessUrl("/").invalidateHttpSession(true)

				.and().sessionManagement().maximumSessions(1) // 최대 허용 가능 세션 수 , -1 : 무제한 로그인 세션 허용
				.maxSessionsPreventsLogin(false) // 동시 로그인 차단함, false : 기존 세션 만료(default)
				.expiredUrl("/user/Login.market"); // 세션이 만료된 경우 이동 할 페이지

		http.headers().frameOptions().disable();

	}

}

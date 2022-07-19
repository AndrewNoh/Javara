package com.carrot.marketapp.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;

import com.zaxxer.hikari.HikariDataSource;

@PropertySource("classpath:config/database/connect.properties")
public class HikariConfig {

	@Value("${driver}")
	private String driver;
	@Value("${url}")
	private String url;
	@Value("${name}")
	private String name;
	@Value("${pwd}")
	private String pwd;

	@Bean
	public HikariDataSource dataSource() {
		HikariDataSource dataSource = new HikariDataSource();
		dataSource.setDriverClassName(driver);
		dataSource.setJdbcUrl(url);
		dataSource.setUsername(name);
		dataSource.setPassword(pwd);
		return dataSource;
	}
}

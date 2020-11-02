package org.anuran.springstudy.configs;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
public class AppConfig {

	@Value("${spring.datasource.url}")
	private String dbUrl;
	
	@Bean
	public DataSource dataSource() throws SQLException {
		if (dbUrl == null || dbUrl.isEmpty()) {
			return new HikariDataSource();
		} else {
			HikariConfig config = new HikariConfig();
			config.setJdbcUrl(dbUrl);
			//config.setDriverClassName("com.mysql.jdbc.Driver");
			return new HikariDataSource(config);
		}
	}
	
	@Bean
	public String dbURL() {
		if (dbUrl == null || dbUrl.isEmpty()) {
			return new String("");
		} else {
			return new String(dbUrl);
		}
	}

}

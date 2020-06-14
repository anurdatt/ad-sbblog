package org.anuran.springstudy.configs;

import org.anuran.springstudy.services.DBUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.expression.DefaultWebSecurityExpressionHandler;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;

@Configuration
@EnableGlobalMethodSecurity(securedEnabled = true)
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Bean
	public DefaultWebSecurityExpressionHandler defaultWebSecurityExpressionHandler() {
		return new DefaultWebSecurityExpressionHandler();
	}
	
	@Bean
	public UserDetailsService dbUserDetailsService() {
		return new DBUserDetailsService();
	}
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder(11);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//http
		//.authorizeRequests()
		/*			.antMatchers("/resources/**", "/login.jsp*")
		.access("hasRole('IS_AUTHENTICATED_ANONYMOUSLY')")*/
		//.antMatchers("/**/secure/**")
		//.hasRole("USER")
		//.anyRequest()
		//	.permitAll()
		//.and()
		/*.formLogin()
		.loginPage("/login.jsp")
		.permitAll()
		.loginProcessingUrl("/login")
		.defaultSuccessUrl("/");*/

//		http.authorizeRequests()
//		.antMatchers("/**/secure/**").hasRole("ADMIN")
//		.antMatchers("/**").permitAll()
//		//.and()
//		//.formLogin().permitAll()
//		.and()
//		.logout().permitAll()
//		//.invalidateHttpSession(true)
//		//.logoutUrl("/logout")
//		.logoutSuccessUrl("/")
//		;

		
		http
		  .headers().frameOptions().sameOrigin()
		  .and()
		  .authorizeRequests()
			.antMatchers("/**/secure/**").hasRole("ADMIN")
		    .antMatchers("/**").permitAll()
		    .and()
		  .formLogin()
		    .loginPage("/loginAdmin")
		    .permitAll()
		    .usernameParameter("j_username")
		    .passwordParameter("j_password")
//		    .loginProcessingUrl("/login")
		    .failureUrl("/loginAdmin?error")
		    .defaultSuccessUrl("/blog/page/0")
		    .and()
		  .logout()
		    .permitAll()
		  //.invalidateHttpSession(true)
		  //.logoutUrl("/logout")
		    .logoutSuccessUrl("/loginAdmin?logout")
		  //  .and()
		  //.httpBasic()
//		    .and()
//		    .csrf().disable()
		;
		super.configure(http);
	}
	
//	@Override
//	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		auth.inMemoryAuthentication().withUser("anuran").password("{noop}password")
//		.roles("ADMIN");
//		super.configure(auth);
//	}
	
	
	@Autowired
	protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		//auth.inMemoryAuthentication().withUser("anuran").password("{noop}password")
		//.roles("ADMIN");
		auth.userDetailsService(dbUserDetailsService()).passwordEncoder(bCryptPasswordEncoder());
	}
}

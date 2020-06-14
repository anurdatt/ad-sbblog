package org.anuran.springstudy.services;

import java.util.List;
import java.util.stream.Collectors;

import org.anuran.springstudy.data.entities.User;
import org.anuran.springstudy.data.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DBUserDetailsService implements UserDetailsService {

	@Autowired
	UserRepository userRepository;
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true, noRollbackFor=Exception.class)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub	
		List<User> user = userRepository.findByName(username);
		if(user.size() == 0) {
			throw new UsernameNotFoundException("User does not exist!");
		}
		return org.springframework.security.core.userdetails.User.withUsername(user.get(0).getName())
				.password(user.get(0).getPassword())
				.authorities(user.get(0).getRoles()
						.stream()
						.map(role -> new SimpleGrantedAuthority(role.getName()))
						.collect(Collectors.toList()))
				.build();
	}

}

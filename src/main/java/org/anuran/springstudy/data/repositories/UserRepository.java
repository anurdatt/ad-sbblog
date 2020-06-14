package org.anuran.springstudy.data.repositories;

import java.util.List;

import org.anuran.springstudy.data.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {

	List<User> findByName(String name);
}

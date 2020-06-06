package org.anuran.springstudy.data.repositories;

import java.util.List;

import org.anuran.springstudy.data.entities.Tag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TagRepository extends JpaRepository<Tag, Integer> {

	@Query("select t from Tag t where lower(t.name) like '%' || :name || '%'")
	public List<Tag> findByName(@Param("name") String name);
}

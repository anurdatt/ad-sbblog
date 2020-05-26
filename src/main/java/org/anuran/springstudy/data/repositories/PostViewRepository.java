package org.anuran.springstudy.data.repositories;

import org.anuran.springstudy.data.entities.views.PostView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly=true)
public interface PostViewRepository extends JpaRepository<PostView, Integer> {

}

package com.example.demo.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.Like;

public interface ILikeRepository extends CrudRepository<Like, Integer> {

	@Transactional
	@Modifying
	@Query(value="DELETE FROM likes WHERE id_user = :id_user", nativeQuery=true)
	public void deleteAllLikesByIdUser(@Param("id_user")int id_user);
}

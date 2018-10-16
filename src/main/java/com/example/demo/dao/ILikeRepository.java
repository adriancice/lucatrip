package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.Like;

public interface ILikeRepository extends CrudRepository<Like, Integer> {

}

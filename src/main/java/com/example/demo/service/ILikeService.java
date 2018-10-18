package com.example.demo.service;

import com.example.demo.model.Like;

public interface ILikeService {

	Like save(Like like);

	Boolean delete(int id);

	Like update(Like like);

	Like findById(int id);

}

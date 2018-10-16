package com.example.demo.service;

import java.util.Collection;

import com.example.demo.model.User;

public interface IUserSevice {

	User save(User user);

	Boolean delete(int id);

	User update(User user);

	User findById(int id);

	User findByEmail(String email);

	Collection<User> findAll();

}

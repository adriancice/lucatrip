package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.Evento;

public interface IEventoRepository extends CrudRepository<Evento, Integer>{

}

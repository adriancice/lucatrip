package com.example.demo.dao;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.example.demo.model.Evento;

public interface IEventoRepository extends PagingAndSortingRepository<Evento, Integer> {

}

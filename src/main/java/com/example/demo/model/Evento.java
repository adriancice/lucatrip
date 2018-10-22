package com.example.demo.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * La clase entity del evento
 * 
 * @author admin
 *
 */
@Entity
@Table(name = "eventos")
public class Evento {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_evento")
	private int idEvento;

	private double latitud;

	private double longitud;

	private String sitio;

	@Column(name = "fecha_evento")
	private String fechaEvento;

	private String pais;

	private String ciudad;

	private String descripcion;

	@Column(columnDefinition = "LONGTEXT")
	private String imagen;

	@Column(name = "id_user")
	private int idUser;

	@Column(name = "create_at")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date createAt;

	@PrePersist
	public void PrePersist() {
		createAt = new Date();
	}

	public int getIdEvento() {
		return idEvento;
	}

	public void setIdEvento(int idEvento) {
		this.idEvento = idEvento;
	}

	public double getLatitud() {
		return latitud;
	}

	public void setLatitud(double latitud) {
		this.latitud = latitud;
	}

	public double getLongitud() {
		return longitud;
	}


	public String getFechaEvento() {
		return fechaEvento;
	}

	public void setFechaEvento(String fechaEvento) {
		this.fechaEvento = fechaEvento;
	}

	public void setLongitud(double longitud) {
		this.longitud = longitud;
	}

	public String getSitio() {
		return sitio;
	}

	public void setSitio(String sitio) {
		this.sitio = sitio;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

}

package com.newture.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="fb_time")
public class Fb_time implements Serializable {

	private static final long serialVersionUID = 952806715545438510L;
	@Id  
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="payablemoney_seq")  
	@SequenceGenerator(name="payablemoney_seq", sequenceName="seq_Fb_time")
	private int id;
	
	@Column(name = "address", length=50,unique=false)
	private	String address;
	
	@Column(name = "startime", length=50,unique=false)
	private	Date startime;
	
	@Column(name = "endtime", length=50,unique=false)
	private	Date endtime;
	
	@Column(name = "lot", length=50,unique=false)
	private	int lot;
	
	@Column(name = "statu", length=50,unique=false)
	private	int statu;
	
	@ManyToOne(cascade = {CascadeType.ALL},optional = false,fetch = FetchType.EAGER)
	private Class_schedule classchedule;
	
	@ManyToOne(cascade = {CascadeType.ALL},optional = false,fetch = FetchType.EAGER)
	private Users users;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getStartime() {
		return startime;
	}

	public void setStartime(Date startime) {
		this.startime = startime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public int getLot() {
		return lot;
	}

	public void setLot(int lot) {
		this.lot = lot;
	}

	public int getStatu() {
		return statu;
	}

	public void setStatu(int statu) {
		this.statu = statu;
	}

	public Class_schedule getClasschedule() {
		return classchedule;
	}

	public void setClasschedule(Class_schedule classchedule) {
		this.classchedule = classchedule;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}
	
}

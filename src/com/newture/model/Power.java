package com.newture.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="power")
public class Power implements Serializable {

	private static final long serialVersionUID = 7556312452853420010L;
	
	@Id  
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="payablemoney_seq")  
	@SequenceGenerator(name="payablemoney_seq", sequenceName="seq_Power")
	private int pid;
	
	@Column(name = "powername", length=50,unique=false)
	private	String powername;
	
	@Column(name = "powerurl", length=100,unique=false)
	private	String powerurl;
	
	@Column(name = "paretid",unique=false)
	private	int paretid;
	
	@Column(name = "statu", unique=false)
	private	int statu;
	
	@Column(name = "imageurl", length=100,unique=false)
	private	String imageurl;
	
	@ManyToMany(mappedBy = "power", targetEntity = Role.class)
	private Set<Role> role;

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPowername() {
		return powername;
	}

	public void setPowername(String powername) {
		this.powername = powername;
	}

	public String getPowerurl() {
		return powerurl;
	}

	public void setPowerurl(String powerurl) {
		this.powerurl = powerurl;
	}

	public int getParetid() {
		return paretid;
	}

	public void setParetid(int paretid) {
		this.paretid = paretid;
	}

	public int getStatu() {
		return statu;
	}

	public void setStatu(int statu) {
		this.statu = statu;
	}

	public String getImageurl() {
		return imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	public Set<Role> getRole() {
		return role;
	}

	public void setRole(Set<Role> role) {
		this.role = role;
	} 
	
	
}

package com.newture.model;

import java.sql.Date;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="classes")
public class Classes implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	@Id  
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="payablemoney_seq")  
	@SequenceGenerator(name="payablemoney_seq", sequenceName="seq_Classes")
	private int cid;
	
	@Column(name = "classname", length=50,unique=true)
	private String classname;
	
	@Column(name = "statu", unique=false)
	private int statu;
	
	@Column(name = "createtime",unique=false)
	private Date createtime;
	
	@OneToMany(mappedBy="classes",cascade = {CascadeType.ALL},fetch = FetchType.LAZY)
	private Set<Class_schedule> classchedule = new HashSet<Class_schedule>();
	
	@OneToMany(mappedBy="stuclasses",cascade = {CascadeType.ALL},fetch = FetchType.LAZY)
	private Set<Users> users = new HashSet<Users>();
	
	@ManyToOne(cascade = {CascadeType.ALL},optional = false,fetch = FetchType.EAGER)
	private Users tusers;
	
	@OneToMany(mappedBy="classes",cascade = {CascadeType.ALL},fetch = FetchType.LAZY)
	private Set<Feenbackscore> Feenbackscore = new HashSet<Feenbackscore>();

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public int getStatu() {
		return statu;
	}

	public void setStatu(int statu) {
		this.statu = statu;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Set<Class_schedule> getClasschedule() {
		return classchedule;
	}

	public void setClasschedule(Set<Class_schedule> classchedule) {
		this.classchedule = classchedule;
	}

	public Set<Users> getUsers() {
		return users;
	}

	public void setUsers(Set<Users> users) {
		this.users = users;
	}

	public Users getTusers() {
		return tusers;
	}

	public void setTusers(Users tusers) {
		this.tusers = tusers;
	}

	public Set<Feenbackscore> getFeenbackscore() {
		return Feenbackscore;
	}

	public void setFeenbackscore(Set<Feenbackscore> feenbackscore) {
		Feenbackscore = feenbackscore;
	}

	@Override
	public String toString() {
		return "Classes [cid=" + cid + ", classname=" + classname + ", statu=" + statu + ", createtime=" + createtime
				+ ", classchedule=" + classchedule + ", users=" + users + ", tusers=" + tusers + ", Feenbackscore="
				+ Feenbackscore + "]";
	}


	
	
}

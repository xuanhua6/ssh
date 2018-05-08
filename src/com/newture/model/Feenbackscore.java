package com.newture.model;

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
@Table(name="feenbackscore")
public class Feenbackscore implements java.io.Serializable{

	private static final long serialVersionUID = 5010819553119034862L;
	
	@Id  
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="payablemoney_seq")  
	@SequenceGenerator(name="payablemoney_seq", sequenceName="seq_Feenbackscore")
	private int id;
	
	@Column(name = "score",unique=false)
	private	int score;
	
	@Column(name = "ctime",unique=false)
	private	Date ctime;
	
	@Column(name = "statu",unique=false)
	private	int statu;
	
	@ManyToOne(cascade = {CascadeType.ALL},optional = false,fetch = FetchType.EAGER)
	private Classes classes;
	
	@ManyToOne(cascade = {CascadeType.ALL},optional = false,fetch = FetchType.EAGER)
	private Feenback_item feenback_item;
	
	@ManyToOne(cascade = {CascadeType.ALL},optional = false,fetch = FetchType.EAGER)
	private Users tusers;
	
	@ManyToOne(cascade = {CascadeType.ALL},optional = false,fetch = FetchType.EAGER)
	private Users stusers;
	
	@ManyToOne(cascade = {CascadeType.ALL},optional = false,fetch = FetchType.EAGER)
	private Course course;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Date getCtime() {
		return ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}

	public int getStatu() {
		return statu;
	}

	public void setStatu(int statu) {
		this.statu = statu;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	public Feenback_item getFeenback_item() {
		return feenback_item;
	}

	public void setFeenback_item(Feenback_item feenback_item) {
		this.feenback_item = feenback_item;
	}

	public Users getTusers() {
		return tusers;
	}

	public void setTusers(Users tusers) {
		this.tusers = tusers;
	}

	public Users getStusers() {
		return stusers;
	}

	public void setStusers(Users stusers) {
		this.stusers = stusers;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
}

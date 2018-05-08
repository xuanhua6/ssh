package com.newture.model;

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

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
/**
 * 指标项
 * @author Administrator
 *
 */
@Entity
@Table(name="feenback_item")			//指定实体类和对应表的名称
//@Cache(usage = CacheConcurrencyStrategy.NONE) 
public class Feenback_item implements java.io.Serializable{
	
	private static final long serialVersionUID = 4132491235994715682L;

	@Id  
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="payablemoney_seq")  
	@SequenceGenerator(name="payablemoney_seq", sequenceName="seq_Feenback_item")
	@Column(name = "fb_id")
	private int fb_id;//ID
	
	@Column(name = "fb_name", length=100)
	private String fb_name;//指标项内容
	
	@Column(name = "fb_score", length=11)
	private int fb_score;//分值
	
	@ManyToOne(cascade = {CascadeType.ALL},optional = false,fetch = FetchType.EAGER)
	private Feenback feenback;

	@OneToMany(mappedBy="feenback_item",cascade = {CascadeType.ALL},fetch = FetchType.LAZY)
	private Set<Feenbackscore> feenbackscore = new HashSet<Feenbackscore>();

	public int getFb_id() {
		return fb_id;
	}

	public void setFb_id(int fb_id) {
		this.fb_id = fb_id;
	}

	public String getFb_name() {
		return fb_name;
	}

	public void setFb_name(String fb_name) {
		this.fb_name = fb_name;
	}

	public int getFb_score() {
		return fb_score;
	}

	public void setFb_score(int fb_score) {
		this.fb_score = fb_score;
	}

	public Feenback getFeenback() {
		return feenback;
	}

	public void setFeenback(Feenback feenback) {
		this.feenback = feenback;
	}

	public Set<Feenbackscore> getFeenbackscore() {
		return feenbackscore;
	}

	public void setFeenbackscore(Set<Feenbackscore> feenbackscore) {
		this.feenbackscore = feenbackscore;
	}

	@Override
	public String toString() {
		return "Feenback_item [fb_id=" + fb_id + ", fb_name=" + fb_name + ", fb_score=" + fb_score + ", feenback="
				+ feenback + ", feenbackscore=" + feenbackscore + "]";
	}
}

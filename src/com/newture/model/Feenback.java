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
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 指标类别
 * @author Administrator
 *
 */
@Entity	//指定实体类和对应表的名称
@Table(name="feenback")
public class Feenback implements java.io.Serializable{
	
	private static final long serialVersionUID = -3957309199633381668L;
	@Id  
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="payablemoney_seq")  
	@SequenceGenerator(name="payablemoney_seq", sequenceName="seq_feenback",allocationSize=1,initialValue=1)
	private int feenback_id;//id
	@Column(name = "feenback_name", length=50,unique=true)
	private String feenback_name;//类名
	
	@OneToMany(mappedBy="feenback",cascade = {CascadeType.ALL},fetch = FetchType.LAZY)
	private Set<Feenback_item> feenback_item = new HashSet<Feenback_item>();
	public Set<Feenback_item> getFeenback() {
		return feenback_item;
	}
	public void setFeenback(Set<Feenback_item> feenback_item) {
		this.feenback_item = feenback_item;
	}
	
	public int getFeenback_id() {
		return feenback_id;
	}

	public void setFeenback_id(int feenback_id) {
		this.feenback_id = feenback_id;
	}

	public String getFeenback_name() {
		return feenback_name;
	}

	public void setFeenback_name(String feenback_name) {
		this.feenback_name = feenback_name;
	}
	@Override
	public String toString() {
		return "Feenback [feenback_id=" + feenback_id + ", feenback_name=" + feenback_name + ", feenback_item="
				+ feenback_item + "]";
	}
}

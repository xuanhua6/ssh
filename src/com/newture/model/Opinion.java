package com.newture.model;

import java.io.Serializable;
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

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="opinion")
public class Opinion implements Serializable {

	private static final long serialVersionUID = 3603646174670263073L;
	
	@Id  
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="payablemoney_seq")  
	@SequenceGenerator(name="payablemoney_seq", sequenceName="seq_Opinion")
	private int id;
	
	@Column(name = "username", length=50,unique=false)
	private	String content;
	
	@Column(name = "createtime",unique=false)
	private	Date createtimt;
	
	@ManyToOne(cascade = {CascadeType.ALL},optional = false,fetch = FetchType.EAGER)
	private Users tusers;
	
	@OneToMany(mappedBy="opinions",cascade = {CascadeType.ALL},fetch = FetchType.LAZY)
	private Set<Users> users = new HashSet<Users>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreatetimt() {
		return createtimt;
	}

	public void setCreatetimt(Date createtimt) {
		this.createtimt = createtimt;
	}

	public Users getTusers() {
		return tusers;
	}

	public void setTusers(Users tusers) {
		this.tusers = tusers;
	}

	public Set<Users> getUsers() {
		return users;
	}

	public void setUsers(Set<Users> users) {
		this.users = users;
	}

}

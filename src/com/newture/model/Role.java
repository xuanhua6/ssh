package com.newture.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="role")
public class Role implements java.io.Serializable{

	private static final long serialVersionUID = 4905603792679026782L;
	
	@Id  
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="payablemoney_seq")  
	@SequenceGenerator(name="payablemoney_seq", sequenceName="seq_Role")
	private int rid;
	
	@Column(name = "rolename", length=60,unique=false)
	private	String rolename;
	
	@ManyToMany(targetEntity = Power.class, fetch = FetchType.EAGER)  
	@JoinTable(name = "roles_power", joinColumns = @JoinColumn(name = "rid"), inverseJoinColumns = @JoinColumn(name = "pid"))  
	@Cache(usage = CacheConcurrencyStrategy.NONE)
	private Set<Power> power;
	
	@ManyToMany(mappedBy = "roles", targetEntity = Users.class)
	private Set<Users> users;

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public Set<Power> getPower() {
		return power;
	}

	public void setPower(Set<Power> power) {
		this.power = power;
	}

	public Set<Users> getUsers() {
		return users;
	}

	public void setUsers(Set<Users> users) {
		this.users = users;
	} 
	
	
}

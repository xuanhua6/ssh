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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="users")
public class Users implements java.io.Serializable {

	private static final long serialVersionUID = 472104487935690636L;
	@Id  
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator="payablemoney_seq")  
	@SequenceGenerator(name="payablemoney_seq", sequenceName="seq_Users")
	private int id;
	
	@Column(name = "username", length=50,unique=true)
	private	String username;
	
	@Column(name = "password", length=50,unique=false)
	private	String password;
	
	@Column(name = "truename", length=50,unique=false)
	private	String truename;
	
	@Column(name = "sex", length=2,unique=false)
	private	String sex;
	
	@Column(name = "age",unique=false)
	private	int age;
	
	@Column(name = "address", length=100,unique=false)
	private	String address;
	
	@Column(name = "tel", length=15,unique=false)
	private	String tel;
	
	@Column(name = "card", length=18,unique=false)
	private	String card;
	
	@Column(name = "statu",unique=false)
	private	int statu;
	
	@ManyToOne(cascade = {CascadeType.ALL},optional = false,fetch = FetchType.EAGER)
	private Dept dept;
	
	@OneToMany(mappedBy="users",cascade = {CascadeType.ALL},fetch = FetchType.LAZY)
	private Set<Class_schedule> classchedule = new HashSet<Class_schedule>();
	
	@OneToMany(mappedBy="users",cascade = {CascadeType.ALL},fetch = FetchType.LAZY)
	private Set<Fb_time> fb_time = new HashSet<Fb_time>();
	
	@ManyToOne(cascade = {CascadeType.ALL},optional = false,fetch = FetchType.EAGER)
	private Classes stuclasses;
	
	@OneToMany(mappedBy="tusers",cascade = {CascadeType.ALL},fetch = FetchType.EAGER)
	private Set<Classes> classes = new HashSet<Classes>();
	
	@OneToMany(mappedBy="tusers",cascade = {CascadeType.ALL},fetch = FetchType.LAZY)
	private Set<Feenbackscore> tfeenbackscore = new HashSet<Feenbackscore>();
	
	@OneToMany(mappedBy="stusers",cascade = {CascadeType.ALL},fetch = FetchType.LAZY)
	private Set<Feenbackscore> stufeenbackscore = new HashSet<Feenbackscore>();
	
	@ManyToOne(cascade = {CascadeType.ALL},optional = false,fetch = FetchType.EAGER)
	private Opinion opinions;
	
	@OneToMany(mappedBy="tusers",cascade = {CascadeType.ALL},fetch = FetchType.LAZY)
	private Set<Opinion> opinion = new HashSet<Opinion>();
	
	@ManyToMany(targetEntity = Role.class, fetch = FetchType.EAGER)  
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "id"), inverseJoinColumns = @JoinColumn(name = "rid"))  
	@Cache(usage = CacheConcurrencyStrategy.NONE)
	private Set<Role> roles;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTruename() {
		return truename;
	}

	public void setTruename(String truename) {
		this.truename = truename;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public int getStatu() {
		return statu;
	}

	public void setStatu(int statu) {
		this.statu = statu;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public Set<Class_schedule> getClasschedule() {
		return classchedule;
	}

	public void setClasschedule(Set<Class_schedule> classchedule) {
		this.classchedule = classchedule;
	}

	public Set<Fb_time> getFb_time() {
		return fb_time;
	}

	public void setFb_time(Set<Fb_time> fb_time) {
		this.fb_time = fb_time;
	}

	public Classes getStuclasses() {
		return stuclasses;
	}

	public void setStuclasses(Classes stuclasses) {
		this.stuclasses = stuclasses;
	}

	public Set<Classes> getClasses() {
		return classes;
	}

	public void setClasses(Set<Classes> classes) {
		this.classes = classes;
	}

	public Set<Feenbackscore> getTfeenbackscore() {
		return tfeenbackscore;
	}

	public void setTfeenbackscore(Set<Feenbackscore> tfeenbackscore) {
		this.tfeenbackscore = tfeenbackscore;
	}

	public Set<Feenbackscore> getStufeenbackscore() {
		return stufeenbackscore;
	}

	public void setStufeenbackscore(Set<Feenbackscore> stufeenbackscore) {
		this.stufeenbackscore = stufeenbackscore;
	}

	public Opinion getOpinions() {
		return opinions;
	}

	public void setOpinions(Opinion opinions) {
		this.opinions = opinions;
	}

	public Set<Opinion> getOpinion() {
		return opinion;
	}

	public void setOpinion(Set<Opinion> opinion) {
		this.opinion = opinion;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	@Override
	public String toString() {
		return "Users [id=" + id + ", username=" + username + ", password=" + password + ", truename=" + truename
				+ ", sex=" + sex + ", age=" + age + ", address=" + address + ", tel=" + tel + ", card=" + card
				+ ", statu=" + statu + ", dept=" + dept + ", classchedule=" + classchedule + ", fb_time=" + fb_time
				+ ", stuclasses=" + stuclasses + ", classes=" + classes + ", tfeenbackscore=" + tfeenbackscore
				+ ", stufeenbackscore=" + stufeenbackscore + ", opinions=" + opinions + ", opinion=" + opinion
				+ ", roles=" + roles + "]";
	} 
	
	
}

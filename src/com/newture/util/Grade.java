package com.newture.util;

import java.io.Serializable;

public class Grade implements Serializable {

	private static final long serialVersionUID = -3894445634909172392L;
	
	private String feenback_name;
	private String fb_name;
	private String fb_score;
	private String tusers;
	private String stusers;
	private String course;
	public String getFeenback_name() {
		return feenback_name;
	}
	public void setFeenback_name(String feenback_name) {
		this.feenback_name = feenback_name;
	}
	public String getFb_name() {
		return fb_name;
	}
	public void setFb_name(String fb_name) {
		this.fb_name = fb_name;
	}
	public String getFb_score() {
		return fb_score;
	}
	public void setFb_score(String fb_score) {
		this.fb_score = fb_score;
	}
	public String getTusers() {
		return tusers;
	}
	public void setTusers(String tusers) {
		this.tusers = tusers;
	}
	public String getStusers() {
		return stusers;
	}
	public void setStusers(String stusers) {
		this.stusers = stusers;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	@Override
	public String toString() {
		return "Grade [feenback_name=" + feenback_name + ", fb_name=" + fb_name + ", fb_score=" + fb_score + ", tusers="
				+ tusers + ", stusers=" + stusers + ", course=" + course + "]";
	}
	
}

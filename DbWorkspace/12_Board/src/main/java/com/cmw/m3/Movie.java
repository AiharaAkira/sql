package com.cmw.m3;

public class Movie {

	String no;
	String title ;
	String actor ;
	String img ;
	String story;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	
	public Movie() {
		// TODO Auto-generated constructor stub
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public Movie(String no, String title, String actor, String img, String story) {
		super();
		this.no = no;
		this.title = title;
		this.actor = actor;
		this.img = img;
		this.story = story;
	}

	
	
	
	
}

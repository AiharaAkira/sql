package com.cmw.main;

public class Human {
	public Human() {
		// TODO Auto-generated constructor stub
	}
	
	private String name;
	private String age;
	
	public Human(String name, String age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	
}

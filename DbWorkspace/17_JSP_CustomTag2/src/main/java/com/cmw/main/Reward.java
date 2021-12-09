package com.cmw.main;

public class Reward {
	public Reward() {
		// TODO Auto-generated constructor stub
	}

	private String color;
	private String danwi1;
	private String danwi2;
	private double uInput;
	private String result;
	public Reward(String color, String danwi1, String danwi2, double uInput, String result) {
		super();
		this.color = color;
		this.danwi1 = danwi1;
		this.danwi2 = danwi2;
		this.uInput = uInput;
		this.result = result;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getDanwi1() {
		return danwi1;
	}
	public void setDanwi1(String danwi1) {
		this.danwi1 = danwi1;
	}
	public String getDanwi2() {
		return danwi2;
	}
	public void setDanwi2(String danwi2) {
		this.danwi2 = danwi2;
	}
	public double getuInput() {
		return uInput;
	}
	public void setuInput(double uInput) {
		this.uInput = uInput;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	
	
	
	
	
}

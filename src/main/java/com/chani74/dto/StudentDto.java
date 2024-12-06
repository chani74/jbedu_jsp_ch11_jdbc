package com.chani74.dto;

public class StudentDto {
	
	private int hakbun ;
	private String name;
	private int grade;
	private String address ;
	
	public StudentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public StudentDto(int hakbun, String name, int grade, String address) {
		super();
		this.hakbun = hakbun;
		this.name = name;
		this.grade = grade;
		this.address = address;
	}

	public int getHakbun() {
		return hakbun;
	}

	public void setHakbun(int hakbun) {
		this.hakbun = hakbun;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
}

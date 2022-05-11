package com.example.emp.app.emp;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class EmployeeForm implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@NotNull
	@Size(min=5, max=5,  message="半角数値5桁で入力してください")
	@Pattern(regexp = "^[0-9]+$", message="半角数値5桁で入力してください")
	private String id;
	
	@NotNull
	private String name;
	
	@NotNull
	private String kana;
	
	
	private String email;

	public EmployeeForm() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKana() {
		return kana;
	}

	public void setKana(String kana) {
		this.kana = kana;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	


}
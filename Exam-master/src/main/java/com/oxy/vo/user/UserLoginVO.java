package com.oxy.vo.user;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class UserLoginVO {
	
	@NotBlank
	private String usercode;
	@NotBlank
	private String password;
	private String role;
	
	
} 
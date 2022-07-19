package com.carrot.marketapp.model.dto;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
	
	private int userno;
	
	private String email;
	
	private String phonenumber;
	
	private String nickname;
	
	private String password;
	
	private String fulladdress;
	
	private String simpleaddress;
	
	private String profile_img;
	
	private String platform;
	
}

package com.carrot.marketapp.model.dto;

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

	private float latitude;

	private float longitude;
	
	// 페이 서비스
	private int payno; // amount
	private int paylog;
	private UserDTO payLogNo;
	private int deposit;
	private int withdraw;
	private String balance;

}

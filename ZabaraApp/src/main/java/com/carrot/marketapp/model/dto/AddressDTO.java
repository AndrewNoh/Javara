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
public class AddressDTO {
	
	private int addrNo;
	
	private int userNo;
	
	private String simpleAddress;
	
	private String fullAddress;
	
	private float latitude;
	
	private float longitude;
	
	private int auction_no;
}

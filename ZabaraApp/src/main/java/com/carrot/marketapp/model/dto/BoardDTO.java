package com.carrot.marketapp.model.dto;

import java.sql.Date;

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
public class BoardDTO {
	
	//글 번호
	private String listNo;
	private String product_no;
	private String auction_no;
	private String townlist_no;
	
	
		
	//대부분의 공통사항
	private String userNo;
	private String title;
	private String content;
	private String category;
	private String likes;
	private Date postDate;
	private String addrNo;
	private String nickName;
	private String endDate;
	private String status;
	private String imagename;
	private double latitude;
	private double longitude; 
	private String simpleaddress;
	private String fulladdress;
	private String profile_img;
	
	
	//조회수
	private int viewCount;
	
	private String soldout;
	
	//최고 입찰자
	private String upper_user_no;
	
	//가격
	private String price;
	private String upper_Price;
	private String base_Price;
	
}

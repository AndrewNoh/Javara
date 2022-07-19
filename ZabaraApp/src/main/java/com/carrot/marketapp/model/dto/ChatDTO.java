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
public class ChatDTO {
	
	private int roomno;
	private int auction_no;
	private int product_no;
	private int town_no;
	private int wirteuserno;
	private int userno;
	private int unread_count;
	private String chatcontent;
	private int senduserno;
	private Date sendtime;
	
	private String nickname;
	private String senduserprofileimg;
	private String writeuserprofileimg;
	private String profileimage;
	private String sendusernickname;
	private String writeusernickname;
	
	
	
	
}

package com.carrot.marketapp.model.dto;

import java.sql.Timestamp;

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
	private int townlist_no;
	private int writeuserno;
	private int userno;
	private int unread_count;
	private int unreadcount;
	private String chatcontent;
	private int senduserno;
	private Timestamp sendtime;
	
	private String img;
	private String nickname;
	private String senduserprofileimg;
	private String writeuserprofileimg;
	private String profileimage;
	private String profile_img;
	private String sendusernickname;
	private String writeusernickname;
	
	
	
	
}

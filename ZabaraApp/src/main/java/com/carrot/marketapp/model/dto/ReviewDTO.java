package com.carrot.marketapp.model.dto;

import java.sql.Date;
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
public class ReviewDTO {

	private int review_no;
	private String review_content;
	private int review_star;
	private int room_no;
	private int user_no;

	
	
	
}

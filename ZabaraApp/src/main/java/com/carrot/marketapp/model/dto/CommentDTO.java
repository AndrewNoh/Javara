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
public class CommentDTO {
	
	private String comment_no;
	private String comment_content;
	private String comment_userno;
	private Timestamp comment_postdate;
	
}

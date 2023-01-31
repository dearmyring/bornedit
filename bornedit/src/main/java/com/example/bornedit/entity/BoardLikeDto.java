package com.example.bornedit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoardLikeDto {
	private int boardNo;
	private String memberEmail;
	private Date likeWhen;
}

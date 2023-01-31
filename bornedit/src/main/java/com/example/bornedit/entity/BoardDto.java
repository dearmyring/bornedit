package com.example.bornedit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDto {
	private String memberEmail, boardTitle, mainBody, boardContent;
	private int boardNo,boardLike, howManyEmployee, boardSave, boardView;
	private Date boardWhen, boardPut;
}

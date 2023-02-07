package com.example.bornedit.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardVO {
	private String memberEmail, boardTitle, mainBody, boardContent, memberNick, memberOffer;
	private int boardNo,boardLike, howManyEmployee, boardSave, boardView, attachmentNo;
	private Date boardWhen, boardPut;
}

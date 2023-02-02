package com.example.bornedit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoradVideoDto {
	private int attachmentNo, boardNo;
	private Date uploadWhen;
}

package com.example.bornedit.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AttachmentDto {
	private String attachmentName, attachmentType;
	private int attachmentNo;
	private long attachmentSize;
	private Date attachmentWhen;
}

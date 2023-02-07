package com.example.bornedit.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReplyVO {
	private int replyNo, boardNo, attachmentNo;
	private String replyContent, memberNick, replyWhen;
}

package com.example.bornedit.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class HomeListVO {
	private int boardNo, profileNo, boardLike, videoNo, rn;
	private String boardTitle, memberNick, boardContent;
	
}

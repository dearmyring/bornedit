package com.example.bornedit.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SearchVO {
	private int startRow = 1;
	private int endRow = 16;
	private String sort, keyword;
}

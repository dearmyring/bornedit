package com.example.bornedit.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SearchVO {
	private int startRow;
	private int endRow;
	private String sort, keyword;
}

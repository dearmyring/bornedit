package com.example.bornedit.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TripodDto {
	private int tripodNo, boardNo;
	private String tripodName;
}

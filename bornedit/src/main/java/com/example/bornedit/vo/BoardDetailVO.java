package com.example.bornedit.vo;

import java.util.List;

import com.example.bornedit.entity.AudioDto;
import com.example.bornedit.entity.BoardVideoDto;
import com.example.bornedit.entity.BodyDto;
import com.example.bornedit.entity.EtcDto;
import com.example.bornedit.entity.LensDto;
import com.example.bornedit.entity.MonitorDto;
import com.example.bornedit.entity.RightDto;
import com.example.bornedit.entity.TripodDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardDetailVO {
	private BoardVO boardDetail;
	private List<BodyDto> bodyDetail;
	private List<LensDto> lensDetail;
	private List<RightDto> rightDetail;
	private List<TripodDto> tripodDetail;
	private List<AudioDto> audioDetail;
	private List<MonitorDto> monitorDetail;
	private List<EtcDto> etcDetail;
	private BoardVideoDto boardVideoDetail;
}

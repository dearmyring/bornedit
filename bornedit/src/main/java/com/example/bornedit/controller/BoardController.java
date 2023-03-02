package com.example.bornedit.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.bornedit.constant.SessionConstant;
import com.example.bornedit.entity.AudioDto;
import com.example.bornedit.entity.BoardDto;
import com.example.bornedit.entity.BoardVideoDto;
import com.example.bornedit.entity.BodyDto;
import com.example.bornedit.entity.EtcDto;
import com.example.bornedit.entity.LensDto;
import com.example.bornedit.entity.MonitorDto;
import com.example.bornedit.entity.RightDto;
import com.example.bornedit.entity.TripodDto;
import com.example.bornedit.repository.AttachmentDao;
import com.example.bornedit.repository.AudioDao;
import com.example.bornedit.repository.BoardDao;
import com.example.bornedit.repository.BodyDao;
import com.example.bornedit.repository.EtcDao;
import com.example.bornedit.repository.HomeDao;
import com.example.bornedit.repository.LensDao;
import com.example.bornedit.repository.MonitorDao;
import com.example.bornedit.repository.ReplyDao;
import com.example.bornedit.repository.RightDao;
import com.example.bornedit.repository.TripodDao;
import com.example.bornedit.vo.SearchVO;

@Controller
@RequestMapping("/board")

public class BoardController {

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private BodyDao bodyDao;
	
	@Autowired
	private LensDao lensDao;
	
	@Autowired
	private TripodDao tripodDao;
	
	@Autowired
	private AudioDao audioDao;
	
	@Autowired
	private MonitorDao monitorDao;
	
	@Autowired
	private RightDao rightDao;
	
	@Autowired
	private EtcDao etcDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private ReplyDao replyDao;
	
	@Autowired
	private HomeDao homeDao;
	
	
	@GetMapping("/write")
	public String write() {
		return "board/write";
	}
	
	@PostMapping("/write")
	public String write(
			@ModelAttribute BoardDto boardDto,
			@RequestParam List<String> bodyName,
			@RequestParam List<String> lensName,
			@RequestParam List<String> tripodName,
			@RequestParam List<String> audioName,
			@RequestParam List<String> monitorName,
			@RequestParam List<String> rightName,
			@RequestParam List<String> etcName,
			@RequestParam int attachmentNo,
			HttpSession session, RedirectAttributes attr
			) {
		int boardNo = boardDao.sequence();
		String memberId = (String) session.getAttribute(SessionConstant.ID);
		boardDto.setBoardNo(boardNo);
		boardDto.setMemberEmail(memberId);
		
		boardDao.write(boardDto);
		
		attachmentDao.addVideo(BoardVideoDto.builder()
				.boardNo(boardNo)
				.attachmentNo(attachmentNo)
				.build());
		
		for(int i = 0; i < bodyName.size(); i++) {
			int bodyNo = bodyDao.sequence();
			BodyDto bodyDto = BodyDto.builder().boardNo(boardNo).bodyNo(bodyNo).bodyName(bodyName.get(i)).build();
			bodyDao.write(bodyDto);
		}
		
		for(int i = 0; i < lensName.size(); i++) {
			int lensNo = lensDao.sequence();
			LensDto lensDto = LensDto.builder().boardNo(boardNo).lensNo(lensNo).lensName(lensName.get(i)).build();
			lensDao.write(lensDto);
		}
		
		for(int i = 0; i < tripodName.size(); i++) {
			int tripodNo = tripodDao.sequence();
			TripodDto tripodDto = TripodDto.builder().boardNo(boardNo).tripodNo(tripodNo).tripodName(tripodName.get(i)).build();
			tripodDao.write(tripodDto);
		}
		
		for(int i = 0; i < audioName.size(); i++) {
			int audioNo = audioDao.sequence();
			AudioDto audioDto = AudioDto.builder().boardNo(boardNo).audioNo(audioNo).audioName(audioName.get(i)).build();
			audioDao.write(audioDto);
		}
		
		for(int i = 0; i < monitorName.size(); i++) {
			int monitorNo = monitorDao.sequence();
			MonitorDto monitorDto = MonitorDto.builder().boardNo(boardNo).monitorNo(monitorNo).monitorName(monitorName.get(i)).build();
			monitorDao.write(monitorDto);
		}
		
		for(int i = 0; i < rightName.size(); i++) {
			int rightNo = rightDao.sequence();
			RightDto rightDto = RightDto.builder().boardNo(boardNo).rightNo(rightNo).rightName(rightName.get(i)).build();
			rightDao.write(rightDto);
		}
		
		for(int i = 0; i < etcName.size(); i++) {
			int etcNo = etcDao.sequence();
			EtcDto etcDto = EtcDto.builder().boardNo(boardNo).etcNo(etcNo).etcName(etcName.get(i)).build();
			etcDao.write(etcDto);
		}
		
		attr.addAttribute("boardNo", boardNo);
		return "redirect:detail";
	}
	
	@GetMapping("/detail")
	public String detail(
			@RequestParam int boardNo, 
			Model model, 
			HttpSession session) {
		@SuppressWarnings("unchecked")
		Set<Integer> history = (Set<Integer>) session.getAttribute("history");
		
		if(history == null) {
			history = new HashSet<>();
		}
		
		if(history.add(boardNo)) {
			boardDao.incrementViewCount(boardNo);
		}
		session.setAttribute("history", history);
		model.addAttribute("replyDto", replyDao.selectReply(boardNo));
		model.addAttribute("selectOneBoard", boardDao.selectOneBoard(boardNo));
		model.addAttribute("boardDto", boardDao.detail(boardNo));
		return "board/detail3";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam int boardNo) {
		boardDao.delete(boardNo);
		return "home";
	}
	
	@GetMapping("/search")
	public String search() {
		return "board/search";
	}
	
	@GetMapping("/search/result")
	public String searchForresult(Model model, @ModelAttribute SearchVO searchVO) {
		model.addAttribute("list", homeDao.list(searchVO));
		return "board/result";
	}
	
}

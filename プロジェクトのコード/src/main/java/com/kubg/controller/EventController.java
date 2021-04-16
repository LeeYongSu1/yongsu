package com.kubg.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kubg.dao.EventDAO;
import com.kubg.service.EventService;
import com.kubg.service.EventServiceImpl;
import com.kubg.vo.Criteria;
import com.kubg.vo.EventVO;
import com.kubg.vo.PageMaker;
import com.kubg.vo.SearchCriteria;

@Controller
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Inject
	EventService service;
	
	@Inject EventServiceImpl serviceImpl;
	
	 
	//이벤트 게시판 글 작성 화면
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
	}
	
	//이벤트 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(EventVO vo, MultipartHttpServletRequest mpRequest) throws Exception{
		logger.info("write");
		
		
		service.write(vo, mpRequest);


       
	
		return "redirect:/list";
	}
	
		
	
	// 게시판 목록 조회
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String list(Model model, @ModelAttribute("scri") SearchCriteria cri) throws Exception{
			logger.info("list");
			
			
			model.addAttribute("list",service.list(cri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.listCount(cri));
			
			model.addAttribute("pageMaker", pageMaker);
			return "/list";
			
		}
		
	// 게시판 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(EventVO vo,@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("read");
		
		String no = Integer.toString(vo.getNo());
		model.addAttribute("read", service.read(vo.getNo()));
		model.addAttribute("scri", scri);
		
		model.addAttribute("fileName",service.filenameIs(no) );
		List<Map<String, Object>> fileList = service.selectFileList(vo.getNo());
		model.addAttribute("file", fileList);
		
		return "/readView";
	}
	
	// 게시판 수정뷰
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(EventVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", service.read(vo.getNo()));
		model.addAttribute("scri", scri);
		
		return "/updateView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(EventVO vo,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("update");
		
		service.update(vo);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/list";
	}

	// 게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(EventVO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("delete");
		
		service.delete(vo.getNo());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/list";
	}
	
}

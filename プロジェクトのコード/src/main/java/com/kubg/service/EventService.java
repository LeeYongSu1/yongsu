package com.kubg.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kubg.vo.Criteria;
import com.kubg.vo.EventVO;
import com.kubg.vo.SearchCriteria;

public interface EventService {
	
	//게시글 작성
	public void write(EventVO vo, MultipartHttpServletRequest mpRequest)throws Exception;
	
	// 게시물 목록 조회
	public List<EventVO> list(SearchCriteria cri) throws Exception;
	
	//게시물 총 갯수
	public int listCount(SearchCriteria cri) throws Exception;
	// 게시물 목록 조회
	public EventVO read(int no) throws Exception;
	
	// 게시물 수정
	public void update(EventVO vo) throws Exception;
	
	// 게시물 삭제
	public void delete(int no) throws Exception;
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int no) throws Exception;
	

	 //첨부파일 이름가져오기 
	public String filenameIs(String no) throws Exception;
	 
}

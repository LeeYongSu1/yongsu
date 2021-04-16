package com.kubg.dao;

import java.util.List;
import java.util.Map;

import com.kubg.vo.Criteria;
import com.kubg.vo.EventVO;
import com.kubg.vo.SearchCriteria;

public interface EventDAO {
	
	//이벤트 게시글
	public void write(EventVO vo) throws Exception;
	
	//게시글 목록 조회
	public List<EventVO> list(SearchCriteria cri) throws Exception;
	
	//게시물 총 갯수
	public int listCount(SearchCriteria cri) throws Exception;
	
	// 게시물 조회
	public EventVO read(int no) throws Exception;
	
	// 게시물 수정
	public void update(EventVO vo) throws Exception;
	
	// 게시물 삭제
	public void delete(int no) throws Exception;
	
	//첨부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int no) throws Exception;
	

	 //첨부파일 이름 가져오기
	public String selectFileName(String no) throws Exception;
	 
	
	
}

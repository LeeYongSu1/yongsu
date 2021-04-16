package com.kubg.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kubg.vo.Criteria;
import com.kubg.vo.EventVO;
import com.kubg.vo.SearchCriteria;


@Repository
public class EventDAOImpl implements EventDAO {

	@Inject	
	private SqlSession sqlsession;
	//글 쓰기
	@Override
	public void write(EventVO vo) throws Exception {
		sqlsession.insert("eventMapper.insert", vo);
	}
	
	//목록 조회
	@Override
	public List<EventVO> list(SearchCriteria cri) throws Exception {
		
		return sqlsession.selectList("eventMapper.listPage", cri);
	}
	
	//게시물 갯수
	@Override
	public int listCount(SearchCriteria cri) throws Exception{
		
		return sqlsession.selectOne("eventMapper.listCount");
	}
	// 게시물 조회
	@Override
	public EventVO read(int no) throws Exception {
		
		return sqlsession.selectOne("eventMapper.read", no);
	}

	@Override
	public void update(EventVO vo) throws Exception {

		sqlsession.update("eventMapper.update", vo);
	}

	@Override
	public void delete(int no) throws Exception {

		sqlsession.delete("eventMapper.delete", no);
	}

	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlsession.insert("eventMapper.insertFile", map);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int no) throws Exception {
		return sqlsession.selectList("eventMapper.selectFileList", no);
	}

	
	 @Override 
	 public String selectFileName(String no) throws Exception { 
		 
		 return sqlsession.selectOne("eventMapper.getfilename", no); 
		 }
	 

	

}

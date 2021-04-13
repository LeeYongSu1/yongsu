package com.kubg.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kubg.common.FileUtils;
import com.kubg.dao.EventDAO;
import com.kubg.dao.EventDAOImpl;
import com.kubg.vo.Criteria;
import com.kubg.vo.EventVO;
import com.kubg.vo.SearchCriteria;

@Service
public class EventServiceImpl implements EventService {

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Inject
	private EventDAOImpl dao;
	
	@Override
	public void write(EventVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		
		dao.write(vo);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
	}

	@Override
	public List<EventVO> list(SearchCriteria cri) throws Exception {
		
		return dao.list(cri);
	}
	
	@Override
	public int listCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(cri);
	}
	
	@Override
	public EventVO read(int no) throws Exception {

		return dao.read(no);
	}
	
	@Override
	public void update(EventVO vo) throws Exception {
		
		dao.update(vo);
	}

	@Override
	public void delete(int no) throws Exception {
		
		dao.delete(no);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int no) throws Exception {
		return dao.selectFileList(no);
	}

	
	  @Override 
	  public String filenameIs(String no) throws Exception { 
	
		  return dao.selectFileName(no);
	}
	 
	

	

	

}

package com.kubg.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kubg.dao.PreorderDAO;
import com.kubg.dao.PreorderDAOImpl;
import com.kubg.vo.BookVO;

@Service
public class PreorderServiceImpl implements PreorderService, PreorderDAO {
	
	@Inject
	private PreorderDAOImpl dao;
	
	@Override
	public void insertGoods(BookVO vo) {
		dao.insertGoods(vo);
	}

}

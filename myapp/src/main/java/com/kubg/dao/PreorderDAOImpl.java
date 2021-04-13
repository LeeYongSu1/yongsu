package com.kubg.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kubg.vo.BookVO;

@Repository
public class PreorderDAOImpl implements PreorderDAO {
	
	@Inject
	SqlSession sql;
	
	@Override
	public void insertGoods(BookVO vo) {
		sql.insert("bookMapper.insert", vo);
	}

}

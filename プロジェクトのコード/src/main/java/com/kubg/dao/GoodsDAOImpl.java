package com.kubg.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kubg.vo.GoodsVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {

	@Inject
	SqlSession sql;
	
	@Override
	public void insertGoods(GoodsVO vo) {
		// src/main/resources/mappers/goodsMapper: namespace.id
		sql.insert("goodsMapper.insert", vo);

	}

	@Override
	public List<GoodsVO> listGoods() {
		return sql.selectList("goodsMapper.selectAll");
	}
	
	@Override
	public GoodsVO detailGoods(String product_name) {
		GoodsVO vo = sql.selectOne("goodsMapper.goodsinfo", product_name);
		return vo;
	}
	
	@Override
	public void updateGoods(GoodsVO vo) {
		sql.update("goodsMapper.update_goods", vo);
	}
	
	@Override
	public void deleteGoods(int product_num) {
		sql.delete("goodsMapper.deleteGoods", product_num);
	}
	
	@Override
	public String fileInfo(int product_num) {
		return sql.selectOne("goodsMapper.goodsinfo", product_num);
				
	}
}

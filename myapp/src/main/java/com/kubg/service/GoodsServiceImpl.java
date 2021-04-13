package com.kubg.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kubg.dao.GoodsDAO;
import com.kubg.dao.GoodsDAOImpl;
import com.kubg.vo.GoodsVO;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Inject
	private GoodsDAOImpl dao;
	
	@Override
	public void insertGoods(GoodsVO vo) {
		dao.insertGoods(vo);
	}

	@Override
	public List<GoodsVO> listGoods() {
		return dao.listGoods();
	}

	@Override
	public GoodsVO detailGoods(String product_name) {
		return dao.detailGoods(product_name);
	}

	@Override
	public void updateGoods(GoodsVO vo) {
		dao.updateGoods(vo);
	}

	@Override
	public void deleteGoods(int product_num) {
		dao.deleteGoods(product_num);
	}

	@Override
	public String fileInfo(int product_num) {
		return dao.fileInfo(product_num);
	}
	

}

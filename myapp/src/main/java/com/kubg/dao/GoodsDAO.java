package com.kubg.dao;

import java.util.List;

import com.kubg.vo.GoodsVO;

public interface GoodsDAO {
	
	public void insertGoods(GoodsVO vo);
	
	public List<GoodsVO> listGoods();
	
	public GoodsVO detailGoods(String product_name);
	
	public void updateGoods(GoodsVO vo);
	
	public void deleteGoods(int product_num);
	
	public String fileInfo(int product_num);
	
}

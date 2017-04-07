package com.qingke.boma.service;

import java.util.List;

import com.qingke.boma.pojo.Trade;

public interface TradeService extends BasicService<Trade> {

	// 查找所有行业
	public List<Trade> getAllTrades();

	// 根据行业名称查找行业
	public Trade getTradeByName(Trade trade);
	
	//根据行业id查找行业
	public Trade getTradeById(Integer id);

}

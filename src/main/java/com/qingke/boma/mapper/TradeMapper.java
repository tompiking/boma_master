package com.qingke.boma.mapper;

import java.util.List;
import java.util.Map;

import com.qingke.boma.pojo.Trade;

public interface TradeMapper extends BomaMapper<Trade> {

	// 查找所有行业
	public List<Trade> getAllTrades();

	// 根据行业名称查找行业
	public Trade getTradeByName(Trade trade);

	// 根据行业id查找行业
	public Trade getTradeById(Integer id);

	// limitselect
	public List<Trade> limitSelect(Map<String , Integer> map);
}

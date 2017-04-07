package com.qingke.boma.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qingke.boma.mapper.TradeMapper;
import com.qingke.boma.pojo.Trade;
import com.qingke.boma.service.TradeService;

@Service(value = "tradeServiceImpl")
@Transactional
public class TradeServiceImpl implements TradeService {

	@Autowired
	private TradeMapper tradeMapper;

	@Override
	public int insert(Trade t) {
		return tradeMapper.insert(t);
	}

	@Override
	public int update(Trade t) {
		return tradeMapper.update(t);
	}

	@Override
	public List<Trade> getAllTrades() {
		return tradeMapper.getAllTrades();
	}

	@Override
	public Trade getTradeByName(Trade trade) {
		return tradeMapper.getTradeByName(trade);
	}

	@Override
	public Trade getTradeById(Integer id) {
		return tradeMapper.getTradeById(id);
	}
}

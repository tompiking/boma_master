package com.qingke.boma.serviceImpl;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qingke.boma.mapper.CompanyMapper;
import com.qingke.boma.mapper.TradeJobMapper;
import com.qingke.boma.mapper.TradeMapper;
import com.qingke.boma.pojo.Company;
import com.qingke.boma.pojo.Job;
import com.qingke.boma.pojo.Trade;
import com.qingke.boma.pojo.TradeJob;
import com.qingke.boma.service.CaseService;

@Service(value = "caseServiceImpl")
@Transactional
public class CaseServiceImpl implements CaseService {
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private TradeMapper tradeMapper;
	@Autowired
	private TradeJobMapper tradeJobMapper;

	@Override
	public List<Map> getCaseMap() throws Exception {
		List<Trade> trades = tradeMapper.getAllTrades();
		Map<Trade, List<Company>> tc = new HashMap<>();
		Map<Trade, List<Job>> tj = new HashMap<>();
		for (Trade trade : trades) {
			List<Company> companies = companyMapper.getCaseCompanyByTrade(trade);
			List<TradeJob> tJobs = tradeJobMapper.getIsShowTradeJobs(trade.getId());
			List<Job> jobs = new ArrayList<>();
			for (TradeJob tradeJob : tJobs) {
				jobs.add(tradeJob.getJob());
			}
			if (companies.size() > 0 || jobs.size() > 0) {
				tc.put(trade, companies);
				tj.put(trade, jobs);
			}
		}
		List<Map> maps = new ArrayList<>();
		maps.add(tc);
		maps.add(tj);
		return maps;
	}

	@Override
	public List<Map> getSelectMap(Map<String, Integer> map) throws Exception {
		List<Map> mappp = getCaseMap();
		List<Trade> t = new ArrayList<>();
		List<Trade> trades = null;
		int sId = map.get("sId");
		int eId = map.get("eId");
		Map<Trade, List<Company>> m = mappp.get(0);
		for (Trade trade : m.keySet()) {
			t.add(trade);
		}
		t.sort(new Comparator<Trade>() {

			@Override
			public int compare(Trade o1, Trade o2) {
				return o1.getId().compareTo(o2.getId());
			}
		});
		if (t.size() < sId) {

		} else if (t.size() < eId) {
			trades = t.subList(sId - 1, t.size());
		} else {
			trades = t.subList(sId - 1, eId-1);
		}
		Map<Trade, List<Company>> tc = new HashMap<>();
		Map<Trade, List<Job>> tj = new HashMap<>();
		List<Map> maps = new ArrayList<>();
		if (trades == null) {
			maps.add(tc);
			maps.add(tj);
			return maps;
		}
		for (Trade trade : trades) {
			List<Company> companies = companyMapper.getCaseCompanyByTrade(trade);
			List<TradeJob> tJobs = tradeJobMapper.getIsShowTradeJobs(trade.getId());
			List<Job> jobs = new ArrayList<>();
			for (TradeJob tradeJob : tJobs) {
				jobs.add(tradeJob.getJob());
			}
			if (companies.size() > 0 || jobs.size() > 0) {
				tc.put(trade, companies);
				tj.put(trade, jobs);
			}
		}
		maps.add(tc);
		maps.add(tj);
		return maps;
	}
}

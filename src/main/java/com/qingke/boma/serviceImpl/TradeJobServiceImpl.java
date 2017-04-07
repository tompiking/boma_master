package com.qingke.boma.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qingke.boma.mapper.JobMapper;
import com.qingke.boma.mapper.TradeJobMapper;
import com.qingke.boma.pojo.Job;
import com.qingke.boma.pojo.TradeJob;
import com.qingke.boma.service.TradeJobService;

@Service(value = "tradeJobServiceImpl")
@Transactional
public class TradeJobServiceImpl implements TradeJobService {

	@Autowired
	private TradeJobMapper tradeJobMapper;
	@Autowired
	private JobMapper jobMapper;

	@Override
	public int insert(TradeJob t) {
		tradeJobMapper.insert(t);
		return 0;
	}

	@Override
	public int update(TradeJob t) {
		return tradeJobMapper.update(t);
	}

	@Override
	public List<TradeJob> getTradeJobs(Integer id) {
		return tradeJobMapper.getTradeJobs(id);
	}

	@Override
	public List<TradeJob> getIsShowTradeJobs(Integer id) {
		return tradeJobMapper.getIsShowTradeJobs(id);
	}

	@Override
	public List<TradeJob> getUnShowTradeJobs(Integer id) {
		return tradeJobMapper.getUnShowTradeJobs(id);
	}

	@Override
	public TradeJob getTradeJobById(Integer id) {
		return tradeJobMapper.getTradeJobById(id);
	}

	@Override
	public TradeJob getTradeJobByTwoIds(Integer tId, Integer jId) {
		return tradeJobMapper.getTradeJobByTwoIds(tId, jId);
	}

	public List<Job> getOtherJobs(Integer id) {
		List<Job> jobs = jobMapper.getAllJobs();
		for (TradeJob tradeJob : getIsShowTradeJobs(id)) {
			jobs.remove(tradeJob.getJob());
		}
		for (TradeJob tradeJob : getUnShowTradeJobs(id)) {
			jobs.remove(tradeJob.getJob());
		}
		return jobs;
	}

	@Override
	public List<TradeJob> getIsShow() {
		return tradeJobMapper.getIsShow();
	}
}

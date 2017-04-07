package com.qingke.boma.service;

import java.util.List;

import com.qingke.boma.pojo.Job;
import com.qingke.boma.pojo.TradeJob;

public interface TradeJobService extends BasicService<TradeJob> {

	// 查找某行业下的所有岗位
	public List<TradeJob> getTradeJobs(Integer id);

	// 查找某行业下的所有展示的服务岗位
	public List<TradeJob> getIsShowTradeJobs(Integer id);

	// 查找某行业下的所有不展示的服务岗位
	public List<TradeJob> getUnShowTradeJobs(Integer id);

	// 根据id找tradejob
	public TradeJob getTradeJobById(Integer id);

	// 通过行业id和岗位id找到tradejob
	public TradeJob getTradeJobByTwoIds(Integer tId, Integer jId);

	// 查找非该行业的岗位
	public List<Job> getOtherJobs(Integer id);

	// 查找所有isShow
	public List<TradeJob> getIsShow();
}

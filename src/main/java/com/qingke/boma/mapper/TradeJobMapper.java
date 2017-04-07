package com.qingke.boma.mapper;

import java.util.List;

import com.qingke.boma.pojo.TradeJob;

public interface TradeJobMapper extends BomaMapper<TradeJob> {

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
	
	//查找所有isShow
	public List<TradeJob> getIsShow();
}

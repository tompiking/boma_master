package com.qingke.boma.pojo;

/**
 * 
 * @Description 行业与岗位的中间表，用于归类行业下的岗位与是否在页面展示
 */
public class TradeJob {

	private Integer id;
	// 行业
	private Trade trade;
	// 岗位
	private Job job;
	// 是否在成功案例中展示
	private String isShow;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Trade getTrade() {
		return trade;
	}

	public void setTrade(Trade trade) {
		this.trade = trade;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}
}

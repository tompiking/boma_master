package com.qingke.boma.bean;

import java.util.List;

public class Page<T> {
	private List<T> datas;
	//总页码
	private Integer totalno;
	//总记录条数
	private Integer pagesize;
	//当前页码
	private Integer currentno;
	
	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}

	public Integer getTotalno() {
		return totalno;
	}

	public void setTotalno(Integer totalno) {
		this.totalno = totalno;
	}

	public Integer getPagesize() {
		return pagesize;
	}

	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}

	public Integer getCurrentno() {
		return currentno;
	}

	public void setCurrentno(Integer currentno) {
		this.currentno = currentno;
	}
}

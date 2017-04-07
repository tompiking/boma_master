package com.qingke.boma.pojo;

import java.util.List;

/**
 * 
 * @time 下午4:09:56
 * @Description 行业, 用于成功案例, 一个行业有多个公司，多个岗位
 */
public class Trade{
	private Integer id;
	// 行业名称
	private String name;
	// 拥有的公司
	private List<Company> companys;
	// 拥有的职位
	private List<Job> jobs;

	public Trade() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Company> getCompanys() {
		return companys;
	}

	public void setCompanys(List<Company> companys) {
		this.companys = companys;
	}

	public List<Job> getJobs() {
		return jobs;
	}

	public void setJobs(List<Job> jobs) {
		this.jobs = jobs;
	}

}

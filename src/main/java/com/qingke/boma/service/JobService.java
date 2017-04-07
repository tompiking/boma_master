package com.qingke.boma.service;

import java.util.List;

import com.qingke.boma.pojo.Job;

public interface JobService extends BasicService<Job> {

	// 通过岗位id查找岗位
	public Job getJobById(Integer id);

	// 查找所有岗位
	public List<Job> getAllJobs();

	// 通过名字找岗位
	public Job getJobByName(String name);
}

package com.qingke.boma.mapper;

import java.util.List;

import com.qingke.boma.pojo.Job;

public interface JobMapper extends BomaMapper<Job> {

	// 通过岗位id查找岗位
	public Job getJobById(Integer id);
	// 查找所有岗位
	public List<Job> getAllJobs();

}

package com.qingke.boma.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qingke.boma.mapper.JobMapper;
import com.qingke.boma.pojo.Job;
import com.qingke.boma.service.JobService;

@Service(value = "jobServiceImpl")
@Transactional
public class JobServiceImpl implements JobService {
	@Autowired
	private JobMapper jobMapper;

	@Override
	public int insert(Job t) {
		return jobMapper.insert(t);
	}

	@Override
	public int update(Job t) {
		return jobMapper.update(t);
	}

	@Override
	public Job getJobById(Integer id) {
		return jobMapper.getJobById(id);
	}

	@Override
	public List<Job> getAllJobs() {
		return jobMapper.getAllJobs();
	}

	public Job getJobByName(String name) {
		Job job = null;
		List<Job> jobs = jobMapper.getAllJobs();
		for (Job j : jobs) {
			if (name.equals(j.getName())) {
				job = j;
			}
		}
		return job;
	}
}

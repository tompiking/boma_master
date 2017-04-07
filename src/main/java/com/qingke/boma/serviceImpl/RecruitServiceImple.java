package com.qingke.boma.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qingke.boma.mapper.RecruitMapper;
import com.qingke.boma.pojo.Page;
import com.qingke.boma.pojo.Recruit;
import com.qingke.boma.service.RecruitService;

@Service(value = "recruitServiceImpl")
@Transactional
public class RecruitServiceImple implements RecruitService{

	@Autowired
	private RecruitMapper recruitMapper;
	
	@Override
	public int insert(Recruit t) {
		int count = recruitMapper.insert(t);
		return count;
	}

	@Override
	public int update(Recruit t) {
		return recruitMapper.update(t);
	}

	@Override
	public List<Recruit> getAllRecruits() {
		List<Recruit> recruits = recruitMapper.getAllRecruits();
		return recruits;
	}

	@Override
	public int deleteRecruit(Recruit recruit) {
		return recruitMapper.deleteRecruit(recruit);
	}

	@Override
	public Recruit getRecruitById(Integer id) {
		return recruitMapper.getRecruitById(id);
	}

	@Override
	public List<Recruit> getIsShowRecruits(Page page) {
		return recruitMapper.getIsShowRecruits(page);
	}

}

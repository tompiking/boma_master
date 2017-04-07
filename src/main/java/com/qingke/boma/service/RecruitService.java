package com.qingke.boma.service;

import java.util.List;

import com.qingke.boma.pojo.Page;
import com.qingke.boma.pojo.Recruit;

public interface RecruitService extends BasicService<Recruit> {

	// 查找所有招聘信息
	public List<Recruit> getAllRecruits();

	// 根据id永久删除招聘信息
	public int deleteRecruit(Recruit recruit);

	// 根据id查找招聘信息
	public Recruit getRecruitById(Integer id);

	// 查找所有显示的招聘信息
	public List<Recruit> getIsShowRecruits(Page page);

}

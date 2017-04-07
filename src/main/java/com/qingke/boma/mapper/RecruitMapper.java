package com.qingke.boma.mapper;

import java.util.List;

import com.qingke.boma.pojo.Page;
import com.qingke.boma.pojo.Recruit;

public interface RecruitMapper extends BomaMapper<Recruit> {

	// 查找所有显示的招聘信息
	public List<Recruit> getAllRecruits();

	// 根据id删除招聘信息(软删除)
	public int deleteRecruit(Recruit recruit);
	 
	// 根据id查找招聘信息
	public Recruit getRecruitById(Integer id);
	
	// 按页码查找显示的招聘信息
	public List<Recruit> getIsShowRecruits(Page page);

}

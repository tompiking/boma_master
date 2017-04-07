package com.qingke.boma.mapper;

import java.util.List;
import java.util.Map;

import com.qingke.boma.pojo.Manager;

public interface ManagerMapper extends BomaMapper<Manager> {

	// 通过公司id获取负责人信息
	public Manager getManagerByCompanyId(Integer id);

	// 获取所有负责人信息
	public List<Manager> getAllManagers();

	// 根据id获取负责人
	public Manager getManagerById(Integer id) throws Exception;

	// 获取所有是口碑印证的负责人(分页)
	public List<Manager> getAllManagersByPage(Map<String, Integer> mapPage);
	// 获取所有是口碑印证的负责人总数
	public Integer countIsPraise();
	
	// 获取所有不是口碑印证的负责人(分页)
	public List<Manager> getAllManagerNotByPage(Map<String, Integer> mapPage);
	// 获取所有不是口碑印证的负责人总数
	public Integer countNotPraise();
	
	// 根据公司ID删除负责人
	// public int deleteManagersByCompanyId(Integer id) throws Exception;
}

package com.qingke.boma.service;

import java.util.List;
import java.util.Map;

import com.qingke.boma.pojo.Manager;

public interface ManagerService extends BasicService<Manager> {

	// 通过公司id获取负责人信息
	public Manager getManagerByCompanyId(Integer id);

	// 获取所有负责人信息
	public List<Manager> getAllManagers();
	
	//根据Id获取负责人
	public Manager getManagerById(Integer id) throws Exception;
	
	//获取所有是口碑印证的负责人(分页)
	public List<Manager> getAllManagersByPage(Map<String, Integer> mapPage);
	//获取所有是口碑印证的负责人总数
	public Integer countIsPraise();
	
	//获取所有不是口碑印证的负责人(分页)
	public List<Manager> getAllManagerNotByPage(Map<String, Integer> mapPage);
	//获取所有不是口碑隐者的负责人总数
	public Integer countNotPraise();
}

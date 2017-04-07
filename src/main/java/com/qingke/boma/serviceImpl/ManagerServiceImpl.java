package com.qingke.boma.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qingke.boma.mapper.ManagerMapper;
import com.qingke.boma.pojo.Manager;
import com.qingke.boma.service.ManagerService;

@Service(value = "managerServiceImpl")
@Transactional
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerMapper managerMapper;

	// 添加负责人
	@Override
	public int insert(Manager t) {
		return managerMapper.insert(t);
	}

	// 更新负责人
	@Override
	public int update(Manager t) {
		return managerMapper.update(t);
	}

	@Override
	public Manager getManagerByCompanyId(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	// 获得所有负责人
	@Override
	public List<Manager> getAllManagers() {
		// 获取所有负责人
		List<Manager> managers = managerMapper.getAllManagers();
		return managers;
	}

	// 根据Id获取负责人
	public Manager getManagerById(Integer id) throws Exception {
		return managerMapper.getManagerById(id);
	}
	
	//获取所有是口碑印证的负责人信息(分页)
	@Override
	public List<Manager> getAllManagersByPage(Map<String, Integer> mapPage) {
		return managerMapper.getAllManagersByPage(mapPage);
	}
	
	//获取所有是口碑印证的总个数
	@Override
	public Integer countIsPraise() {
		return managerMapper.countIsPraise();
	}

	//获取所有不是口碑印证的负责人信息
	@Override
	public List<Manager> getAllManagerNotByPage(Map<String, Integer> mapPage) {
		return managerMapper.getAllManagerNotByPage(mapPage);
	}
	
	//获取不是口碑印证的总个数
	@Override
	public Integer countNotPraise() {
		// TODO Auto-generated method stub
		return managerMapper.countNotPraise();
	}
}

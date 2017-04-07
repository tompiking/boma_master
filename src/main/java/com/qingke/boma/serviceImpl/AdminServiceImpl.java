package com.qingke.boma.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qingke.boma.mapper.AdminMapper;
import com.qingke.boma.pojo.Admin;
import com.qingke.boma.service.AdminService;

@Service(value = "adminServiceImpl")
@Transactional
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public int insert(Admin t) {
		return adminMapper.insert(t);
	}

	@Override
	public int update(Admin t) {
		return adminMapper.update(t);
	}

	@Override
	public Admin getAdminByUsername(String username) {
		return adminMapper.getAdminByUsername(username);
	}

	@Override
	public List<Admin> getAllAdmin() {
		return adminMapper.getAllAdmin();
	}

}

package com.qingke.boma.service;

import java.util.List;

import com.qingke.boma.pojo.Admin;

public interface AdminService extends BasicService<Admin>{
	
	//根据用户名查找管理员
	public Admin getAdminByUsername(String username);
	
	//查找所有管理员
	public List<Admin> getAllAdmin();

}

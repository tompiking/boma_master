package com.qingke.boma.mapper;

import java.util.List;

import com.qingke.boma.pojo.Admin;

public interface AdminMapper extends BomaMapper<Admin>{

	// 根据用户名查找管理员
	public Admin getAdminByUsername(String username);

	// 查找所有管理员
	public List<Admin> getAllAdmin();

}

package com.qingke.boma.service;

import java.util.List;
import java.util.Map;

import com.qingke.boma.pojo.Company;
import com.qingke.boma.pojo.Trade;

public interface CompanyService extends BasicService<Company> {

	// 获取所有公司
	public List<Company> getAllCompanies();

	// 获取所有成功案例公司
	public List<Company> getCaseCompanies();

	// 根据id获取公司
	public Company getCompanyById(Integer id);

	// 获取所有某行业的成功案例的公司
	public List<Company> getCaseCompanyByTrade(Trade trade);

	// 获取所有某行业的成功案例的公司
	public List<Company> getUnCaseCompanyByTrade(Trade trade);

	// 根据公司名称获取公司
	public Company getCompanyByName(String name);
	
	//获取所有公司分页
	public List<Company> getCompaniesByPage(Map<String, Integer> mapPage);
	
	//获取公司信息总条数
	public Integer countAllCompanies();
}

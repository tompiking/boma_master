package com.qingke.boma.mapper;

import java.util.List;
import java.util.Map;

import com.qingke.boma.pojo.Company;
import com.qingke.boma.pojo.Trade;

public interface CompanyMapper extends BomaMapper<Company> {

	// 获取所有成功案例公司
	public List<Company> getCaseCompanies();

	// 根据id获取公司
	public Company getCompanyById(Integer id);

	// 获取所有某行业的成功案例的公司
	public List<Company> getCaseCompanyByTrade(Trade trade);
	
	//获取某行业非成功案例公司
	public List<Company> getUnCaseCompanyByTrade(Trade trade);

	// 根据公司名称获取公司
	public Company getCompanyByName(String name);

	// 获取所有公司(改)
	public List<Company> getCompanies();
	
	//根据ID删除公司
	///public int deleteCompanyById(Integer id);
	
	//获取所有公司(分页)
	public List<Company> getCompaniesByPage(Map<String, Integer> mapPage);
	
	//获取公司信息的总条数
	public Integer countAllCompanies();
}

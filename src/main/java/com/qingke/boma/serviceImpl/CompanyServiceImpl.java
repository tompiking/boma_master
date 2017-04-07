package com.qingke.boma.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qingke.boma.mapper.CompanyMapper;
import com.qingke.boma.mapper.LogoMapper;
import com.qingke.boma.pojo.Company;
import com.qingke.boma.pojo.Trade;
import com.qingke.boma.service.CompanyService;

@Service(value = "companyServiceImpl")
@Transactional
public class CompanyServiceImpl implements CompanyService{
	
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private LogoMapper logoMapper;
	// 添加公司
	@Override
	public int insert(Company t) {
		System.out.println(t.getLogo().getId());
		logoMapper.insert(t.getLogo());
		System.out.println(t.getLogo().getId());
		return companyMapper.insert(t);
	}
	// 更新公司信息
	@Override
	public int update(Company t) {
		if(t.getLogo() != null) 
			logoMapper.insert(t.getLogo());
		return companyMapper.update(t);
	}
	// 获取所有公司
	@Override
	public List<Company> getAllCompanies() {
		return companyMapper.getCompanies();
	}
	// 获取所有成功案例公司
	@Override
	public List<Company> getCaseCompanies() {
		return companyMapper.getCaseCompanies();
	}
	// 根据id获取公司
	@Override
	public Company getCompanyById(Integer id) {
		return companyMapper.getCompanyById(id);
	}
	// 获取所有某行业的成功案例的公司
	@Override
	public List<Company> getCaseCompanyByTrade(Trade trade) {
		return companyMapper.getCaseCompanyByTrade(trade);
	}
	// 根据公司名称获取公司
	@Override
	public Company getCompanyByName(String name) {
		return companyMapper.getCompanyByName(name);
	}
	// 获取所有某行业的成功案例的公司
	@Override
	public List<Company> getUnCaseCompanyByTrade(Trade trade) {
		return companyMapper.getUnCaseCompanyByTrade(trade);
	}
	
	//获取所有公司分页
	@Override
	public List<Company> getCompaniesByPage(Map<String, Integer> mapPage) {
		return companyMapper.getCompaniesByPage(mapPage);
	}
	
	//获取公司信息的总条数
	@Override
	public Integer countAllCompanies() {
		return companyMapper.countAllCompanies();
	}

}

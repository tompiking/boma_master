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
	// ��ӹ�˾
	@Override
	public int insert(Company t) {
		System.out.println(t.getLogo().getId());
		logoMapper.insert(t.getLogo());
		System.out.println(t.getLogo().getId());
		return companyMapper.insert(t);
	}
	// ���¹�˾��Ϣ
	@Override
	public int update(Company t) {
//		if(t.getLogo() != null) 
//			logoMapper.insert(t.getLogo());
		return companyMapper.update(t);
	}
	// ��ȡ���й�˾
	@Override
	public List<Company> getAllCompanies() {
		return companyMapper.getCompanies();
	}
	// ��ȡ���гɹ�������˾
	@Override
	public List<Company> getCaseCompanies() {
		return companyMapper.getCaseCompanies();
	}
	// ����id��ȡ��˾
	@Override
	public Company getCompanyById(Integer id) {
		return companyMapper.getCompanyById(id);
	}
	// ��ȡ����ĳ��ҵ�ĳɹ������Ĺ�˾
	@Override
	public List<Company> getCaseCompanyByTrade(Trade trade) {
		return companyMapper.getCaseCompanyByTrade(trade);
	}
	// ���ݹ�˾���ƻ�ȡ��˾
	@Override
	public Company getCompanyByName(String name) {
		return companyMapper.getCompanyByName(name);
	}
	// ��ȡ����ĳ��ҵ�ĳɹ������Ĺ�˾
	@Override
	public List<Company> getUnCaseCompanyByTrade(Trade trade) {
		return companyMapper.getUnCaseCompanyByTrade(trade);
	}
	
	//��ȡ���й�˾��ҳ
	@Override
	public List<Company> getCompaniesByPage(Map<String, Integer> mapPage) {
		return companyMapper.getCompaniesByPage(mapPage);
	}
	
	//��ȡ��˾��Ϣ��������
	@Override
	public Integer countAllCompanies() {
		return companyMapper.countAllCompanies();
	}

}

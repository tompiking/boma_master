package com.qingke.boma.pojo;

/**
 * 
 * @time 下午4:02:54
 * @Description 公司
 */
public class Company {
	private Integer id;
	// 公司名
	private String name;
	// 公司简介
	private String description;
	// 所属行业
	private Trade trade;
	// 是否是成功案例
	private String isCase;
	// 是否存在总公司
	private Company parentCompany;
	// 公司对应的log
	private Logo logo;

	public Company() {
		super();
		isCase = "n";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Trade getTrade() {
		return trade;
	}

	public void setTrade(Trade trade) {
		this.trade = trade;
	}

	public String getIsCase() {
		return isCase;
	}

	public void setIsCase(String isCase) {
		this.isCase = isCase;
	}

	public Company getParentCompany() {
		return parentCompany;
	}

	public void setParentCompany(Company parentCompany) {
		this.parentCompany = parentCompany;
	}

	public Logo getLogo() {
		return logo;
	}

	public void setLogo(Logo logo) {
		this.logo = logo;
	}

}

package com.qingke.boma.pojo;

/**
 * 
 * @time 下午4:03:24
 * @Description 招聘
 */
public class Recruit {
	private Integer id;
	//公司简介
	private String description;
	// 招聘要求
	private String requirement;
	// 年薪
	private String salary;
	// 工作地址
	private String address;
	// 招聘标题
	private String title;
	// 招聘公司
	private Company company;
	//是否显示
	private String isShow;

	public Recruit() {
		super();
		isShow = "y";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}

}

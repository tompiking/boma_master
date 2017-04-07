package com.qingke.boma.pojo;

/**
 * @time 下午4:02:21
 * @Description 负责人
 */
public class Manager {
	private Integer id;
	// 公司负责人名
	private String name;
	// 负责人尊称
	private String showName;
	// 负责人岗位
	private String job;
	// 负责人评语
	private String comment;
	// 所属公司
	private Company company;
	// 是否是显示口碑印证
	private String isPraise;

	public Manager() {
		super();
		isPraise = "n";
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

	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getIsPraise() {
		return isPraise;
	}

	public void setIsPraise(String isPraise) {
		this.isPraise = isPraise;
	}

}

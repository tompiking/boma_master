package com.qingke.boma.pojo;

/**
 * @time 下午4:11:01
 * @Description 岗位
 */
public class Job {
	private Integer id;
	// 岗位名称
	private String name;

	public Job() {
		super();
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

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Job) {
			if (((Job) obj).getName().equals(this.getName())) {
				return true;
			}
		}
		return false;
	}
}

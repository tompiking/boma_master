package com.qingke.boma.pojo;

/**
 * 
 * @time 下午4:09:22
 * @Description Logo表
 */
public class Logo {
	private Integer id;
	// logo资源地址+UUID
	private String img;

	public Logo() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}

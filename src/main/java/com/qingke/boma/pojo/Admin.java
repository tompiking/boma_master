package com.qingke.boma.pojo;

/**
 * 
 * @Description 管理员
 */
public class Admin {

	private int id;
	// 管理员名称
	private String name;
	// 账户名
	private String username;
	// 密码
	private String password;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}

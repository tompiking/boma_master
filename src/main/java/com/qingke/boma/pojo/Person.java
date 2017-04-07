package com.qingke.boma.pojo;

import java.util.Date;

/**
 * 
 * @time ����4:12:12
 * @Description ���Ƽ���
 */
public class Person {
	private Integer id;
	// ����
	private String name;
	// ����
	private Date birth;
	// �Ա�
	private Boolean gender;
	// �Ƿ��ѻ�
	private Boolean marry;
	// ѧ��
	private String educational;
	// �������ڵ�
	private String registry;
	// ���
	private Double height;
	// �������ڵ�
	private String domicile;
	// ��������
	private String description;
	// ��������
	private String requireJob;

	public Person() {
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

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public Boolean getMarry() {
		return marry;
	}

	public void setMarry(Boolean marry) {
		this.marry = marry;
	}

	public String getEducational() {
		return educational;
	}

	public void setEducational(String educational) {
		this.educational = educational;
	}

	public String getRegistry() {
		return registry;
	}

	public void setRegistry(String registry) {
		this.registry = registry;
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public String getDomicile() {
		return domicile;
	}

	public void setDomicile(String domicile) {
		this.domicile = domicile;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRequireJob() {
		return requireJob;
	}

	public void setRequireJob(String requireJob) {
		this.requireJob = requireJob;
	}

}

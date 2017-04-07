package com.qingke.boma.pojo;

/**
 * 
 * @time ����4:11:47
 * @Description �Ƽ�
 */
public class Recommend {
	private Integer id;
	// ���Ƽ���
	private Person person;
	// ���Ƽ���λ
	private Job job;
	// �Ƿ�չʾ��ҳ������
	private Boolean isShow;

	public Recommend() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public Boolean getIsShow() {
		return isShow;
	}

	public void setIsShow(Boolean isShow) {
		this.isShow = isShow;
	}

}

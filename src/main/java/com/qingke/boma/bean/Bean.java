package com.qingke.boma.bean;

import com.qingke.boma.pojo.Job;
import com.qingke.boma.pojo.Person;
import com.qingke.boma.pojo.Recommend;

public class Bean {
	private Job job;
	private Recommend recommend;
	private Person person;

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public Recommend getRecommend() {
		return recommend;
	}

	public void setRecommend(Recommend recommend) {
		this.recommend = recommend;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

}

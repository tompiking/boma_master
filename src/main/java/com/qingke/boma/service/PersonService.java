package com.qingke.boma.service;

import java.util.List;

import com.qingke.boma.bean.Page;
import com.qingke.boma.pojo.Person;

public interface PersonService extends BasicService<Person>{
	
	//ͨ��id���ұ��Ƽ���
	public Person getPersonById(Integer id);

	public List<Person> getPersons();

	public int deletePersonById(Integer id);

	public Page<Person> getPage(Integer pageno, Integer pagesize);

	public Page<Person> getPage(Integer pagesize);
	
}

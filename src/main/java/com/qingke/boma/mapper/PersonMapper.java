package com.qingke.boma.mapper;

import java.util.List;
import java.util.Map;

import com.qingke.boma.pojo.Person;

public interface PersonMapper extends BomaMapper<Person> {

	// ͨ��id���ұ��Ƽ���
	public Person getPersonById(Integer id);

	public List<Person> getPersons();

	public int deletePersonById(Integer id);

	public List<Person> queryDatas(Map<String, Object> paramMap);

	public Integer queryCount();

}

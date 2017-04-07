package com.qingke.boma.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qingke.boma.bean.Page;
import com.qingke.boma.mapper.PersonMapper;
import com.qingke.boma.pojo.Person;
import com.qingke.boma.service.PersonService;

@Service("personServiceImpl")
@Transactional
public class PersonServiceImpl implements PersonService{
	
	@Autowired
	private PersonMapper personMapper;

	@Override
	public int insert(Person t) {
		return personMapper.insert(t);
	}

	@Override
	public int update(Person t) {
		return personMapper.update(t);
	}

	@Override
	public Person getPersonById(Integer id) {
		return personMapper.getPersonById(id);
	}

	@Override
	public List<Person> getPersons() {
		return personMapper.getPersons();
	}

	@Override
	public int deletePersonById(Integer id) {
		return personMapper.deletePersonById(id);
	}

	@Override
	public Page<Person> getPage(Integer pageno, Integer pagesize) {
		Page<Person> personPage = new Page<Person>();
		//查询集合数据
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startIndex",(pageno-1)*pagesize);
		paramMap.put("pagesize", pagesize);
		List<Person> persons = personMapper.queryDatas(paramMap);
		//查询总的数据条数
		Integer count = personMapper.queryCount();
		//查询总页码
		Integer totalno;
		if(count % pagesize == 0){
			totalno = count /pagesize;
		}else {
			totalno = count /pagesize + 1;
		}
		personPage.setDatas(persons);
		personPage.setPagesize(count);
		personPage.setTotalno(totalno);
		personPage.setCurrentno(pageno);
		return personPage;
	}

	@Override
	public Page<Person> getPage(Integer pagesize) {
		Page<Person> personPage = new Page<Person>();
		// 查询总的数据条数
		Integer count = personMapper.queryCount();
		// 查询总页码
		Integer totalno;
		if (count % pagesize == 0) {
			totalno = count / pagesize;
		} else {
			totalno = count / pagesize + 1;
		}
		personPage.setPagesize(count);
		personPage.setTotalno(totalno);
		personPage.setCurrentno(1);
		return personPage;
	}

}

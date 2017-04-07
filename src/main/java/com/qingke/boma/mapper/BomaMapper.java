package com.qingke.boma.mapper;

public interface BomaMapper <T> {
	
	//修改某一对象(逻辑删除与逻辑修改)
	int update(T t);
	
	//增加某一对象
	int insert(T t);
	
}

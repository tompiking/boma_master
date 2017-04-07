package com.qingke.boma.service;

public interface BasicService <T>{
	//添加实体信息
	int insert(T t);
	//更新实体信息
	int update(T t);
}

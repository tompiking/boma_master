package com.qingke.boma.service;

import java.util.List;

import com.qingke.boma.bean.Page;
import com.qingke.boma.pojo.Recommend;

public interface RecommendService extends BasicService<Recommend> {
	
	//�������е��Ƽ���Ϣ
	public List<Recommend> getAllRecommend();
	//����������Ҫ��ʾ���Ƽ���Ϣ
	public List<Recommend> getIsShowRecommends();
	
	public Recommend getRcommendById(Integer id);
	
	public int delete(Recommend recommend);
	public Page<Recommend> getRecommendPage(Integer pageno, Integer pagesize);
	public Page<Recommend> getPage(Integer pagesize);
	public Page<Recommend> getPage(Integer pageno, Integer pagesize);
}

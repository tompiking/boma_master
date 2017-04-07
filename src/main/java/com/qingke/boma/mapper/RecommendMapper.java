package com.qingke.boma.mapper;

import java.util.List;
import java.util.Map;

import com.qingke.boma.pojo.Recommend;

public interface RecommendMapper extends BomaMapper<Recommend> {

	// �������е��Ƽ���Ϣ
	public List<Recommend> getAllRecommend();

	// ����������Ҫ��ʾ���Ƽ���Ϣ
	public List<Recommend> getIsShowRecommends();

	public Recommend getRecommendById(Integer id);

	public int deleteByRecommendId(Integer id);

	public List<Recommend> queryDatas(Map<String, Object> paramMap);

	public Integer queryCount();

}

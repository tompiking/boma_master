package com.qingke.boma.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qingke.boma.bean.Page;
import com.qingke.boma.mapper.RecommendMapper;
import com.qingke.boma.pojo.Recommend;
import com.qingke.boma.service.RecommendService;


@Service("recommandServiceImpl")
@Transactional
public class RecommandServiceImpl implements RecommendService{
	
	@Autowired
	private RecommendMapper recommendMapper;

	@Override
	public int insert(Recommend t) {
		return recommendMapper.insert(t);
	}

	@Override
	public int update(Recommend t) {
		return recommendMapper.update(t);
	}

	@Override
	public List<Recommend> getAllRecommend() {
		return recommendMapper.getAllRecommend();
	}

	@Override
	public List<Recommend> getIsShowRecommends() {
		return recommendMapper.getIsShowRecommends();
	}

	@Override
	public Recommend getRcommendById(Integer id) {
		return recommendMapper.getRecommendById(id);
	}

	@Override
	public int delete(Recommend recommend) {
		int count = recommendMapper.deleteByRecommendId(recommend.getId());
		return count;
	}

	@Override
	public Page<Recommend> getRecommendPage(Integer pageno, Integer pagesize) {
		Page<Recommend> recommendPage = new Page<Recommend>();
		//查询集合数据
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startIndex",(pageno-1)*pagesize);
		paramMap.put("pagesize", pagesize);
		List<Recommend> recommends = recommendMapper.queryDatas(paramMap);
		//查询总的数据条数
		Integer count = recommendMapper.queryCount();
		//查询总页码
		Integer totalno;
		if(count % pagesize == 0){
			totalno = count /pagesize;
		}else {
			totalno = count /pagesize + 1;
		}
		recommendPage.setDatas(recommends);
		recommendPage.setPagesize(count);
		recommendPage.setTotalno(totalno);
		recommendPage.setCurrentno(pageno);
		return recommendPage;
	}

	@Override
	public Page<Recommend> getPage(Integer pagesize) {
		Page<Recommend> recommendPage = new Page<Recommend>();
		//查询总的数据条数
		Integer count = recommendMapper.queryCount();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startIndex",0);
		paramMap.put("pagesize", pagesize);
		List<Recommend> recommends = recommendMapper.queryDatas(paramMap);
		//查询总页码
		Integer totalno;
		if(count % pagesize == 0){
			totalno = count /pagesize;
		}else {
			totalno = count /pagesize + 1;
		}
		recommendPage.setDatas(recommends);
		recommendPage.setPagesize(count);
		recommendPage.setTotalno(totalno);
		recommendPage.setCurrentno(1);
		return recommendPage;
	}

	@Override
	public Page<Recommend> getPage(Integer pageno, Integer pagesize) {
		Page<Recommend> recommendPage = new Page<Recommend>();
		//查询集合数据
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startIndex",(pageno-1)*pagesize);
		paramMap.put("pagesize", pagesize);
		List<Recommend> recommends = recommendMapper.queryDatas(paramMap);
		//查询总的数据条数
		Integer count = recommendMapper.queryCount();
		//查询总页码
		Integer totalno;
		if(count % pagesize == 0){
			totalno = count /pagesize;
		}else {
			totalno = count /pagesize + 1;
		}
		recommendPage.setDatas(recommends);
		recommendPage.setPagesize(count);
		recommendPage.setTotalno(totalno);
		recommendPage.setCurrentno(pageno);
		return recommendPage;
	}
}

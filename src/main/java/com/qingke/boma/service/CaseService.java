package com.qingke.boma.service;

import java.util.List;
import java.util.Map;

import com.qingke.boma.pojo.Trade;

public interface CaseService {
	// 拿到所有有显示的行业
	public List<Map> getCaseMap() throws Exception;

	// limitselect
	public List<Map> getSelectMap(Map<String, Integer> map) throws Exception;
}
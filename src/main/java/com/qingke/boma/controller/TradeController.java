package com.qingke.boma.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qingke.boma.exception.BomaException;
import com.qingke.boma.pojo.Company;
import com.qingke.boma.pojo.Trade;
import com.qingke.boma.pojo.TradeJob;
import com.qingke.boma.service.CompanyService;
import com.qingke.boma.service.TradeJobService;
import com.qingke.boma.service.TradeService;

@Controller()
@RequestMapping("/trade")
public class TradeController {
	@Autowired
	private TradeService tradeServiceImpl;
	@Autowired
	private CompanyService companyServiceImpl;
	
	@Autowired
	private TradeJobService tradeJobService;

	//跳转新增行业
	@RequestMapping("/addTrade")
	public ModelAndView addTrade() {
		System.out.println("添加行业");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/trade/AddTrade");
		return modelAndView;
	}
	
	//执行新增行业
	@RequestMapping("/addTradeSubmit")
	public ModelAndView addTradeSubmit(Trade trade) throws Exception {
		try {
			tradeServiceImpl.insert(trade);
		} catch (Exception e) {
			throw new BomaException("添加行业失败!!");
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("msg", "添加成功");
		modelAndView.setViewName("/trade/AddTrade");
		return modelAndView;
	}

	// 检查数据库中是否存在同名的行业
	@RequestMapping("/checkTradeName")
	public void checkTradeName(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		System.out.println(name);
		Trade trade = new Trade();
		trade.setName(name);
		if (tradeServiceImpl.getTradeByName(trade) != null) {
			// System.out.println("true");
			response.getWriter().print("true");
		} else {
			// System.out.println("false");
			response.getWriter().print("false");
		}
	}

	@RequestMapping("/deleteTrade")
	@ResponseBody
	public Map<String, Object> deleteTrade(Integer id) {
		Trade trade = tradeServiceImpl.getTradeById(id);
		List<Company> companies = companyServiceImpl.getCaseCompanyByTrade(trade);
		for (Company company : companies) {
			company.setIsCase("n");
			companyServiceImpl.update(company);
		}
		List<TradeJob> tJobs = tradeJobService.getIsShowTradeJobs(id);
		for (TradeJob tj : tJobs) {
			tj.setIsShow("n");
			tradeJobService.update(tj);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("result", "true");
		return map;
	}

}

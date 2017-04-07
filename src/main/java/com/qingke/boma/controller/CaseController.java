package com.qingke.boma.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qingke.boma.pojo.Company;
import com.qingke.boma.pojo.Page;
import com.qingke.boma.pojo.Trade;
import com.qingke.boma.pojo.TradeJob;
import com.qingke.boma.service.CaseService;
import com.qingke.boma.service.CompanyService;
import com.qingke.boma.service.TradeJobService;
import com.qingke.boma.service.TradeService;
import com.qingke.boma.util.Const;

@Controller
@RequestMapping("/case")
public class CaseController {

	@Autowired
	private TradeService tradeServiceImpl;
	@Autowired
	private CaseService caseServiceImpl;
	@Autowired
	private CompanyService companyServiceImpl;
	@Autowired
	private TradeJobService tradeJobServiceImpl;

	@RequestMapping("/case")
	public ModelAndView list() throws Exception {
		List<Map> maps = caseServiceImpl.getCaseMap();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("companies", maps.get(0));
		modelAndView.addObject("jobs", maps.get(1));
		modelAndView.setViewName("/case/trade");
		return modelAndView;
	}

	@RequestMapping("/admin")
	public ModelAndView admin() throws Exception {
		List<Map> maps = caseServiceImpl.getCaseMap();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("companies", maps.get(0));
		modelAndView.addObject("jobs", maps.get(1));
		modelAndView.setViewName("/case/trade_admin");
		return modelAndView;
	}

	@RequestMapping("/add")
	public ModelAndView add() {
		List<Trade> trades = tradeServiceImpl.getAllTrades();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("trades", trades);
		modelAndView.setViewName("/case/add");
		return modelAndView;
	}

	@RequestMapping("/insert")
	public ModelAndView insert() {
		List<Trade> trades = tradeServiceImpl.getAllTrades();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("trades", trades);
		modelAndView.setViewName("/case/insert");
		return modelAndView;
	}

	@RequestMapping("/select")
	public ModelAndView select(HttpServletRequest request) throws Exception {
		List<Map> maps = caseServiceImpl.getCaseMap();
		Page page = (Page) request.getAttribute("page");
		if (page == null) {
			page = new Page();
			page.setCurrentPage(1);
			page.setPageAmount(Const.pageAmount_case);
			page.setTotalAmount(maps.get(0).keySet().size());
		}
		request.setAttribute("page", page);
		int sId = (page.getCurrentPage() - 1) * page.getPageAmount() + 1;
		int eId = sId + page.getPageAmount();
		Map<String, Integer> map = new HashMap<>();
		map.put("sId", sId);
		map.put("eId", eId);
		maps = caseServiceImpl.getSelectMap(map);
		ModelAndView modelAndView = new ModelAndView();
		Set ts = maps.get(0).keySet();
		List<Trade> trades = new ArrayList<>();
		for (Object o : ts) {
			trades.add((Trade) o);
		}
		trades.sort(new Comparator<Trade>() {

			@Override
			public int compare(Trade o1, Trade o2) {
				return o1.getId().compareTo(o2.getId());
			}

		});
		modelAndView.addObject("trades", trades);
		modelAndView.addObject("companies", maps.get(0));
		modelAndView.addObject("jobs", maps.get(1));
		modelAndView.setViewName("/case/select");
		return modelAndView;
	}

	@RequestMapping("/select_admin")
	public ModelAndView selectaa(HttpServletRequest request) throws Exception {
		List<Map> maps = caseServiceImpl.getCaseMap();
		Page page = (Page) request.getAttribute("page");
		if (page == null) {
			page = new Page();
			page.setCurrentPage(1);
			page.setPageAmount(Const.pageAmount_case);
			page.setTotalAmount(maps.get(0).keySet().size());
		}
		request.setAttribute("page", page);
		int sId = (page.getCurrentPage() - 1) * page.getPageAmount() + 1;
		int eId = sId + page.getPageAmount();
		Map<String, Integer> map = new HashMap<>();
		map.put("sId", sId);
		map.put("eId", eId);
		maps = caseServiceImpl.getSelectMap(map);
		ModelAndView modelAndView = new ModelAndView();
		Set ts = maps.get(0).keySet();
		List<Trade> trades = new ArrayList<>();
		for (Object o : ts) {
			trades.add((Trade) o);
		}
		trades.sort(new Comparator<Trade>() {

			@Override
			public int compare(Trade o1, Trade o2) {
				return o1.getId().compareTo(o2.getId());
			}

		});
		modelAndView.addObject("trades", trades);
		modelAndView.addObject("companies", maps.get(0));
		modelAndView.addObject("jobs", maps.get(1));
		modelAndView.setViewName("/case/select_admin");
		return modelAndView;
	}

	@RequestMapping("/getTotalPage")
	@ResponseBody
	public Map<String, Object> getTotalPage() throws Exception {
		List<Map> maps = caseServiceImpl.getCaseMap();
		Map<String, Object> map = new HashMap<>();
		Page page = new Page();
		page.setTotalAmount(maps.get(0).keySet().size());
		page.setPageAmount(Const.pageAmount_case);
		if (page.getTotalPage() != null) {
			map.put("result", page.getTotalPage());
		} else {
			map.put("result", "false");
		}
		return map;
	}

	@RequestMapping("/showAll")
	@ResponseBody
	public Map<String, Object> showAllCompaniesAjax(Page page, HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		// 设置每页显示的条数
		page.setPageAmount(Const.pageAmount_case);
		request.setAttribute("page", page);
		List<Map> list = caseServiceImpl.getCaseMap();
		int sId = (page.getCurrentPage() - 1) * page.getPageAmount() + 1;
		int eId = sId + page.getPageAmount();
		Map<String, Integer> map = new HashMap<>();
		map.put("sId", sId);
		map.put("eId", eId);
		list = caseServiceImpl.getSelectMap(map);
		resultMap.put("result", "true");
		List<Trade> trades = new ArrayList<>();
		for (Object o : list.get(0).keySet()) {
			trades.add((Trade) o);
		}
		trades.sort(new Comparator<Trade>() {
			@Override
			public int compare(Trade o1, Trade o2) {
				return o1.getId().compareTo(o2.getId());
			}
		});
		List<Company> companies = companyServiceImpl.getCaseCompanies();
		for (Company company : companies) {
			System.out.println(company.getTrade().getName());
		}
		List<TradeJob> jobs = tradeJobServiceImpl.getIsShow();
		resultMap.put("companies", companies);
		resultMap.put("trades", trades);
		resultMap.put("jobs", jobs);
		resultMap.put("page", page);
		return resultMap;
	}
}

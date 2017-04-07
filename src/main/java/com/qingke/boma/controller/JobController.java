package com.qingke.boma.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingke.boma.pojo.Company;
import com.qingke.boma.pojo.Job;
import com.qingke.boma.pojo.Trade;
import com.qingke.boma.pojo.TradeJob;
import com.qingke.boma.service.JobService;
import com.qingke.boma.service.TradeJobService;
import com.qingke.boma.service.TradeService;

@Controller
@RequestMapping("/job")
public class JobController {
	@Autowired
	private TradeJobService tradeJobServiceImpl;
	@Autowired
	private JobService jobServiceImpl;
	@Autowired
	private TradeService tradeServiceImpl;

	@RequestMapping("/getJobByName")
	@ResponseBody
	public Map<String,String> getJobByName(String name) {
		Map<String,String> map = new HashMap<>();
		Job job = jobServiceImpl.getJobByName(name);
		if(job != null) {
			map.put("result", job.getName());
		} else {
			map.put("result", "error");
		}
		return map;
	}
	@RequestMapping("/addJob")
	@ResponseBody
	public Map<String, Object> deleteCompany(Integer id) {
		Map<String, Object> map = new HashMap<>();
		TradeJob tradeJob = tradeJobServiceImpl.getTradeJobById(id);
		if("y".equals(tradeJob.getIsShow())){
			map.put("result", "false");
			return map;
		}
		tradeJob.setIsShow("y");
		tradeJobServiceImpl.update(tradeJob);
		map.put("result", "true");
		return map;
	}

	@RequestMapping(value = "/listjob/{id}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public void add(@PathVariable("id") Integer id, HttpServletResponse response) throws IOException {
		List<TradeJob> tradeJobs = tradeJobServiceImpl.getUnShowTradeJobs(id);
		String html = "[";
		for (int i = 0; i < tradeJobs.size(); i++) {
			if (i > 0) {
				html += ",";
			}
			html += "{id:'" + tradeJobs.get(i).getId() + "',name:'" + tradeJobs.get(i).getJob().getName() + "'}";
		}
		html += "]";
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(html);
	}

	@RequestMapping("/deleteJobById")
	@ResponseBody
	public Map<String, Object> deleteById(Integer jid, Integer tid) {
		TradeJob tradeJob = tradeJobServiceImpl.getTradeJobByTwoIds(tid, jid);
		System.out.println("tid" + tid);
		System.out.println("jid" + jid);
		tradeJob.setIsShow("n");
		tradeJobServiceImpl.update(tradeJob);
		Map<String, Object> map = new HashMap<>();
		map.put("result", "true");
		return map;
	}

	@RequestMapping("/getOtherJobs/{id}")
	public void getOtherJobs(@PathVariable("id") Integer id, HttpServletResponse response) throws IOException {
		List<Job> jobs = tradeJobServiceImpl.getOtherJobs(id);
		String html = "[";
		for (int i = 0; i < jobs.size(); i++) {
			if (i > 0) {
				html += ",";
			}
			html += "{id:'" + jobs.get(i).getId() + "',name:'" + jobs.get(i).getName() + "'}";
		}
		html += "]";
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(html);
	}

	@RequestMapping("/selectAdd")
	@ResponseBody
	public Map<String, Object> selectAdd(Integer tid, Integer jid) {
		TradeJob tradeJob = new TradeJob();
		tradeJob.setIsShow("n");
		Job job = jobServiceImpl.getJobById(jid);
		Trade trade = tradeServiceImpl.getTradeById(tid);
		tradeJob.setJob(job);
		tradeJob.setTrade(trade);
		tradeJobServiceImpl.insert(tradeJob);
		Map<String, Object> map = new HashMap<>();
		map.put("result", "true");
		return map;
	}

	@RequestMapping("/inputAdd")
	@ResponseBody
	public Map<String, Object> inputAdd(Integer id, String name) {
		Map<String, Object> map = new HashMap<>();
		List<Job> jobs = jobServiceImpl.getAllJobs();
		for (Job job : jobs) {
			if (name.equals(job.getName())) {
				map.put("result", "false");
				return map;
			}
		}
		Job job = new Job();
		job.setName(name);
		jobServiceImpl.insert(job);
		job = jobServiceImpl.getJobByName(name);
		Trade trade = tradeServiceImpl.getTradeById(id);
		TradeJob tradeJob = new TradeJob();
		tradeJob.setIsShow("n");
		tradeJob.setJob(job);
		tradeJob.setTrade(trade);
		tradeJobServiceImpl.insert(tradeJob);
		map.put("result", "true");
		return map;
	}
}

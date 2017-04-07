package com.qingke.boma.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingke.boma.bean.Bean;
import com.qingke.boma.bean.Page;
import com.qingke.boma.bean.Result;
import com.qingke.boma.pojo.Job;
import com.qingke.boma.pojo.Person;
import com.qingke.boma.pojo.Recommend;
import com.qingke.boma.service.JobService;
import com.qingke.boma.service.PersonService;
import com.qingke.boma.service.RecommendService;

@Controller
@RequestMapping("/recommend")
public class RecommandController {

	@Autowired
	private RecommendService recommendServiceImpl;

	@Autowired
	private PersonService personServiceImpl;

	@Autowired
	private JobService jobServiceImpl;

	/**
	 * 鍦ㄥ墠鍙版樉绀烘墍鏈夐渶瑕佸睍绀虹殑鎺ㄨ崘淇℃伅
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String listIsShow(Model model) {
		List<Recommend> recommends = recommendServiceImpl.getIsShowRecommends();
		model.addAttribute("recommends", recommends);
		return "/recommend/list";
	}
	
	/**
	 * 分页查询用户信息
	 * @param pageno
	 * @param pagesize
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/pageQuery")
	public Object pageQuery(Integer pageno,Integer pagesize){
		Result r = new Result();
		try {
			Page<Recommend> recommendPage = recommendServiceImpl.getRecommendPage(pageno, pagesize);
			r.setObject(recommendPage);
			r.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			r.setSuccess(false);
		}
		return r;
	}
	
	/**
	 * 分页查询用户信息
	 * @param pageno
	 * @param pagesize
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/pageQueryAjax")
	public Object pageQueryAjax(Integer pagesize){
		Result r = new Result();
		try {
			Page<Recommend> recommendPage = recommendServiceImpl.getPage(pagesize);
			r.setObject(recommendPage);
			r.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			r.setSuccess(false);
		}
		return r;
	}

	/**
	 * 鍦ㄥ墠鍙版樉绀鸿缁嗘帹鑽愪俊鎭�
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/lookInfo")
	public String recommendDetail(Model model, String id) {
		if (StringUtils.isNotBlank(id)) {
			Integer recommendId = Integer.parseInt(id);
			Recommend recommend = recommendServiceImpl.getRcommendById(recommendId);
			model.addAttribute("recommend", recommend);
			return "/recommend/admin/lookInfo";
		}else return null;
	}

	/**
	 * 绠＄悊鍛樻樉绀烘墍鏈夌殑鎺ㄨ崘淇℃伅
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/listAll")
	public String listAll(@RequestParam(value="pageno",required=false,defaultValue="1")Integer pageno,@RequestParam(value="pagesize",required=false,defaultValue="6")Integer pagesize,Model model) {
		Page<Recommend> recommendPage = recommendServiceImpl.getPage(pagesize);
		model.addAttribute("recommendPage", recommendPage);
		return "/recommend/admin/list";
	}
	/**
	 * 璺宠浆鍒版坊鍔犻〉闈�
	 * 
	 * @return
	 */
	@RequestMapping("/add")
	public String add(Model model) {
		List<Person> persons = personServiceImpl.getPersons();
		List<Job> jobs = jobServiceImpl.getAllJobs();
		model.addAttribute("jobs", jobs);
		model.addAttribute("persons", persons);
		return "/recommend/admin/add";
	}

	/**
	 * 灏嗘帹鑽愪俊鎭斁鍏ユ暟鎹簱锛宎jax鏄剧ず鏀惧叆鍒扮殑鏁版嵁
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("insert")
	public Object insert(Bean bean) {
		Result r = new Result();
		try {
			Person person = bean.getPerson();
			Job job = bean.getJob();
			bean.getRecommend().setJob(job);
			bean.getRecommend().setPerson(person);
			try {
				recommendServiceImpl.insert(bean.getRecommend());
			} catch (Exception e) {
				e.printStackTrace();
				r.setSuccess(false);
				r.setMsg("推荐信息添加出错！可能是填入的信息重复了");
			}
			r.setSuccess(true);
			r.setMsg("添加推荐信息成功");
		} catch (Exception e) {
			e.printStackTrace();
			r.setSuccess(false);
			r.setMsg("娌℃湁姝ｇ‘杈撳叆淇℃伅");
		}
		return r;
	}

	/**
	 * 璺宠浆鍒扮紪杈戦〉闈�
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(HttpServletRequest request) {
		Integer id = Integer.parseInt(request.getParameter("id"));
		Recommend recommend = recommendServiceImpl.getRcommendById(id);
		List<Job> jobs = jobServiceImpl.getAllJobs();
		request.setAttribute("recommend", recommend);
		request.setAttribute("jobs", jobs);
		return "/recommend/admin/edit";
	}

	/**
	 * 鏇存柊鎺ㄨ崘淇℃伅锛屽苟鍦ㄥ綋鍓嶉〉闈㈡樉绀虹粨鏋�
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update")
	public Object update(Bean bean) {
		Result r = new Result();
		try {
			//jobServiceImpl.update(bean.getJob());
			personServiceImpl.update(bean.getPerson());
			bean.getRecommend().setJob(bean.getJob());
			bean.getRecommend().setPerson(bean.getPerson());
			recommendServiceImpl.update(bean.getRecommend());
			r.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			r.setSuccess(false);
		}
		return r;
	}
	
	/**
	 * 鎾ゅ洖鏇存柊鎺ㄨ崘淇℃伅锛屽苟鍦ㄥ綋鍓嶉〉闈㈠師鍏堢殑鏄剧ず缁撴灉
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/cancel")
	public Object cancel(Integer id) {
		Result r = new Result();
		try {
			Recommend recommend  = recommendServiceImpl.getRcommendById(id);
			r.setObject(recommend);
			r.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			r.setSuccess(false);
		}
		return r;
	}

	/**
	 * 鍒犻櫎鎺ㄨ崘淇℃伅
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request) {
		Integer id = Integer.parseInt(request.getParameter("id"));
		Recommend recommend = recommendServiceImpl.getRcommendById(id);
		recommendServiceImpl.delete(recommend);
		return "redirect:/recommend/listAll";
	}
	/**
	 * ajax删除信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteAjax")
	public Object deleteAjax(Integer id,@RequestParam(value="pageno",required=false,defaultValue="1")Integer pageno,@RequestParam(value="pagesize",required=false,defaultValue="6")Integer pagesize){
		Result r = new Result();
		Recommend recommend = recommendServiceImpl.getRcommendById(id);
		int count = recommendServiceImpl.delete(recommend);
		Page<Recommend> recommendPage = new Page<>();
		recommendPage = recommendServiceImpl.getPage(pageno,pagesize);
		if(count == 1){
			r.setMsg("删除成功");
			r.setSuccess(true);
			r.setObject(recommendPage);
		}else {
			r.setMsg("删除失败");
			r.setSuccess(false);
		}
		return r;
	}
}

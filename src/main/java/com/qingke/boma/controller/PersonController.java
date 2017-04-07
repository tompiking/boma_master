package com.qingke.boma.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qingke.boma.bean.Page;
import com.qingke.boma.bean.Result;
import com.qingke.boma.pojo.Person;
import com.qingke.boma.service.PersonService;

@Controller
@RequestMapping("/person")
public class PersonController {

	@Autowired
	private PersonService personServiceImpl;

	/**
	 * 璺宠浆鍒颁慨鏀归〉闈�
	 * 
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(HttpServletRequest request, Model model) {
		Integer id = Integer.parseInt(request.getParameter("id"));
		Integer pageno = Integer.parseInt(request.getParameter("pageno"));
		Person person = personServiceImpl.getPersonById(id);
		model.addAttribute("person", person);
		model.addAttribute("pageno", pageno);
		return "/recommend/person/edit";
	}

	/**
	 * 取消更新推荐人信息
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/cancel")
	public Object cancel(Integer id) {
		Result r = new Result();
		try {
			Person person = personServiceImpl.getPersonById(id);
			r.setObject(person);
			r.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			r.setSuccess(false);
		}
		return r;
	}

	/**
	 * 鏇存柊鎺ㄨ崘浜轰俊鎭�
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update")
	public Object update(Person person,Integer id) {
		Result r = new Result();
		try {
			Person newperson = person;
			newperson.setId(id);
			int count = personServiceImpl.update(person);
			if(count == 1){
				r.setSuccess(true);
				r.setObject(newperson);
			}else {
				r.setSuccess(false);
			}
			personServiceImpl.update(person);
			r.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			r.setSuccess(false);
		}
		return r;
	}

	/**
	 * 娣诲姞person淇℃伅
	 */
	@ResponseBody
	@RequestMapping("/insert")
	public Object insert(Person person) {
		Result r = new Result();
		try {
			int count = personServiceImpl.insert(person);
			if(count==1){
				r.setSuccess(true);
			}else {
				r.setSuccess(false);
			}		
			r.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			r.setSuccess(false);
		}
		return r;
	}

	/**
	 * 璺宠浆鍒版帹鑽愪汉娣诲姞椤甸潰
	 * @return
	 */
	@RequestMapping("/add")
	public String add() {
		return "/recommend/person/add";
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
			Page<Person> personPage = personServiceImpl.getPage(pageno,pagesize);
			r.setObject(personPage);
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
			Page<Person> personPage = personServiceImpl.getPage(pagesize);
			r.setObject(personPage);
			r.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			r.setSuccess(false);
		}
		return r;
	}
	/**
	 * 查看被推荐人的详细信息
	 */
	@RequestMapping("/lookInfo")
	public String lookInfo(Integer id,Model model){
		Person person = personServiceImpl.getPersonById(id);
		model.addAttribute("person", person);
		return "/recommend/person/lookInfo";
	}
	
	/**
	 * 跳转到分页查询的被推荐人信息页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="pageno",required=false,defaultValue="1")Integer pageno,@RequestParam(value="pagesize",required=false,defaultValue="6")Integer pagesize,Model model) {
		//分页查询被推荐人信息
		Page<Person> personPage = personServiceImpl.getPage(pageno,pagesize);
		model.addAttribute("personPage", personPage);
		return "/recommend/person/list";
	}
	
	/***
	 * 跳转到显示被推荐人信息页面
	 * @param model
	 * @return
	 *//*
	@RequestMapping("/list")
	public String list() {
		return "/recommend/person/list";
	}*/
	
	/**
	 * 删除被推荐人信息
	 * @return
	 */
	@RequestMapping("/delete")
	public String delete(Integer id){
		Result r = new Result();
		int count = personServiceImpl.deletePersonById(id);
		if(count == 1){
			r.setMsg("删除成功");
			r.setSuccess(true);
		}else {
			r.setMsg("删除失败");
			r.setSuccess(false);
		}
		return "redirect:/person/list";
	}
	
	/**
	 * ajax删除被推荐人信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteAjax")
	public Object deleteAjax(Integer id,@RequestParam(value="pageno",required=false,defaultValue="1")Integer pageno,@RequestParam(value="pagesize",required=false,defaultValue="6")Integer pagesize){
		Result r = new Result();
		int count = personServiceImpl.deletePersonById(id);
		Page<Person> personPage = new Page<>();
		personPage = personServiceImpl.getPage(pageno,pagesize);
		if(count == 1){
			r.setMsg("删除成功");
			r.setSuccess(true);
			r.setObject(personPage);
		}else {
			r.setMsg("删除失败");
			r.setSuccess(false);
		}
		return r;
	}
}

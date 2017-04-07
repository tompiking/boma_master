package com.qingke.boma.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qingke.boma.exception.BomaException;
import com.qingke.boma.pojo.Company;
import com.qingke.boma.pojo.Manager;
import com.qingke.boma.pojo.Page;
import com.qingke.boma.service.CompanyService;
import com.qingke.boma.service.ManagerService;
import com.qingke.boma.util.Const;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	private ManagerService managerServiceImpl;

	@Autowired
	private CompanyService companyServiceImpl;

	// 跳转到增加负责人界面
	@RequestMapping("/addManager")
	public ModelAndView addManager() {
		// 获取所有公司(最后整合时这里可在监听器里获取)
		List<Company> companies = companyServiceImpl.getAllCompanies();

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("companys", companies);
		modelAndView.setViewName("/manager/AddManager");
		return modelAndView;
	}

	// 获取页面上传的负责人信息并插入至数据库
	@RequestMapping("/addManagerSubmit")
	public String addManagerSubmit(Manager manager) {
		System.out.println("manager: " + manager);
		System.out.println(manager.getCompany().getId());
		int result = managerServiceImpl.insert(manager);
		System.out.println("插入了" + result);
		return "redirect:/manager/addShowPraise";
	}

	// 查询是口碑印证的公司的总页数
	@RequestMapping("/getTotalPageIsPraise")
	@ResponseBody
	public Map<String, Object> getTotalPageIsPraise() {
		Map<String, Object> mapResult = new HashMap<>();
		Page page = new Page();
		page.setPageAmount(Const.pageAmount);
		page.setTotalAmount(managerServiceImpl.countIsPraise());
		if (page.getTotalPage() != null) {
			System.out.println("是口碑印证的总页数:" + page.getTotalPage());
			mapResult.put("result", page.getTotalPage());
		} else {
			mapResult.put("result", "false");
		}
		return mapResult;
	}

	// 获取是口碑印证的负责人(分页第一页)
	@RequestMapping("/getManagerIsPraise")
	public ModelAndView getManagerIsPraise() {
		System.out.println("进入获取所有是口碑印证的公司");
		Map<String, Integer> map = new HashMap<>();
		map.put("index", 0);
		map.put("offset", Const.pageAmount);
		List<Manager> managers = managerServiceImpl.getAllManagersByPage(map);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("managerList", managers);
		modelAndView.setViewName("/Praise/praiseIndex");
		return modelAndView;
	}

	// 获取是口碑印证的负责人(分页AJax)
	@RequestMapping("/getManagerIsPraiseAjax")
	@ResponseBody
	public Map<String, Object> getManagerIsPraiseAjax(Page page) {
		Map<String, Object> resultMap = new HashMap<>();
		page.setPageAmount(Const.pageAmount);
		Map<String, Integer> mapPage = new HashMap<>();
		System.out.println("从第几个开始:"+(page.getCurrentPage()-1)*page.getPageAmount());
		mapPage.put("index", (page.getCurrentPage() - 1) * page.getPageAmount());
		mapPage.put("offset", page.getPageAmount());
		List<Manager> managers = managerServiceImpl.getAllManagersByPage(mapPage);
		if(managers!=null) {
			resultMap.put("result", managers);
		} else {
			resultMap.put("result", "false");
		}
		return resultMap;
	}
	
	//查询不是口碑印证的公司的总页数
	@RequestMapping("/getTotalPagesNotPraise")
	@ResponseBody
	public Map<String, Object> getTotalPagesNotPraise() {
		Map<String, Object> mapResult = new HashMap<>();
		Page page = new Page();
		page.setTotalAmount(managerServiceImpl.countNotPraise());
		page.setPageAmount(Const.pageAmount);
		if(page.getTotalPage()!=null) {
			mapResult.put("result", page.getTotalPage());
		} else {
			mapResult.put("result", "false");
		}
		return mapResult;
	}
	
	//获取不是口碑印证的负责人(分页第一页)
	@RequestMapping("/addShowPraise")
	public ModelAndView addShowPraise() {
		System.out.println("进入增加页面");
		Map<String, Integer> mapPage = new HashMap<>();
		mapPage.put("index", 0);
		mapPage.put("offset", Const.pageAmount);
		List<Manager> managers = managerServiceImpl.getAllManagerNotByPage(mapPage);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("managers", managers);
		modelAndView.setViewName("/Praise/AddShowPraise");
		return modelAndView;
	}

	//获取不是口碑印证的负责人(分页Ajax)
	@RequestMapping("/getManagerIsNotPraise")
	@ResponseBody
	public Map<String, Object> getManagerIsNotPraise(Page page) {
		Map<String, Object> mapResult = new HashMap<>();
		page.setPageAmount(Const.pageAmount);
		Map<String, Integer> mapPage = new HashMap<>();
		System.out.println("从第几个开始:"+(page.getCurrentPage()-1)*page.getPageAmount());
		mapPage.put("index", (page.getCurrentPage()-1)*page.getPageAmount());
		mapPage.put("offset", page.getPageAmount());
		List<Manager> managers = managerServiceImpl.getAllManagerNotByPage(mapPage);
		if(managers!=null) {
			mapResult.put("result", managers);
		} else {
			mapResult.put("result", "false");
		}
		return mapResult;
	}
	
	// 提交选择显示的口碑印证
	@RequestMapping("/addShowPraiseSubmit")
	public String addShowPraiseSubmit(Integer[] listId) {
		System.out.println("共选择了" + listId.length);
		if (listId != null && listId.length > 0) {
			for (Integer id : listId) {
				System.out.println("负责人ID:" + id);
				Manager manager = new Manager();
				manager.setId(id);
				manager.setIsPraise("y");
				managerServiceImpl.update(manager);
			}
		}
		return "redirect:/manager/getManagerIsPraise";
	}

	// 取消负责人是口碑印证
	@RequestMapping("/removeIsPraise")
	@ResponseBody
	public Map<String, Object> removeIsPraise(Manager manager) {
		Map<String, Object> map = new HashMap<String, Object>();
		manager.setIsPraise("n");
		System.out.println("取消？");
		int result = managerServiceImpl.update(manager);
		if (result != 0) {
			map.put("result", "true");
		} else {
			map.put("result", "false");
		}
		return map;
	}

	// 获取Manager的ID, 取出该Manager的信息
	@RequestMapping("/updateManagerById/{id}")
	public ModelAndView updateManagerById(@PathVariable("id") Integer id) throws Exception {
		Manager manager = managerServiceImpl.getManagerById(id);
		System.out.println("Manager:" + manager);
		ModelAndView modelAndView = new ModelAndView();
		List<Company> companies = companyServiceImpl.getAllCompanies();
		modelAndView.addObject("manager", manager);
		modelAndView.addObject("companys", companies);
		modelAndView.setViewName("/manager/UpdateManager");
		return modelAndView;
	}

	// 根据Id更新负责人
	@RequestMapping("/updateManagerByIdSubmit/{id}")
	public String updateManagerByIdSubmit(@PathVariable("id") Integer id, Manager manager, HttpServletRequest request)
			throws BomaException {
		manager.setId(id);
		int result = managerServiceImpl.update(manager);
		// if(result==0){
		// throw new BomaException("未知错误, 更新失败!!");
		// } else {
		// System.out.println("已经更新");
		// }
		System.out.println(result);
		if ("y".equals(manager.getIsPraise())) {
			return "redirect:/manager/getManagerIsPraise";
		} else {
			return "redirect:/manager/addShowPraise";
		}
	}
}

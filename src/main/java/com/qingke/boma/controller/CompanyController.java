package com.qingke.boma.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.qingke.boma.exception.BomaException;
import com.qingke.boma.pojo.Company;
import com.qingke.boma.pojo.Logo;
import com.qingke.boma.pojo.Page;
import com.qingke.boma.pojo.Trade;
import com.qingke.boma.service.CompanyService;
import com.qingke.boma.service.TradeService;
import com.qingke.boma.util.Const;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyService companyServiceImpl;
	@Autowired
	private TradeService tradeServiceImpl;
	// 获取所有公司
	@RequestMapping("/getAllCompanies")
	public ModelAndView getAllCompanies() {
		ModelAndView modelAndView = new ModelAndView();
		List<Company> companies = companyServiceImpl.getAllCompanies();
		modelAndView.setViewName("/recruit/addRecruit");
		modelAndView.addObject("companies", companies);
		return modelAndView;
	}

	// 通过公司名称获取公司信息
	@RequestMapping("/getCompanyByName")
	@ResponseBody
	public Map<String, String> getCompanyByName(Company company) {
		Map<String, String> map = new HashMap<>();
		Company c = companyServiceImpl.getCompanyByName(company.getName());
		if (c != null) {
			map.put("result", c.getDescription());
		} else {
			map.put("result", "error");
		}
		return map;
	}
	
	//跳转新增公司页面
		@RequestMapping("/addCompany")
		public ModelAndView addCompany() {
			List<Trade> trades = tradeServiceImpl.getAllTrades();
			List<Company> companies = companyServiceImpl.getAllCompanies();
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("trades", trades);
			modelAndView.addObject("companys", companies);
			modelAndView.setViewName("/company/AddCompany");
			return modelAndView;
		}
		
		//执行新增公司
		@RequestMapping("/addCompanySubmit")
		public String addCompanySubmit(Company company, @RequestParam("file0") MultipartFile multipartFile)
				throws IllegalStateException, IOException {

			System.out.println("公司名:" + company.getName());
			System.out.println("公司简介:" + company.getDescription());
			System.out.println("所属行业ID:" + company.getTrade());
			int result = 0;
			Logo logo = new Logo();
			// logo.setCompany(company);
			// 获取上传的图片的原始名称
			String logoName = multipartFile.getOriginalFilename();
			System.out.println("[DEBUG]图片原始名称:" + logoName);
			if (multipartFile != null && logoName != null && logoName.length() > 0) {
				// 储存图片磁盘位置
				String loadPath = Const.PATH_PIC;

				// 生成新的图片名称
				String newLogoName = UUID.randomUUID() + logoName.substring(logoName.lastIndexOf("."));
				System.out.println("[DEBUG]新的图片名称:" + newLogoName);

				// 生成图片
				File file = new File(loadPath + newLogoName);
				// 将页面上传的图片数据传入图片
				multipartFile.transferTo(file);
				// 将图片路径存入Logo中
				logo.setImg(newLogoName);
			}

			// 将图片设置到company中
			company.setLogo(logo);

			result = companyServiceImpl.insert(company);
			if (result == 0) {
				System.out.println("这里应该抛出异常或者打印添加公司失败信息");
			}
			//String path = multipartFile.getOriginalFilename();
			// 返回至添加成功页面
			return "redirect:/company/showAllCompanies";
		}
		//获取所有公司所能占得页数
		@RequestMapping("/getTotalPage")
		@ResponseBody
		public Map<String, Object> getTotalPage() {
			Map<String, Object> resultMap = new HashMap<>();
			Page pg = new Page();
			// 设置每页显示的条数
			pg.setPageAmount(Const.pageAmount);
			//设置总共条数
			pg.setTotalAmount(companyServiceImpl.countAllCompanies());
			System.out.println("总页数:"+ pg.getTotalPage());
			if(pg.getTotalPage() != null) {
				resultMap.put("result", pg.getTotalPage());
			} else {
				resultMap.put("result", "false");
			}
			return resultMap;
		}
		//获得所有公司(分页AJAX)
		@RequestMapping("/showAllCompaniesAjax")
		@ResponseBody
		public Map<String, Object> showAllCompaniesAjax(Page page) {
			Map<String, Object> resultMap = new HashMap<>();
			// 设置每页显示的条数
			System.out.println(page.getCurrentPage());
			page.setPageAmount(Const.pageAmount);
			// 传参map
			Map<String, Integer> map = new HashMap<>();
			map.put("index", (page.getCurrentPage() - 1) * page.getPageAmount());
			map.put("offSet", page.getPageAmount());
			List<Company> companies = companyServiceImpl.getCompaniesByPage(map);
			if(companies!=null) {
				resultMap.put("result", companies);
			} else {
				resultMap.put("result", "false");
			}
			return resultMap;
		}
		
		// 获得所有公司(分页第一页)
		@RequestMapping("/showAllCompanies")
		public ModelAndView showAllCompanies(HttpServletRequest req) {
			Page page = new Page();
			// 设置每页显示的条数
			page.setPageAmount(Const.pageAmount);
			// 传参map
			Map<String, Integer> map = new HashMap<>();
			map.put("index", 0);
			map.put("offSet", page.getPageAmount());

			ModelAndView modelAndView = new ModelAndView();
			List<Company> companies = companyServiceImpl.getCompaniesByPage(map);
			if (companies != null) {
				System.out.println("当前取到的公司条数:" + companies.size());
				modelAndView.addObject("companies", companies);
				modelAndView.addObject("page", page);
			} else {
				modelAndView.addObject("msg", "数据库尚未保存任何公司信息");
			}
			String msg = (String)req.getAttribute("msg");
			if(msg != null) {
				modelAndView.addObject("msg", msg);
			}
			modelAndView.setViewName("/company/ShowAllCompanies");
			return modelAndView;
		}

		// 根据公司ID获取公司信息
		@RequestMapping("/updateCompany/{id}")
		public ModelAndView updateCompany(@PathVariable("id") Integer id) {
			List<Trade> trades = tradeServiceImpl.getAllTrades();
			Company company = companyServiceImpl.getCompanyById(id);
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("company", company);
			System.out.println(company.getParentCompany());
			modelAndView.addObject("trades", trades);
			List<Company> geCompanies = companyServiceImpl.getAllCompanies();
			List<Company> companies = new ArrayList<>();
			for (Company c : geCompanies) {
				if (c.getId() != id) {
					companies.add(c);
				}
			}
			modelAndView.addObject("companies", companies);
			modelAndView.setViewName("/company/UpdateCompany");
			return modelAndView;
		}

		// 执行更新后上传的公司
		@RequestMapping("/updateCompanySubmit")
		public String updateCompanySubmit(Company company, @RequestParam("file0") MultipartFile multipartFile)
				throws Exception {
			Logo logo = null;
			String updateLogoName = multipartFile.getOriginalFilename();
			if (multipartFile != null && updateLogoName != null && updateLogoName.length() > 0) {
				// 储存图片磁盘位置
				String loadPath = Const.PATH_PIC;
				// 删除之前的图片
				String oldLogoName = company.getLogo().getImg();
				System.out.println("老图片:" + oldLogoName);

				File file = new File(loadPath, oldLogoName);
				System.out.println(file.exists() + ":" + file.getAbsolutePath());
				if (file.exists()) {

					file.delete();
					System.out.println(file.exists());
				}

				// ------------------------------------------------ //
				// 生成新的图片名称
				String newLogoName = UUID.randomUUID() + updateLogoName.substring(updateLogoName.lastIndexOf("."));
				System.out.println("[DEBUG]新的图片名称:" + newLogoName);
				// 生成图片
				file = new File(loadPath + newLogoName);

				System.out.println(file.exists());
				// 将页面上传的图片数据传入图片
				multipartFile.transferTo(file);
				// 将图片路径存入Logo中
				logo = new Logo();
				logo.setImg(newLogoName);
			}
			company.setLogo(logo);
			int result = companyServiceImpl.update(company);
			if (result == 0) {
				throw new BomaException("更新失败, 请重新执行更新操作！！");
			} else {
				return "redirect:/company/showAllCompanies";
			}
		}
		
		// 查重公司名
		@RequestMapping("/checkCompanyName")
		@ResponseBody
		public Map<String, Object> checkCompanyName(Company company) {
			Map<String, Object> mapResult = new HashMap<>();
			company = companyServiceImpl.getCompanyByName(company.getName());
			if(company!=null) {
				mapResult.put("result", "true");
			} else {
				mapResult.put("result", "false");
			}
			return mapResult;
		}

	@RequestMapping("/deleteCompany")
	@ResponseBody
	public Map<String, Object> deleteCompany(Integer id) {
		Map<String, Object> map = new HashMap<>();
		Company company = companyServiceImpl.getCompanyById(id);
		company.setIsCase("n");
		companyServiceImpl.update(company);
		map.put("result", "true");
		return map;
	}

	@RequestMapping("/listcompany/{id}")
	public void listCompany(@PathVariable("id") Integer id, HttpServletResponse response) throws IOException {
		Trade trade = new Trade();
		trade.setId(id);
		List<Company> companies = companyServiceImpl.getUnCaseCompanyByTrade(trade);
		response.setContentType("text/html;charset=utf-8");
		String html = "[";
		for (int i = 0; i < companies.size(); i++) {
			if (i > 0) {
				html += ",";
			}
			Company company = companies.get(i);
			html += "{id:'" + company.getId() + "',name:'" + company.getName() + "',logo:'" + company.getLogo() + "'}";
		}
		html += "]";
		response.getWriter().println(html);
	}

	@RequestMapping("/add")
	@ResponseBody
	public Map<String, Object> addCompany(Integer id) {
		Map<String, Object> map = new HashMap<>();
		Company company = companyServiceImpl.getCompanyById(id);
		company.setIsCase("y");
		companyServiceImpl.update(company);
		map.put("result", "true");
		return map;
	}

}

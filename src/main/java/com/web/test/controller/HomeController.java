package com.web.test.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.test.Service.marketService;
import com.web.test.Vo.Market;
import com.web.test.Vo.TestVo;
import com.web.test.Vo.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	marketService ms;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = { RequestMethod.POST, RequestMethod.GET})
	public String home(Locale locale, Model model) {
		ArrayList<Market> mList = ms.marketSelect4();
		Collections.shuffle(mList);
		model.addAttribute("mList", mList);
		ArrayList<Market> mmList = ms.marketSelect4Point();
		model.addAttribute("mmList", mmList);
		

		return "home";// 폴더에 경로가 생길경우 여기에 /member/index쓰기
	}

	@RequestMapping(value = "/user/login", method = {RequestMethod.POST, RequestMethod.GET })
	public String gologin(Locale locale, Model model) {

		return "user/login";// 폴더에 경로가 생길경우 여기에 /member/index쓰기
	}

	@RequestMapping(value = "goAdmin", method = RequestMethod.GET)
	public String goadmin(HttpSession hs, Model model) {
		String result = "home";
		if (hs.getAttribute("admin") != null) {
			if (hs.getAttribute("admin").equals("y")) {
				result = "AdminPage";
			}
		}
		return result;// 폴더에 경로가 생길경우 여기에 /member/index쓰기
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String userLogout(HttpSession hs) {
		System.out.println("로그아웃?");
		hs.invalidate();
		
		return "redirect:/";// 폴더에 경로가 생길경우 여기에 /member/index쓰기
	}
	@RequestMapping(value = "/marketPageGo", method = RequestMethod.GET)
	public String marketPageGo(HttpSession hs) {
		System.out.println("이동하기?");
		
		return "redirect:market/marketSelectAll";// 폴더에 경로가 생길경우 여기에 /member/index쓰기
	}
	@RequestMapping(value = "/goinsert", method = RequestMethod.GET)
	public String goUserInsert(User u, Model model) {
		System.out.println("들어옴?");
		
		return "user/userInsert";//폴더에 경로가 생길경우 여기에 /member/index쓰기
	}
	@RequestMapping(value = "/testGo", method = RequestMethod.GET)
	public String testGo(User u, Model model) {
		System.out.println("들어옴?");
		
		return "Test";//폴더에 경로가 생길경우 여기에 /member/index쓰기
	}
	@RequestMapping(value = "/test", method = RequestMethod.POST)
	@ResponseBody
	public void test1(@RequestBody TestVo vo) {
		System.out.println(vo);
	}
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	@ResponseBody
	public void test2(TestVo vo) {
		System.out.println(vo);
	}
	@RequestMapping(value = "/test3", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<TestVo> test3() {
		ArrayList<TestVo> list = new ArrayList<>();
		list.add(new TestVo("배고픔","졸림"));
		list.add(new TestVo("배고픔배고픔","졸림졸림"));
		list.add(new TestVo("배고픔배고픔배고픔","졸림졸림졸림"));
		list.add(new TestVo("배고픔배고픔배고픔배고픔","졸림졸림졸림졸림"));
		return list;
	}
	@RequestMapping(value = "/test4", method = RequestMethod.POST)
	@ResponseBody
	public void test4(TestVo vo,MultipartFile upload){
		System.out.println(vo);
		System.out.println(upload.getOriginalFilename());
	}
	
}

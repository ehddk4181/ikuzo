package com.web.test.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.test.Service.userService;
import com.web.test.Vo.User;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	userService us;
	@RequestMapping(value = "/userInsert", method = RequestMethod.POST)
	public String userInsert(User u, Model model) {
		int result = us.userInsert(u);
		
		return "user/login";//폴더에 경로가 생길경우 여기에 /member/index쓰기
	}
	@RequestMapping(value = "/goinsert", method = RequestMethod.GET)
	public String goUserInsert(User u, Model model) {
		System.out.println("들어옴?");
		
		return "user/userInsert";//폴더에 경로가 생길경우 여기에 /member/index쓰기
	}
	@RequestMapping(value = "/login2", method = RequestMethod.GET)
	public String userLogin(User u, Model model,HttpSession hs) {
		User user =us.userLogin(u);
		String result = "user/login";
		if(user!= null){
			result = "redirect:/";
			if(user.getAdmin().equals("y")||user.getAdmin().equals("Y")){
				hs.setAttribute("admin", user.getAdmin());
			}
			System.out.println(u.getUserId());
			model.addAttribute("login","로그인 성공입니다.");
			hs.setAttribute("loginId", u.getUserId());
		}else{
			model.addAttribute("login","0");
		}
		return result;//폴더에 경로가 생길경우 여기에 /member/index쓰기
	}
	
	@RequestMapping(value = "/userSelect", method = RequestMethod.GET)
	public void userSelect(String userId, HttpServletResponse r) {
		System.out.println(userId);
		if(us.userSelect(userId)==null){
			
		}else{
			try {
				r.sendError(404);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		
		
	}
	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public String userUpdate(User u, RedirectAttributes ra) {
		if(us.userUpdate(u)==1){
			System.out.println("정상");
			ra.addFlashAttribute("message", "성공입니다.");
		}else{
			ra.addFlashAttribute("message", "실패입니다.");
			}
		
		return "forward:/";//폴더에 경로가 생길경우 여기에 /member/index쓰기
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String userLogout(HttpSession hs) {
		System.out.println("로그아웃?");
		hs.invalidate();
		return "redirect:/";//폴더에 경로가 생길경우 여기에 /member/index쓰기
	}
	
}

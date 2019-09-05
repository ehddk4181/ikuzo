package com.web.test.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.test.Service.BookService;
import com.web.test.Vo.Book;
import com.web.test.Vo.Market;

@Controller
@RequestMapping(value="/book")
public class BookController {
	@Autowired
	BookService bs;
	@RequestMapping(value = "/bookList", method = { RequestMethod.POST, RequestMethod.GET })
	public String download(String userId, Model m,HttpSession hs) {
		ArrayList<Book> bList = new ArrayList<>();
		bList = bs.bookList((String)hs.getAttribute("loginId"));
		if(!bList.isEmpty()){
		m.addAttribute("bList", bList);
		}
		
		return "book/bookList";
	}
	@RequestMapping(value = "/bookPageOpe", method = { RequestMethod.POST, RequestMethod.GET })
	public String bookPageOpe(int marketSeq,Model m) {
		m.addAttribute("seq", marketSeq);
		return "book/bookPage";
	}
}

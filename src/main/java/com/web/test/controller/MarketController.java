package com.web.test.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.test.Service.BookService;
import com.web.test.Service.marketService;
import com.web.test.Service.reviewService;
import com.web.test.Vo.Book;
import com.web.test.Vo.Market;
import com.web.test.Vo.MarketImg;
import com.web.test.Vo.Menu;
import com.web.test.Vo.Review;
import com.web.test.Vo.SearchKey;
import com.web.test.util.PageNavigator;

@Controller
@RequestMapping("/market")
public class MarketController {
	@Autowired
	marketService ms;
	@Autowired
	reviewService rs;
	@Autowired
	BookService bs;

	@RequestMapping(value = "/marketInsertGo", method = RequestMethod.GET)
	public String marketInsertGo(HttpSession hs) {
		String result = "redirect:/logout";
		if (hs.getAttribute("admin") != null) {
			if (hs.getAttribute("admin").equals("y")) {
				result = "market/marketInsert";
			}
		}

		return result;// 폴더에 경로가 생길경우 여기에 /member/index쓰기
	}

	@RequestMapping(value = "/marketInsert", method = RequestMethod.POST)
	public String marketInsert(RedirectAttributes ra, Market m, MultipartFile marketUploadFile) {
		String result = "market/marketInsert";
		if (ms.marketInsert(m) != 0) {
			ra.addFlashAttribute("message", "입력 완료");
			result = "AdminPage";
		} else {
			ra.addFlashAttribute("message", "등록실패");
		}

		return result;// 폴더에 경로가 생길경우 여기에 /member/index쓰기
	}

	@RequestMapping(value = "/marketSelectAll", method = { RequestMethod.POST, RequestMethod.GET })
	public String marketSelectAll(Model model,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,SearchKey ss) {
		System.out.println("컨트롤러");
		ArrayList<Market> result = null;
		PageNavigator pn = ms.getTotal(currentPage);
		if(ss.getSearchTitle()==null) {
		result = ms.marketSelectAll(pn);
		}else {
			result = ms.marketSearch(pn, ss);
		}
		System.out.println(result);
		if (result != null) {
			model.addAttribute("mList", result);
			model.addAttribute("navi", pn);
		}

		return "market/marketPage";// 폴더에 경로가 생길경우 여기에 /member/index쓰기
	}

	@RequestMapping(value = "/marketSelect", method = { RequestMethod.POST, RequestMethod.GET })
	public String marketSelect(int seq, Model m) {
		Market result = ms.marketSelect(seq);
		
		if (result != null) {
			m.addAttribute("Market", result);
			m.addAttribute("TimeTable", ms.marketTimeTableSelect(seq));
		}
		return "market/marketSelect";// 폴더에 경로가 생길경우 여기에 /member/index쓰기
	}
	
	@RequestMapping(value = "/ReviewInsert", method = { RequestMethod.POST, RequestMethod.GET })
	public String reviewInsert(Review r, Model m) {
		System.out.println(r);
		int result = rs.reviewInsert(r);
		return "redirect:marketSelect?seq=" + r.getMarketSeq();
	}
	@RequestMapping(value = "/reviewShowAll", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public List<Review> reviewShowAll(int marketSeq) {
		List<Review> result = rs.reviewShowAll(marketSeq);
		if(result!=null) {
			System.out.println("성공잼");
		}
		return result;
	}

	@RequestMapping(value = "/marketImgInsert", method = { RequestMethod.POST, RequestMethod.GET })
	public String marketImgInsert(Market m, MultipartFile uploadFile) {
		if(marketImgSelect(m.getMarketSeq()).size()<4) {
			System.out.println(uploadFile);
			int result = ms.marketImgInsert(m, uploadFile);
		}
		return "redirect:marketSelect?seq=" + m.getMarketSeq();// 폴더에 경로가 생길경우
																// 여기에
																// /member/index쓰기
	}

	@RequestMapping(value = "/download", method = { RequestMethod.POST, RequestMethod.GET })
	public void download(int seq, HttpServletResponse hsp) {
		Market m = ms.marketSelect(seq);
		ms.download(m, hsp);
	}
	@RequestMapping(value = "/download2", method = { RequestMethod.POST, RequestMethod.GET })
	public void download2(String fileName, HttpServletResponse hsp) {
		ms.download2(fileName, hsp);
	}
	@RequestMapping(value = "/marketImgSelect", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public List<MarketImg> marketImgSelect(int marketSeq) {
		List<MarketImg> list = ms.marketImgSelect(marketSeq);
		return list;
	}

	@RequestMapping(value = "/marketTimeTableSelect", method = { RequestMethod.POST, RequestMethod.GET })
	public String marketTimeTableSelect(Book b, Model model) {
		System.out.println(b);
		Market m = ms.marketTimeTableSelect(b.getMarketSeq());
		Market m2 = ms.marketSelect(b.getMarketSeq());
		// ArrayList<Book> bList = bs.bookSelect(m.getMarketSeq());
		if (bs.bookCount(b) + b.getPeople() <= m2.getMarketBookLimit()) {
			if (timezone(m, b.getBookTime(), b.getBookDate())) {
				System.out.println("성공");
				if (bs.bookInsert(b) != 0) {
					model.addAttribute("complete", "예약이 완료되었습니다.");
				}else{
					model.addAttribute("message", "예약 실패.");
				}
			} else
				model.addAttribute("message", "영업 시간을 획인 해주세요.");
		} else
			model.addAttribute("message", "인원수를 획인 해주세요.");
		return "/book/bookPage";
	}
	@RequestMapping(value = "/menuInsert", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public void menuInsert(Menu menu) {
		if(ms.menuInsert(menu)!=0) {
			System.out.println("성공잼");
		}
	}
	@RequestMapping(value = "/menuSelect", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public List<Menu> menuSelect(Menu menu) {
		System.out.println(menu);
		List<Menu> result = ms.menuSelect(menu);
		if(result!=null) {
			System.out.println("성공");
		}
		System.out.println(result);
		return result;
	}
	public boolean timezone(Market m, String time, String date) {
		Date breakTime = null;
		Date breakTimeEnd = null;
		Date openTime = null;
		Date closeTime = null;
		Date bookTime = null;
		try {
			breakTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date + " " + m.getBreakTime() + ":00");
			breakTimeEnd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date + " " + m.getBreakTimeEnd() + ":00");
			openTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date + " " + m.getOpen() + ":00");
			System.out.println(openTime.getTime());
			closeTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date + " " + m.getClose() + ":00");
			System.out.println(closeTime.getTime());
			bookTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date + " " + time + ":00");
			if (openTime.getTime() != closeTime.getTime()) {
				if (openTime.getTime() <= bookTime.getTime()
						&& closeTime.getTime() - 3600000 + 60000 >= bookTime.getTime()) {
					if (breakTime.getTime() != breakTimeEnd.getTime()) {
						if (breakTime.getTime() - 1800000 + 60000 <= bookTime.getTime()
								&& breakTimeEnd.getTime() - 60000 >= bookTime.getTime()) {
							return false;
						} else {
							return true;
						}
					} else {
						return true;
					}
				} else {
					return false;
				}
			} else {
				return true;
			}

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}

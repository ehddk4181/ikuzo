package com.web.test.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.web.test.Dao.MarketDao;
import com.web.test.Dao.MarketMapper;
import com.web.test.Vo.Market;
import com.web.test.Vo.MarketImg;
import com.web.test.Vo.Menu;
import com.web.test.Vo.SearchKey;
import com.web.test.util.PageNavigator;

@Service
public class marketService {
	@Autowired
	MarketDao md;

	private final int countPerPage = 10;
	private final int pagePerGroup = 5;

	public int marketInsert(Market m) {
		int result = 0;
		System.out.println(m);
		if (md.marketInsert(m) != 0) {
			if(md.marketTimeTableInsert(m)!=0){
				result = md.marketLocationInsert(m);
			}
		}
		return result;
	}

	public ArrayList<Market> marketSelectAll(PageNavigator pn) {
		System.out.println("사비스");
		return md.marketSelectAll(pn.getStartRecord(), pn.getCountPerPage());
		
	}
	public ArrayList<Market> marketSelect4() {
		return md.marketSelect4();
	}
	public ArrayList<Market> marketSelect4Point() {
		return md.marketSelect4Point();
	}
	public List<Menu> menuSelect(Menu menu){
		return md.menuSelect(menu);
	}

	public Market marketSelect(int seq) {
		return md.marketSelect(seq);
	}

	public PageNavigator getTotal(int currentPage) {
		return new PageNavigator(countPerPage, pagePerGroup, currentPage, md.getTotal());
	}
	public ArrayList<Market> marketSearch(PageNavigator pn,SearchKey ss) {
		System.out.println("사비스");
		return md.marketSearch(ss,pn.getStartRecord(), pn.getCountPerPage());
		
	}

	public int marketImgInsert(Market m, MultipartFile mFile) {
		System.out.println("SS");
		if (mFile != null) {
			if (!mFile.isEmpty()) {
				String fileName = mFile.getOriginalFilename();
				String savedName = UUID.randomUUID().toString();
				try {
					mFile.transferTo(new File("C:/test/"+savedName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				m.setFileName(fileName);
				m.setSavedName(savedName);
			}
		}
		return md.marketImgInsert(m);

	}
	public Market marketTimeTableSelect(int seq) {
		return md.marketTimeTableSelect(seq);
	}

	public void download(Market m, HttpServletResponse hsp) {
		System.out.println(m.getSavedName());
		File file = new File("C:/test/" + m.getSavedName());
		String fileName = m.getFileName();
		try {
			hsp.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
			// 헤더셋팅,응답의 종류 //응답의 대한 파일처리 , 응답에 대한 파일처리 , 저장하는 이름 지정
			hsp.setContentLength((int) file.length());// 저장하기 . 용량 맞춰주기
			FileCopyUtils.copy(new FileInputStream(file), hsp.getOutputStream());
			// Spring 클래스파일 서버에 저장된 파일 읽기 사용자의 컴퓨터에 저장시킨다.
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void download2(String FileName, HttpServletResponse hsp) {

		File file = new File("C:/test/" + FileName);
		try {
			hsp.setHeader("Content-Disposition", "attachment;filename=");
			// 헤더셋팅,응답의 종류 //응답의 대한 파일처리 , 응답에 대한 파일처리 , 저장하는 이름 지정
			hsp.setContentLength((int) file.length());// 저장하기 . 용량 맞춰주기
			FileCopyUtils.copy(new FileInputStream(file), hsp.getOutputStream());
			// Spring 클래스파일 서버에 저장된 파일 읽기 사용자의 컴퓨터에 저장시킨다.
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int menuInsert(Menu menu) {
		System.out.println("사비스"+menu);
		return md.menuInsert(menu);
	}
	public List<MarketImg> marketImgSelect(int marketSeq){
		return md.marketImgSelect(marketSeq);
	}
	// public void download(Market m,HttpServletResponse hsp) {
	// File file = new File("C:/test/"+m.getSavedName());
	// String fileName = m.getFileName();
	// try {
	// hsp.setHeader("Content-Disposition", "inline");
	// hsp.setHeader("Content-Type", "text/html;charset=UTF-8");
	// PrintWriter p = hsp.getWriter();
	// p.write("<h1>직접작성한파일<h1>");
	// p.close();
	//
	//
	// } catch (Exception e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	//
	// }
}

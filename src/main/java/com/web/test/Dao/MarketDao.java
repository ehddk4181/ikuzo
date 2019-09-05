package com.web.test.Dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.test.Vo.Market;
import com.web.test.Vo.MarketImg;
import com.web.test.Vo.Menu;
import com.web.test.Vo.SearchKey;

@Repository
public class MarketDao {
	@Autowired
	SqlSession s;
	
	public int marketInsert(Market m){
		MarketMapper mm = s.getMapper(MarketMapper.class);
		return mm.marketInsert(m);
	}
	public int marketTimeTableInsert(Market m){
		MarketMapper mm = s.getMapper(MarketMapper.class);
		return mm.marketTimeTableInsert(m);
	}
	public int marketLocationInsert(Market m){
		MarketMapper mm = s.getMapper(MarketMapper.class);
		return mm.marketLocationInsert(m);
	}
	
	public ArrayList<Market> marketSelectAll(int start,int count){
		MarketMapper mm = s.getMapper(MarketMapper.class);
		
		RowBounds rb = new RowBounds(start,count);
		return mm.marketSelectAll(rb);
	}
	public ArrayList<Market> marketSelect4(){
		MarketMapper mm = s.getMapper(MarketMapper.class);
		
		return mm.marketSelect4();
	}
	public ArrayList<Market> marketSelect4Point(){
		MarketMapper mm = s.getMapper(MarketMapper.class);
		
		return mm.marketSelect4Point();
	}
	public List<MarketImg> marketImgSelect(int marketSeq){
		MarketMapper mm = s.getMapper(MarketMapper.class);
		return mm.marketImgSelect(marketSeq);
	}
	public Market marketSelect(int seq){
		MarketMapper mm = s.getMapper(MarketMapper.class);
		return mm.marketSelect(seq);
	}
	public int marketPointSet(int seq){
		MarketMapper mm = s.getMapper(MarketMapper.class);
		return mm.marketPointSet(seq);
	}
	public int getTotal(){
		MarketMapper mm = s.getMapper(MarketMapper.class);
		return mm.getTotal();
	}
	
	public int marketImgInsert(Market m){
		MarketMapper mm = s.getMapper(MarketMapper.class);
		return mm.marketImgInsert(m);
	}
	public Market marketTimeTableSelect(int seq){
		MarketMapper mm = s.getMapper(MarketMapper.class);
		return mm.marketTimeTableSelect(seq);
	}
	public int menuInsert(Menu menu){	
		menuMapper mm = s.getMapper(menuMapper.class);
		return mm.menuInsertmenu(menu);
	}
	public List<Menu> menuSelect(Menu menu){
		menuMapper mm = s.getMapper(menuMapper.class);
		return mm.menuSelect(menu);
	}
	public ArrayList<Market> marketSearch(SearchKey ss,int start,int count){
		MarketMapper mm = s.getMapper(MarketMapper.class);
		RowBounds rb = new RowBounds(start,count);
		return mm.marketSearch(ss,rb);
	}
}

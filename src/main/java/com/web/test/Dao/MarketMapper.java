package com.web.test.Dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.web.test.Vo.Market;
import com.web.test.Vo.MarketImg;
import com.web.test.Vo.Menu;
import com.web.test.Vo.SearchKey;

public interface MarketMapper {
	
	public int marketInsert(Market m);
	public int marketTimeTableInsert(Market m);
	public int marketLocationInsert(Market m);
	
	public ArrayList<Market> marketSelectAll(RowBounds rb);
	public ArrayList<Market> marketSelect4();
	public ArrayList<Market> marketSelect4Point();
	
	public ArrayList<Market> marketSearch(SearchKey s,RowBounds rb);
	
	public List<MarketImg> marketImgSelect(int marketSeq);
	
	public Market marketSelect(int seq);
	
	public int marketPointSet(int seq);
	
	public int getTotal();
	
	public int marketImgInsert(Market m);
	
	public Market marketTimeTableSelect(int seq);
	
	public int menuInsert(Menu menu);
}

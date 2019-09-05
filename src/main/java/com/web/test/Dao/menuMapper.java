package com.web.test.Dao;

import java.util.List;

import com.web.test.Vo.Menu;

public interface menuMapper {
	
	public int menuInsertmenu(Menu menu);
	public List<Menu> menuSelect(Menu menu);
}

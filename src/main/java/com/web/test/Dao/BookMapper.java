package com.web.test.Dao;

import java.util.ArrayList;

import com.web.test.Vo.Book;
import com.web.test.Vo.SearchBook;

public interface BookMapper {
	
	public int bookInsert(Book b);
	
	public ArrayList<Book> bookSelect(int seq);
	
	public String bookCount(Book seq);
	
	public ArrayList<Book> bookList(String userId);
}

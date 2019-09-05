package com.web.test.Dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.test.Vo.Book;
import com.web.test.Vo.SearchBook;

@Repository
public class BookDao {
	@Autowired
	SqlSession ss;
	
	public int bookInsert(Book b){
		BookMapper bm = ss.getMapper(BookMapper.class);
		return bm.bookInsert(b);
	}
	public ArrayList<Book> bookSelect(int seq){
		BookMapper bm = ss.getMapper(BookMapper.class);
		return bm.bookSelect(seq);
	}
	public int bookCount(Book seq){
		BookMapper bm = ss.getMapper(BookMapper.class);
		String result = bm.bookCount(seq);
		if(result == null){ return 0 ;}
		else{ return Integer.parseInt(result);}
	}
	public ArrayList<Book> bookList(String userId){
		BookMapper bm = ss.getMapper(BookMapper.class);
		return bm.bookList(userId);
	}
	
}

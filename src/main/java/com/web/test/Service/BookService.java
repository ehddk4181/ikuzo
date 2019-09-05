package com.web.test.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.test.Dao.BookDao;
import com.web.test.Vo.Book;
import com.web.test.Vo.SearchBook;

@Service
public class BookService {
	@Autowired
	BookDao bd;
	
	public int bookInsert(Book b){
		System.out.println(b);
		return bd.bookInsert(b); 
	}
	
	public ArrayList<Book> bookSelect(int seq){
		return bd.bookSelect(seq);
	}
	public int bookCount(Book seq){
		return bd.bookCount(seq);
	}
	public ArrayList<Book> bookList(String userId){
		return bd.bookList(userId);
	}

}

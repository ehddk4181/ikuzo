package com.web.test.Dao;

import java.util.List;

import com.web.test.Vo.Review;

public interface ReviewMapper {
	
	public int reviewInsert(Review r);
	
	public List<Review> reviewShowAll(int marketSeq);
}

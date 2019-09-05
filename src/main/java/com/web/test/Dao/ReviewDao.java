package com.web.test.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.test.Vo.Review;

@Repository
public class ReviewDao {
	@Autowired
	SqlSession s;
	
	public int reviewInsert(Review m){
		ReviewMapper rm = s.getMapper(ReviewMapper.class);
		return rm.reviewInsert(m);
	}
	public List<Review> reviewShowAll(int marketSeq){
		ReviewMapper rm = s.getMapper(ReviewMapper.class);
		return rm.reviewShowAll(marketSeq);
	}
}

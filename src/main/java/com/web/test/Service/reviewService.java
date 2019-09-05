package com.web.test.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.test.Dao.MarketDao;
import com.web.test.Dao.ReviewDao;
import com.web.test.Vo.Review;

@Service
public class reviewService {
	@Autowired
	MarketDao md;
	@Autowired
	ReviewDao rd;
	public int reviewInsert(Review r){
		int result = 0;
		if(rd.reviewInsert(r)!=0){
			result=md.marketPointSet(r.getMarketSeq());
			System.out.println("최종"+result);
		}
		return result;
	}
	public List<Review> reviewShowAll(int marketSeq){
		return rd.reviewShowAll(marketSeq);
	}
}

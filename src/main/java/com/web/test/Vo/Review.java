package com.web.test.Vo;

import lombok.Data;

@Data
public class Review {
	private String userId,reviewTitle,reviewContent;
	private int marketSeq,reviewSeq,reviewPoint;
}

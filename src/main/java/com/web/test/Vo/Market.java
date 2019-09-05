package com.web.test.Vo;

import lombok.Data;

@Data
public class Market {
	private int marketSeq,locationNumber,marketHit;
	private String marketName,marketTitle,marketContent,marketKind,indate;
	private double marketPoint;
	private String open,close,rest,breakTime,breakTimeEnd;
	private String fileName,savedName;
	private int marketBookLimit;
	private String lat,lng;
}

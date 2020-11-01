package com.qman.www.board;


import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.gson.JsonObject;
import com.qman.www.common.code.CommonCode;
import com.qman.www.common.code.ResultCode;


@Service
public class BoardService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private BoardDAO boardDAO;

	
	public JsonObject writeAction(JsonObject returnObj,BoardVO boardVO) {
		try {
			boardDAO.writeAction(boardVO);
			ResultCode.setSuccessCode(returnObj);
		}catch(Exception e) {
			ResultCode.setResultCode(returnObj,CommonCode.ERROR_OTHER);
			e.getStackTrace();
		}
		return returnObj;
	}
	
	
	public Integer getBoardMaxCnt() {
		int maxCnt = 0;
		try {
			maxCnt = boardDAO.getBoardMaxCnt();
			//ResultCode.setSuccessCode(returnObj);
		}catch(Exception e) {
			//ResultCode.setResultCode(returnObj,CommonCode.ERROR_OTHER);
			e.getStackTrace();
		}
		return maxCnt;
	}
	
	public List<Object> getBoardList(BoardVO boardVO) {
		List<Object> boardList = new ArrayList<Object>();;
		try {
			//ResultCode.setSuccessCode(returnObj);
			boardList = boardDAO.getBoardList(boardVO);
		}catch(Exception e) {
			//ResultCode.setResultCode(returnObj,CommonCode.ERROR_OTHER);
			e.getStackTrace();
		}
		return boardList;
	}
	
}

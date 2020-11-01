package com.qman.www.common.code;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

public class ResultCode {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	public static void setSuccessCode(JsonObject returnObj){
		returnObj.addProperty("resultCode", CommonCode.SUCCESS_NORMAL.getCode());
		returnObj.addProperty("resultMessage", CommonCode.SUCCESS_NORMAL.getMessage());
	}
	
	public static void setResultCode(JsonObject returnObj,CommonCode commonCode){
		returnObj.addProperty("resultCode", commonCode.getCode());
		returnObj.addProperty("resultMessage", commonCode.getMessage());
	}
}
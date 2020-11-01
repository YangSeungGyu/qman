package com.qman.www.sample;

import java.lang.reflect.Method;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonObject;
import com.qman.www.common.code.CommonCode;
import com.qman.www.common.code.ResultCode;


@Service
public class SampleService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SampleDAO sampleDAO;

	@Transactional
	public String DbTest() {
		return sampleDAO.DbTest();
	}
	
	public SampleVO getAutoVo(String colNm) {
		SampleVO autoVo = null;
		try {
			Class<SampleVO> cls = SampleVO.class;
			Object obj = cls.newInstance();
			String UpperCh = colNm.substring(0, 1).toUpperCase() + colNm.substring(1);
			String methodNm = "set" + UpperCh;
			Method method = cls.getDeclaredMethod(methodNm, Integer.TYPE);
			method.invoke(obj, 1);
			autoVo = (SampleVO) obj;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return autoVo;
		
	}
	
	
	public JsonObject sampleService(JsonObject returnObj) {
		try {
			
			ResultCode.setSuccessCode(returnObj);
		}catch(Exception e) {
			ResultCode.setResultCode(returnObj,CommonCode.ERROR_OTHER);
			e.getStackTrace();
		}
		return returnObj;
	}
}

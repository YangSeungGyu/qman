package com.qman.www.board;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@Autowired 
	private SqlSessionTemplate sqlSession;
	

	public void writeAction(BoardVO boardVO) throws Exception {
		sqlSession.insert("writeAction", boardVO);
	}
	
	public Integer getBoardMaxCnt() throws Exception {
		return sqlSession.selectOne("getBoardMaxCnt");
	}
	
	public List<Object> getBoardList(BoardVO boardVO) throws Exception {
		return sqlSession.selectList("getBoardList",boardVO);
	}
	
}

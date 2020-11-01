package com.qman.www.board;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.qman.www.common.code.CommonCode;
import com.qman.www.common.code.ResultCode;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping(value = "/board/write.view", method = RequestMethod.GET)
	public String write() {
		return "board/write";
	}

	@RequestMapping(value = "/board/writeAction.ins", method = RequestMethod.POST)
	@ResponseBody
	public JsonObject writeAction(BoardVO boardVO) {
		JsonObject returnObj = new JsonObject();
		
		boardService.writeAction(returnObj,boardVO);
		
		return returnObj;
	}
	
	@RequestMapping(value = "/board/list.view", method = RequestMethod.GET)
	@ResponseBody
	public String list(BoardVO boardVO,Model model) {
		int crntPage = 1;
		if(boardVO.getCrntPage() != 0){
			crntPage = boardVO.getCrntPage(); 
		}
		
		int maxRow = 10;
		double maxPage = 5.0;
		int maxRowCnt = boardService.getBoardMaxCnt();
		int maxPageCnt = (int)Math.ceil(maxRowCnt/(double)maxRow);
		
		int firstRow = ((crntPage * maxRow)-maxRow)+1;  
		int lastRow = ((crntPage * maxRow)); 
		
		boolean isPrewPage = false;
		boolean isNextPage = false;
		int firstPage = (int)(Math.ceil(crntPage/(maxPage))*maxPage-maxPage)+1;
		int lastPage = (int)(Math.ceil(crntPage/(maxPage))*maxPage);
		if(lastPage>maxPageCnt){
			lastPage = maxPageCnt;
		}
		if(firstPage != 1){
			isPrewPage = true;
		}
		if(lastPage!=maxPageCnt){
			isNextPage = true;
		}
		
		BoardVO param = new BoardVO();
		
		param.setFirstRow(firstRow);
		param.setLastRow(lastRow);
		param.setFirstPage(firstPage);
		param.setLastPage(lastPage);
		param.setIsPrewPage(isPrewPage);
		param.setIsNextPage(isNextPage);
		param.setMaxPageCnt(maxPageCnt);
		
		List<Object> boardList = boardService.getBoardList(param);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageInfo", param);
		
		
		//List<Object> simpleBoardList = simpleBoardService.list(param);
		return "board/list";
	}
	

}

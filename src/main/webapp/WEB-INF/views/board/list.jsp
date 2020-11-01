<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/tld/CommonTaglibrary.tld" prefix="cmm"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false" %>
<html>
<head>
	<title>Test</title>
	<link rel="stylesheet" href="${CONTEXT_PATH}/resources/css/common.css?ver=${nowDate}" media="screen, print">
	<script src="${CONTEXT_PATH}/resources/js/common.js"></script>
	<script src="${CONTEXT_PATH}/resources/js/jquery-3.2.1.min.js"></script>
	
	<style>
		.boardPageDiv{
			text-align : center;
		}
		.boardDiv{
			display: inline-block;
			width: 800px;
		}
		.boardTb {
			border-collapse: collapse;
			width: 800px;
			text-align: center;
		}
		.boardTb caption {
			font-weight: bold;
			color: #22741C;
		}
		.boardTb thead {
			background-color: #F2FFED; 
		}	
		.boardTb thead tr{
			border-top: 2px solid #74D36D;
			border-bottom: 2px solid #74D36D;
		}
		.boardTb tbody tr{
			border-bottom: 1px solid #BDBDBD;
		}
		.boardTb .noTh{
			width: 50px;
		}
		.boardTb .titleTh, .titleTd{
			width: 450px;
			vertical-align: middle;
		}
		.boardTb  .titleTd{
			text-align: left;
		}
		.boardTb .titleTd div{
			position: relative;
			display : inline-block;
			max-width : 350px;
			text-overflow : ellipsis;
			white-space: nowrap;
			overflow: hidden;
		}
		.boardTb .titleTd span{
			color: red;
		}
		.boardTb .writerTh, .writerTd{
			width: 100px;
			text-overflow : ellipsis;
			white-space: nowrap;
			overflow: hidden;
		}
		.boardTb .dtTh, .dtTd{
			width: 100px;
		}
		.boardTb .cntTh, .cntTd{
			width: 100px;
		}
		.btDiv{
			display: inline-block;
			width: 800px;
			text-align: right;
		}
		.boardTb a{
			color: black;
			text-decoration: none; 
		}
		.boardTb a:hover {
			text-decoration: underline; 
		}
	</style>
</head>
<body>
<div class="boardPageDiv">

	<div class="boardDiv">
		<table class="boardTb">
			<caption> 기본 게시판 </caption>
			<thead>
				<tr>
					<th class="noTh" >NO</th>
					<th class="titleTh">제 목</th>
					<th class="writerTh">작성자</th>
					<th class="dtTh">작성일</th>
				</tr>
			</thead>
			<tbody>
			 <c:if test="${not empty boardList}">
				<c:forEach var="list" items="${boardList}" varStatus="status">
					<tr>
						<td  class="noTd">
							${list.no}
						</td>
						<td  class="titleTd">
						 	<div>
								<a href="/board/board/read.do?no=${list.no}" >${list.title}</a>
							</div>
						</td>
						<td class="writerTd">
							${list.name}
						</td>
						<td class="dtTd">
							${list.upDt}
						</td>
					</tr>
				</c:forEach>	
			</c:if>
			</tbody>
		</table>
	</div>
	<div class="pageDiv">
	 	<c:if test="${pageInfo.isPrewPage == true}">
			<a href="/board/list.view?crntPage=1"><<</a>&nbsp;
			<a href="/board/list.view?crntPage=${pageInfo.firstPage-1}"></a>&nbsp;
		</c:if>
		<span id="pageSp">
		 </span>
		 <c:if test="${pageInfo.isNextPage == true}">
			 &nbsp;<a href="/board/list.view?crntPage=${pageInfo.lastPage+1}">></a>
			 &nbsp;<a href="/board/list.view?crntPage=${pageInfo.maxPageCnt}">>></a>
		 </c:if>
	</div>
	<div class="btDiv">
		<input type="button" value="글쓰기" onclick="writeBorad();">
	</div>
 </div>
</body>
<script>
	$(document).ready(function(){
		var firstPage = ${pageInfo.firstPage};
		var lastPage = ${pageInfo.lastPage};
		var pageSp= $("#pageSp");
		var pageTags="";
		for(var i=firstPage ;i <= lastPage; i++){
			var tagA = "<a href='/board/list.do?crntPage="+i+"'>"+i+"<a/>&nbsp;";
			pageTags = pageTags + tagA;
			pageSp.html(pageTags);
		}
	});

	function writeBorad(){
		location.href="/board/write.view";
	}
</script>
</html>

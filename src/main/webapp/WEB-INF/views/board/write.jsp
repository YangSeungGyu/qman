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
	.simpleBoardPageDiv{
		text-align : center;
	}
	.writeDiv{
		margin-top : 10px;
		display: inline-block;
		width: 800px;
		padding: 0 0 0 0;
	}
	.writeTb{
		border-collapse: collapse;
		width: 800px;
	}
	
	.titleTr {
		border-top: 2px solid #BDBDBD;
		background-color: #F2FFED;
	}
	.contensTr{
		border-bottom: 2px solid #BDBDBD;
		background-color: #F2FFED;
	}
	
	.titleTh{
		width: 50px;
	}
	
	.title{
		width: 700px;;
	}
	
	.contents{
		width: 100%;
		padding: 0 0 0 0;
		border-left: 0px;
		border-right: 0px; 
		text-align: left;
		
	}
	
	
	.btDiv{
		display: inline-block;
		width: 800px;
	}
	.btDivLeft{
		display: inline-block;
		width: 45%;
		text-align: left;
	}
	
	.btDivRight{
		display: inline-block;
		width: 45%;
		text-align: right;
	}
</style>
</head>
<body>
	<div class="simpleBoardPageDiv">

<form id="writeForm"  name="writeForm" method="post" action="/board/simpleBoard/writeAction.do">
	<div class="writeDiv">
		<table class="writeTb">
			<tbody>
			<tr class="titleTr">
				<th class="titleTh">제목 : </th>
				<td><input class="title" id="title" name="title" type="text" maxlength="30"></td>
			</tr>
			<tr class="titleTr">
				<th class="titleTh">이름 : </th>
				<td><input  id="name" name="name" type="name"></td>
			</tr>
			<tr class="contensTr">
				<td colspan="2">
				<textarea class="contents" name="contents" id="contents" rows="20"></textarea>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
</form>
	<div class="btDiv">
		<div class="btDivLeft" >
			<input type="button" value="목록" onclick="javascript:void(0);">
		</div>
		<div class="btDivRight" >
			<input type="button" value="취소" onclick="javascript:history.back();">
			<input type="button" value="작성" onclick="writeAction();">
		</div>
	</div>
 </div>
</body>

<script>

	
	function writeAction(){
		var frm = document.writeForm;
		if($("#title").val()==""){
			alert("제목을 입력 해 주세요");
			return;
		}
		if($("#name").val()==""){
			alert("이름을 입력 해 주세요");
			return;
		}
		if( $("#contents").val()==""){
			alert("내용을 입력 해 주세요");
			return;
		}else{
			//textarea 줄바꿈 처리
			var beStr = $("#contents").val();
			var afStr = strReplace($("#contents").val(),'\n','<BR/>');
			$("#contents").val(afStr);
		}
		
		var param = $("#writeForm").serialize();
		$.ajax({
			url : '/board/writeAction.ins',
			data : param,
			async: true,
			type: 'POST',
			success : function(data) {
				console.log(data);
				if(data.resultCode == 'S001'){
					alert("입력되었습니다.")
					location.reload();
				}else{
					alert("입력실패 code:" + data.resultCode+"\n message :"+data.resultMessage);
					
				}
			}
		});
	}
	
	function strReplace(subject, search, replace) {
	    return subject.split(search).join(replace);
	};

</script>
</html>

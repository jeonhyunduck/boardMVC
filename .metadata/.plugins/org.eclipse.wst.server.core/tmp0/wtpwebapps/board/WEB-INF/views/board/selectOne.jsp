<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>상세정보</title>
</head>
<body>
	<div style = "width : 80%; margin:0 auto;">
		
		<table style = "width: 100%; border:1px solid #000;">
			<tr>
				<th style = "width:120px">제목</th>
				<td style = "width:calc(100% - 120px)">					
					${data.boardTitle}
				</td>
			</tr>
			<tr>
				<th>등록자</th>
				<td>${data.createUser}</td>
			</tr>
			<tr>
				<th>수정자</th>
				<td>${data.updateUser}</td>
			</tr>	
			<tr>
				<th>내용</th>
				<td>${data.boardContents}</td>
				
			</tr>
			
		</table>
		<br>
		
		<button style="float:right" onclick = "update()">수정</button>
		<button style="float:right" onclick = "delete_action()">삭제</button>
		<button style="float:right" onclick = "goSelectList()">목록으로</button>
	</div> 
</body>
<script>
	
	function goSelectList(){		
		window.location.href = "/selectList";
	}
	function delete_action(){
		var boardId = "${data.boardId}";
		window.location.href = "/delete_action?board_Id=" + boardId;				
	}
	function update(){
		var boardId = "${data.boardId}";
		window.location.href = "/update?board_Id=" + boardId;
	}
</script>
</html>
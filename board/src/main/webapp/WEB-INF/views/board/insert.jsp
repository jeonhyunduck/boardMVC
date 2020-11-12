<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>게시판 등록 화면</title>
</head>
<body>
	<div style="width:80%; margin:0 auto;">
		<table style = "width:80%; border:1px solid #000;">
			<tr>
				<th style="width:120px">제목</th>
				<td style="witdh:calc(100% - 120px)">
					<input type="text" style="width:100%" id ="board_title">
				</td>
			</tr>
			<tr>
				<th>등록자</th>
				<td>
					<input type="text" style="width:100%" id="create_user">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" style="width:100%" id="board_contents"></textarea>
				</td>
			</tr>
			
		</table>
		<br>
		<button style="float:right" onclick = "insert()">등록</button>
		<button style="float:right" onclick = "goSelectList()">취소</button>
	</div>
</body>
<script>
	function goSelectList() {
		window.location.href = "/selectList";
	}
	function insert(){
		var board_title = document.getElementById("board_title").value;
		var create_user = document.getElementById("create_user").value;
		var board_contents = document.getElementById("board_contents").value;
		
		/* console.log("타이틀" + board_title);
		console.log("유저"+create_user);
		console.log("내용"+ board_contents); */
		
		window.location.href = 
				"/insert_action?" +
				"board_title=" + board_title +
				"&create_user=" + create_user +
				"&board_contents=" + board_contents;
	}
</script>
</html>
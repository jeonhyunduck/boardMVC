<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<div style="width: 80%; margin: 0 auto;">
		<input type="text" placeholder="검색값 입력" id="search_keyword">
	<button onclick="search()">검색</button>
		<table style="width: 100%; border: 1px solid #000;">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
			<c:forEach var="data" items="${list}">
				<!-- forEach == for문 -->

				<!-- 데이터 표출 -->
				<tr>
					<th>${data.boardId}</th>
					<th><a href="/selectOne?board_Id=${data.boardId}">${data.boardTitle}</a></th>
					<th>${data.createUser}</th>
				</tr>
				<!-- 데이터 표출 -->
         	
         	</c:forEach>

		</table>

		<button style="float: right" onclick="insertList()">등록하러가기</button>
	</div>
</body>
<script>
	
	function insertList() {
		window.location.href = "/insert";
	}
	
	function search(){
		var keyword = document.getElementById("search_keyword").value;
		window.location.href = "/selectList?keyword="+keyword;
		
	}
</script>

</html>
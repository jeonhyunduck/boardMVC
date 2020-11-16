<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>상세정보</title>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
	<div style = "width : 80%; margin:0 auto;" id="vueCtrl">
		
		<table style = "width: 100%; border:1px solid #000;">
			<tr>
				<th style = "width:120px">제목</th>
				<td style = "width:calc(100% - 120px)">					
					{{boardTitle}}
				</td>
			</tr>
			<tr>
				<th>등록자</th>
				<td>{{createUser}}</td>
			</tr>
			<tr>
				<th>수정자</th>
				<td>{{updateUser}}</td>
			</tr>	
			<tr>
				<th>내용</th>
				<td>{{boardContents}}</td>
				
			</tr>
			
		</table>
		<br>
		
		<button style="float:right" v-on:click="update">수정</button>
		<button style="float:right" v-on:click="delete_action">삭제</button>
		<button style="float:right" v-on:click="goSelectList">목록으로</button>
	</div> 
</body>
<script>
	 
	var vm = new Vue({
		el : "#vueCtrl",
		data : {
			boardId : "${data.boardId}",
			boardTitle :  "${data.boardTitle}",
			createUser :  "${data.createUser}",
			updateUser :  "${data.updateUser}",
			boardContents : "${data.boardContents}"
		},
		methods: {
			update : function(){
				// var boardId = "${data.boardId}";
				window.location.href = "/update?board_Id=" + this.boardId;
			},
			delete_action : function(){
				// var boardId = "${data.boardId}";
				window.location.href = "/delete_action?board_Id=" + this.boardId;
			},
			goSelectList : function(){
				window.location.href = "/selectList";
			}
		}
	});
	// function goSelectList(){		
	// 	window.location.href = "/selectList";
	// }
	// function delete_action(){
	// 	var boardId = "${data.boardId}";
	// 	window.location.href = "/delete_action?board_Id=" + boardId;				
	// }
	// function update(){
	// 	var boardId = "${data.boardId}";
	// 	window.location.href = "/update?board_Id=" + boardId;
	// }
</script>
</html>
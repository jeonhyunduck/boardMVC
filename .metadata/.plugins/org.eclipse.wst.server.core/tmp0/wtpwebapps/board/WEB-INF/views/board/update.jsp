<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">	
	<title>수정 페이지</title>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
	<div style="width:80%; margin : 0 auto;" id="vueCtrl">
		<table style="width: 100%; border:1px solid #000;">
			<tr>
				<th style="width:120px">제목</th>
				<td style="width:calc(100% - 120px)">
					<input id="board_title" type="text" style="width : 100%" v-bind:value="board_title">
				</td>
			</tr>
			<tr>
				<th>등록자</th>
				<td>{{createUser}}</td>
				<!-- <td>${data.createUser}</td> -->
			</tr>
			<tr>
				<th>수정자</th>
				<td>
					<input id="update_user" type="text" style="width : 100%">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<!-- <textarea id = "board_contents" rows="5">${data.boardContents}</textarea> -->
					<textarea id="board_contents" rows="5">{{boardContents}}</textarea>
				</td>
			</tr>
		</table>
		<br>
		<button style="float:right" v-on:click="update_action">수정</button>
		<button style="float:right" v-on:click="goSelectOne">취소</button>
		<button style="float:right" v-on:click="goSelectList">목록으로</button>
	</div>
</body>
<script>

	var vm  = new Vue({
		el : '#vueCtrl',
		data : {
			board_id : "${data.boardId}",
			board_title : "${data.boardTitle}",
			createUser : "${data.createUser}",
			boardContents : "${data.boardContents}"
		},
		methods: {
			update_action : function(){
				var board_title = document.getElementById("board_title").value;
				var update_user = document.getElementById("update_user").value;
				var board_contents = document.getElementById("board_contents").value;
				window.location.href = "/update_action?"
					+ "boardTitle=" + board_title
					+ "&updateUser=" + update_user
					+ "&boardContents=" + board_contents
					+ "&boardId=" + this.board_id;
			},
			goSelectOne : function(){
				window.location.href = "/selectOne?board_Id=" + this.board_id;
			},
			goSelectList : function(){
				window.location.href = "/selectList";
			}
		}
	});
	// function update_action(){
	// 	var board_id = "${data.boardId}";
	// 	var board_title = document.getElementById("board_title").value;
	// 	var update_user = document.getElementById("update_user").value;
	// 	var board_contents = document.getElementById("board_contents").value;
		
	// 	window.location.href = "/update_action?"
	// 			+ "boardTitle=" + board_title
	// 			+ "&updateUser=" + update_user
	// 			+ "&boardContents=" + board_contents
	// 			+ "&boardId=" + board_id;
							
	// }
	// function goSelectOne() {
	// 	var board_id = "${data.boardId}"
	// 	window.location.href = "/selectOne?board_Id=" + board_id;
	// }
	// function goSelectList() {
	// 	window.location.href = "/selectList";
	// }
</script>
</html>
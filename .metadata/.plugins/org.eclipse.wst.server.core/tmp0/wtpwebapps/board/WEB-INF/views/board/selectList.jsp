<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>

<body>
    <div style="width: 80%; margin: 0 auto;" id="vueCtrl">
        <input type="text" placeholder="검색값 입력" id="search_keyword">
        <button v-on:click ="search">검색</button>
        <table style="width: 100%; border: 1px solid #000;">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
            </tr>                      
            <tr v-for="contact in list">
                <th>{{contact.boardId}}</th>
                <!-- <th><a href="#" v-on:click="goSelectOne(contact.boardId)">{{contact.boardTitle}}</a></th> -->
                <th><a v-bind:href="goSelectOne(contact.boardId)">{{contact.boardTitle}}</a></th>
                <th>{{contact.createUser}}</th>
            </tr>
            
        </table>
        <div style="display:block; text-align : center;">
            <!-- jstl기준 -->
            <!-- <c:if test="${paging.startPage != 1 }">
                <a href="/selectList?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}">&lt;</a>
            </c:if> -->
            <!-- <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
                <c:choose>
                    <c:when test="${p == paging.nowPage}">
                        <b>${p}</b>
                    </c:when>
                    <c:when test="${p != paging.nowPage}">
                        <a href="/selectList?nowPage=${p}&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}">${p}</a>
                    </c:when>
                </c:choose>
            </c:forEach> -->
            
            <!-- <c:if test="${paging.endPage != paging.lastPage}">
                <a href="/selectList?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}">&gt;</a>
            </c:if> -->
            <!-- vue.js  기준-->
            <a v-if="(startPage != 1)" href="#" v-on:click="leftArrowBtn">&lt;</a>
            <template v-for="p in range(startPage, endPage)">
                <b v-if="(p == nowPage)">{{p}}</b>
                <a v-else-if="(p != nowPage)" href = "#" v-on:click="paingNumBtn(p)">{{p}}</a>
                <b> </b>
            </template>
            <a v-if="(endPage -1 != lastPage)" href="#" v-on:click="rightArrowBtn">&gt;</a>

        </div>
        <button style="float: right" v-on:click="insertList">등록하러가기</button>
    </div>
</body>
<script>
    var keyword = "${paging.keyword}";
    var vm = new Vue({
       el : "#vueCtrl",
       data : {
           list : ${list},
           startPage : ${paging.startPage},
           nowPage : ${paging.nowPage},
           cntPerPage : ${paging.cntPerPage},
           endPage : ${paging.endPage + 1},
           lastPage : ${paging.lastPage}
                
       },
       methods: {
            search: function () {
                var keyword = document.getElementById("search_keyword").value;
                window.location.href = "/selectList?keyword=" + keyword;
            },
            insertList: function () {
                window.location.href = "/insert";
            },
            goSelectOne: function (boardId) {
                //window.location.href="/selectOne?boardId="+ boardId;
                return "/selectOne?boardId="+ boardId;
            },
            leftArrowBtn : function(){
                window.location.href = "/selectList?nowPage="+ (this.startPage-1)
                + "&cntPerPage=" + this.cntPerPage
                + "&keyword=" + keyword
            },
            rightArrowBtn : function(){
                window.location.href = "/selectList?nowPage="+ this.endPage
                + "&cntPerPage=" + this.cntPerPage
                + "&keyword=" + keyword
            },
            range : function(start, end){
            	list = []
            	for(i = start; i<end; i++){
            		list.push(i);
            	}
            	return list;
            },
            paingNumBtn : function(p){
                window.location.href = "/selectList?nowPage=" + p
                +"&cntPerPage=" + this.cntPerPage
                +"&keyword="+keyword
            }
            
        },
        mounted() {
            
        }
    });

    // console.log("${list}");

    // function insertList() {
    //     window.location.href = "/insert";
    // }

    // function search() {
    //     var keyword = document.getElementById("search_keyword").value;
    //     window.location.href = "/selectList?keyword=" + keyword;

    // }

    // function selChange() {
    //     var sel = document.getElementById('cntPerPage').value;
    //     window.location.href = "/selectList?nowPage=${paging.nowPage}&cntPerPage=" + sel;
    // }
</script>

</html>
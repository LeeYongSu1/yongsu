<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
		<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
		<meta charset="UTF-8">
		<title>이벤트 페이지</title>
	<style>
.fakeimg {
  height: 200px;
  background: #aaa;
}
.subReply {
    padding-left: 50px;
}
.oriImg{width:500px;  height:auto;}
	</style>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/delete");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/list";
			})
		})
			// 목록
			$(".list_btn").on("click", function(){
			
			location.href = "/board/list?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
		
		$.ajax({url: "readView?no="+NO, success: function(result){
			  $("#image").append('<img src="resources/'+ result.image + '" style="width: 100%;">');
			  $("#title").text(result.title);
			  $("#content").text(result.content);
		 }});
		
	  
	</script>
	
	<body>
		<p>${fileName}
	<div class="jumbotron text-center" style="margin-bottom:0">
	  <h1><a href="/" style="font-style: italic; color: black;">イベント掲示板</a></h1>
	</div>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="/">ホーム</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/list">リスト</a>
	      </li>
	    </ul>
	  </div>  
	</nav>
			<hr />
			
			<section id="container" style="margin-top:30px">
				<div class="row">
					<div class="col-sm-12">	
						<form name="readForm" role="form" method="post">
							<input type="hidden" id="no" name="no" value="${read.no}" />
							<input type="hidden" id="page" name="page" value="${scri.page}"> 
							  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
							  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
							  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
						</form>
						<%-- <table>
							<tbody>
								<tr>
									<td>
										<label for="title">제목</label><input type="text" id="title" name="title" value="${read.title}" readonly="readonly" />
									</td>
								</tr>	 --%>
							<div class="form-group">
							  <label for="title">題目:</label>
							  <input type="text" class="form-control" id="title" name = "title" value="${read.title }" readonly="readonly">
							</div>
							
							<hr>
								<span></span>
								<div class="form-group" style="border: 1px solid #dbdbdb;">
										<img src="resources/${fileName }" style="width:550px;"   alt="未完成" title="photo" />
								</div>
							<hr>
								<%-- <tr>
									<td>
										<label for="content">내용</label><textarea id="content" name="content" readonly="readonly"><c:out value="${read.content}" /></textarea>
									</td>
								</tr> --%>
							<div class="form-group">
							  <label for="content">内容:</label>
							  <textarea class="form-control" rows="5" id="content" name = "content" readonly="readonly"><c:out value="${read.content}" /></textarea>
							</div>
							
								<%-- <tr>
									<td>
										<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}"  readonly="readonly"/>
									</td>
								</tr> --%>
							<div class="form-group">
							  <label for="writer">作成者:</label>
							  <input type="text" class="form-control" id="writer" name = "writer" value="${read.writer}"  readonly="readonly">
							</div>
							
							<div class="form-group">
								<label for="regdate">作成日時</label>
								<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />					
							</div>	
							<hr>
							<div>
								<button type="submit" class="update_btn">修正</button>
								<button type="submit" class="delete_btn">削除</button>
								<button type="submit" class="list_btn">リスト</button>	
							</div>
					</div>
				</div>
			</section>
		<hr />
	</body>
</html>
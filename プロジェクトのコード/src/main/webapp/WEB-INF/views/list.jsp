<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	html, body {
	  height: 100%;
	}
	
	html {
	  background: #eee;
	}
	
	body {
	  display: block;
	  justify-content: center;
	  align-items: flex-start;
	}
	
	.box {
	  width: 100%;
	  height: 250px;
	  border-radius: 5px;
	  box-shadow: 0 2px 30px rgba(black, .2);
	  background: lighten(#f0f4c3, 10%);
	  position: relative;
	  overflow: hidden;
	  transform: translate3d(0, 0, 0);
	}
	
	.wave {
	  opacity: .4;
	  position: absolute;
	  top: 3%;
	  left: 50%;
	  background: #0af;
	  width: 500px;
	  height: 500px;
	  margin-left: -250px;
	  margin-top: -250px;
	  transform-origin: 50% 48%;
	  border-radius: 43%;
	  animation: drift 3000ms infinite linear;
	}
	
	.wave.-three {
	  animation: drift 5000ms infinite linear;
	}
	
	.wave.-two {
	  animation: drift 7000ms infinite linear;
	  opacity: .1;
	  background: yellow;
	}
	
	.box:after {
	  content: '';
	  display: block;
	  left: 0;
	  top: 0;
	  width: 100%;
	  height: 100%;
	  background: linear-gradient(to bottom, rgba(#e8a, 1), rgba(#def, 0) 80%, rgba(white, .5));
	  z-index: 11;
	  transform: translate3d(0, 0, 0);
	}
	
	.title {
	  position: absolute;
	  left: 0;
	  top: 0;
	  width: 100%;
	  z-index: 1;
	  line-height: 300px;
	  text-align: center;
	  transform: translate3d(0, 0, 0);
	  color: white;
	  text-transform: uppercase;
	  font-family: 'Playfair Display', serif;
	  letter-spacing: .4em;
	  font-size: 24px;
	  text-shadow: 0 1px 0 rgba(black, .1);
	  text-indent: .3em;
	}
	@keyframes drift {
	  from { transform: rotate(0deg); }
	  from { transform: rotate(90deg); }
	}
	li{list-style: none; float: left; padding: 0px;}
</style>
</head>
<body>
	<div class="box">
		<div class='wave -one'></div>
		<div class='wave -two'></div>
		<div class='wave -three'></div>
	  	<div class='title'><a href="/" style="font-style: italic; color: ;">イベント掲示板</a></div>
	</div>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="/">ホーム</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/writeView">書き込み</a>
	      </li>
	    </ul>
	  </div>  
	</nav>
<hr />
		<section id="container" style="margin-top:20px;" >
			<div class="row">
				<div class="col-sm-9">
					<form role="form" method="get" action="/write">
						<table id="example" class="display" style="width:100%">
							<tr><th>ナンバー</th><th>題目</th><th>作成者</th><th>登録日時</th></tr>
								<c:forEach items="${list}" var = "list">
									<tr>
										<td><c:out value="${list.no}" /></td>
										<td>
										<a href="/readView?no=${list.no}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
										</td>
										<td><c:out value="${list.writer}" /></td>
										<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
									</tr>
								</c:forEach>
							</table>
							 <div class="search">
							    <select name="searchType">
							      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
							      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>題目</option>
							      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>内容</option>
							      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>作成者</option>
							      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>題目+内容</option>
							    </select>
							
							    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
							
							    <button id="searchBtn" type="button">検索</button>
							    <script>
							      $(function(){
							        $('#searchBtn').click(function() {
							          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
							        });
							      });   
							    </script>
							  </div>
							<div>
							  <ul>
							    <c:if test="${pageMaker.prev}">
							    	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">以前</a></li>
							    </c:if> 
							
							    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							    	<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							    </c:forEach>
							
							    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							    	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">次に</a></li>
							    </c:if> 
							  </ul>
							</div>
						</form>
					</div>
				</div>
			</section>
		<hr />
</body>
</html>
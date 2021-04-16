<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<meta charset="UTF-8">
<title>상품 전체 목록</title>
<style>
  .thead{
  		text-align: center;
  	}
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
	  position: inherit;
	  top: 0%;
	  left: 50%;
	  background: #0af;
	  width: 500px;
	  height: 500px;
	  margin-left: -250px;
	  margin-top: -200px;
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
	  from { transform: rotate(360deg); }
	}
</style>
</head>
<body>
	<div class="box">
		<div class='wave -one'></div>
		<div class='wave -two'></div>
		<div class='wave -three'></div>
	  	<div class='title'><a href="/" style="font-style: italic; color: ;">商品の情報</a></div>
	</div>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="/">ホーム</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/productlist">リスト</a>
	      </li>
	    </ul>
	  </div>  
	</nav>
	<table class="table table-striped">
		<thead class="thead">
			<tr >
				<th>商品ナンバー</th>		
				<th>商品名</th>	
				<th>商品価格</th>		
				<th>商品モデル</th>		
				<th>商品カラー</th>		
				<th>商品情報</th>		
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list }">
				<tr align = "center">
					<td>${row.product_num }</td>	
					<td><a href="${path}/listOfGoods?product_name=${row.product_name }">${row.product_name}</a></td>
					<td>${row.product_price }</td>		
					<td>${row.product_model }</td>		
					<td>${row.product_color }</td>		
					<td>${row.product_info }</td>		
				</tr>
			</c:forEach>
			<c:if test="${sessionScope.userId = 'ly3029' }">
				<br>
				<a href="${path }/edit/${row.product_num }">[수정]</a>
			</c:if>
		</tbody>
	</table>
</body>
</html>
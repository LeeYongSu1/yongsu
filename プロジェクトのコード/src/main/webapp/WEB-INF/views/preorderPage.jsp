<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 사전예약 화면</title>
<!--  This file has been downloaded from bootdey.com    @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<style type="text/css">
html, body {
	  height: 100%;
	}
	
body{margin-top:100px;
	background:#eee;
	display: block;
		  justify-content: center;
		  align-items: flex-start;
}

/*panel*/
.panel {
    border: none;
    box-shadow: none;
}

.panel-heading {
    border-color:#eff2f7 ;
    font-size: 20px;
    font-weight: 350;
}

.panel-title {
    color: #2A3542;
    font-size: 14px;
    font-weight: 500;
    margin-bottom: 0;
    margin-top: 0;
    font-family: 'Open Sans', sans-serif;
}

/*product list*/

.prod-cat li a{
    border-bottom: 1px dashed #d9d9d9;
}

.prod-cat li a {
    color: #3b3b3b;
}

.prod-cat li ul {
    margin-left: 30px;
}

.prod-cat li ul li a{
    border-bottom:none;
}
.prod-cat li ul li a:hover,.prod-cat li ul li a:focus, .prod-cat li ul li.active a , .prod-cat li a:hover,.prod-cat li a:focus, .prod-cat li a.active{
    background: none;
    color: #ff7261;
}

.pro-lab{
    margin-right: 20px;
    font-weight: normal;
}

.pro-sort {
    padding-right: 20px;
    float: left;
}

.pro-page-list {
    margin: 5px 0 0 0;
}

.product-list img{
	padding-top: 30px;
    width: 100%;
    border-radius: 4px 4px 0 0;
    -webkit-border-radius: 4px 4px 0 0;
}

.product-list .pro-img-box {
    position: relative;
}
.adtocart {
    background: #fc5959;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    -webkit-border-radius: 50%;
    color: #fff;
    display: inline-block;
    text-align: center;
    border: 3px solid #fff;
    left: 45%;
    bottom: -25px;
    position: absolute;
}

.adtocart i{
    color: #fff;
    font-size: 25px;
    line-height: 42px;
}

.pro-title {
    color: #5A5A5A;
    display: inline-block;
    margin-top: 20px;
    font-size: 16px;
}

.product-list .price {
    color:#fc5959 ;
    font-size: 15px;
}

.pro-img-details {
    margin-left: -15px;
}

.pro-img-details img {
    width: 100%;
}

.pro-d-title {
    font-size: 16px;
    margin-top: 0;
}

.product_meta {
    border-top: 1px solid #eee;
    border-bottom: 1px solid #eee;
    padding: 10px 0;
    margin: 15px 0;
}

.product_meta span {
    display: block;
    margin-bottom: 10px;
}
.product_meta a, .pro-price{
    color:#fc5959 ;
}

.pro-price, .amount-old {
    font-size: 18px;
    padding: 0 10px;
}

.amount-old {
    text-decoration: line-through;
}

.quantity {
    width: 120px;
}

.pro-img-list {
    margin: 10px 0 0 -15px;
    width: 100%;
    display: inline-block;
}

.pro-img-list a {
    float: left;
    margin-right: 10px;
    margin-bottom: 10px;
    padding-top: 100px;
}

.pro-d-head {
    font-size: 18px;
    font-weight: 300;
}

</style>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="/">홈</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/productlist">목록</a>
	      </li>
	    </ul>
	  </div>  
	</nav>
	
<div class="container bootdey">
<div class="col-md-12">
<section class="panel">
      <div class="panel-body">
          <div class="col-md-6">
              <div class="pro-img-details">
                  <img src="<spring:url value='/resources/img/airpot.jpg'/>" style="max-width:100%; height:auto;">
              </div>
          </div>
          <div class="col-md-6">
              <h4 class="pro-d-title">
                  <a href="#" class="">
                      AirPod Pro
                  </a>
              </h4>
          	  <form action="preorder" method="post">    
              <div class="form-group mb-3">
              	  <label>商品名</label>
					<select name="productId" class="form-control" style="width: 300px">
					  <option value="product1">AirPods Pro</option>
					</select>
			  </div>
					
              <div class="form-group mb-3">     
              	  <label>Quantity</label>
                  <input type="number" min="0" max="100" name="productCount" placeholder="수량" class="form-control quantity" style="width: 300px">
              </div>
              <div class="form-group mb-3">     
                  <label>予約者</label>
                  <input type="text" name="userName" placeholder="이용수" class="form-control" style="width: 300px">
              </div>
              <div class="form-group mb-3">     
                  <label>連絡先</label>
                  <input type="text" name="userPhon" placeholder="010-1234-5637" class="form-control" style="width: 300px">
              </div>
              <div class="form-group mb-3">     
                  <label>住所</label>
                  <input type="text" name="userAddr" placeholder="서울특별시 △△구 □□동" class="form-control" style="width: 300px">
                  
              </div>
              <p>
                  <button class="btn btn-round btn-danger" type="submit"><i class="fa fa-shopping-cart"></i> 予約</button>
              </p>
              </form>
          </div>
      </div>
  </section>
  </div>
  </div>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>
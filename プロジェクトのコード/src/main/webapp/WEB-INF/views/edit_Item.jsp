<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 전체 목록</title>
</head>
<body>
	<form action="edit" method="post">
		<div class="container">
			<div class="form-group">
				<label>상품번호</label>
				<input class="form-control" type="text" name="product_num" value="${vo.product_num }" >
			</div>
			<div class="form-group">
				<label>상품명</label>
				<input class="form-control" type="text" name="product_name" value="${vo.product_name }" >
			</div>
			<div class="form-group">
				<label>상품가격</label>
				<input class="form-control" type="text" name="product_price" value="${vo.product_price }" >
			</div>
			<div class="form-group">
				<label>상품모델명</label>
				<input class="form-control" type="text" name="product_model" value="${vo.product_model }" >
			</div>
			<div class="form-group">
				<label>상품색상</label>
				<input class="form-control" type="text" name="product_color" value="${vo.product_color }" >
			</div>
			<div class="form-group">
				<label>상품정보</label>
				<input class="form-control" type="text" name="product_info" value="${vo.product_info }" >
			</div>
			
			<button type="submit" name="submit_btn">상품수정</button>
			
		</div>
	
	</form>
	
</body>
</html>
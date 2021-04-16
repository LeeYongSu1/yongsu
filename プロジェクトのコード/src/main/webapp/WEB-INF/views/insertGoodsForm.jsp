<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지 (관리자 전용)</title>
	<style type="text/css">
		 
	</style>
</head>
	
<body>
	<section id="container" >
		<form action="upload" method="post" enctype="multipart/form-data" >
			<div class="form-group has-feedback" >
				<label class="control-label" for="gdId">商品ナンバー</label>
				<input class="form-control" type="text" name="product_num" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="gdName">商品名</label>
				<input class="form-control" type="text" name="product_name" />
			</div>
						<div class="form-group has-feedback">
				<label class="control-label" for="gdName">商品価格</label>
				<input class="form-control" type="text" name="product_price" />
			</div>
						<div class="form-group has-feedback">
				<label class="control-label" for="gdName">商品モデル</label>
				<input class="form-control" type="text" name="product_model" />
			</div>
						<div class="form-group has-feedback">
				<label class="control-label" for="gdName">商品カラー</label>
				<input class="form-control" type="text" name="product_color" />
			</div>
						<div class="form-group has-feedback">
				<label class="control-label" for="gdName">商品情報</label>
				<input class="form-control" type="text" name="product_info" />
			</div>
			
			<button type="submit" name="submit_btn">登録</button>
		</form>
	</section>

</body>
</html>
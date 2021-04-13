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
<title>이벤트 페이지</title>
<style>
	.select_img img 
	{margin:50px 0; 
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
	  from { transform: rotate(360deg); }
	}
	.btn{
		margin-top: 10px;
	}
</style>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
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
	        <a class="nav-link" href="/list">リスト</a>
	      </li>
	    </ul>
	  </div>  
	</nav>
		<div class="container" style="margin-top:30px">
			<div class="row">
				<div class="col-sm-12">
				<h2>書き込み</h2>
				<form name="writeForm" method="post" action="/write" enctype="multipart/form-data">
					<c:if test="${member.userId != null}">
							<!-- <tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" />
								</td>
							</tr>	 -->
							
							<div class="inputArea">
								 <label for="gdsImg">イメージ</label>
								 <input type="file" id="gdsImg" name="file" />
								 <div class="select_img"><img src="" /></div>
								 
								 <script>
								  $("#gdsImg").change(function(){
								   if(this.files && this.files[0]) {
								    var reader = new FileReader;
								    reader.onload = function(data) {
								     $(".select_img img").attr("src", data.target.result).width(500);        
								    }
								    reader.readAsDataURL(this.files[0]);
								   }
								  });
								 </script>
								</div>
							<div class="form-group">
							  <label for="title">題目:</label>
							  <input type="text" class="form-control" id="title" name = "title">
							</div>
							
							<!-- <tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content" ></textarea>
								</td>
							</tr> -->
							<div class="form-group">
							  <label for="comment">内容:</label>
							  <textarea class="form-control" rows="5" id="content" name = "content"></textarea>
							</div>
							<!-- <tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" />
								</td>
							<tr> -->
							<div class="form-group">
							  <label for="writer">作成者:</label>
							  <input type="text" class="form-control" id="writer" name = "writer">
							</div>
							
							
							<div class="btn">
									<button class="write_brn" type="submit">作成</button>
							</div>
							</c:if>
							<c:if test="${member.userId == null}">
								<p>ログインしてから書けます。</p>
							</c:if>
					</form>
				</div>
			</div>
		</div>
	<hr />
</body>
</html>
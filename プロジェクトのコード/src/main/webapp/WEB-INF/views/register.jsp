<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/";
			})
			
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("IDを入力してください。");
					$("#userId").focus();
					return false;
				}
				if($("#userPass").val()==""){
					alert("暗証番号をご入力ください。");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("氏名を入力してください。");
					$("#userName").focus();
					return false;
				}
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("重複確認ボタンを押してください。");
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
					return false;
				}
			});
		})
		
		function fn_idChk(){
			$.ajax({
				url : "/idChk",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(data == 1){
						alert("ID重複です。");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("使用可能なIDです。");
					}
				}
			})
		}
	</script>
	<body>
		<section id="container">
			<form action="register" method="post" id="regForm">
				<div class="form-group has-feedback">
					<label class="control-label" for="userId">ID</label>
					<input class="form-control" type="text" id="userId" name="userId" />
					<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">重複確認</button>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPass">パスワード</label>
					<input class="form-control" type="password" id="userPass" name="userPass" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">氏名</label>
					<input class="form-control" type="text" id="userName" name="userName" />
				</div>
				
			</form>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="button" id="submit">会員登録</button>
					<button class="cencle btn btn-danger" type="button">キャンセル</button>
				</div>
		</section>
		
	</body>
	
</html>
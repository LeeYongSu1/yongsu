<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com    @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body{
    overflow: hidden;
    height: 100%;
    background: #191c22;
    padding: 0;
    margin-top:150px;
}
.lc-block {
    background: #fff;
    border-radius: 2px;
    position: relative;
    padding: 45px 30px 30px;
}

.lc-block.toggled {
    -webkit-animation-name: fadeInUp;
    animation-name: fadeInUp;
    -webkit-animation-duration: .3s;
    animation-duration: .3s;
    -webkit-animation-fill-mode: both;
    animation-fill-mode: both;
    z-index: 10;
}
.lc-block .form-control {
    text-align: center;
}
.lcb-float {
    width: 60px;
    height: 60px;
    background: #fff;
    border-radius: 50%;
    box-shadow: 0 -10px 19px rgba(0, 0, 0, .38);
    position: absolute;
    top: -35px;
    left: 50%;
    margin-left: -30px;
}
.lcb-float img {
    width: 100%;
    height: 100%;
    border-radius: 50%;
    padding: 4px;
}
.lcb-float i {
    color: #333;
    font-size: 25px;
    line-height: 60px;
}
.lcb-lockscreen {
    position: relative;
}
.lcb-lockscreen .form-control {
    padding-right: 35px;
}
.lcb-lockscreen .lcbl-btn {
    background-color: #2196F3;
    position: absolute;
    top: 0;
    right: 0;
    width: 30px;
    color: #fff;
    font-size: 15px;
    height: 27px;
    margin: 4px;
    line-height: 26px;
    border-radius: 2px;
}
.login-navigation {
    list-style: none;
    padding: 0;
    margin: 0;
    position: absolute;
    width: 100%;
    left: 0;
    bottom: -45px;
}
.login-navigation>li {
    display: inline-block;
    margin: 0 2px;
    -webkit-transition: all;
    -o-transition: all;
    transition: all;
    -webkit-transition-duration: 150ms;
    transition-duration: 150ms;
    cursor: pointer;
    vertical-align: top;
    color: #fff;
    line-height: 16px;
    min-width: 16px;
    min-height: 16px;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    backface-visibility: hidden;
}
#footer, #footer .f-menu>li>a {
    color: #a2a2a2;
}
.login-navigation>li>span {
    opacity: 0;
    filter: alpha(opacity=0);
}
.login-navigation>li:not(:hover) {
    font-size: 0;
    border-radius: 100%
}
.login-navigation>li:hover {
    border-radius: 10px;
    padding: 0 5px;
    font-size: 8px;
}
.login-navigation>li:hover>span {
    opacity: 1;
    filter: alpha(opacity=100);
}
.lcb-float {
    width: 60px;
    height: 60px;
    background: #fff;
    border-radius: 50%;
    box-shadow: 0 -10px 19px rgba(0,0,0,.38);
    position: absolute;
    top: -35px;
    left: 50%;
    margin-left: -30px;
    text-align:center;
}
.lcb-float i {
    color: #333;
    font-size: 25px;
    line-height: 60px;
}
.zmdi {
    display: inline-block;
    font: normal normal normal 14px/1 'Material-Design-Iconic-Font';
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
.cr-alt label {
    position: relative;
    padding-left: 28px;
}
.form-group {
    margin-bottom: 15px;
}
.c-gray {
    color: #9e9e9e!important;
}
.form-control {
    -webkit-transition: all;
    -o-transition: all;
    transition: all;
    -webkit-transition-duration: .3s;
    transition-duration: .3s;
    resize: none;
    box-shadow: 0 0 0 40px transparent!important;
    border-radius: 0;
}
.form-control {
    width: 100%;
    height: 35px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #e8e8e8;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
}
.form-control, output {
    font-size: 13px;
    line-height: 1.42857143;
    color: #9e9e9e;
    display: block;
}
.lc-block {
    box-shadow: 0 1px 11px rgba(0, 0, 0, .27);
}
.lc-block, .login-content:after {
    vertical-align: middle;
    display: inline-block;
}
.btn:not(.btn-alt) {
    border: 0;
}
.btn-primary.active, .btn-primary.focus, .btn-primary:active, .btn-primary:focus, 
.btn-primary:hover, .open>.dropdown-toggle.btn-primary {
    color: #fff;
    background-color: #1791f2;
    border-color: #0d87e9;
}
.btn-primary {
    color: #fff;
    background-color: #2196f3;
    border-color: #0d8aee;
}
</style>
</head>
<script type="text/javascript">
</script>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">


<form name='homeForm' method="post" action="/login">
	<c:if test="${member == null}">
	<div class="container bootstrap snippets bootdey">
	    <div class="lc-block col-md-4 col-md-offset-4 toggled" id="l-login"  id="userId" name="userId">
	        <div class="lcb-float"><i class="fa fa-users"></i></div>
	        <div class="form-group">
	            <input type="text" id="userId" name="userId" class="form-control" placeholder="ID">
	        </div>
	        <div class="form-group">
	            <input type="password" id="userPass" name="userPass" class="form-control" placeholder="Password" id="userPass" name="userPass">
	        </div>
	        <div class="form-group">
		        <c:if test="${msg == false}">
				<p style="color: red;">ログインに失敗！ IDとパスワードを確認してください。</p>
				</c:if>
	        </div>
	        <div class="form-group mb-1">
	        	<button type="submit" class="btn btn-block btn-primary btn-float m-t-25">ログイン</button>
	        </div>
	        <div class="form-group">
				<a href="${path}/register"><button id="registerBtn" type="button" class="btn btn-block btn-primary btn-float m-t-25">新規会員登録</button></a>
			</div>
	    </div>
	</div>
	</c:if>
	
</form>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>
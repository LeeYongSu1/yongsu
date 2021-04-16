<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file = "../include/header.jsp" %>
<style>
iframe{
width : 400px;
height : 200px;
border : 1px;
border-style : solid;
}
</style>
</head>
<body>
<%@ include file = "../include/menu.jsp" %>
<!-- enctype = "multipart/form-data" 파일 업로드 필수 옵션 
enctype = "application/x-www-form-urlencoded" 기본 옵션-->
 
 
<!-- target = "iframe" 의 name => iframe으로 전송함 -->
<form action="${path}/upload/uploadForm" method="post" enctype="multipart/form-data">
        <input type="file" name="file">
        <input type="submit" value="업로드">    
    </form>
 
<iframe name="iframe1"></iframe>
 
</body>
</html>

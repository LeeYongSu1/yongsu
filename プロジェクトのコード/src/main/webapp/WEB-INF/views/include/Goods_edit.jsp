<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편집 페이지</title>
<script>
    //상품을 갱신하는 함수
    //컨트롤러의 update.do로 맵핑된다.
    function product_update() {
        document.form1.action = "${path}/update.do";
        document.form1.submit();
    }
 
    //상품을 삭제하는 함수
    //컨트롤러의 delete.do로 맵핑된다.
    function product_delete() {
        if (confirm("삭제하시겠습니까?")) {
            document.form1.action = "${path}/delete.do";
            document.form1.submit();
        }
    }
</script>
</head>
<body>
<h2>상품 정보 편집</h2>
    <form id="form1" name="form1" method="post"
        enctype="multipart/form-data">
        <!-- 파일 업로드를 하기위한 타입, 필수로 작성해야 한다.-->
        <table>
            <!-- 관리자로그인을 한 후에 들어갈 수 있는 상품정보 편집정보 -->
            <!-- 해당되는 자료들은 vo에서 가져와서 보여준다. -->
            <tr>
                <td>상품명</td>
                <td><input name="product_name" value="${vo.product_name}"></td>
            </tr>
 
            <tr>
                <td>상품가격</td>
                <td><input name="product_price" type="number" value="${vo.product_price}"></td>
            </tr>
 			<tr>
 				<td>상품모델명</td>
 				<td><input name="product_model" value="${vo.product_model}"></td>
 			</tr>
 			<tr>
 				<td>상품색상</td>
 				<td><label>성별</label>
                                 <select class="form-control form-control-lg" id="gender" path="mGender">
                                    <foption value="남성">남성</option>
                                    <option value="여성">여성</option>
                                 </select></td>
 			</tr>
            <tr>
                <td>상품정보</td>
                <td><textarea rows="5" cols="60" name="description"
                        id="product_info">${vo.product_info}</textarea></td>
            </tr>
        </table>
    </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h2>도서정보 등록 화면</h2>
<form name="form" method="post" action="bookInsertProcess.jsp">
<table border=1 id="tab1">
<tr><th width="30%">도서코드</th>
<td><input id="in1" type="text" name="bookno"></td>
</tr>
<tr><th width="30%">저자</th>
<td><input id="in1"  type="text" name="author"></td>
</tr>
<tr><th width="30%">도서이름</th>
<td><input id="in1"  type="text" name="bookname"></td>
</tr>
<tr>
	<td colspan=2 align=center>
	<input type="button" id="in2" value="등록" onclick="check()">
	<input type="reset" id="in2"  value="취소">
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>
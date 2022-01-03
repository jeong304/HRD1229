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
<%@ include file="DBConn.jsp" %>
<h2>도서 대출 정보 조회</h2>
<table border=1 id="tab4">
<tr>
	<th>no</th>
	<th>대출번호</th>
	<th>고객성명</th>
	<th>도서코드</th>
	<th>도서명</th>
	<th>대출일자</th>
	<th>반납일자</th>
	<th>대출상태</th>
	<th>등급</th>
	<th>관리</th>
</tr>
<%
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	int no=0;
	try{
		String sql="select lentno,custname,a.bookno,bookname,to_char(outdate,'yyyy-mm-dd'),to_char(indate,'yyyy-mm-dd'),status,class from reservation1229 a,bookinfo1229 b where a.bookno=b.bookno";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String lentno=rs.getString(1);
			String custname=rs.getString(2);
			String bookno=rs.getString(3);
			String bookname=rs.getString(4);
			String outdate=rs.getString(5);
			String indate=rs.getString(6);
			String status=rs.getString(7);
			String class1=rs.getString(8);
			no++;

%>
<tr>
	<td><%=no %></td>
	<td><a href="reservationUpdate.jsp?lentno=<%=lentno %>" id="c1"><%=lentno %></a></td>
	<td><%=custname %></td>
	<td><%=bookno %></td>
	<td><%=bookname %></td>
	<td><%=outdate %></td>
	<td><%=indate %></td>
	<td><%=status %></td>
	<td><%=class1 %></td>
	<td><a href="reservationDeleteProcess.jsp?lentno=<%=lentno %>" onclick="if(!confirm('정말로 삭제하겠습니까?')) return false;"  id="c1">삭제</a></td>
</tr>

<%
		}
	}catch(SQLException e){
		System.out.println("조회 실패");
		e.printStackTrace();
	}
%>
</table>
</section>
<%@ include file="footer.jsp"%>

</body>
</html>
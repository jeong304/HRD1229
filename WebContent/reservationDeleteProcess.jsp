<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%
	String lentno=request.getParameter("lentno");
	PreparedStatement pstmt=null;
	try{
		String sql="delete from reservation1229 where lentno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, lentno);
		pstmt.executeUpdate();
		%>
			<script>
				alert("도서대출정보 삭제 성공");
				location.href="reservationSelect.jsp";
			</script>
		<%
	}catch(SQLException e){
		System.out.println("도서예약정보 삭제 실패");
		e.printStackTrace();
	}
%>
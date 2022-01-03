<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>insert, update 처리</title>
<style>
html, body {
		margin: 0;
		padding: 0;
	}
	#wrap {
		width: 100%;
		height: 100%;
		border-collapse: collapse;
		margin: 0 auto 0 auto;
	}
</style>
</head>
<body>
	<table id="wrap">
		<tr>
			<td height="10%" bgcolor="blue">
			<%@ include file="header.jsp" %>
			</td>
		</tr>
		<tr>
			<td height="5%" bgcolor="mediumpurple">
			<%@ include file="nav.jsp" %>
			</td>
		</tr>
		<tr>
			<td id="section" height="75%" bgcolor="#ccc" valign="top">
			<!-- 내용 시작 -->
			<%@ include file="DBConn.jsp" %>
			<%
				String lentno =  request.getParameter("lentno");
				String custname =  request.getParameter("custname");
				String bookno =  request.getParameter("bookno");
				String outdate =  request.getParameter("outdate");
				String indate =  request.getParameter("indate");
				if(indate==null){
					indate="";
				}
				String status =  request.getParameter("status");
				String class1 =  request.getParameter("class");
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				/*
				 * insert_form.jsp, update_form.jsp, delete_form.jsp에서 form을 전송할 때
				 * action을 hidden값으로 전송한다. 해당 값에 맞는 명령을 수행 
				 */
				
				try{
					String sql = "insert into reservation1229  values (?,?,?,?,?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, lentno);
					pstmt.setString(2, custname);
					pstmt.setString(3, bookno);
					pstmt.setString(4, outdate);
					pstmt.setString(5, indate);
					pstmt.setString(6, status);
					pstmt.setString(7, class1);
					pstmt.executeUpdate();
			        %>
			        <script>
			            alert("등록이 완료되었습니다!");
			/*             history.back(-1); */
			        </script>
			        <%
				} catch (Exception e) {
					 %>
				        <script>
				            alert("도서 예약 정보 등록이 실패 했습니다!");
				            history.back(-1);
				        </script>
				        <%
					e.printStackTrace();
				} finally {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				}
				
			%>
			<script>location.href="index.jsp";</script>
			<!-- 내용 끝 -->
			</td>
		</tr>
		<tr>
			<td height="10%" bgcolor="blue">
			<%@ include file="footer.jsp" %>
			</td>
		</tr>
	</table>
</body>
</html>
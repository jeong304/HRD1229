b<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>도서 대출 예약 정보 등록</title>
<link rel="stylesheet" href="common.css">

<script>
	function check() {
		if (document.form.lentno.value == "") {
			alert("대출번호가 입력되지 않았습니다.");
			document.form.lentno.focus();
		}
		else if (document.form.custname.value == "") {
			alert("고객성명이 입력되지 않았습니다.");
			document.form.custname.focus();
		}
		else if (document.form.bookno.value == "") {
			alert("도서코드가 입력되지 않았습니다.");
			document.form.bookno.focus();
		}
		else if (document.form.outdate.value == "") {
			alert("대출일자가 입력되지 않았습니다.");
			document.form.outdate.focus();
		}
		else {
			
			document.form.submit();
		}
	}
	
	
	function btn_click(str){
		if (document.form.lentno.value == "") {
			alert("대출번호가 입력되지 않았습니다.");
			document.form.lentno.focus();
		}
		else if (document.form.custname.value == "") {
			alert("고객성명이 입력되지 않았습니다.");
			document.form.custname.focus();
		}
		else if (document.form.bookno.value == "") {
			alert("도서코드가 입력되지 않았습니다.");
			document.form.bookno.focus();
		}
		else if (document.form.outdate.value == "") {
			alert("대출일자가 입력되지 않았습니다.");
			document.form.outdate.focus();
		}
		else{
		  form.action="reservationInsert_process.jsp";
		 }
		}
	function changesubmit(){
		 document.form.submit();
		}
</script>
</head>
<body>
	<div id=wrap>
	<header>
		<%@ include file="header.jsp" %>
	</header>
	<nav>
		<%@ include file="nav.jsp" %>
	</nav>
	<section>
		<!-- 내용 시작 -->
		<%@ include file="DBConn.jsp" %>
		<%
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int no=0;
			try{
				String sql="select reserv_seq.nextval from dual";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					no=rs.getInt(1);
				}
			}catch(SQLException e){
				System.out.println("sequence 오류");
				e.printStackTrace();
			}
			
			String bookno=request.getParameter("bookno");
			String custname=request.getParameter("custname");
			String indate=request.getParameter("indate");
			String outdate=request.getParameter("outdate");
			String t_bookno="",t_bookname="";
			int sel=0;
		    if(bookno==null){
		    	bookno="";
		    	custname="";
		    	indate="";
		    	outdate="";
		    }else{
			try{
				String sql="select bookno,bookname from bookinfo1229 where bookno=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, bookno);
				rs=pstmt.executeQuery();
				if(rs.next()){
					t_bookno=rs.getString(1);
					t_bookname=rs.getString("bookname");
				}else{
					%>
					<script>
						alert("등록되지 않은 도서코드입니다.");
					</script>
					<%
				}
			}catch(SQLException e){
				System.out.println("bookinfo 테이블 오류");
				e.printStackTrace();
			}
		    }
		%>
		<br><h3 id="h22">도서 대출 예약 정보 등록 화면</h3>
		
		<form name="form" method="post" action="reservationInsert.jsp">
		
			<table  id="tab4"  border="1" bordercolor="black">
				<tr>
					<th  width="20%">대출번호</th>
					<td><input  id=in1  type="text" name="lentno" value="<%=no %>"></td>
					<th width="20%">고객성명</th>
					<td><input id=in1 type="text" name="custname" value="<%=custname %>"></td>
				</tr>
				
				<tr>
						<th width="20%">도서코드</th>
						<td><input  id=in1  type="text" name="bookno" value="<%=t_bookno %>" onchange="changesubmit();"></td>
						<th width="20%">도서이름</th>
						<td><input id=in1 type="text" name="bookname"  value="<%=t_bookname %>"></td>
						
					</tr>
					<tr>
						<th width="20%">대출일자</th>
						<td><input id=in1 type="text" name="outdate" value="<%=outdate %>"></td>
						<th width="20%">반납일자</th>
						<td><input id=in1 type="text" name="indate" value="<%=indate %>" onchange="changesubmit();"
							<%if(indate==""){sel=1;}else{sel=0;} %>>
					</tr>
					<tr>
					<th width="20%">대출상태</th>
					<td><input type="radio" name="status" value="1" <%if(sel==1){ %>checked<%}%>>대출
					<input type="radio" name="status" value="2" <%if(sel==0){ %>checked<%}%>>반납
						<th width="30%">등급</th>
						<td>
							<select id=in1  name="class">
								<option value="S" selected>S</option>
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="C">C</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="4" id=button align="center">
						<button  id="bt1"  type="submit" onclick='btn_click("insert");'>저장</button>
						<button  id="bt1" type="reset" onclick="location.href='index.jsp'">취소</button>
						</td>
					</tr>
				</table>
			</form>
			<!-- 내용 끝 -->
			</td>
		</tr>
		<tr>
		</table>
	
	<!--내용 끝-->
	</section>
	<footer>
		<%@ include file="footer.jsp" %>
	</footer>
	</div>
</body>
</html>
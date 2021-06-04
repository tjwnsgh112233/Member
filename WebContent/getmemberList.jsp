<%@page import="java.util.ArrayList"%>
<%@page import="VO.MVO"%>
<%@page import="DAO.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	DAO dao = new DAO();
    	ArrayList<MVO> vo = dao.getmemberList();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css.css">
</head>
<body>
	<header id="header">
		<%@ include file="header.jsp" %>
	</header>
	
	<div id="menu">
		<%@ include file="menu.jsp" %>
	</div>
	
	<div id="main">
		<h1>회원목록조회/수정</h1>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
				<th>삭제</th>
			</tr>
			<%
				for(MVO m : vo){
			%>
			<tr>
				<td class="custno"><a href="updateList.jsp?no=<%=m.getCustno()%>"><%=m.getCustno() %></a></td>
				<td><%=m.getCustname() %></td>
				<td><%=m.getPhone() %></td>
				<td><%=m.getAddress() %></td>
				<td><%=m.getJoindate() %></td>
				<td><%=m.getGrade() %></td>
				<td><%=m.getCity() %></td>
				<td><a href="deleteCtrl.jsp?no=<%=m.getCustno()%>">삭제</a></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	
	<footer id="footer">
		<%@ include file="footer.jsp" %>
	</footer>
</body>
</html>
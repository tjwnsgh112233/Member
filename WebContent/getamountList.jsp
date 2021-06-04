<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAO"%>
<%@page import="VO.AVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	DAO dao = new DAO();
    	ArrayList<AVO> vo = dao.getamountList();
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
		<h1>회원매출조회</h1>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%
				for(AVO a : vo){
			%>
			<tr>
				<td><%=a.getCustno() %></td>
				<td><%=a.getCustname() %></td>
				<td><%=a.getGrade() %></td>
				<td><%=a.getPrice() %>원</td>
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
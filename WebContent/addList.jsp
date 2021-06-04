<%@page import="DAO.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	DAO dao = new DAO();
    	int max = dao.MAXNO();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css.css">
<script type="text/javascript">
	function ask() {
		if(document.getElementById("custno").value == ""){
			alert('회원번호안됌');
			document.getElementById("custno").focus();
			return false;
		}
		
		if(document.getElementById("custname").value == ""){
			alert('회원성명안됌');
			document.getElementById("custname").focus();
			return false;
		}
		
		if(document.getElementById("phone").value == ""){
			alert('전화번호안됌');
			document.getElementById("phone").focus();
			return false;
		}
		
		if(document.getElementById("address").value == ""){
			alert('주소안됌');
			document.getElementById("address").focus();
			return false;
		}
		
		if(document.getElementById("joindate").value == ""){
			alert('가입일자안됌');
			document.getElementById("joindate").focus();
			return false;
		}
		
		if(document.getElementById("grade").value == ""){
			alert('고객등급안됌');
			document.getElementById("grade").focus();
			return false;
		}
		
		if(document.getElementById("city").value == ""){
			alert('도시코드안됌');
			document.getElementById("city").focus();
			return false;
		}
		alert('등록완료');
		return true;
	}
</script>
</head>
<body>
	<header id="header">
		<%@ include file="header.jsp" %>
	</header>
	
	<div id="menu">
		<%@ include file="menu.jsp" %>
	</div>
	
	<div id="main">
		<h1>회원등록</h1>
		<form action="addCtrl.jsp" method="post" onsubmit="return ask()">
			<table border="1">
				<tr>
					<th>회원번호</th>
					<td><input type="text" id="custno" name="custno" value="<%=max%>"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" id="custname" name="custname" value=""></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" id="phone" name="phone" value=""></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" id="address" name="address" value=""></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" id="joindate" name="joindate" value=""></td>
				</tr>
				<tr>
					<th>고객등급</th>
					<td><input type="text" id="grade" name="grade" value=""></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" id="city" name="city" value=""></td>
				</tr>
				<tr>
					<th colspan="2" align="center">
						<button type="submit">등록</button>
						<button type="button" onclick="location.href='getmemberList.jsp'">조회</button>
					</th>
				</tr>
			</table>
		</form>
	</div>
	
	<footer id="footer">
		<%@ include file="footer.jsp" %>
	</footer>
</body>
</html>
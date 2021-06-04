<%@page import="VO.MVO"%>
<%@page import="DAO.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int no = Integer.parseInt(request.getParameter("no"));
    	DAO dao = new DAO();
    	MVO vo = new MVO();
    	MVO m = dao.getmember(no);
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
		alert('수정완료');
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
		<h1>회원수정</h1>
		<form action="updateCtrl.jsp" method="post" onsubmit="return ask()">
						<input type="hidden" id="no" name="no" value="<%=no%>">
			<table border="1">
				<tr>
					<th>회원번호</th>
					<td><input type="text" id="custno" name="custno" value="<%=m.getCustno()%>" disabled="disabled"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" id="custname" name="custname" value="<%=m.getCustname()%>"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" id="phone" name="phone" value="<%=m.getPhone()%>"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" id="address" name="address" value="<%=m.getAddress()%>"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" id="joindate" name="joindate" value="<%=m.getJoindate()%>"></td>
				</tr>
				<tr>
					<th>고객등급</th>
					<td><input type="text" id="grade" name="grade" value="<%=m.getGrade()%>"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" id="city" name="city" value="<%=m.getCity()%>"></td>
				</tr>
				<tr>
					<th colspan="2" align="center">
						<button type="submit">수정</button>
						<button type="button" onclick="location.href='getmemberList.jsp'">조회</button>
					</th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
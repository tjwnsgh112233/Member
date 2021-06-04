<%@page import="DAO.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	int no = Integer.parseInt(request.getParameter("no"));
    
    	DAO dao = new DAO();
    	
    	int cnt = dao.delete(no);
    	
    	if(cnt > 0){
    		response.sendRedirect("getmemberList.jsp");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>
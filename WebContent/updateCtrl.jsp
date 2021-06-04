<%@page import="VO.MVO"%>
<%@page import="java.sql.Date"%>
<%@page import="DAO.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    request.setCharacterEncoding("utf-8");
    int no = Integer.parseInt(request.getParameter("no"));
    String custname = request.getParameter("custname");
    String phone = request.getParameter("phone");
    String address =request.getParameter("address");
    String joindate = request.getParameter("joindate");
    String grade = request.getParameter("grade");
    String city = request.getParameter("city");
    
    MVO vo = new MVO();
    
    vo.setAddress(address);
    vo.setCity(city);
    vo.setCustname(custname);
    vo.setGrade(grade);
    vo.setJoindate(Date.valueOf(joindate));
    vo.setPhone(phone);
    
    DAO dao = new DAO();
    
    int cnt = dao.update(vo, no);
    
    if(cnt > 0){
    	response.sendRedirect("getmemberList.jsp");	
    }else{
    	response.sendRedirect("updateList.jsp");
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
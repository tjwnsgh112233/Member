<%@page import="DAO.DAO"%>
<%@page import="VO.MVO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    
    int custno = Integer.parseInt(request.getParameter("custno"));
    String custname = request.getParameter("custname");
    String phone = request.getParameter("phone");
    String address =request.getParameter("address");
    String joindate = request.getParameter("joindate");
    String y = joindate.substring(0, 4);
    String m = joindate.substring(4, 6);
    String d = joindate.substring(6);
    String fullDate = y + '-' + m + '-' + d;
    String grade = request.getParameter("grade");
    String city = request.getParameter("city");
    
    MVO vo = new MVO();
    
    vo.setAddress(address);
    vo.setCity(city);
    vo.setCustname(custname);
    vo.setCustno(custno);
    vo.setGrade(grade);
    vo.setJoindate(Date.valueOf(fullDate));
    vo.setPhone(phone);
    
    DAO dao = new DAO();
    
    int cnt = dao.add(vo);
    
    if(cnt > 0){
    	response.sendRedirect("getmemberList.jsp");
    }else{
    	response.sendRedirect("addList.jsp");
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
<%@page import="dto.Cale"%>
<%@page import="dto.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>

	<%
		Cale c = new Cale();
		
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		c.setNum1(Integer.parseInt(num1));
		c.setNum2(Integer.parseInt(num2));
	%>
	<script>
	alert("1인당 가격은 \n"+  <%= c.mul() %>  +"원입니다.");
	location.href='/';
	</script> 
</body>
</html>
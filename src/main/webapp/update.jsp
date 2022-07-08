<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String menu = request.getParameter("menu");
		String price = request.getParameter("price");
	%>
	<h1>수정 페이지</h1>
	<form action="update_menu.jsp">
	메뉴이름:
	<input type="text" name="menu" value=<%=menu %>><br>
	메뉴가격:
	<input type="number" name="price" value=<%=price %>><br>
	<input type="hidden" name="id" value=<%=id %>>
	<input type="submit" value="수정하기">

</body>
</html>
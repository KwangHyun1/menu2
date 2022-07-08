<%@page import="dto.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
  <h2>메뉴 추천</h2>
  <p>오늘의 메뉴는?</p>  
  <% Menu m = (Menu)request.getAttribute("bestMenu"); %>
            
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>메뉴 이름</th>
        <th>가격</th>
        <th>이미지 주소</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><% out.print(m.getMenu()); %></td>
        <td><% out.print(m.getPrice()); %></td>
        <td><% out.print(m.getImg()); %></td>
      </tr>
    </tbody>
  </table>
  
	<h3>추천 메뉴의 이미지</h2>
	<img alt="잘못된 주소 이미지입니다." src="<% out.print(m.getImg()); %>">
	<p>계산기</p>
	<form action ="action_best.jsp">
	<% %>
	사람 수 입력 : 
	<input type = "number" name ="num1">
	<input type = "number" name = "num2" value =<%=m.getPrice() %> readonly>
	<button type = "submit">계산하기</button>	
	</form><br>
	<button  type="button" onclick=" location.href='best.menu'">다시 추천</button> 
	
</div>
	
	
</body>
</html>

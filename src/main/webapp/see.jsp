<%@page import="dto.Menu"%>
<%@page import="java.util.List"%>
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
  <h2>메뉴 보기</h2>
  <p>메뉴 머먹?</p>            
  <table class="table table-bordered">
    <thead>
      <tr>
        <th><center>메뉴 이름</center></th>
        <th>가격</th>
        <th><center>이미지 주소</center></th>
        <th><center>수정</center></th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
    <%
  //SeeServlet에서 셋팅한 데이터 여기서 가지고 오기
  	List<Menu> list = (List<Menu>)request.getAttribute("menuList"); // (List<Menu>) 강제 형변환
    for(Menu m : list){ %>
      <tr>
        <td><% out.println(m.getMenu()); %></td>
        <td><% out.println(m.getPrice()); %></td>
        <td><a href = "<% out.println(m.getImg()); %>"><% out.println(m.getImg()); %></a></td>
      	<td><a href="update.jsp?id=<%=m.getId() %>&menu=<%=m.getMenu() %>&price=<%=m.getPrice() %>">수정</a></td>
        <td><a href="del.jsp?id=<%=m.getId() %>&menu=<%=m.getMenu() %>">삭제</a></td>
      </tr>
      <% } %>
    </tbody>
  </table>
</div>

</body>
</html>

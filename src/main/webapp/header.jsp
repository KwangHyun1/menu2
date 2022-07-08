<%@page import="dto.TbUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 세션 정보 받아오기
	TbUser dto = (TbUser)session.getAttribute("user");
	// 세션에 정보가 있으면 메뉴 넣기가 보여야되고 로그인 -> 로그아웃
	// 세연에 정보가 없으면 메뉴 넣기는 안보이고 로그인 버튼

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="/">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJrNqV6364uIVvqjVI6qn3AEevxwcZWJzXdA&usqp=CAU" alt="logo" style="width:50px;">
  </a>
  
  <!-- Links -->
  <ul class="navbar-nav">
    
    <% if (dto != null){%>
    <li class="nav-item">
      <a class="nav-link" href="/insert.menu">메뉴 넣기</a>
    </li>
    <%}else{ %>
    <li class="nav-item">
      <a class="nav-link" href="#" onclick ="alert('로그인을 하세요.')">메뉴 넣기</a>
    </li>
    <%} %>
    <li class="nav-item">
      <a class="nav-link" href="/see.menu">메뉴 보기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/best.menu">메뉴 추천</a>
    </li>
  
  
  <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        메뉴
      </a>
      <% if (dto == null){%>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="login.menu">로그인</a>
        <a class="dropdown-item" href="#">회원가입</a>
      </div>
      <%} else{%>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="logout.menu">로그아웃</a>
      </div>
       <%} %>
    </li>
    </ul>
</nav>
</body>
</html>
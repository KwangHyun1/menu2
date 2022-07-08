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

<br>

<div class="container">
  <h2>로그인</h2>
  <form action="/login.menu" method="post">
    <div class="form-group">
      <label for="userID">아이디:</label>
      <input type="text" class="form-control" id="userID" placeholder="아이디 입력" name="userID">
    </div>
    <div class="form-group">
      <label for="password">비밀번호:</label>
      <input type="Password" class="form-control" id="password" placeholder="비밀번호 입력" name="password">
    </div>

    <button type="submit" class="btn btn-primary">로그인 입력</button>
  </form>
      <br><button type="button" class="btn btn-primary" onClick="location.href='#'">회원가입</button>
</div>

</body>
</html>

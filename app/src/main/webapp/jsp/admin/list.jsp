<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
<table border='1'>
<thead>
<tr>
<th>아이디</th> <th>닉네임</th> <th>이름</th> <th>이메일</th> <th>전화번호</th> <th>가입일</th> <th>처리</th>
</tr>
</thead>
<tbody>
<c:forEach items="${list}" var="m">
<form method="post">
<c:if test="${m.role == 1}">
<tr>
  <td>${m.id}</td>
  <td>${m.nick}</td>
  <td>${m.name}</td>
  <td>${m.email}</td>
  <td>${m.tel}</td>
  <td>${m.registeredDate}</td>
  <td><a href='memberdelete?no=${m.no}'>강제 탈퇴</a></td>
</tr>
</c:if>
</c:forEach>
</form>
</tbody>
</table>
</body>
</html>
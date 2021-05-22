<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>스토리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<style>
  .container {
    border: 1px solid lightgray;
    width: 800px;
    margin: 0px auto;
  }
</style>
</head>
<body>
<div class="container">
<h1>스토리</h1>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
  <li class="nav-item">
    <a href='../main' class="btn" style="background-color: #FFADAD;">메인</a>
    <a href='add' class="btn" style="background-color: #FFADAD;">새 글</a>
    </li>
    </ul>
    <form class="d-flex">
      <input class="form-control me-2" type="search" name="keyword" value='${param.keyword}' placeholder="검색" aria-label="검색">
      <button class="btn btn-outline-success col-sm-3" type="submit">검색</button>
    </form>
  </div>
</nav>

<table class="table table-hover">
<thead>
<tr>
<th>번호</th> <th>제목</th> <th>사이트</th> <th>등록일</th> <th>스크랩</th>
</tr>
</thead>

<tbody>
<c:forEach items="${storys}" var="s">
<tr> 
  <td>
  <c:if test="${loginUser.id eq 'admin'}">
  <a href='detail?no=${s.no}'>${s.no}</a>
  </c:if>
  <c:if test="${loginUser.id ne 'admin'}">
  ${s.no}
  </c:if>
  </td> 
  <td><a href='${s.url}'>${s.title}</a></td> 
  <td>${s.site}</td> 
  <td>${s.registeredDate}</td> 
  <td>
  <c:if test="${loginUser ne null}">
    <form action='scrapadd' method='get'>
      <input type='hidden' name='newsNo' value ='${s.no}'>
      <input type='submit' value ='스크랩'>
    </form>
  </c:if>
  <%-- <form action='scrapadd' method='get'>
   <c:forEach items="${scrapList}" var="scrap">
    <c:forEach items="${storys}" var="s">
      <c:if test="${scrap.story.no eq story.no}">
        <input type='hidden' name='newsNo' value ='${s.no}'>
        <input type='submit' value ='스크랩'>
      </c:if>
      </c:forEach>
    </c:forEach>
   </form>
   <form action='scrapdelete' method='get'>
     <c:forEach items="${scrapList}" var="scrap">
     <c:forEach items="${storys}" var="s">
       <c:if test="${scrap.story.no ne story.no}">
         <input type='hidden' name='newsNo' value ='${s.no}'>
         <input type='submit' value ='스크랩취소'>
       </c:if>
     </c:forEach>
     </c:forEach> 
   </form> --%>
  </td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</body>
</html>
    
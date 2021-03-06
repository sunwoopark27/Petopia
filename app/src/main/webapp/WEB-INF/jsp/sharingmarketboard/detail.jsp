<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../css/layout.css">
<link rel="stylesheet" type="text/css" href="../../css/detailboard.css">
<title>나눔장터 게시글 상세</title>
<style>
a{
text-decoration:none
}
</style> 
</head>
<body>
<header id="header"></header>

<div class="wrap">
<img src="/web/images/smarket.jpg" class="img-fluid width:100%;"
style="filter:alpha(opacity=60); opacity:0.6; -moz-opacity:0.6;">
  <div class="text-group">
    <p style="font-size: 50px;">나눔장터</p>
    <p style="font-size: 30px;">추억을 나누는 나눔 장터</p>
    <p>사용하지 않는 반려동물 용품을<br>
    버리지 말고 동네 친구들에게 나눠 보세요</p>
  </div>
</div>

<div class="container">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
  <li class="nav-item">
    <a href='../sharingmarketboard/list' class="btn" style="background-color: #FFADAD;">목록</a>
    </li>
    </ul>
  </div>
</nav>

<div style="margin-top:30px;">
<c:if test="${not empty smb}">
<table border='1' id="detailTable" class="detail-table" style="margin-bottom: 15px">
<tbody>
   <tr class = "board-title">
       <td colspan = "8"><h1>${smb.title}</h1></td>
   </tr>  
       <tr><th>분류</th>
          <td>${smb.category.name}</td>
          <th>작성자</th>
          <c:if test="${smb.writer.state == 1}">
            <td>탈퇴 회원</td>
          </c:if>
          <c:if test="${smb.writer.state == 0}">
            <td>${smb.writer.nick}</td>
          </c:if>
          <td colspan = "2"></td>
        </tr>
         <tr id="recomentCount">
          <th>조회수</th>
          <td>${smb.viewCount}</td>
          <th>등록일</th>
          <td>${smb.createdDate}</td>
        </tr>
          <tr>
          <td colspan="8"><span class="content">${smb.content}</span></td>
        </tr>
<tr>
<c:if test="${not empty photList}">
<td colspan="5"><c:forEach items="${photList}" var="p">
<div>
  <c:if test="${not empty p.sharingmarketboard.no and smb.no == p.sharingmarketboard.no}">
    <c:set var="photoUrl">../../upload/${p.photo}_700x700.jpg</c:set>
    <img class="photo" src='${photoUrl}' style= "align-items: center;">
  </c:if>
  <c:if test="${empty p.sharingmarketboard.no}">
    <c:set var="photoUrl">../../images/person_80x80.jpg</c:set>
    <img src='${photoUrl}'>
  </c:if>
</div>
</c:forEach></td>
  </c:if>
 </tr>
 <c:if test="${not empty loginUser and loginUser.no == smb.writer.no}">
  <tr>
    <td colspan='2'>
      <a href='update?no=${smb.no}' class="button" style="item-align: center; color: #323232; background: #ededed; border: 0px;">변경</a>
      <a href='delete?no=${smb.no}' class="button"  style="item-align: center; color: #323232; background: #ededed; border: 0px;">삭제</a>
    </td>
  </tr>
  </c:if>
</tbody>
</table>
  </c:if>
  
<c:if test="${empty smb}">
<p>해당 번호의 게시글이 없습니다.</p>
</c:if>

<jsp:include page="/WEB-INF/jsp/sharingmarketboardcomment/list.jsp" />


<c:if test="${not empty loginUser}">
<form action='/sharingmarketboardcomment/add' method='post'>
<input id="detail-add-no" type='hidden' name='no' value='${smb.no}'>
<table class="detail-add-table">
<tr>
<td><textarea id="detail-add-comment" name='content' rows='2' cols='80'></textarea></td>
<td><input id="detail-add-comment-btn" type="button" value='등록'></td></tr>
  </table>
  </form>
  </c:if>
  
  <a href='list' class="btn" style="background-color: #FFADAD;">목록</a>
</div>
</div>
<script>
"use strict"

$("#detail-add-comment-btn").click(function() {
	var content = $("#detail-add-comment").val();
	var no = $("#detail-add-no").val();
	var xhr = new XMLHttpRequest();
    xhr.open("POST","../sharingmarketboardcomment/add",true);
    xhr.onreadystatechange = () => {
        if (xhr.readyState == 4) {
          if (xhr.status == 200) {
              if(content ==""){
                  alert("댓글내용을 입력해주세요.");
                   return;
                }
                  console.log(content);
                  alert("댓글을 등록했습니다.");
                  window.location.href= "../sharingmarketboard/detail?no="+no;
              } else {
            alert("요청오류 : " + xhr.status);
            }
          }
      };
      var params = "no="+no+"&content="+encodeURIComponent(content);
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      xhr.send(params);
  }); 


</script>
<footer></footer>
<script>
$(document).ready(function() {
    $("header").load("../../html/header.jsp");
    $("footer").load("../../html/footer.html");
  });
</script>
</body>
</html>


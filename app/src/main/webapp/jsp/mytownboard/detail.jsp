<%@page import="com.pms.petopia.domain.MyTownBoard"%>
<%@page import="com.pms.petopia.domain.SmallAddress"%>
<%@page import="java.util.List"%>
<%@ page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 상세</title>
</head>
<body>
<%
int stateNo= Integer.parseInt(request.getParameter("stateNo"));
int cityNo = Integer.parseInt(request.getParameter("cityNo"));
int no = Integer.parseInt(request.getParameter("no"));
%>
<jsp:useBean id="smallAddresses" type = "List<SmallAddress>" scope = "request"/>
<jsp:useBean id="myTownBoard" type = "com.pms.petopia.domain.MyTownBoard" scope = "request"/>
<h1><%=myTownBoard.getBigAddress().getName()%>&nbsp;<%=myTownBoard.getSmallAddress().getName()%></h1>
<h2>게시글 상세보기</h2>
<form action='update' method='post'><table border='1'>
<tbody>
<tr><th>광역시/도</th> 
<td><select name ='stateNo'>
<%
for(SmallAddress s : smallAddresses) {
%>
<option value='<%=s.getBigAddress().getNo()%>' <%=s.getBigAddress().getNo() == myTownBoard.getBigAddress().getNo() ?  "selected" : ""%>><%=s.getBigAddress().getName()%></option>
<%
}
%>
</select>
시/군/구 : 
<select name='cityNo'>
<%
for(SmallAddress s : smallAddresses) {
%>
<option value='<%=s.getNo()%>' <%=s.getNo() == myTownBoard.getNo() ? "selected" : "" %>><%=s.getName()%></option>
<%
}
%>
</select></td></tr>

<tr><th>번호</th> <td><input type='text' name='no' value='<%=%>'readonly></td></tr>
<tr><th>제목</th> <td><input name='title' type='text' value='안녕'></td></tr>
<tr><th>내용</th> <td><textarea name='content' rows='10'>하세요</textarea></td></tr>
<tr><th>작성자</th> <td>abc</td></tr>
<tr><th>등록일</th> <td>2021-05-12 00:00:00</td></tr>
<tr><th>조회수</th> <td>77</td></tr>
</tbody>
</table>
</form><a href='list?stateNo=1&cityNo=1'>목록</a></p>
<br>
<table border='1'>
<tbody>
<tr><th>작성자</th><td>aaa</td>
<th>작성일</th><td>2021-05-17</td></tr>
<tr><th>내용</th><td>오호라</td></tr><a href='../mytowncomment/delete?no=6'> 삭제</a>  <br>
</tbody>
</table>
<br>



<table border='1'>
<tbody>
<tr><th>작성자</th><td>abc</td>
<th>작성일</th><td>2021-05-17</td></tr>
<tr><th>내용</th><td>히히</td></tr><a href='../mytowncomment/delete?no=7'> 삭제</a>  <br>
</tbody>
</table>
<br>
<table border='1'>
<tbody>
<tr><th>작성자</th><td>abc</td>
<th>작성일</th><td>2021-05-17</td></tr>
<tr><th>내용</th><td>zzz</td></tr><a href='../mytowncomment/delete?no=8'> 삭제</a>  <br>
</tbody>
</table>
<br>
댓글 수 :3
<form action='http://localhost:8080/web/mytowncomment/add' method='post'>
<input type='hidden' name='boardNo' value='3'> <br>
댓글: <textarea name='content' rows='1' cols='30'></textarea><br>
<input type='submit' value='등록'>
</form>
</body>
</html>
</body>
</html>

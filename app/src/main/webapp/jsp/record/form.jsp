<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진찰 기록</title>
</head>
<body>
<h1>진찰 기록</h1>
<form action="add" method="post" enctype="multipart/form-data">
기록 : <input type="text" name="record"><br>
<input type="submit" value="등록하기">
</form>
<form action="../main">
<input type="submit" value="뒤로가기">
</body>
</html>
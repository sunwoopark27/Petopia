<%@ page language="java" 
  contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
  trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<link href="css/common.css" rel="stylesheet" >
<style>
  #login-form {
    width: 500px;
    margin: 50px auto;
  }
</style>
</head>
<body>
<div class="container">
<div id="login-form">
<h1>Petopia 로그인</h1>
<form method='post'>
  <div class="mb-3 row">
    <label for="id" class="col-sm-3 col-form-label">아이디/이메일</label>
    <div class="col-sm-9">
      <input type="id" class="form-control form-control-sm" id="id" name="id" value='${cookie.id.value}' placeholder="아이디 또는 이메일을 입력하세요.">
    </div>
  </div>
  <div class="mb-3 row">
    <label for="password" class="col-sm-3 col-form-label">암호</label>
    <div class="col-sm-9">
      <input type="password" class="form-control form-control-sm" id="password" name="password" placeholder="비밀번호를 입력하세요.">
    </div>
  </div>
  <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" id="saveIdOrEmail" name="saveIdOrEmail">
    <label class="form-check-label" for="saveEmail">ID/Email 저장</label>
  </div>
<button class="btn btn-primary btn-sm">로그인</button>
</form>
</div>
</div>
</body>
</html>

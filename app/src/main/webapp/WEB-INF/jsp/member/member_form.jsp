<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
	crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="/web/css/common.css">
<link rel="stylesheet" type="text/css" href="/web/css/layout.css">
</head>
<body>
	<header></header>
	<div class="wrap">
		<img src="/web/images/mypage.jpg"
			class="img-fluid width:100%;"
			style="filter: alpha(opacity = 60); opacity: 0.6; -moz-opacity: 0.6;">
		<div class="text-group">
			<p style="font-size: 50px;">펫토피아</p>
			<p style="font-size: 30px;">우리 아이들의 이야기</p>
			<p>
				동네 커뮤니티로 정보를 나누고, 수다 떨며<br> 같이 산책할 내 반려동물의 친구를 사귀어 보세요
			</p>
		</div>
	</div>

	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand">Petopia 회원 가입</a>
		</nav>
		<div class="addform">
			<form action="add" method="post">
				<div class="mt-3 mb-3 row">
					<label for="name" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-6">
						<input type="text" required class="form-control form-control-sm"
							id="name" name="name" placeholder="이름" maxlength='15'>
					</div>
				</div>
				<div class="mb-3 row">
					<label for="id" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-6">
						<input type="text" class="form-control form-control-sm" id="id"
							name="id" placeholder="아이디" required oninput="checkId()" maxlength='20'>
						<div id="idLength" style="display: none">영문/숫자 6자 이상 입력하세요.</div>
						<div id="idCheck" style="display: none">이미 사용 중인 ID 입니다.</div>
					</div>
				</div>
				<div class="mb-3 row">
					<label for="email" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-6">
						<input type="email" required class="form-control form-control-sm"
							id="email" name="email" placeholder="이메일" oninput="checkEmail()" maxlength='40'>
						<div id="emailPattern" style="display: none">이메일 형식이 아닙니다.</div>
						<div id="emailCheck" style="display: none">이미 사용 중인 E-mail
							입니다.</div>
					</div>
				</div>
				<div class="mb-3 row">
					<label for="nick" class="col-sm-2 col-form-label">닉네임</label>
					<div class="col-sm-6">
						<input type="text" required class="form-control form-control-sm"
							id="nick" name="nick" placeholder="닉네임" oninput="checkNick()" maxlength='10'>
						<div id="nickLength" style="display: none">2자 이상 입력하세요.</div>
						<div id="nickCheck" style="display: none">이미 사용 중인 닉네임 입니다.</div>
						<div id="nickPattern" style="display: none">한글 자음/모음 입력은
							허용되지 않습니다.</div>
					</div>
				</div>
				<div class="mb-3 row">
					<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-6">
						<input type="password" required
							class="form-control form-control-sm" id="password"
							name="password" placeholder="비밀번호" oninput="checkOriginalPwd()" maxlength='20'>
						<div id="pwdLength" style="display: none">8자 이상 입력하세요.</div>
					</div>
				</div>

				<div class="mb-3 row">
					<label for="password" class="col-sm-2 col-form-label">비밀번호
						확인</label>
					<div class="col-sm-6">
						<input type="password" placeholder="비밀번호 확인" name="checkPassword"
							required class="form-control form-control-sm" id="checkPassword" oninput="checkRepeatedPwd()" maxlength='20'>
						<div id="pwdSame" style="display: none">비밀번호가 일치하지 않습니다.</div>
					</div>
				</div>

				<div class="mb-3 row">
					<label for="tel" class="col-sm-2 col-form-label">휴대전화</label>
					<div class="col-sm-6">
						<input type="tel" required class="form-control form-control-sm" id="tel" name="tel" placeholder="휴대전화 입력" oninput="checkTel()" maxlength='11'>
						<div id="telCheck" style="display: none">(-)없이 11자리 입력하세요.</div>
						<div id="sameTel" style="display: none">이미 사용 중인 번호입니다.</div>
						<br> <input type="button" id="sendNumber" name="auth" value="인증번호 요청">
					</div>
				</div>

				<div class="mb-3 row">
					<label for="tel" id="authenticationLabel" style="display: none" class="col-sm-2 col-form-label">번호 인증</label>
					<div class="col-sm-6">
						<input type="tel" style="display: none" required class="form-control form-control-sm" id="authenticationNumber" name="authenticationNumber" placeholder="인증번호 입력" maxlength='6'> 
							<br>
							<input type="button" style="display: none" id="authenticationButton" name="authenticationButton" value="확인">
					</div>
				</div>

				<div class="modal-footer justify-content-between">
					<a href='../main' class="btn btn-secondary">메인</a>

					<button type="button" class="cancelbtn">초기화</button>

					<button type="submit" class="btn"
						style="background-color: #aaaaaa;" disabled="disabled">가입하기</button>
				</div>

			</form>

		</div>
	</div>

	<footer></footer>

	<script>
		var idCheck = 0;
		var pwdCheck = 0;
		var repeatedPwdCheck = 0;
		var emailCheck = 0;
		var nickCheck = 0;
		var telCheck = 0;
		var sameTel = 0;
		var authenticationCheck = 0;
		var tempNumber = 0;
		var confirmNumber = 0;
		var idValidator = /^[A-za-z0-9]{6,15}/g;
		var emailValidator = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,3}$/;
		var nickValidator = /([^가-힣\x20a-zA-Z0-9])/i;
		var telValidator = /^[0-9]*$/;

		function checkId() {
			var userId = $('#id').val();
			$.ajax({
						url : "checkid",
						data : {
							id : userId
						},
						success : function(data) {
							if (userId == "" && data == '0') {
								$(".btn").prop("disabled", true);
								$(".btn").css("background-color", "#aaaaaa");
								$("#id").css("background-color", "#FFCECE");
								$("#idLength").show();
								$("#idCheck").hide();
								idCheck = 0;
							} else if (data == '0'
									&& userId.match(idValidator) == null) {
								$(".btn").prop("disabled", true);
								$(".btn").css("background-color", "#aaaaaa");
								$("#id").css("background-color", "#FFCECE");
								$("#idLength").show();
								$("#idCheck").hide();
								idCheck = 0;
							} else if (data == '0') {
								$("#id").css("background-color", "#B0F6AC");
								$("#idLength").hide();
								$("#idCheck").hide();
								idCheck = 1;
						        if (idCheck == 1 && pwdCheck == 1 && repeatedPwdCheck == 1 && emailCheck == 1
						                && nickCheck == 1 && telCheck == 1 && authenticationCheck == 1) {
									$(".btn").prop("disabled", false);
									$(".btn")
											.css("background-color", "#FFADAD");
									nameCheck();
								}
							} else if (data == '1') {
								$(".btn").prop("disabled", true);
								$(".btn").css("background-color", "#aaaaaa");
								$("#id").css("background-color", "#FFCECE");
								$("#idLength").hide();
								$("#idCheck").show();
								idCheck = 0;
							}
						}
					});
		}
		function checkEmail() {
			var userEmail = $('#email').val();
			$.ajax({
				url : "checkemail",
				data : {
					email : userEmail
				},
				success : function(data) {
					if (userEmail == "" && data == '0') {
						$(".btn").prop("disabled", true);
						$(".btn").css("background-color", "#aaaaaa");
						$("#email").css("background-color", "#FFCECE");
						$("#emailPattern").show();
						$("#emailCheck").hide();
						emailCheck = 0;
					} else if (data == '0'
							&& userEmail.match(emailValidator) == null) {
						$(".btn").prop("disabled", true);
						$(".btn").css("background-color", "#aaaaaa");
						$("#email").css("background-color", "#FFCECE");
						$("#emailPattern").show();
						$("#emailCheck").hide();
						emailCheck = 0;
					} else if (data == '0') {
						$("#email").css("background-color", "#B0F6AC");
						$("#emailPattern").hide();
						$("#emailCheck").hide();
						emailCheck = 1;
				        if (idCheck == 1 && pwdCheck == 1 && repeatedPwdCheck == 1 && emailCheck == 1
				                && nickCheck == 1 && telCheck == 1 && authenticationCheck == 1) {
							$(".btn").prop("disabled", false);
							$(".btn").css("background-color", "#FFADAD");
							nameCheck();
						}
					} else if (data == '1') {
						$(".btn").prop("disabled", true);
						$(".btn").css("background-color", "#aaaaaa");
						$("#email").css("background-color", "#FFCECE");
						$("#emailPattern").hide();
						$("#emailCheck").show();
						emailCheck = 0;
					}
				}
			});
		}
		function checkNick() {
			var userNick = $('#nick').val();
			$.ajax({
				url : "checknick",
				data : {
					nick : userNick
				},
				success : function(data) {
					if (userNick == "" && data == '0') {
						$(".btn").prop("disabled", true);
						$(".btn").css("background-color", "#aaaaaa");
						$("#nick").css("background-color", "#FFCECE");
						$("#nickLength").show();
						$("#nickCheck").hide();
						$("#nickPattern").hide();
						nickCheck = 0;
					} else if (data == '0'
							&& userNick.match(nickValidator) != null) {
						$(".btn").prop("disabled", true);
						$(".btn").css("background-color", "#aaaaaa");
						$("#nick").css("background-color", "#FFCECE");
						$("#nickLength").hide();
						$("#nickCheck").hide();
						$("#nickPattern").show();
						nickCheck = 0;
					} else if (data == '0' && userNick.length < 2) {
						$(".btn").prop("disabled", true);
						$(".btn").css("background-color", "#aaaaaa");
						$("#nick").css("background-color", "#FFCECE");
						$("#nickLength").show();
						$("#nickCheck").hide();
						$("#nickPattern").hide();
						nickCheck = 0;
					} else if (data == '0') {
						$("#nick").css("background-color", "#B0F6AC");
						$("#nickLength").hide();
						$("#nickCheck").hide();
						$("#nickPattern").hide();
						nickCheck = 1;
				        if (idCheck == 1 && pwdCheck == 1 && repeatedPwdCheck == 1 && emailCheck == 1
				                && nickCheck == 1 && telCheck == 1 && authenticationCheck == 1) {
							$(".btn").prop("disabled", false);
							$(".btn").css("background-color", "#FFADAD");
							nameCheck();
						}
					} else if (data == '1') {
						$(".btn").prop("disabled", true);
						$(".btn").css("background-color", "#aaaaaa");
						$("#nick").css("background-color", "#FFCECE");
						$("#nickLength").hide();
						$("#nickCheck").show();
						$("#nickPattern").hide();
						nickCheck = 0;
					}
				}
			});
		}

		function checkTel() {
			var userTel = $('#tel').val();
			 $.ajax({
			        url : "checktel",
			        data : {
			          tel : userTel
			        },
			        success : function(data) {
			if (data == "0" && userTel.length < 9) {
				$("#tel").css("background-color", "#FFCECE");
				$("#telCheck").show();
				$("#sameTel").hide();
				telCheck = 0;
				}
			 else if (data == "0" && userTel.length > 10) {
				$("#telCheck").hide();
				$("#sameTel").hide();
				telCheck = 1;
		        	$("#tel").css("background-color", "#B0F6AC");
		        if (idCheck == 1 && pwdCheck == 1 && repeatedPwdCheck == 1 && emailCheck == 1
		                && nickCheck == 1 && telCheck == 1 && authenticationCheck == 1) {
					$(".btn").prop("disabled", false);
					$(".btn").css("background-color", "#FFADAD");
					nameCheck();
				}
			}
			else if(data == "1") {
				telCheck = 0;
				$("#tel").css("background-color", "#FFCECE");
				$("#sameTel").show();
				$("#telCheck").hide();
			}
			        }
			});
		}

		function checkOriginalPwd() {
			var originalPassword = $('#password').val();
			if (originalPassword == '' || originalPassword.length < 8) {
				$("#password").css("background-color", "#FFCECE");
				$("#pwdLength").show();
		    $(".btn").prop("disabled", true);
		    $(".btn").css("background-color", "#aaaaaa");
		    pwdCheck = 0;
				
			} else {
				$("#password").css("background-color", "#B0F6AC");
				$("#pwdLength").hide();
				pwdCheck = 1;
		        if (idCheck == 1 && pwdCheck == 1 && repeatedPwdCheck == 1 && emailCheck == 1
		                && nickCheck == 1 && telCheck == 1 && authenticationCheck == 1) {
		    $(".btn").prop("disabled", false);
		    $(".btn").css("background-color", "#FFADAD");
				}
			}
		}

		function checkRepeatedPwd() {
			var originalPassword = $('#password').val();
			var repeatedPassword = $('#checkPassword').val();
			if (repeatedPassword == "" && (originalPassword != repeatedPassword || originalPassword == repeatedPassword)) {
				repeatedPwdCheck = 0;
				$(".btn").prop("disabled", true);
				$(".btn").css("background-color", "#aaaaaa");
				$("#checkPassword").css("background-color", "#FFCECE");
				$("#pwdSame").show();
			} 
			 else if (originalPassword == repeatedPassword) {
				$("#checkPassword").css("background-color", "#B0F6AC");
				$("#pwdSame").hide();
				repeatedPwdCheck = 1;
				if (idCheck == 1 && pwdCheck == 1 && repeatedPwdCheck == 1 && emailCheck == 1
						&& nickCheck == 1 && telCheck == 1 && authenticationCheck == 1) {
					$(".btn").prop("disabled", false);
					$(".btn").css("background-color", "#FFADAD");
					nameCheck();
				}
			} else if (originalPassword != repeatedPassword) {
				repeatedPwdCheck = 0;
				$(".btn").prop("disabled", true);
				$(".btn").css("background-color", "#aaaaaa");
				$("#checkPassword").css("background-color", "#FFCECE");
				$("#pwdSame").show();

			}
		}
		function nameCheck() {
			var name = $("#name").val();
			if (name == "") {
				$(".btn").prop("disabled", true);
				$(".btn").css("background-color", "#aaaaaa");
			}
		}

		$(".cancelbtn").click(function() {
			$("#name").val('');
			$("#id").val('');
			$("#email").val('');
			$("#nick").val('');
			$("#password").val('');
			$("#checkPassword").val('');
			$("#tel").val('');
			$("#authenticationNumber").val('');
			$(".btn").prop("disabled", true);
			$(".btn").css("background-color", "#aaaaaa");
			$("#id").css("background-color", "#FFFFFF");
			$("#email").css("background-color", "#FFFFFF");
			$("#nick").css("background-color", "#FFFFFF");
			$("#password").css("background-color", "#FFFFFF");
			$("#checkPassword").css("background-color", "#FFFFFF");
			$("#nickLength").hide();
			$("#nickCheck").hide();
			$("#nickPattern").hide();
			$("#emailPattern").hide();
			$("#emailCheck").hide();
			$("#idLength").hide();
			$("#idCheck").hide();
			$("#pwdLength").hide();
			$("#pwdSame").hide();
			$("#telCheck").hide();
			$("#authenticationButton").hide();
		  $("#authenticationNumber").hide();
		  $("#authenticationLabel").hide();
		  $("#tel").prop("disabled", false);
		});

		$('#sendNumber').click(function() {
			$("#authenticationButton").show();
			$("#authenticationNumber").show();
		  $("#authenticationLabel").show();
			
		  swal("인증 번호 전송", "인증 번호를 입력해주세요.", "info", { button: "확인" });
		  
			var phoneNumber = $('#tel').val();
			$.ajax({
				url : "checknumber",
				data : {
					tel : phoneNumber
				},
				success : function(response) {
					confirmNumber = response;
				}
			})
		});

		$('#authenticationButton').click(function() {
			tempNumber = $('#authenticationNumber').val();
			if (confirmNumber == tempNumber) {
				authenticationCheck = 1;
				swal("인증 성공", "회원 가입이 가능합니다.", "success", { button: "확인"});
				
				
		        if (idCheck == 1 && pwdCheck == 1 && repeatedPwdCheck == 1 && emailCheck == 1
		                && nickCheck == 1 && telCheck == 1 && authenticationCheck == 1) {
				          $(".btn").prop("disabled", false);
				          $(".btn").css("background-color", "#FFADAD");
				          nameCheck();
				  }

			} else {
				authenticationCheck = 0;
				$(".btn").prop("disabled", true);
        $(".btn").css("background-color", "#aaaaaa");
				swal("인증 실패", "다시 인증 해주세요.", "error", { button: "확인"});
			}
		});
		
		$(document).ready(function() {
		    $("header").load("/web/html/header.jsp");
		    $("footer").load("/web/html/footer.html");
		  });
	</script>

</body>
</html>
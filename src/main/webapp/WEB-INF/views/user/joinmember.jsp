<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<h1 class="text-primary">회원가입창</h1>
	
	<form method="post" action="/user/joinmember">
		아이디 : <input type="text" id="uid" name="uid" placeholder="ID" /><button type="button" id="idChk">중복체크</button><br>
		<div id="check">
			
		</div>
		비밀번호 : <input type="password" name="upw" placeholder="PW" /><br>
		닉네임 : <input type="text" name="uname" placeholder="NAME" /><br>
		<div id="join"></div>
		<input type="reset" value="재입력">
	</form>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#idChk").on("click", function() {
				var uid = $("#uid").val();
				
				if($.trim(uid) === "") {
					alert("아이디를 입력해주세요.");
					return;
				}
				
				console.log(uid);
				
				$.ajax({
					type : 'post',
					url : '/chk/' + uid,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'text',
					success : function(result) {
						var jsonResult = null;
						if(result !== "") {
							jsonResult = JSON.parse(result);
						}
						if(jsonResult !== null) {
							//중복o
							$("#check").html("*이미 존재하는 아이디입니다.");
						} else {
							//중복x
							$("#check").html("");
							$("#uid").attr("readonly", "readonly");
							$("#join").html("<button type='submit'>회원가입</button>");
						}
					},
					error : function(result) {
						console.log("에러발생");
					}
				});//ajax
			});//idChk
			
		});//ready
	</script>
</body>
</html>
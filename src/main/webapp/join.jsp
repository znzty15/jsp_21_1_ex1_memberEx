<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
<script language="JavaScript" src="members.js" charset="UTF-8"></script>
</head>
<body>
	<h3>회원가입을 위하여 아래 내용을 작성 후 회원가입 버튼을 눌러주세요</h3>
	<form action="joinOk.jsp" method="post" name="reg_frm">
		아이디 : <input type="text" name="id" size="20"><br>
		비밀번호 : <input type="password" name="pw" size="20"><br>
		비밀번호 확인: <input type="password" name="pw_check" size="20"><br>
		이름: <input type="text" name="name" size="20"><br>
		이메일: <input type="text" name="email" size="30"><br>
		주소: <input type="text" name="addr" size="60"><br>
		<input type="button" value="회원가입" onclick="infoConfirm()">
		<input type="reset" value="취소" onclick="javascript:window.location='login.jsp'">	
	</form>
</body>
</html>
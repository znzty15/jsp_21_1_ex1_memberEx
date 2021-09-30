<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout.jsp</title>
</head>
<body>
	<%
		String name = (String)session.getAttribute("name");	
	%>
	<h3><%= name %>님 로그아웃 되셨습니다.</h3>
	
	<%
		session.invalidate();//모든 세션이 삭제	
	%>
	<a href ="login.jsp">회원 로그인</a>
</body>
</html>

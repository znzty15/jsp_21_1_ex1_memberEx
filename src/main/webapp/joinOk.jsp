<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.javaGG.ex.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="com.javaGG.ex.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinOk.jsp</title>
</head>
<body>
	<%
	//String idr = dto.getId();
	//out.println(idr);
	MemberDAO dao = new MemberDAO();
	int ri = dao.insertMember(dto);
	if(ri == 1)
		out.println("회원가입을 축하합니다.");	
	%>		
</body>
</html>
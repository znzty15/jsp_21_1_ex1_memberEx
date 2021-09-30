<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.javaGG.ex.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="com.javaGG.ex.MemberDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyOk.jsp</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
		dto.setId(id);
	
		MemberDAO dao = MemberDAO.getInstance();
		// MemberDAO dao = new MemberDAO();
		int ri = dao.updateMember(dto);
		
		if(ri==1){
	%>
		<script language="javascript">
			alert("회원정보수정이 완료되었습니다.");
			document.location.href="main.jsp"
		</script>
	<%	
		} else {
	%>
		<script language="javascript">
			alert("회원정보수정이 실패하였습니다.");
			history.go(-1);
		</script>
	<%	
		}
	%>	
</body>
</html>
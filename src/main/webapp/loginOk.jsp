<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.javaGG.ex.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginOk.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		int checkuser = dao.userCheck(id, pw);
		
		if(checkuser == -1){ //아이디 없음
	%>	
			<!-- html 영역 시작-->
			<script language = "javascript">
				alert("입력하신 ID는 존재하지 않는 ID입니다.");
				history.back();
			</script>
			<!-- html 영역 끝-->
	<%
		}else if(checkuser == 0){ //비밀번호 틀림
	%>	
			<!-- html 영역 시작-->
			<script language = "javascript">
				alert("비밀번호가 일치하지 않습니다. 확인 후 다시 입력해주세요.");
				history.back();
			</script>
			<!-- html 영역 끝-->
	<%
		}else if(checkuser == 1){ // 로그인 성공
			String name = dao.getMemberName(id);
			session.setAttribute("name", name);
			response.sendRedirect("main.jsp");
		}	
	%>
</body>
</html>
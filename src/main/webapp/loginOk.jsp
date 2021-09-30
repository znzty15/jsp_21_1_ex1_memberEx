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
		int checkNum = dao.userCheck(id, pw);
		
		if (checkNum == -1) { // 아이디 없음
	%>			
			<script language="javascript">
				alert("입력하신 ID는 존재하지 않는 ID입니다.");
				history.back();
			</script>
	<%	
			
		} else if(checkNum == 0) { // 비번 틀림
	%>			
			<script language="javascript">
				alert("비밀번호가 틀립니다. 다시 확인 후 입력해주세요.");
				history.back();
			</script>
	<%	
		} else if(checkNum == 1 ) { //로그인 성공
			MemberDTO dto = dao.getMember(id);//dto 객체에 모든 회원정보가 저장됨
			String name = dto.getName();
			String uid = dto.getId();
			session.setAttribute("name", name);
			session.setAttribute("id", uid);
			session.setAttribute("ValidMem", "yes");//로그인 유효한 회원 판별값
			response.sendRedirect("main.jsp");
		}
	
	%>
</body>
</html>
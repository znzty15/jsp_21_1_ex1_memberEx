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
	//String id = dto.getId();
	//out.println(idr);
	MemberDAO dao = new MemberDAO();
	if(dao.confirmId(dto.getId()) == MemberDAO.MEMBER_EXITSTMENT){
	%>	
		<!-- html 영역 시작-->
		<script language = "javascript">
			alert("입력하신 아이디가 이미 존재합니다.");
			history.back();
		</script>
		<!-- html 영역 끝-->
	<%
	}else {
		int ri = dao.insertMember(dto);// ri값 반환성공시 1 실패 0
		if(ri == MemberDAO.MEMBER_JOIN_SUCCESS){
			session.setAttribute("id", dto.getId());
	%>	
		<!-- html 영역 시작-->
		<script language = "javascript">
			alert("회원가입을 축하합니다. 로그인을 해주세요.");
			document.location.href="login.jsp";
		</script>
		<!-- html 영역 끝-->
	<%
		}else{
	%>	
			<!-- html 영역 시작-->
			<script language = "javascript">
				alert("회원가입에 실패했습니다. 다시 가입 해주세요");
				document.location.href="join.jsp";
			</script>
			<!-- html 영역 끝-->
	<%
		}
	}
	
	%>		
</body>
</html>
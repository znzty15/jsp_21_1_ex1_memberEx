<%@ page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.javaGG.ex.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="com.javaGG.ex.MemberDTO" />
<jsp:setProperty name="dto" property="*" />
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
   dto.setRdate(new Timestamp(System.currentTimeMillis())); //현재 시간을 mlis/s 단위로 뽑아오오오오
   
   MemberDAO dao = MemberDAO.getInstance();
   //MemberDAO dao = new MemberDAO();
   // int ri = dao.insertMember(dto);//ri값이 반환됨 성공1 실패 0
   
   if(dao.confirmId(dto.getId()) == 1){ 
   %>
   <script language="javascript">
      alert("입력하신 ID가 이미 존재합니다");
      history.back();
      </script>
   <% 
   }else {
      int ri = dao.insertMember(dto);
      if(ri == MemberDAO.MEMBER_JOIN_SUCCESS){
         %>
   <script language="javascript">
         alert("회원가입에 성공했습니다. 로그인 해주세요");
         document.location.href="login.jsp";
         </script>
   <% } else { %>
   <script language="javascript">
         alert("회원가입에 실패했습니다. 재입력 해주세요");
         document.location.href="join.jsp";
         </script>
   <%   
      } 
   }  
   %>
</body>
</html>
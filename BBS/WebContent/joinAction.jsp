<!-- 회원가입 처리 -->
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 문장사용 -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 파일을 UTF-8로 -->
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 掲示板ウェブサイト</title>
</head>
<body>
    <%  String userID=null;
    if(session.getAttribute("userID")!=null){
  	  userID=(String)session.getAttribute("userID");
    }
    if(userID!=null){
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('既にログインしました')");
    script.println("location href='main.jsp'");
    script.println("</script>");  
   }
        if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null ||
                        user.getUserGender() == null || user.getUserEmail() == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('入力されてない項目があります')");
            script.println("history.back()");
            script.println("</script>");
    } else {
        UserDAO userDAO = new UserDAO();
        int result = userDAO.join(user);
            if(result == -1){
                PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록.
                script.println("<script>");
                script.println("alert('既に存在するIDです')");
                script.println("history.back()");
                script.println("</script>");
            }
            else {
                session.setAttribute("userID", user.getUserID());
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href= 'main.jsp'");
                script.println("</script>");
                }
        }
    %>
</body>
</html> 

<%@page import="java.io.PrintWriter"%>
<%@page import="com.cos.util.SHA256"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//get code value
	String code = request.getParameter("code");
	String email = request.getParameter("email");
	String username = request.getParameter("username");
	//compare between coad and sended code value

	//email Check in DB / success = 1, error = 0;
	boolean rightCode = SHA256.getEncrypt(email, "cos").equals(code) ? true : false;

	PrintWriter script = response.getWriter();
	if (rightCode == true) {
		script.println("<script>");
		script.println("alert('이메일 인증에 성공하였습니다.')");
		script.println("location.href='/blog/user?cmd=admit&username="+username+"'");
		script.println("</script>");
	} else {
		script.println("<script>");
		script.println("alert('이메일 인증을 실패하였습니다.')");
		script.println("location.href='error.jsp'");
		script.println("</script>");
	}

	//DB에 칼럼 emailCheck(Number) 1 = 인증, 0 = 미인증 1을 update 해준다.

	// 인증완료 로그인 페이지 이동

	// 미인증 -> error 페이지 이동
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
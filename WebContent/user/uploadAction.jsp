<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadAction</title>
</head>
<body>

	<%
		String path = application.getRealPath("media");

		MultipartRequest multi = new MultipartRequest(
				request,
				path,
				1024 * 1024 * 10, //사이즈값 : 2MB
				"UTF-8", //인코딩 방식
				new DefaultFileRenamePolicy() // 파일명 중복을 해결하기 위한 정책 함수
		);
		String username = multi.getParameter("username");
		String filename = multi.getFilesystemName("userProfile"); //정책에 의해서 변경된 이름
		String originFilename = multi.getOriginalFileName("userProfile");
		String contextPath = getServletContext().getContextPath();
		String downloadPath = getServletContext().getRealPath("media");
		String filepath = contextPath+"/media/"+filename;
	%>
	 
	 <form action ="/blog/user?cmd=profileUpload" method ="POST">
	 <input type="hidden" value ="<%=username %>" name = "username">
	 <input type="hidden" value ="<%=filepath %>" name = "userProfile">
	 <img style="border-radius: 50%;"src="<%=filepath %>" width="150px" height="150px" />
	 <button type="submit" value="확인">확인</button>
	 </form>
	 
</body>
</html>
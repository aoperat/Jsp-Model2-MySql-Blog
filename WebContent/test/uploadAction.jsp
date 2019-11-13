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
		//값 못받음
		/* 		String username = request.getParameter("username");
		 */
		String path = application.getRealPath("media");

		//파일을 받아오기위해 멀티파트 리퀘스트를 사용한다.
		//생성자 순서 -> 1. request 2.path
		MultipartRequest multi = new MultipartRequest(
				request,
				path,
				1024 * 1024 * 2, //사이즈값 : 2MB
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

	 path :<%=path%><br />
	 username :<%=username%><br />
	 filename : <%=filename %><br/>
	 originFilename : <%=originFilename %><br/>
	 contextPath : <%=contextPath %><br/>
	 downloadPath : <%=downloadPath %> <br/>
	 <img style="border-radius: 50%;"src="<%=filepath %>" width="300px" height="300px" />
	 
</body>
</html>
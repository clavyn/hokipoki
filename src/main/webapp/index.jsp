<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String pageTitle = (String)request.getParameter("PAGETITLE");
String contentPage = request.getParameter("CONTENTPAGE");
pageTitle = "호키포키";
%>
<c:if test="${pagefile eq null }">
	 <c:redirect url="gonguListHome.go"/> 
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호키포키</title> 
<jsp:include page="/common/common.jsp"></jsp:include>
</head>
<body>
<div id="wrap">
	<jsp:include page="/common/user/header.jsp"></jsp:include>
	<jsp:include page="${pagefile}"></jsp:include>
	<jsp:include page="/common/user/footer.jsp"></jsp:include>
</div>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Login Page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<div align="center">
  	<h1>学生管理系统登录</h1><br/>
  	<form action=login.jsp method=post>
  	User Name:<input type="text" name=userName/><br/>
  	Password: <input type="password" name=password /><br/>
  	<input type=submit value=submit/>
  	<input type=reset value=reset/>
  	</form>
  	</div>
  	
  	<%
  	String userName=request.getParameter("userName");
  	String password=request.getParameter("password");
  	if(userName.equals("liuyi")&&password.equals("liuyi")){
   %>
   <jsp:forward page="main.jsp"/>
  <%}
  else{%>
  		<h2 align=center>Input Error!!!<h2><br>
  		<a href="login.jsp">Return Login Page</a>
  <%}%> 
  </body>
</html>

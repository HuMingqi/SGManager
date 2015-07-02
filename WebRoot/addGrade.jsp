<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addGrade.jsp' starting page</title>
    
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
    <div align=center>
    <form action=addGrade.jsp method=post>
    Student ID:<input type="text" name=sid/><br/>
    Course ID:<input type="text" name=cid/>
    New Score:<input type="text" name=score/>
    <input type=submit value=submit/>
    <input type=reset value=reset/>
    </form>
    </div>
    <jsp:useBean id="stu" class="com.cn.GradeBean"></jsp:useBean>
    <%
    int sid=Integer.parseInt(request.getParameter("sid"));
    int cid=Integer.parseInt(request.getParameter("cid"));
    String score=request.getParameter("score");
    String sql="insert into grade values("+sid+","+cid+",'"+score+"');";
    stu.getConn("root","root");
    if(stu.insert(sql)==1){
      stu.close();
     %>
    <h3 align=center>Add Grade Succeed!</h3> <br/>
    <a href=main.jsp>Return Home Page</a>
    <%} %>
    
  </body>
</html>

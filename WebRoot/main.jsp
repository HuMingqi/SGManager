<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Home Page</title>
    
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
    <jsp:useBean id="stu" class="com.cn.GradeBean"/>
    <%
    String sql="select * from grade";
    ResultSet rs=stu.query(sql);
    %>
    
    <div align=center>
    <form method=post action=main.jsp>
    <h1>Student Infomation</h1><br/>
    <table border=1>
    <tr><th>MOD SOCRE</th><th>DEL SCORE</th><th>SID</th><th>CID</th><th>SCORE</th></tr>
    <%while(rs.next()){%>
    <tr><td><input type=radio name=mod value="<%=rs.getInt(1)%>"/></td><td><input type=checkbox name=del value="<%=rs.getInt(1)%>"/></td><td><%=rs.getInt(1)%></td><td><%=rs.getInt(2)%></td><td><%=rs.getInt(3)%></td></tr>
    <%} %>
    </table><br/><br/>
    <input type=submit value="delete grades"/>
    <input type=reset value=reset/>
	</form>
	</div>
    <br/><br/>
    <a href=addGrade.jsp>Add Student Grade</a><br/>
    <a href=modifyGrade.jsp>Modify Student Grade</a><br/>
    <a href=manageStu.jsp>Manage Students</a><br/>
    <a href=manageCourse.jsp>Manage Courses</a><br/>
    <%
    String[] sid=request.getParameterValues("del");
    stu.getConn("root","root");
    for(String i:sid){
    String sql2="delete from grade where sid='"+i+"';"; 
    if(stu.delete(sql)==1){
      stu.close();
     %>
    <h2 align=center>Delete Score Succeed!</h2><br/>
    <%}
    }
    response.sendRedirect("main.jsp");
    %>
    
    
    
  </body>
</html>

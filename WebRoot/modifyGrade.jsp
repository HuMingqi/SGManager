<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modifyGrade.jsp' starting page</title>
    
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
    <jsp:useBean id="stu" class="com.cn.GradeBean"></jsp:useBean>
    <div align=center>
    <form action=modifyGrade.jsp method=post>
    <h2>Modify Grade</h2><br/>
    SID:<input type="text" name=sid/><br/>
    CID:<input type=text name=cid/><br/>
    NEW SCORE:<input type=text name=score/><br/>
    <input type="submit" value=submit/>
    <input type="reset" value=reset/>"
    </form>
    </div>
    
    <%
    int sid=Integer.parseInt(request.getParameter("sid"));
     int cid=Integer.parseInt(request.getParameter("cid"));
      int score=Integer.parseInt(request.getParameter("score"));
      stu.getConn("root","root");
      String sql1="select * from grade where sid="+sid+" and cid="+cid+";";
      ResultSet rs=stu.query(sql1);
      if(rs.next()){
        String sql2="update grade set score="+score+" where sid="+sid+" and cid="+cid+";";
        if(stu.update(sql2)==1)
        {
        stu.close();
     %>
     <h2 align=center>Modify Score Succeed!</h2><br>
     <a href=main.jsp>Return Home Page</a>
     <%}
     }%>
  </body>
</html>

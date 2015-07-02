package com.cn;
import java.sql.*;

public class CourseBean{
	private Connection conn=null;
	private Statement stmt=null;
	private ResultSet rs=null;
	private int lines;
	
	public CourseBean(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public Connection getConn(String user,String password){
		try{
			String url="jdbc:mysql://localhost:3306/SGM";
			conn=DriverManager.getConnection(url,user,password);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return conn;
	}
	
	public ResultSet query(String sql){
		try{
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
	
	public int insert(String sql){
		try{
			stmt=conn.createStatement();
			lines=stmt.executeUpdate(sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return lines;
	}
	
	public int delete(String sql){
		try{
			stmt=conn.createStatement();
			lines=stmt.executeUpdate(sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return lines;
	}
	
	public int update(String sql){
		try{
			stmt=conn.createStatement();
			lines=stmt.executeUpdate(sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return lines;
	}
	
	public void close(){
		try{
			if(conn!=null) conn.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
}


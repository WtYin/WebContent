<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- This import is necessary for JDBC --> 
<%@ page import="java.sql.*"%> 
<%@ page import="oracle.jdbc.pool.OracleDataSource"%> 
<!-- Database lookup --> 
<% 
 Connection conn = null; 
 ResultSet rset = null; 
 String error_msg = "";
 String dish_id=request.getParameter("dish_id");
 String dish_name=request.getParameter("dish_name");
 String rid = session.getAttribute("rid").toString();


 try { 
 OracleDataSource ods = new OracleDataSource(); 
 
 ods.setURL("jdbc:oracle:thin:yz2605/yYfCBstY@//w4111b.cs.columbia.edu:1521/ADB"); 
 conn = ods.getConnection(); 
 Statement stmt = conn.createStatement(); 

 stmt.executeQuery("insert into dish_offer values(" + dish_id + ","+ rid +",'"+ dish_name +"', 0)"); 

 if( conn != null ) { 
 conn.close(); 
 } 
 
 %><jsp:forward page="manage_dish.jsp"/><%
 } catch (SQLException e) { 
 error_msg = e.getMessage(); 
 if( conn != null ) { 
 conn.close(); 
 } 
 } 
 
 if( conn != null ) { 
 conn.close(); 
 } 
%> 
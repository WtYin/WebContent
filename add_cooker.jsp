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
 String cooker_ssn=request.getParameter("cooker_ssn");
 String cooker_name=request.getParameter("cooker_name");
 String rid = session.getAttribute("rid").toString();


 try { 
 OracleDataSource ods = new OracleDataSource(); 
 
 ods.setURL("jdbc:oracle:thin:yz2605/yYfCBstY@//w4111b.cs.columbia.edu:1521/ADB"); 
 conn = ods.getConnection(); 
 Statement stmt = conn.createStatement(); 
 Statement stmt2 = conn.createStatement(); 
 Statement stmt3 = conn.createStatement(); 

 stmt.executeQuery("insert into employee values('" + cooker_ssn + "','"+ cooker_name +"')"); 
 stmt2.executeQuery("insert into cooker values('" + cooker_ssn + "', 0)");
 stmt3.executeQuery("insert into work_in values('" + cooker_ssn + "',"+ rid +")");

 
 if( conn != null ) { 
 conn.close(); 
 } 
 
 %><jsp:forward page="manage_cooker.jsp"/><%
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
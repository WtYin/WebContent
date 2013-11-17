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

 String qty=request.getParameter("newqty");
 String sid=request.getParameter("ssid");


 String rid=request.getParameter("rid");
 String rmname=request.getParameter("rmname");
 
 out.print(rid);
 out.print(sid);
 out.print(rmname);
 out.print(qty);

 
 

 try { 
 OracleDataSource ods = new OracleDataSource(); 
 
 ods.setURL("jdbc:oracle:thin:yz2605/yYfCBstY@//w4111b.cs.columbia.edu:1521/ADB"); 
 conn = ods.getConnection(); 
 Statement stmt = conn.createStatement(); 
 rset = stmt.executeQuery("update contract set qty="+qty+" where rid="+rid+" and sid="+sid+" and rmname='"+rmname+"')"); 
 if( conn != null ) { 
 conn.close(); 
 } 
 
 %><jsp:forward page="manage_contract.jsp"/><%
 } catch (SQLException e) { 
 error_msg = e.getMessage(); 
 if( conn != null ) { 
 conn.close(); 
 } 
 }
 if( conn != null ) { 
	 conn.close(); 
	 } 
	 
	 %><jsp:forward page="manage_contract.jsp"/><%
 if( conn != null ) { 
 conn.close(); 
 } 
%> 

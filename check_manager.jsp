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
 String name=request.getParameter("ssn");
 //session.setAttribute("ssn",name);

 try { 
 OracleDataSource ods = new OracleDataSource(); 
 
 ods.setURL("jdbc:oracle:thin:yz2605/yYfCBstY@//w4111b.cs.columbia.edu:1521/ADB"); 
 conn = ods.getConnection(); 
 Statement stmt = conn.createStatement(); 
 rset = stmt.executeQuery("select Count(*) as count from restaurant_manage R Where R.ssn='"+name+"'"); 
 } catch (SQLException e) { 
 error_msg = e.getMessage(); 
 if( conn != null ) { 
 conn.close(); 
 } 
 } 
 
 if(rset != null) { 
	 while(rset.next()) { 
	 int exist=rset.getInt("count");
	 out.print(exist);
	 if (exist!=0){
		 if( conn != null ) { 
			 conn.close(); 
			 } 
%> <jsp:forward page="manager_choice.jsp"><jsp:param name="backssn" value="<%=name%>" /></jsp:forward>
<%
	 }
	 else{
	 if( conn != null ) { 
	 conn.close(); 
	 } 
	 %><jsp:forward page="manager_ssn_error.jsp"/><%}
	 } 
	 } else { 
	 out.print(error_msg); 
	 } 
	 if( conn != null ) { 
	 conn.close(); 
	 } 
	 
%>
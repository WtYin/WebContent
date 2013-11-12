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
 try { 
 OracleDataSource ods = new OracleDataSource(); 
 
 ods.setURL("jdbc:oracle:thin:yz2605/yYfCBstY@//w4111b.cs.columbia.edu:1521/ADB"); 
 conn = ods.getConnection(); 
 Statement stmt = conn.createStatement(); 
 rset = stmt.executeQuery("select cssn from Customer"); 
 
 
 
 
 } catch (SQLException e) { 
 error_msg = e.getMessage(); 
 if( conn != null ) { 
 conn.close(); 
 } 
 } 
%> 
 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
<title>Employee Table JSP Sample</title> 
</head> 
<body> 
Please choose from the options below:
 <FORM action="manager.jsp" method=post name=form_manager>
<INPUT TYPE="submit" value="manager" name=manager>
</FORM>

 <FORM action="customer.jsp" method=post name=form_customer>
<INPUT TYPE="submit" value="customer" name=customer>
</FORM>
  <H2>Employee Table</H2> 
 
 <TABLE> 
 <tr> 
 <td>CSSN</td>
 </tr> 
 <tr> 
 <td><b>----------</b></td>
 </tr>
  <% 
 if(rset != null) { 
 while(rset.next()) { 
 out.print("<tr>"); 
 out.print("<td>" + rset.getString("cssn") + "</td>"); 
 out.print("</tr>"); 
 } 
 } else { 
 out.print(error_msg); 
 } 
 if( conn != null ) { 
 conn.close(); 
 } 
 %> 
 </TABLE> 
</body> 
</html>
 
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- This import is necessary for JDBC --> 
<%@ page import="java.sql.*"%> 
<%@ page import="oracle.jdbc.pool.OracleDataSource"%> 
 
<!-- Database lookup --> 
<% 
//String manager_ssn=session.getAttribute("ssn").toString();
String manager_ssn = request.getParameter("ssn");

 Connection conn = null; 
 ResultSet rset = null; 
 String error_msg = ""; 
 try { 
 OracleDataSource ods = new OracleDataSource(); 
 
 ods.setURL("jdbc:oracle:thin:yz2605/yYfCBstY@//w4111b.cs.columbia.edu:1521/ADB"); 
 conn = ods.getConnection(); 
 Statement stmt = conn.createStatement(); 
 rset = stmt.executeQuery("select R.rid, R.rname from Restaurant_manage R where R.ssn='" + manager_ssn + "'"); 
 
 
 } catch (SQLException e) { 
 error_msg = e.getMessage(); 
 if( conn != null ) { 
 conn.close(); 
 } 
 } 
%> 




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
hello manager!
<p>Your ssn is:</p>
<% 
out.print(manager_ssn);
%>

<p>Please choose the restaurant you want to manage:</p>

<TABLE border="4"> 
 <tr> 
<td>RESTAURANT NAME</td><td>RESTAURANT ID</td>
 </tr> 
  <% 
 if(rset != null) { 
 while(rset.next()) { 
  out.print("<tr>"); 
  out.print("<td>" + rset.getString("rname") + "</td>"); 
  out.print("<td>");
%>
	 <FORM action="manager_choice_action.jsp" method=post>
	 <INPUT TYPE="submit" value="<%=rset.getString("rid")%>" name="rid">
	</FORM>
 <%
 out.print("</td>");
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
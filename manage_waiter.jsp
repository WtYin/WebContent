<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- This import is necessary for JDBC --> 
<%@ page import="java.sql.*"%> 
<%@ page import="oracle.jdbc.pool.OracleDataSource"%> 
 
<!-- Database lookup --> 
<% 
String rrid = session.getAttribute("rid").toString();


 Connection conn = null; 
 ResultSet rset = null; 
 String error_msg = ""; 
 try { 
 OracleDataSource ods = new OracleDataSource(); 
 
 ods.setURL("jdbc:oracle:thin:yz2605/yYfCBstY@//w4111b.cs.columbia.edu:1521/ADB"); 
 conn = ods.getConnection(); 
 Statement stmt = conn.createStatement(); 
 rset = stmt.executeQuery("select W.ssn,E.name,W.wscore from Waiter W, Employee E, Work_in WI where W.ssn=E.ssn and WI.ssn=E.ssn and WI.rid="+rrid); 
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

<p>
Please choose the waiter you want to delete:
</p>

<TABLE border="4"> 
 <tr> 
  <td>WAITER NAME</td><td>SSN</td> <td>SCORE</td><td>DELETE</td>
 </tr> 
  <% 
 if(rset != null) { 
 while(rset.next()) { 
 out.print("<tr>"); 
  out.print("<td>" + rset.getString("name") + "</td>" +"<td>" + rset.getString("ssn") + "</td>" + "<td>" + rset.getString("wscore") + "</td>"); 
  out.print("<td>");
  %>
  	 <FORM action="delete_waiter.jsp" method=post>
  	 <INPUT TYPE="submit" value="<%=rset.getString("ssn")%>" name="waiterssn">
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
<p></p>
Or add a new waiter: 
<FORM  action="add_waiter.jsp" method=post> 
<p>please input ssn of new waiter:
<INPUT type="text" name="waiter_ssn"></p>
<p>
Please input name of new waiter:

<INPUT type="text" name="waiter_name">
</p>
<INPUT TYPE="submit" value="submit">
</FORM>

<p>
<FORM action="manager_choice_action2.jsp" method=post >
<INPUT TYPE="submit" value="back to manage choice">
</FORM>
</p>

</body>
</html>
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
 rset = stmt.executeQuery("select W.ssn, E.name from Waiter W, Employee E where W.ssn=E.ssn"); 
 
 
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
your ssn is:
<% 
out.print(session.getAttribute("cssn"));
%>

<p>
Please select the ssn of waiter that you want to score
</p>

<FORM  action="thankyou_score_waiter.jsp" method=post name=cssn_input> 
<INPUT type="text" name="waiter_ssn">
<br>Please input the score (0 ~ 10)</br>
<INPUT type="text" name="waiter_score">
<br></br>
<INPUT TYPE="submit" value="submit" name=score_submit>
</FORM>

The list of all the waiters and their ssn:

 <TABLE border="4"> 
 <tr> 
 <td>SSN</td> <td>NAME</td>
 </tr> 
  <% 
 if(rset != null) { 
 while(rset.next()) { 
 out.print("<tr>"); 
 out.print("<td>" + rset.getString("ssn") + "  " + "</td>" + "<td>" + rset.getString("name") + "</td>"); 
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
 
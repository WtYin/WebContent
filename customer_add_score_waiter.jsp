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
 ResultSet rset2 = null; 
 String error_msg = ""; 
 String cssn=session.getAttribute("cssn").toString();
 try { 
 OracleDataSource ods = new OracleDataSource(); 
 
 ods.setURL("jdbc:oracle:thin:yz2605/yYfCBstY@//w4111b.cs.columbia.edu:1521/ADB"); 
 conn = ods.getConnection(); 
 Statement stmt = conn.createStatement(); 
 Statement stmt2 = conn.createStatement();
 rset = stmt.executeQuery("select T.ssn, E.name, R.rname from Waiter T, Employee E, Work_in W, Restaurant_manage R where T.ssn=E.ssn and R.rid=W.rid and E.ssn=W.ssn"); 
 rset2 = stmt2.executeQuery("select S.waiter_ssn, E.name, S.cwscore from Employee E, waiter W, Serve S where E.ssn=W.ssn and W.ssn=S.waiter_ssn and S.customer_ssn='"+cssn+"'");
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
The dish you have scored:
</p>

<TABLE border="4"> 
 <tr> 
  <td>EMPLOYEE SSN</td> <td>NAME</td><td>SCORE</td>
 </tr> 
  <% 
 if(rset2 != null) { 
 while(rset2.next()) { 
 out.print("<tr>"); 
 out.print( "<td>" + rset2.getString("waiter_ssn") + "</td>" 
 + "<td>" + rset2.getString("name") + "</td>"+ "<td>" + rset2.getString("cwscore") + "</td>"); 
 out.print("</tr>"); 
 } 
 } else { 
 out.print(error_msg); 
 } 
 %>
  
 </TABLE>


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
<td>RESTAURANT NAME</td> <td>SSN</td> <td>NAME</td>
 </tr> 
  <% 
 if(rset != null) {
 while(rset.next()) {
 out.print("<tr>");
 out.print("<td>" + rset.getString("rname") + "</td>" +"<td>" + rset.getString("ssn") + "  " + "</td>" + "<td>" + rset.getString("name") + "</td>"); 
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
 
 <FORM action="main.jsp" method=post name=main_choice>
<INPUT TYPE="submit" value="back to main">
</FORM> 
</body> 
</html>
 
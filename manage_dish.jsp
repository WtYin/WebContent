<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- This import is necessary for JDBC --> 
<%@ page import="java.sql.*"%> 
<%@ page import="oracle.jdbc.pool.OracleDataSource"%> 
 
<!-- Database lookup --> 
<% 
String rrid = session.getAttribute("rid").toString();
//String manager_ssn=session.getAttribute("ssn").toString();


 Connection conn = null; 
 ResultSet rset = null; 
 String error_msg = ""; 
 try { 
 OracleDataSource ods = new OracleDataSource(); 
 
 ods.setURL("jdbc:oracle:thin:yz2605/yYfCBstY@//w4111b.cs.columbia.edu:1521/ADB"); 
 conn = ods.getConnection(); 
 Statement stmt = conn.createStatement(); 
 rset = stmt.executeQuery("select d.did, d.dname, d.dscore from Dish_offer D where d.rid="+rrid); 
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
Please choose the dish you want to delete:
</p>

<TABLE border="4"> 
 <tr> 
  <td>DISH NAME</td><td>DISH ID</td> <td>SCORE</td><td>DELETE</td>
 </tr> 
  <% 
 if(rset != null) { 
 while(rset.next()) { 
 out.print("<tr>"); 
  out.print("<td>" + rset.getString("dname") + "</td>" +"<td>" + rset.getString("did") + "</td>" + "<td>" + rset.getString("dscore") + "</td>"); 
  out.print("<td>");
  %>
  	 <FORM action="delete_dish.jsp" method=post>
  	 <INPUT TYPE="submit" value="<%=rset.getString("did")%>" name="did">
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
Or add a new dish: 
<FORM  action="add_dish.jsp" method=post> 
<p>please input id of new dish:
<INPUT type="text" name="dish_id"></p>
<p>
Please input name of new dish:

<INPUT type="text" name="dish_name">
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
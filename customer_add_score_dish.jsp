<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!-- This import is necessary for JDBC --> 
<%@ page import="java.sql.*"%> 
<%@ page import="oracle.jdbc.pool.OracleDataSource"%> 
 
<!-- Database lookup --> 
<% 
 String cssn=session.getAttribute("cssn").toString();
 Connection conn = null; 
 ResultSet rset = null;
 ResultSet rset2 = null;
 String error_msg = ""; 
 try { 
 OracleDataSource ods = new OracleDataSource(); 
 
 ods.setURL("jdbc:oracle:thin:yz2605/yYfCBstY@//w4111b.cs.columbia.edu:1521/ADB"); 
 conn = ods.getConnection(); 
 Statement stmt = conn.createStatement(); 
 Statement stmt2 = conn.createStatement();
 rset = stmt.executeQuery("select D.did, D.dname, R.rname from Dish_offer D, Restaurant_manage R Where D.rid=R.rid"); 
 rset2 = stmt2.executeQuery("select D.did, D.dname, H.cdscore from Dish_offer D, Have_eaten H where D.did=H.did and H.customer_ssn='"+cssn+"'"); 
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
out.print(cssn);
%>
<p>
The dish you have scored:
</p>

<TABLE border="4"> 
 <tr> 
  <td>ID</td> <td>DISH NAME</td><td>SCORE</td>
 </tr> 
  <% 
 if(rset2 != null) { 
 while(rset2.next()) { 
 out.print("<tr>"); 
 out.print( "<td>" + rset2.getString("did") + "</td>" 
 + "<td>" + rset2.getString("dname") + "</td>"+ "<td>" + rset2.getString("cdscore") + "</td>"); 
 out.print("</tr>"); 
 } 
 } else { 
 out.print(error_msg); 
 } 
 %>
  
 </TABLE>
<p>
Please select the id of dish that you want to score
</p>

<FORM  action="thankyou.jsp" method=post name=cssn_input> 
<INPUT type="text" name="did">
<br>Please input the score (0 ~ 10)</br>
<INPUT type="text" name="dish_score">
<br></br>
<INPUT TYPE="submit" value="submit" name=score_submit>
</FORM>

The list of all the dishes and their id:

<TABLE border="4"> 
 <tr> 
  <td>RESTAURANT NAME</td><td>ID</td> <td>DISH NAME</td>
 </tr> 
  <% 
 if(rset != null) { 
 while(rset.next()) { 
 out.print("<tr>"); 
 out.print("<td>" + rset.getString("rname") + "</td>" +"<td>" + rset.getString("did") + "</td>" + "<td>" + rset.getString("dname") + "</td>"); 
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
 
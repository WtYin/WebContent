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
 
 rset = stmt.executeQuery("select D.did, D.dname from Dish_offer D"); 
 
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
String cssn = session.getAttribute("cssn").toString();
out.print(cssn);
%>

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
 <td>ID</td> <td>DISH NAME</td>
 </tr> 
  <% 
 if(rset != null) { 
 while(rset.next()) { 
 out.print("<tr>"); 
 out.print("<td>" + rset.getString("did") + "  " + "</td>" + "<td>" + rset.getString("dname") + "</td>"); 
 out.print("</tr>"); 
 } 
 } else { 
 out.print(error_msg); 
 } 
 if( conn != null ) { 
 conn.close(); 
 } 
 

 %> 
 
<!-- Database lookup --> 
<% 
 try { 
 OracleDataSource ods = new OracleDataSource(); 
 
 ods.setURL("jdbc:oracle:thin:yz2605/yYfCBstY@//w4111b.cs.columbia.edu:1521/ADB"); 
 conn = ods.getConnection(); 
 Statement stmt1 = conn.createStatement(); 
 
 String dish_score=request.getParameter("dish_score");
 String did=request.getParameter("did");

 rset = stmt1.executeQuery("insert into have_eaten values(" + dish_score + ",'" + session.getAttribute("cssn") +"'," + did + ")"); 
 
 } catch (SQLException e) { 
 error_msg = e.getMessage(); 
 if( conn != null ) { 
 conn.close(); 
 } 
 } 
%> 
 </TABLE> 
</body> 
</html>
 
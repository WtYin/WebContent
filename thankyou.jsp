<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- This import is necessary for JDBC --> 
<%@ page import="java.sql.*"%> 
<%@ page import="oracle.jdbc.pool.OracleDataSource"%> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>

Thank you for your scoring!
<!-- <p>Add another score or see the scores</p>
 <FORM action="customer.jsp" method=post name=thankyou_choice>
<INPUT TYPE="submit" value="back to score">
</FORM>
 -->
 
<p>Go back to score dish:</p>
 <FORM action="customer_add_score_dish.jsp" method=post name=main_choice>
<INPUT TYPE="submit" value="back to score dish">
</FORM>
 <!-- Database lookup --> 

<% 
 Connection conn = null; 
 ResultSet rset = null; 
 String error_msg = ""; 
 String cssn = session.getAttribute("cssn").toString();
 //out.print(cssn);
 try { 
 OracleDataSource ods = new OracleDataSource(); 
 
 ods.setURL("jdbc:oracle:thin:yz2605/yYfCBstY@//w4111b.cs.columbia.edu:1521/ADB"); 
 conn = ods.getConnection(); 
 Statement stmt1 = conn.createStatement(); 
 Statement stmt2 = conn.createStatement(); 
 
 String dish_score=request.getParameter("dish_score");
 String did=request.getParameter("did");

 rset = stmt1.executeQuery("insert into have_eaten values(" + dish_score + ",'" + cssn +"'," + did + ")"); 
 stmt2.executeQuery("update dish_offer set dscore=(select avg(cdscore) from have_eaten H where did="+did+") where did="+did);
 
 } catch (SQLException e) { 
 error_msg = e.getMessage(); 
 if( conn != null ) { 
 conn.close(); 
 } 
 } 
 
 if( conn != null ) { 
 conn.close(); 
 } 
%> 

</body>
</html>
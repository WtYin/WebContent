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
 <FORM action="customer_choice.jsp" method=post name=thankyou_choice>
<INPUT TYPE="submit" value="back to score">
</FORM>
 -->
<p>Go back to score waiter:</p>
 <FORM action="customer_add_score_waiter.jsp" method=post name=main_choice>
<INPUT TYPE="submit" value="back to score waiter">
</FORM>
 <!-- Database lookup --> 

<% 
 Connection conn = null; 
 ResultSet rset = null; 
 String error_msg = ""; 
 String cssn = session.getAttribute("cssn").toString();
// out.print(cssn);
 try { 
 OracleDataSource ods = new OracleDataSource(); 
 
 ods.setURL("jdbc:oracle:thin:yz2605/yYfCBstY@//w4111b.cs.columbia.edu:1521/ADB"); 
 conn = ods.getConnection(); 
 Statement stmt1 = conn.createStatement(); 
 Statement stmt2 = conn.createStatement(); 

 
 String waiter_score=request.getParameter("waiter_score");
 String waiter_ssn=request.getParameter("waiter_ssn");

 rset = stmt1.executeQuery("insert into serve values(" + waiter_score + ",'" + cssn +"','" + waiter_ssn + "')"); 
 //stmt2.executeQuery("update dish_offer set dscore=(select avg(cdscore) from have_eaten H where did="+did+") where did="+did);

 
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
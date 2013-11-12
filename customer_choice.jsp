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
 String name=request.getParameter("cssn");
 String age=request.getParameter("age");

 try { 
 OracleDataSource ods = new OracleDataSource(); 
 
 ods.setURL("jdbc:oracle:thin:yz2605/yYfCBstY@//w4111b.cs.columbia.edu:1521/ADB"); 
 conn = ods.getConnection(); 
 Statement stmt = conn.createStatement(); 
 rset = stmt.executeQuery("select Count(*) as count from Customer C Where C.cssn='"+name+"'"); 
 if(rset != null) { 
	 while(rset.next()) { 
	 int exist=rset.getInt("count");
	 out.print(exist);
	 if (exist==0){
		 Statement stmt1 = conn.createStatement(); 
		 rset = stmt1.executeQuery("insert into Customer values("+name+","+age+")"); 
	 }
	 } 
	 } else { 
	 out.print(error_msg); 
	 } 
	 if( conn != null ) { 
	 conn.close(); 
	 } 
 //rset = stmt.executeQuery("insert into table Customer values("")"); 
 
 
 
 
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
your ssn is: 
<% 
out.print(name);
session.setAttribute("cssn",name);
%>

<p>Please choose which to score:</p>
 <FORM action="customer_add_score_waiter.jsp" method=post name=wasw>
<INPUT TYPE="submit" value="Waiter" name=score_waiter>
</FORM>

 <FORM action="customer_add_score_dish.jsp" method=post name=wasd>
<INPUT TYPE="submit" value="Dish" name=score_dish>
</FORM>

 <FORM action="see_score.jsp" method=post>
<INPUT TYPE="submit" value="see score">
</FORM>
 
</body> 
</html>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- This import is necessary for JDBC --> 
<%@ page import="java.sql.*"%> 
<%@ page import="oracle.jdbc.pool.OracleDataSource"%> 
 
<% 
//String manager_ssn=session.getAttribute("ssn").toString();
String name=request.getParameter("rid");
session.setAttribute("rid",name);
%> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
hello manager!


<p>Please choose what you want to manage:</p>

 <FORM action="manage_waiter.jsp" method=post>
<INPUT TYPE="submit" value="waiter" >
</FORM>

 <FORM action="manage_cooker.jsp" method=post >
<INPUT TYPE="submit" value="cooker">
</FORM>

<FORM action="manage_dish.jsp" method=post >
<INPUT TYPE="submit" value="dish">
</FORM>

 <FORM action="manage_contract.jsp" method=post >
<INPUT TYPE="submit" value="see contract">
</FORM>

<FORM action="manage_recipe.jsp" method=post >
<INPUT TYPE="submit" value="see recipe">
</FORM>

<FORM action="main.jsp" method=post >
<INPUT TYPE="submit" value="back to main">
</FORM>
</body>
</html>
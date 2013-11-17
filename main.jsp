<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<!-- This import is necessary for JDBC --> 
<%@ page import="java.sql.*"%> 
<%@ page import="oracle.jdbc.pool.OracleDataSource"%> 

<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
<title>Employee Table JSP Sample</title> 
</head> 
<body> 
Please choose from the options below:
 <FORM action="manager.jsp" method=post name=form_manager>
<INPUT TYPE="submit" value="manager" name=manager>
</FORM>

 <FORM action="customer.jsp" method=post name=form_customer>
<INPUT TYPE="submit" value="customer" name=customer>
</FORM>


 <FORM action="see_dish_score.jsp" method=post>
<INPUT TYPE="submit" value="see dish score">
</FORM>

 <FORM action="see_restaurant_score.jsp" method=post>
<INPUT TYPE="submit" value="see restaurant score">
</FORM>

</body> 
</html>
 
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

 
 rset = stmt.executeQuery("select R.rname, R.rid, T.rscore from Restaurant_manage R, (select D.rid, AVG(D.dscore) AS rscore from Dish_offer D group by D.rid order by D.rid) T where T.rid= R.rid");
		 
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



<TABLE border="4"> 
 <tr> 
  <td>RESTAURANT NAME</td><td>RID</td><td>RESTAURANT SCORE</td>
 </tr> 
  <% 
 if(rset != null) { 
 while(rset.next()) { 
 out.print("<tr>"); 
  out.print("<td>" + rset.getString("rname") + "</td>" +"<td>" + rset.getString("rid") + "</td>" +"<td>" + rset.getString("rscore") + "</td>" ); 
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
 <FORM action="main.jsp" method=post >
<INPUT TYPE="submit" value="back to main">
</FORM>
 

</body>


</html>
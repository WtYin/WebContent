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
 rset = stmt.executeQuery("select C.qty, C.price, C.rid, C.sid, C.rmname, S.sname from Contract C, Supplier S where S.sid=C.sid and C.rid="+rrid); 
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
Please see the contract of your restaurant:
</p>

<TABLE border="4"> 
 <tr> 
  <td>RID</td><td>SUPPLIER ID</td><td>SUPPLIER NAME</td><td>MATERIAL NAME</td><td>QTY</td><td>PRICE</td>
<!--   <td>DELETE</td> -->
 </tr> 
  <% 
 if(rset != null) { 
 while(rset.next()) { 
 out.print("<tr>"); 
  out.print("<td>" + rset.getString("rid") + "</td>" +"<td>" + rset.getString("sid") + "</td>" + "<td>" + rset.getString("sname") + "</td>" +"<td>" + rset.getString("rmname") + "</td>" + "<td>" + rset.getString("qty") + "</td>" + "<td>" + rset.getString("price") + "</td>"); 
 
  
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
<p>
<FORM action="manager_choice_action2.jsp" method=post >
<INPUT TYPE="submit" value="back to manage choice">
</FORM>
</p>

</body>
</html>
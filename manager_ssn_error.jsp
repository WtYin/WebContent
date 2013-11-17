<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
Your ssn is not valid, please input again.

<script language = "JavaScript">
function check()
{
	var flag = false;
	var ssn=document.getElementById("mssnid").value;
	if (ssn.length == 9)
			{flag = true;		}
	else
		document.getElementById("flag").innerHTML = "ssn must be 9-digit number, please input again";
	return flag;
}
</script>


<FORM  action="check_manager.jsp" method=post onSubmit="return check();"> 
<p>please input your ssn:
<INPUT type="text" name="ssn" id="mssnid"></p>
<INPUT TYPE="submit" value="submit" >
</FORM>


<p id= "flag"></p>



<!-- // String s = null;
// s = request.getParameter("cssn");
// out.print(s);
-->

</body>
</html>
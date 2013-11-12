<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
hello customer


<script language = "JavaScript">
function check()
{
	var flag = false;
	var ssn=document.getElementById("cssnid").value;
	if (ssn.length == 9)
			{flag = true;		}
	else
		document.getElementById("flag").innerHTML = "ssn must be 9-digit number, please input again";
	return flag;
}
</script>


<FORM  action="customer_choice.jsp" method=post name=cssn_input onSubmit="return check();"> 
<p>please input your ssn:
<INPUT type="text" name="cssn" id="cssnid"></p>
<p>
Please input your age:

<INPUT type="text" name="age" id="ageid">
</p>
<INPUT TYPE="submit" value="submit" name=cssn_submit>
</FORM>


<p id= "flag"></p>



<!-- // String s = null;
// s = request.getParameter("cssn");
// out.print(s);
-->

</body>
</html>
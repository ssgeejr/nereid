<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<%@page import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*"%>
<%@page import="java.util.Map" %>
<%
     Map<String, String> env = System.getenv();
     String servername = env.get("REDIS_SERVER");
%>
<head>
<meta content="en-us" http-equiv="Content-Language" />
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Nereid Test Instance</title>
<style type="text/css">
.auto-style1 {
	text-align: right;
}
</style>
</head>

<body>



<form>


	<table style="width: 450px; border:1px solid black;margin-left:auto;margin-right:auto;" >
		<tr>
			<td style="text-align:center">Redis Active-Active Testing [<%= servername %>]</td>
		</tr>
		<tr>
			<td>
			<table style="width: 100%">
				<tr>
					<td style="width: 150px" class="auto-style1">
					<input name="set" type="submit"  style="width: 150px"  value="SET" /></td>
					<td style="width: 150px">
					<input name="settx" type="text" style="width: 150px" /></td>
					<td style="width: 150px">
					<input name="settx" type="text" style="width: 150px" /></td>
				</tr>
				<tr>
					<td style="width: 150px" class="auto-style1">
					<input name="get" type="submit"  style="width: 150px"  value="GET" /></td>
					<td style="width: 150px">
					<input name="gettx" type="text"  style="width: 150px" /></td>
					<td style="width: 150px">&nbsp;</td>

				</tr>
				<tr>
					<td style="width: 50%" class="auto-style1">RESULT</td>
					<td style="width: 50%" colspan="2">
					<input name="result" type="text"  style="width: 300px" readonly /></td>
				</tr>
				<tr>
					<td colspan="3" align="center">&nbsp;</td>
			</table>
			</td>
		</tr>
	</table>


</form>



</body>

</html>

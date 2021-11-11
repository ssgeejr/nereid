<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<%@page import="java.sql.*, javax.sql.*, javax.naming.*, java.util.*"%>
<%@page import="redis.nereid.*" %>
<%
	String message = "";
	String value = "";
	String getvalue = "";
	String action = null;
	try{
		action = request.getParameter("action");
	}catch(Exception ex){}
	if(action != null){
		System.out.println("ACTION [" + action + "]");
		try{
			RedisDataManager rdm = new RedisDataManager();
			if(action.equals("set")){
				rdm.setKeyValue(request.getParameter("setkey"), request.getParameter("setval"));
			}else if(action.equals("get")){
				getvalue = request.getParameter("getkey");
				value = rdm.getValue(getvalue);
			}
			message = "SUCCESS";
		}catch(Exception ex){
			message = ex.getMessage();
		}
	}
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
	<SCRIPT LANGUAGE="JavaScript">
           <!--
           function setAction(){
               document.redis.action.value = "set"
           	   redis.submit()
           }    
           function getAction(){
               document.redis.action.value = "get"
           	   redis.submit()
           }         
           // --> 
	</SCRIPT>
</head>

<body>



<form NAME="redis" ACTION="index.jsp" METHOD="POST">


	<table style="width: 450px; border:1px solid black;margin-left:auto;margin-right:auto;" >
		<tr>
			<td style="text-align:center">Redis Active-Active Testing</td>
		</tr>
		<tr>
			<td>
			<table style="width: 100%">
				<tr>
					<td style="width: 150px" class="auto-style1">
					<input name="set" type="button"  style="width: 150px"  value="SET" ONCLICK="setAction()" /></td>
					<td style="width: 150px">
					<input name="setkey" type="text" style="width: 150px" /></td>
					<td style="width: 150px">
					<input name="setval" type="text" style="width: 150px" /></td>
				</tr>
				<tr>
					<td style="width: 150px" class="auto-style1">
					<input name="get" type="button"  style="width: 150px"  value="GET" value="SET" ONCLICK="getAction()" /></td>
					<td style="width: 150px">
					<input name="gettx" type="text"  style="width: 150px" /><%= getvalue %></td>
					<td style="width: 150px">&nbsp;</td>

				</tr>
				<tr>
					<td style="width: 50%" class="auto-style1">RESULT</td>
					<td style="width: 50%" colspan="2">
					<input name="result" type="text"  style="width: 300px" readonly /><%= message %></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><%= message %></td>
			</table>
			</td>
		</tr>
	</table>

<INPUT TYPE="HIDDEN" NAME="action">
</form>



</body>

</html>

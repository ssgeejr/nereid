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
//		System.out.println("ACTION [" + action + "]");
		try{
			RedisDataManager rdm = new RedisDataManager();
			
			
			
			
			if(action.equals("set")){
//				System.out.println("SET_ACTION");
//				System.out.println(request.getParameter("setkey"));
//				System.out.println(request.getParameter("setval"));
				rdm.setKeyValue(request.getParameter("setkey"), request.getParameter("setval"));
				message = "KEY SET";
			}else if(action.equals("get")){
//				System.out.println("GET_ACTION");
//				System.out.println(request.getParameter("getkey"));
				
				getvalue = request.getParameter("getkey");
				
				if(getvalue == null){
					message = "GET VALUE MUST NOT BE NULL";
					return;
				}
				value = rdm.getValue(getvalue);
				message = "";
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
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
<script src="jquery.min.js"></script>
<script LANGUAGE="JavaScript">
          <!--
          function setAction(){
              document.redis.action.value = "set"
          	   redis.submit()
          }    
          function getAction(){
              document.redis.action.value = "get"
          	   redis.submit()
          }      
          
		$(document).ready(function(){
		    $('#show').click(function() {
		      $('.menu').toggle("slide");
		    });
		});
    // --> 
</script>
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
					<input name=getkey type="text"  style="width: 150px" value="<%= getvalue %>"/></td>
					<td style="width: 150px">&nbsp;</td>

				</tr>
				<tr>
					<td style="width: 50%" class="auto-style1">RESULT</td>
					<td style="width: 50%" colspan="2">
					<input name="result" type="text"  style="width: 300px" value="<%= value %>" readonly /></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><%= message %></td>
				</tr>
				
			</table>
			</td>
		</tr>
		<tr>
		<td>
		<div id="show">Click to Show/ Hide Server Details</div>
		 <div class="menu" style="display: none;">
		    <ol>
			    <li>REDIS_SERVER: </li>
			    <li>REDIS_PORT:</li>
			    <li>CALL TIME: </li>
		    </ol>
		 </div>
		</td>
		</tr>
	</table>

<INPUT TYPE="HIDDEN" NAME="action">
</form>



</body>

</html>

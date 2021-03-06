<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.manager_account.model.*"%>
<%@ page import="com.manager_account_authority.model.*"%>
<%@ page import="java.util.*"%>
<%
Manager_accountVO manager_accountVO = (Manager_accountVO) request.getAttribute("manager_accountVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
List<String> list =(List<String>) request.getAttribute("list");
%>
<jsp:useBean id="authority_classSvc" class="com.authority_class.model.Authority_classService"/>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>員工資料修改</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
    text-size:3em;
  }
  td{
   height:40px;
  }
  
    .button {
  display: inline-block;
  padding: 10px 20px;
  font-size: 10px;
  cursor: pointer;
  text-align: center;   
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: blue;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: blue;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
<script>
	var loadFile = function(event) {
		var output = document.getElementById('output');
		output.src = URL.createObjectURL(event.target.files[0]);
	};
</script>
</head>
<body bgcolor='white'>


<div align="center" style="
    padding-top:5%;
"><img src="<%=request.getContextPath()%>/front-end/pic/333.png" style="width: 30px; height: 30px ; align:center"><font style="font-family:微軟正黑體;font-weight:bold;font-size:2em">員工職位修改</font>
</div>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM align="center" METHOD="post" ACTION="<%=request.getContextPath()%>/Manager_account_authorityServlet">
<table align="center" style="padding-top:5%;">
	<tr>
		<td style="width: 90px;">員工編號:</td>
		<td>${manager_accountVO.man_acc_id}</td>
	</tr>
	<tr>
		<td>員工姓名:</td>
		<td>${manager_accountVO.emp_name}</td>
	</tr>
	<tr>
		<td>員工E-mail:</td>
		<td>${manager_accountVO.emp_email}</td>
	</tr>
	<tr>
	<td>
	<h3 style="padding-top: 30px;">職位修改:</h3>
	</td>
	</tr>
	<tr>
		<td colspan="2">	
			<c:forEach var="authority_classVO" items="${authority_classSvc.all}">
	                <input type="checkbox" name="auth" value="${authority_classVO.authority_id}"  ${list.contains(authority_classVO.authority_id)?'checked':''}> ${authority_classVO.authority_des}
	       </c:forEach>
		</td>
	</tr>
</table>
<br>	
<input type="hidden" name="action" value="update">
<input type="hidden" name="man_acc_id"  value="<%=manager_accountVO.getMan_acc_id()%>">
<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"> <!--接收原送出修改的來源網頁路徑後,再送給Controller準備轉交之用-->
<input type="hidden" name="whichPage"  value="<%=request.getParameter("whichPage")%>">  <!--只用於:istAllEmp.jsp-->
<input class="button" type="submit" value="送出修改"></FORM>

</body>


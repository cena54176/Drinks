<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ice.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.*"%>
<%
	IceVo iceVo = (IceVo) request.getAttribute("iceVo");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/bootstrap.min.css">
</head>
<body>
	<div class="container" style="margin-top: 10%;">
		<form class="well form-horizontal"
			  action="<%=request.getContextPath()%>/ice.do" method="post">
			<fieldset>
 		        <legend class="text-center" style="font-size: 20px;">
					<b>修改冰塊</b>
				</legend>
				<div></div>
				<div class="form-group">
					<label class="col-md-4 control-label">冰塊敘述</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-comment"></i></span> 
							<input name="ice_des" class="form-control" type="text" value="${iceVo.ice_des}" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<input type="hidden" name="action" value="update"> 
						<input type="hidden" name="ice_id" value="${iceVo.ice_id}">
						<button type="submit" class="btn btn-warning">
							修改確認<span class="glyphicon glyphicon-send"></span>
						</button>
					</div>
				</div>
				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
			</fieldset>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
</body>
</html>
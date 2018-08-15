<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.aboutus.model.*"%>

<%
	AboutUsService aboutUsSvc = new AboutUsService();
    List<AboutUsVO> list = aboutUsSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>關於我們</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/front.css" type="text/css" />

</head>
<body>
<jsp:include page="/front-end/header.jsp" />
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <!-- Animate.css v3.5.2 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css" rel="stylesheet" />
    <!-- lettering.js v0.7.0 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lettering.js/0.7.0/jquery.lettering.min.js"></script>
    <!-- Textillate.js v0.4.0 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/textillate/0.4.0/jquery.textillate.min.js"></script>
    <div id="content" class="container">
        <div class="row text-left">
            <div class="col-md-6 col-sm-12 text">
                <h3 class="title example">| 關於我們 <small>About Us</small></h3>
                	<c:forEach var="aboutUsVO" items="${list}">
                		<p>${aboutUsVO.about_des}</p>
                	</c:forEach>
            </div>
            <div class="col-md-6 col-sm-12 pic">
                <img src="<%=request.getContextPath()%>/front-end/img/aboutus01.jpg" class="img-responsive">
            </div>
        </div>
        
        <div class="row text-center">
            <div class="col-md-6 col-sm-12 pic">
                <iframe width="585" height="400" frameborder="0" style="border:0"
                    src="https://www.google.com/maps/embed/v1/place?q=place_id:ChIJpTLHUOojaDQRSeyfbuZuXhs&key=AIzaSyBI21jRzEJsFR1_fd5meKzgw-dfZAarSuM" allowfullscreen>
                </iframe> 
            </div>
            <div class="col-md-6 col-sm-12 text">
                <h3 class="title example">| 店家資訊 <small>Store Information</small></h3>
                <ul class="list" style="font-size: 28px">
                <c:forEach var="aboutUsVO" items="${list}">
                    <li>營業時間：${aboutUsVO.about_time}</li>
                    <li>電話：${aboutUsVO.about_phone}</li>
                    <li>地址：${aboutUsVO.about_add}</li>
                </c:forEach>
                </ul>
            </div>
        </div>
    </div>
<!--     <form  method="post" action="/CA101G2/MemberServlet"> -->
<form  method="post" action="<%=request.getContextPath()%>/back-end/aboutUs.do">
<table style="margin-top:7%"; width="648"  align="center" cellpadding="2" cellspacing="2">
    <tr>
      <td height="150" colspan="4" align="center"><h2  style="font-family:微軟正黑體;">這裡可以問問題</h2></td>
    </tr>
    <tr>
				<td colspan="5" align="center"><c:if
						test="${not empty errorMsgs}">
						<font color='red'>請修正以下錯誤:</font>
						<c:forEach var="message" items="${errorMsgs}">
							<ul><li style="color: red; width: 200px">${message}</li></ul>
						</c:forEach>
					</c:if></td>
	</tr>
    <tr>
      <td  width="140" height="75" align="center"><font size="4">請輸入您的Email : </font></td>
      <td colspan="3">
      <input name="email" type="email" id="email" size="50" value="${param.email}" /></td>
    </tr>
    <tr>
      <td  height="75" align="center"><font size="4">請輸入您的電話 : </font></td>
      <td colspan="3">
      <input name="phone" id="phone" size="50" value="${param.phone}"/></td>
    </tr>
    <tr>
      <td  height="75" align="center"><font size="4">請輸入您的問題 : </font></td>
      <td colspan="3">
      <textarea rows="4" cols="50" name="question" id="question" size="50" value="${param.question}">
 
	  </textarea>
<%--       <input name="question" type="textarea" id="question" size="50" value="${param.question}"/> --%>
      </td>
    </tr>
    <tr>
      <td height="65" align="right">&nbsp;</td>
      <td width="182" height="65" align="right"><input class="btn btn-primary" type="submit" name="button" id="button" value="確認送出" /></td>
      <td width="98" height="65" align="center"><a href="<%=request.getContextPath()%>/front-end/index.jsp">
        <input class="btn btn-primary" type="button" value="取消" />
      </a></td>
      <td width="80" height="65" align="right">&nbsp;</td>
 	<input type="hidden" name="action" value="question" />   
    </tr>
  </table>
</form>
    <script>
        $( ".example" ).textillate();
   	</script>
<%-- <jsp:include page="/front-end/footer.jsp" /> --%>
</body>
</html>

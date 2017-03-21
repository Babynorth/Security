<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/1/12
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<body>
<h1>Title : ${title}</h1>
<h1>Message : ${message}</h1>



<!-- csrt for log out-->
<form action="${logoutUrl}" method="post" id="logoutForm">
    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}" />
</form>

<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }
</script>

<c:if test="${pageContext.request.userPrincipal.name != null}">
    <h2>
        Welcome : ${pageContext.request.userPrincipal.name} | <a
            href="javascript:formSubmit()"> Logout</a>
    </h2>
</c:if>
<a href="<c:url value="/logout" />">Logout</a>



<br/>
<div>
    <label>View all information| This part is visible to Everyone</label>
</div>

<br/>

<br/>
<div>
    <%--测试隐藏和显示标签--%>
    <sec:authorize ifAllGranted="ROLE_USER">
        <label><a href="#">Start backup</a> | This part is visible only to one who is both ADMIN & DBA</label>
    </sec:authorize>
</div>
</body>
</html>
<%@page language="java" contentType="text/html;charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %> 

<!DOCTYPE html>
<html lang="zh_cn">
<head>
  <jsp:include page="../partial/head.jsp" flush="true">
    <jsp:param name="title" value="管理界面" />
  </jsp:include>
</head>
<body>
  <jsp:include page="../partial/header.jsp" flush="true" />
  <div class="container" style="margin-top: 20px">
    <div class="row">
      <div class="col-md-3">
        <jsp:include page="partial/leftsidebar.jsp" flush="true" />
      </div>
      <div class="col-md-9">
      </div>
    </div>
  </div>
</body>
</html>
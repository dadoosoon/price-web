<%@page language="java" contentType="text/html;charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<%@page import="java.util.*,im.dadoo.price.core.domain.*,org.apache.commons.lang3.time.*" %>

<!DOCTYPE html>
<html lang="zh_cn">
<head>
  <meta name="description" content="导购网站">
  <jsp:include page="partial/head.jsp" flush="true">
    <jsp:param name="title" value="去哪儿买" />
  </jsp:include>
</head>
<body>
  <jsp:include page="partial/header.jsp" flush="true" />
  <div class="container">
    <div class="row">
      <div class="col-md-3">
        <jsp:include page="partial/nav.jsp" flush="true" />
      </div>
      <div class="col-md-9">
        <jsp:include page="partial/brand-list.jsp" flush="true" />
        <jsp:include page="partial/record-table.jsp" flush="true" />
      </div>
    </div>
  </div>
  <script type="text/javascript">
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fff29f58f0ec380822d589a65bd53adf8' type='text/javascript'%3E%3C/script%3E"));
  </script>

</body>
</html>
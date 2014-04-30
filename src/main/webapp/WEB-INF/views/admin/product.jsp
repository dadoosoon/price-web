<%@page language="java" contentType="text/html;charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.util.*,im.dadoo.price.core.domain.*,org.apache.commons.lang3.tuple.*,org.apache.commons.lang3.time.*" %>
<%
  Map<Product, ImmutablePair<Category, Brand>> productMap = (Map<Product, ImmutablePair<Category, Brand>>)request.getAttribute("productMap");
%>

<!DOCTYPE html>
<html lang="zh_cn">
<head>
  <jsp:include page="../partial/head.jsp" flush="true">
    <jsp:param name="title" value="产品管理" />
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
        <a class="btn btn-primary pull-right" href="/admin/product/add">新产品</a>
        <table class="table table-hover">
          <thead>
            <tr>
              <th>名称</th>
              <th>分类</th>
              <th>商标</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
            <% if (productMap != null) { %>
            <% for (Product p : productMap.keySet()) { %>
              <tr>
                <td><%= p.getName() %></td>
                <td><%= productMap.get(p).getLeft().getName() %></td>
                <td><%= productMap.get(p).getRight().getName() %></td>
                <td>
                  <a href="/admin/product/<%= p.getId() %>/update">修改</a>
                </td>
              </tr>
              <% } %>
             <% } %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <script>
    $("#admin-product-li").addClass("active");
  </script>
</body>
</html>
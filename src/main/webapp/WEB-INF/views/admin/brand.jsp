<%@page language="java" contentType="text/html;charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.util.*,im.dadoo.price.core.domain.*,org.apache.commons.lang3.time.*" %>
<%
  Map<Brand, List<Category>> brandMap = (Map<Brand, List<Category>>)request.getAttribute("brandMap");
%>

<!DOCTYPE html>
<html lang="zh_cn">
<head>
  <jsp:include page="../partial/head.jsp" flush="true">
    <jsp:param name="title" value="商标管理" />
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
        <a class="btn btn-primary pull-right" href="/admin/brand/add">新商标</a>
        <table class="table table-hover">
          <thead>
            <tr>
              <th>名称</th>
              <th>基本信息</th>
              <th>关联分类</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
            <% if (brandMap != null) { %>
              <% for (Brand brand : brandMap.keySet()) { %>
              <tr>
                <td><%= brand.getName() %></td>
                <td><%= brand.getInfo() %></td>
                <td>
                  <% for(Category c : brandMap.get(brand)) { %>
                    <%= c.getName() %>&nbsp;
                  <% } %>
                </td>
                <td>
                  <a href="/admin/brand/<%= brand.getId() %>/update">修改</a>
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
    $("#admin-brand-li").addClass("active");
  </script>
</body>
</html>
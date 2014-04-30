<%@page language="java" contentType="text/html;charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.util.*,im.dadoo.price.core.domain.*,org.apache.commons.lang3.time.*" %>
<%
  Map<Integer, Category> categoryMap = (Map<Integer, Category>)request.getAttribute("categoryMap");
%>

<!DOCTYPE html>
<html lang="zh_cn">
<head>
  <jsp:include page="../partial/head.jsp" flush="true">
    <jsp:param name="title" value="分类管理" />
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
        <a class="btn btn-primary pull-right" href="/admin/category/add">新分类</a>
        <table class="table table-hover">
          <thead>
            <tr>
              <th>名称</th>
              <th>上级分类</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
            <% if (categoryMap != null) { %>
              <% for (Category c : categoryMap.values()) { %>
              <tr>
                <td><%= c.getName() %></td>
                <td>
                  <% if(c.getSupId() != null) { %>
                    <%= categoryMap.get(c.getSupId()).getName() %>
                  <% } %>
                </td>
                <td>
                  <a href="/admin/category/<%= c.getId() %>/update">修改</a>
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
    $("#admin-category-li").addClass("active");
  </script>
</body>
</html>
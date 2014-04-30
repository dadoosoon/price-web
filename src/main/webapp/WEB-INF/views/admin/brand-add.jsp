<%@page language="java" contentType="text/html;charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.util.*,im.dadoo.price.core.domain.*,im.dadoo.price.web.dto.*,org.apache.commons.lang3.time.*" %>
<%
  List<Node<Category>> categoryNodes = (List<Node<Category>>)request.getAttribute("categoryNodes");
%>

<!DOCTYPE html>
<html lang="zh_cn">
<head>
  <jsp:include page="../partial/head.jsp" flush="true">
    <jsp:param name="title" value="新增商标" />
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
        <form id="new-brand-form" action="/admin/brand" method="post">
          <div class="form-group">
            <label for="name">名称</label>
            <input id="name" name="name" type="text" class="form-control">
          </div>
          <div class="form-group">
            <label for="info">基本信息</label>
            <input id="info" name="info" type="text" class="form-control">
          </div>
          <div class="form-group">
            <label for="categoryIds">关联分类</label>
            <select name="categoryIds" multiple class="form-control" size="25">
              <% if(categoryNodes != null) { %>
                <% for(Node<Category> c1 : categoryNodes) { %>
                  <option disabled="disabled" value="<%= c1.getData().getId() %>"><%= c1.getData().getName() %></option>
                  <% if(c1.getSubs() != null) { %>
                    <% for(Node<Category> c2 : c1.getSubs()) { %>
                      <option disabled="disabled" value="<%= c2.getData().getId() %>">&nbsp;&nbsp;&nbsp;<%= c2.getData().getName() %></option>
                      <% if(c2.getSubs() != null) { %>
                        <% for (Node<Category> c3 : c2.getSubs()) { %>
                          <option value="<%= c3.getData().getId() %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= c3.getData().getName() %></option>
                        <% } %>
                      <% } %>
                    <% } %>
                  <% } %>
                <% } %>
              <% } %>
            </select>
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-default">保存</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script>
    $("#admin-brand-li").addClass("active");
  </script>
</body>
</html>
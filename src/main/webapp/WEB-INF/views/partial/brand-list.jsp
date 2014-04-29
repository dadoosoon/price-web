<%@page language="java" contentType="text/html;charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<%@page import="java.util.*,im.dadoo.price.core.domain.*" %>

<%
  List<Brand> brands = (List<Brand>)request.getAttribute("brands");
%>

<div class="row">
  <div class="col-md-12">
    <% if(brands != null) { %>
      <% for(Brand brand : brands) { %>
        <a href="#brand-<%= brand.getId() %>"><%= brand.getName() %></a>
      <% } %>
    <% } %>
  </div>
</div>
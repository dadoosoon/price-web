<%@page language="java" contentType="text/html;charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<%@page import="java.util.*,im.dadoo.price.core.domain.*,im.dadoo.price.web.dto.*,org.apache.commons.lang3.time.*" %>

<%
  List<Menu> menus = (List<Menu>)request.getAttribute("menus");
%>
<div class="panel-group">
  <% if (menus != null) { %>
    <% for (Menu menu : menus) { %>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapse-<%= menu.getItem().getId() %>">
              <%= menu.getItem().getName() %>
            </a>
          </h4>
        </div>
        <div id="collapse-<%= menu.getItem().getId() %>" class="panel-collapse collapse in">
          <div class="panel-body">
            <ul>
              <% if(menu.getSubs() != null) { %>
                <% for(Menu sub1: menu.getSubs()) { %>
                  <li><%= sub1.getItem().getName() %></li>
                  <ul class="nav nav-pills nav-stacked">
                    <% if(sub1.getSubs() != null) { %>
                      <% for(Menu sub2 : sub1.getSubs()) { %>
                        <li><a href="/record?category=<%= sub2.getItem().getId() %>"><%= sub2.getItem().getName() %></a></li>
                      <% } %>
                    <% } %>
                  </ul>
                <% } %>
              <% } %>
            </ul>
          </div>
        </div>
      </div>
    <% } %>
  <% } %>
</div>
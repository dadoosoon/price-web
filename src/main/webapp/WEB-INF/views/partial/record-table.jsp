<%@page language="java" contentType="text/html;charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<%@page import="java.util.*,im.dadoo.price.core.domain.*,im.dadoo.price.web.dto.*,org.apache.commons.lang3.*,org.apache.commons.lang3.time.*" %>

<%
  List<Map<String, Object>> recordSets = (List<Map<String, Object>>)request.getAttribute("recordSets");
%>

<% if(recordSets != null) { %>
  <% for(Map<String, Object> rs : recordSets) { %>
  <div id="brand-<%= ((Brand)rs.get("brand")).getId() %>" class="row">
    <div class="col-md-12">
      <h2 style="background-color:#faf8f0;color:#8a6d3b"><%= ((Brand)rs.get("brand")).getName() %></h2>
      <% if(rs.get("products") != null) { %>
        <% for(Map<String, Object> pr : (List<Map<String, Object>>)rs.get("products")) { %>
          <div class="product-box">
            <div><h4><%= ((Product)pr.get("product")).getName() %></h4></div>
            <div>
              <table class="table table-hover table-condensed">
                <thead>
                  <tr>
                    <th class="col-md-1">电商</th>
                    <th class="col-md-1">数量</th>
                    <th class="col-md-1">单价</th>
                    <th class="col-md-1">最低&nbsp;-&nbsp;最高价</th>
                    <th class="col-md-2">状态</th>
                    <th class="col-md-1">更新时间</th>
                    <th class="col-md-1">其他</th>
                  </tr>
                </thead>
                <tbody>
                  <% if(pr.get("records") != null) { %>
                    <% for(FullRecord fr : (List<FullRecord>)pr.get("records")) { %>
                      <tr>
                        <td><a href="<%= fr.getUrl() %>" target="_blank"><%= fr.getSellerName() %></a></td>
                        <td><%= fr.getAmount() %></td>
                        <td><%= String.format("%.2f", fr.getPrice()) %></td>
                        <td><%= String.format("%.2f", fr.getMinPrice()) %>&nbsp;-&nbsp;<%= String.format("%.2f", fr.getMaxPrice()) %></td>
                        <td>
                          <% if(fr.getStock() == null || fr.getStock() == 0) { %>
                            <span class="label label-default condition-label">缺货</span>
                          <% } %>
                          <% if(ObjectUtils.compare(fr.getMaxPrice(), fr.getPrice()) == 0 && ObjectUtils.compare(fr.getMaxPrice(), fr.getMinPrice()) != 0) { %>
                            <span class="label label-danger condition-label">历史高价</span>
                          <% } %>
                          <% if(ObjectUtils.compare(fr.getMinPrice(), fr.getPrice()) == 0 && ObjectUtils.compare(fr.getMaxPrice(), fr.getMinPrice()) != 0) { %>
                            <span class="label label-success condition-label">历史低价</span>
                          <% } %>
                        </td>
                        <td>
                          <% if (fr.getDatetime() != null) { %>
                            <%= (System.currentTimeMillis() - fr.getDatetime()) / 1000 / 60 %>分钟前
                          <% } else { %>
                            尚未采集
                          <% } %>
                        </td>
                        <td>
                          <% if (fr.getRemark() != null) { %>
                            <button type="button" class="btn btn-xs btn-warning" data-toggle="tooltip" data-placement="left" title="<%= fr.getRemark() %>">备注</button>
                          <% } %>
                          <% if (fr.getPromotion() != null) { %>
                            <button type="button" class="btn btn-xs btn-danger" data-toggle="tooltip" data-placement="right" title="<%= fr.getPromotion() %>">促销</button>
                          <% } %>
                        </td>
                      </tr>
                    <% } %>
                  <% } %>
                </tbody>
              </table>
            </div>
          </div>
        <% } %>
      <% } %>
    </div>
  </div>
  <% } %>
<% } %>
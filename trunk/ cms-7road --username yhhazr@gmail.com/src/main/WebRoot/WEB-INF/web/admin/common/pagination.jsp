<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg" %>
<jsp:useBean id="currentPageNumber" type="java.lang.Integer" scope="request"/>
<jsp:useBean id="totalItems" type="java.lang.Integer" scope="request"/>
<jsp:useBean id="maxPageItems" type="java.lang.Integer" scope="request"/>
<style>
	.ui-helper-clearfix{
		font-weight: normal;
	}
	.ui-toolbar{
		padding: 5px;
	}
</style>


<div class="fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix">
<div id="example_info" class="dataTables_info">
<%
int totalItemCount = totalItems.intValue();
int pageSise = maxPageItems.intValue();
if(totalItemCount < 1){
%>
	没有查询到任何记录. &nbsp;&nbsp;
	
<%
}else if(totalItemCount == 1){
%>
	当前显示 1 到 <%= totalItemCount %> 条，共 <%= totalItemCount %> 条记录.&nbsp;&nbsp;	
<%
}else if(totalItemCount <= pageSise){
%>
	当前显示 1 到 <%= totalItemCount %> 条，共 <%= totalItemCount %> 条记录.&nbsp;&nbsp;
<%
}
%>

<pg:index export="total=itemCount">
<pg:page export="first,last">
    当前显示 <%= first %> 到 <%= last %> 条，共 <%= total %> 条记录&nbsp;&nbsp;
</pg:page>
</div>
<div class="dataTables_paginate fg-buttonset ui-buttonset fg-buttonset-multi ui-buttonset-multi paging_full_numbers">
<pg:first export="firstPageUrl=pageUrl" >
	<% if(currentPageNumber == 1){ %>
  <a class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default ui-state-disabled" tabindex="0" href="javascript:void(0);">首页</a>
	<%}else{ %>
  <a class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default" tabindex="0" href="javascript:changeContent('<%= firstPageUrl %>')">首页</a>
  <%} %>
</pg:first>
<pg:prev export="prevPageUrl=pageUrl" ifnull="true">
	<%	
		if(prevPageUrl == null){
	 %>
  <a  class="previous fg-button ui-button ui-state-default ui-state-disabled" tabindex="0" href="javascript:void(0);">上一页</a>
	<% }else{ %> 	
  <a class="previous fg-button ui-button ui-state-default" tabindex="0" href="javascript:changeContent('<%= prevPageUrl %>')">上一页</a>
  	<%} %>
</pg:prev>
<span>
<pg:pages><%
  if (pageNumber == currentPageNumber) {
    %> <a  class="fg-button ui-button ui-state-default ui-state-disabled" tabindex="0" href="javascript:void(0);"><%= pageNumber %></a> <%
  } else {
    %> <a class="fg-button ui-button ui-state-default" tabindex="0" href="javascript:changeContent('<%= pageUrl %>')"><%= pageNumber %></a> <%
  }
%></pg:pages>
</span>
<pg:next export="nextPageUrl=pageUrl" ifnull="true">
	<%if(nextPageUrl == null){ %>
  <a  class="next fg-button ui-button ui-state-default ui-state-disabled" tabindex="0" href="javascript:void(0);">下一页</a>
  <%}else{ %>
  <a  class="next fg-button ui-button ui-state-default " tabindex="0" href="javascript:changeContent('<%= nextPageUrl %>')">下一页</a>
  <%} %>
</pg:next>
<pg:last export="lastPageUrl=pageUrl,pageNumber">
	<%if(pageNumber == currentPageNumber) {%>
  <a  class="last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default ui-state-disabled" tabindex="0" href="javascript:void(0);">末页</a>
 	<%}else{ %>
  <a  class="last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default" tabindex="0" href="javascript:changeContent('<%= lastPageUrl %>')">末页</a>
	<%} %>
</pg:last>
</div>
</pg:index>
    
</div>

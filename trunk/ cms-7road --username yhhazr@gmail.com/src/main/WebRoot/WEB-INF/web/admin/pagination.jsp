<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg" %>
<jsp:useBean id="currentPageNumber" type="java.lang.Integer" scope="request"/>
<jsp:useBean id="totalItems" type="java.lang.Integer" scope="request"/>
<jsp:useBean id="maxPageItems" type="java.lang.Integer" scope="request"/>



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
	1 - <%= totalItemCount %> of <%= totalItemCount %> record.&nbsp;&nbsp;	
<%
}else if(totalItemCount <= pageSise){
%>
	1 - <%= totalItemCount %> of <%= totalItemCount %> records.&nbsp;&nbsp;
<%
}
%>

<pg:index export="total=itemCount">
<pg:page export="first,last">
    <%= first %> - <%= last %> of <%= total %> records.&nbsp;&nbsp;
</pg:page>
</div>
<div id="example_paginate" class="dataTables_paginate fg-buttonset ui-buttonset fg-buttonset-multi ui-buttonset-multi paging_full_numbers">
<pg:first export="firstPageUrl=pageUrl" unless="current">
  <a id="example_first" class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default ui-state-disabled" tabindex="0" href="<%= firstPageUrl %>">第一页</a>
</pg:first>
<pg:prev export="prevPageUrl=pageUrl">
  <a id="example_previous" class="previous fg-button ui-button ui-state-default ui-state-disabled" tabindex="0" href="<%= prevPageUrl %>">前一页</a>
</pg:prev>
<span>
<pg:pages><%
  if (pageNumber == currentPageNumber) {
    %> <b><%= pageNumber %></b> <%
  } else {
    %> <a class="fg-button ui-button ui-state-default ui-state-disabled" tabindex="0" href="<%= pageUrl %>"><%= pageNumber %></a> <%
  }
%></pg:pages>
</span>
<pg:next export="nextPageUrl=pageUrl">
  <a id="example_next" class="next fg-button ui-button ui-state-default ui-state-disabled" tabindex="0" href="<%= nextPageUrl %>">后一页</a>
</pg:next>
<pg:last export="lastPageUrl=pageUrl" unless="current">
  <a id="example_last" class="last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default ui-state-disabled" tabindex="0" href="<%= lastPageUrl %>">末页</a>
</pg:last>
</div>
</pg:index>
    <div class="btn-toolbar">
    	<div class="btn-group">
    		<button class="btn btn-info">首页</button>
    		<button class="btn btn-info">上一页</button>
    		<button class="btn btn-info">1</button>
    		<button class="btn btn-info" data-toggle="button">2</button>
    		<button class="btn btn-info">3</button>
    		<button class="btn btn-info">4</button>
    		<button class="btn btn-info">下一页</button>
    		<button class="btn btn-info">末页</button>
    	</div>
    </div>
</div>

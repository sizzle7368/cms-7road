<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/displaytag-el.tld" prefix="display-el"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ taglib prefix="pg" uri="/WEB-INF/pager-taglib.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
.center{
	text-align: center;
}
table.tablelist thead th{
	padding: 3px 0 3px 10px;
}
tr.odd{
	background-color: #F1F1F1;
}
td{
	padding: 3px 3px 3px 3px;
}
.toolbarleft{
	float: left;
    width: 40%;
}
.ui-toolbar select{
	margin-bottom: 0;
	width: auto;
}
label{
	margin-bottom: 0;
}
.toolbarright{
	float: right;
    text-align: right;
    width: 50%;
}
.toolbarright input{
	margin-bottom: 0;
}
</style>
</head>
<body>
		<div class="fg-toolbar ui-toolbar ui-widget-header ui-corner-tl ui-corner-tr ui-helper-clearfix">
				<div class="toolbarleft">
				<button class="btn btn-primary" id="newUser">
					<i class="icon-user icon-white"></i>
					新增用户
				</button>
</div>
<div  class="toolbarright">
<label>
每页显示
<select name="toolbarMenu" size="1" aria-controls="example">
<option value="10" selected="selected">10</option>
<option value="25">25</option>
<option value="50">50</option>
<option value="100">100</option>
</select>
条记录
</label>
</div>
	

</div>
	<pg:pager items="${pageationResult.total }" url='<%=request.getContextPath() + "/userManage.action"%>' index="center" maxPageItems='5'
									maxIndexPages='10' isOffset="true" export="offset,currentPageNumber=pageNumber" scope="request">
	
		<display:table name="requestScope.pageationResult.resultList" class="tablelist" 
				defaultsort="0" cellpadding="0" cellspacing="0" style="width:100%"
				requestURI="" id="user">
				<%-- Table columns --%>
			
				<display:column property="id"  title="用户ID"  headerClass="ui-state-default" class="center"/>
				<display:column property="userName" title="用户名" headerClass="ui-state-default" class="center"/>
				<display:column property="role.roleName"   title="角色" headerClass="ui-state-default" class="center"/>
				<display:column property="email"   title="邮箱" headerClass="ui-state-default" class="center"/>
				<display:column  title="操作" headerClass="ui-state-default" class="center">
					<a class="btn btn-success" href="#">
				<i class="icon-zoom-in icon-white"></i>
					查看
				</a>
				<a class="btn btn-info" href="#">
				<i class="icon-edit icon-white"></i>
					编辑
				</a>
				<a class="btn btn-danger" href="#">
				<i class="icon-trash icon-white"></i>
					删除
				</a>
				</display:column>
				
				
			</display:table>
			<jsp:include page="/WEB-INF/web/admin/pagination.jsp" flush="true" />
	</pg:pager>
  <div class="modal hide" id="myModal">
    <div class="modal-header">
    <a class="close" data-dismiss="modal">×</a>
    <h3>新增用户</h3>
    </div>
    <div class="modal-body">
   		 <div class="control-group ">
                	<label class="control-label">用户名:</label>
                	<div class="controls">
						<input type="text" name="userName" value=""/>
					</div>
		</div>
		<div class="control-group ">
                	<label class="control-label">密码:</label>
                	<div class="controls">
						<input type="password" name="password" value=""/>
					</div>
		</div>
		<div class="control-group ">
                	<label class="control-label">确认密码:</label>
                	<div class="controls">
						<input type="password" name="confirmPassword" value=""/>
					</div>
		</div>
   		 <div class="control-group ">
                	<label class="control-label">邮箱:</label>
                	<div class="controls">
						<input type="text" name="email" value=""/>
					</div>
		</div>
    </div>
    <div class="modal-footer">
    <a href="#" class="btn">关闭</a>
    <a href="#" class="btn btn-primary">保存更新</a>
    </div>
    </div>
    <script type="test/javascript">
		$("#newUser").click(function(){
			$('#myModal').modal({
				backdrop:false
			})
		});
   	</script>
</body>
</html>
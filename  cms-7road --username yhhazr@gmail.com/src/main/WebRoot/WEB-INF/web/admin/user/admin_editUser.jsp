<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
    <div class="modal-header">
    <a class="close" data-dismiss="modal">×</a>
    <h3>修改用户</h3>
    </div>
    <div class="modal-body">
    	<s:form id="userForm" enctype="multipart/form-data"  cssClass="form-horizontal">
   		 <div class="control-group ">
                	<label class="control-label">用户名:</label>
                	<div class="controls">
                		<s:textfield name="user.userName"></s:textfield>
					</div>
		</div>
		<div class="control-group ">
                	<label class="control-label">密码:</label>
                	<div class="controls">
                		<s:textfield name="user.password"></s:textfield>
					</div>
		</div>
		<div class="control-group ">
                	<label class="control-label">确认密码:</label>
                	<div class="controls">
						<s:password name="user.password"></s:password>
					</div>
		</div>
   		 <div class="control-group ">
                	<label class="control-label">邮箱:</label>
                	<div class="controls">
						<s:textfield name="user.email"></s:textfield>
					</div>
		</div>
		 <div class="control-group ">
                	<label class="control-label">角色:</label>
                	<div class="controls">
                		<s:select style="width:auto;" list="roleList" name="role.id" listKey="id" listValue="roleName" value="user.role.id">
                		</s:select>
						
					</div>
		</div>
		</s:form>
    </div>
    <div class="modal-footer">
    <a href="#" id="save" class="btn btn-primary">保存</a>
    <a href="#" class="btn" data-dismiss="modal">关闭</a>
    </div>
    <script type="text/javascript" src="static/js/validate.js"></script>
    <script type="text/javascript">
    	$("#save").click(function(){
    		$.post("addUserSubmit.action",$("#userForm").serialize(),function(data){
    			if(data.result == "true"){
    				$('#myModal').modal('hide');
    				changeContent('userManage.action');
    			}else{
    				bootstrapValidation($("#userForm"),data);
    			}
    		});
    	});
    
    </script>
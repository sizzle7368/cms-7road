<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
    <div class="modal-header">
    <a class="close" data-dismiss="modal">×</a>
    <h3>新增用户</h3>
    </div>
    <div class="modal-body">
    	<s:form id="userForm" enctype="multipart/form-data"  cssClass="form-horizontal">
   		 <div class="control-group ">
                	<label class="control-label">用户名:</label>
                	<div class="controls">
						<input type="text" name="user.userName" value=""/>
					</div>
		</div>
		<div class="control-group ">
                	<label class="control-label">密码:</label>
                	<div class="controls">
						<input type="password" name="user.password" value=""/>
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
						<input type="text" name="user.email" value=""/>
					</div>
		</div>
		 <div class="control-group ">
                	<label class="control-label">角色:</label>
                	<div class="controls">
                		<select style="width:auto;" name="role.id">
                			<option value="0">请选择角色</option>
							<s:iterator value="roleList" id="role" status="st">
								<option value="<s:property value='#role.id'/>"><s:property value='#role.roleName'/></option>
							</s:iterator>
                		</select>
						
					</div>
		</div>
		</s:form>
    </div>
    <div class="modal-footer">
    <a href="#" class="btn" data-dismiss="modal">关闭</a>
    <a href="#" id="save" class="btn btn-primary">保存</a>
    </div>
    <script type="text/javascript" src="static/js/validate.js"></script>
    <script type="text/javascript">
    	$("#save").click(function(){
    		$.post("addUserSubmit.action",$("#userForm").serialize(),function(data){
    			if(data.result == "true"){
    				$('#myModal').modal('hide');
    				changeContent('userManage.action');
    			}else{
    				var errors = {
    					fieldErrors:data.fieldErrors,
    					errors:data.actionErrors
    				}
    				bootstrapValidation($("#userForm"),errors);
    			}
    		});
    	});
    
    </script>
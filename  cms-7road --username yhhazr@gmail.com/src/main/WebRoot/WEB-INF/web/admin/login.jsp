<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<link href="static/css/bootstrap.css" rel="stylesheet">
<link href="static/css/login-style.css" rel="stylesheet">
<script type="text/javascript" src="static/js/jquery-1.8.0.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
</head>
<body>
			
           

           
            
            
            <div class="container-fluid">
			<div class="row-fluid">
				<div class="well" style="width:40%;margin:auto auto;">
					<div class="navbar navbar-static navbar_as_heading">
						<div class="navbar-inner">
							<div class="container" style="width: auto;">
								<a class="brand">用户登录</a>
								

							</div>
						</div>
					</div>
					<s:if test="#request.fieldErrors.error!=NULL">
					<div class="alert alert-error">
						<s:fielderror><s:param>error</s:param> </s:fielderror>
					</div>
					</s:if>
					 <s:form id="validationForm"  action="submit.action" enctype="multipart/form-data"  cssClass="form-horizontal">
                
                

                <div class="control-group "><label class="control-label"         for="validationForm_name"     >用户名:</label><div class="controls">

<input type="text" name="name" value="" id="validationForm_name"/><s:fielderror><s:param>name</s:param> </s:fielderror></div>
				 
				
</div>

                <div class="control-group "><label class="control-label"         for="validationForm_password" >密&nbsp;&nbsp;&nbsp;码:</label><div class="controls">
<input type="password" name="password" id="validationForm_password"/><s:fielderror><s:param>password</s:param> </s:fielderror></div>
</div>


               <div style="display:none;" class="control-group "><label class="control-label"         for="validationForm_name"     >验证码:</label><div class="controls">

<input type="text" name="captcha" value="" id="validationForm_name" class="input-small"/>
<img width="90px" height="25px" onclick="javascript:this.src='captcha?'+(new Date().getTime());" title="Change verify image" src="captcha" style="vertical-align:middle;cursor:pointer;">
</div>
				
</div>
				<input type="submit" value="" class="btn btn-primary">
              
            </s:form>
				</div>
			</div>
		</div>
</body>
</html>
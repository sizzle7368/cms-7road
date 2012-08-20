<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="/struts-bootstrap-tags" prefix="sb" %>
<%@ taglib uri="/struts-jquery-tags" prefix="sj" %>
<html lang="en">

  <head>
   
    <sj:head jqueryui="false"/>
    <sb:head/>
	
  </head>
  
  <body>
    		<s:actionerror theme="bootstrap"/>
            <s:actionmessage theme="bootstrap"/>
            <s:fielderror theme="bootstrap"/>
			<input type="text"/>

            <s:form id="validationForm"  action="submit.action" enctype="multipart/form-data" theme="bootstrap" cssClass="form-horizontal"
                    label="用户登录">
                <s:textfield
                        label="用户名"
                        name="name"
                        />
                <s:password
                        label="密码"
                        name="password"
                        />

               

               
				<sj:submit cssClass="btn btn-primary" formIds="validationForm" validate="true" validateFunction="bootstrapValidation"/>
               
            </s:form></body>
</html>

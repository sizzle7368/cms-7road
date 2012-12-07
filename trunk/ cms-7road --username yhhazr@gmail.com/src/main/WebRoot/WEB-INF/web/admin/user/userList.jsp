<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="static/css/demo_table_jui.css" />
<script type="text/javascript" src="static/js/jquery-1.8.0.js" ></script>
<script type="text/javascript" src="static/js/jquery.dataTables.min.js" ></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable({
    	 "bProcessing": true,
    	 "bServerSide" : true,
    	 "bSort" : false,
         "sPaginationType": "full_numbers",
         "sAjaxSource" :"listUser.action"
     
    });
    alert(fnGetKey( aoData, "iDisplayStart" ));
} );
function fnGetKey( aoData, sKey )
{
    for ( var i=0, iLen=aoData.length ; i<iLen ; i++ )
    {
        if ( aoData[i].name == sKey )
        {
            return aoData[i].value;
        }
    }
    return null;
}
</script>
<title>Insert title here</title>
</head>
<body>
		<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
				<thead>
							<tr>
								<th>ID</th>
								<th>内核引擎</th>
								<th>浏览器</th>
								<th>平台</th>
								<th>版本</th>
								<th>CSS评级</th>
								<th>时间</th>
							</tr>
						</thead>
						<tbody></tbody>
						<tfoot>
							<tr>
								<th>ID</th>
								<th>内核引擎</th>
								<th>浏览器</th>
								<th>平台</th>
								<th>版本</th>
								<th>CSS评级</th>
								<th>时间</th>
							</tr>
							<tr>
								<th>ID</th>
								<th>内核引擎</th>
								<th>浏览器</th>
								<th>平台</th>
								<th>版本</th>
								<th>sdf</th>
								<th>时间</th>
							</tr>
							<tr>
								<th>ID</th>
								<th>内核引擎</th>
								<th>浏览器</th>
								<th>平台</th>
								<th>版本</th>
								<th>CSS评级</th>
								<th>时间</th>
							</tr>
						</tfoot>
			</table>
</body>
</html>
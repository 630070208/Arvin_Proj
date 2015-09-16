<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加用户</title>
    <jsp:include page="../common/headResources.jsp"></jsp:include>
  </head>
  <body>

  <!-- 菜单 -->
	<jsp:include page="../common/head.jsp"></jsp:include>
	<div id="content">
		<div id="content-header">
			<h1>
				用户添加
			</h1>
		</div>
		<div id="content-container">
			<div class="row">
				 <div class="col-md-12">
					<table class="table table-bordered table-highlight" >
	  				<thead>
						<tr>
							<th width="20%"  class="text-center">项目</th>
							<th width="70%"  colspan='2' class="text-center">内容</th>
						</tr>
					</thead>
				<tbody>
					<tr>
						<td align="left" colspan='3' style="background-color: #dddddd">
							账号添加：
						</td>
						
					</tr>
					<tr>
						<td align="left">
							用户类型：
						</td>
						<td align="left">
							<input type="radio" name="userrole" id="user_role_2" value="4" onChange="showChildCount(this.value)" checked="checked" /><label for="user_role_2" >代理用户</label>&nbsp;&nbsp;
							<input type="radio" name="userrole" id="user_role_3" value="0" onChange="showChildCount(this.value)" /><label for="user_role_3" >会员用户</label>
						</td>
						<td align="left">
							
						</td>
					</tr>
				
					<tr valign="bottom">
						<td align="left" >
							用户名：
						</td>
						<td align="left">
							<input type="text" class="form-control" style="width: 250px">
						</td>
						<td align="left">
							由 0-9、a-z、A-Z 组成的6-16个字符
						</td>
				</tr>
				<tr valign="bottom">
						<td align="left">
							登录密码：
						</td>
						<td align="left">
							<input type="password" class="form-control" style="width: 250px">
						</td>
						<td align="left">
							由数字和字母组成6-16个字符
						</td>
				</tr>
				<tr valign="bottom">
						<td align="left">
							Q   Q：
						</td>
						<td align="left">
							<input type="text" class="form-control" style="width: 250px">
						</td>
						<td align="left">
							由数字组成6-11个字符
						</td>
				</tr>
				<tr>
						<td align="left" colspan='3' style="background-color: #dddddd">
							返点设置：
						</td>
						
					</tr>
				<tr valign="bottom">
					<td align="left">
							自由返点模式：
						</td>
						<td align="left">
							<input   class="form-control"  style="width: 50px;display: inline"> 0 - 0.5
						</td>
						<td >
							自由不定位：&nbsp;&nbsp;<input class="form-control"  style="width: 50px;display: inline"> 0 - 0.5
						</td>
						
				</tr>
				<tr>
						<td align="center" colspan='3' >
							<input type="submit" class="btn btn-success" value="添加/修改"></input>
							<input type="reset" class="btn btn-success" value="清           空"></input>
						</td>
						
					</tr>
			</tbody>
  		</table>
					
				</div>
			</div>
		</div>
	</div>
	
	
	
	
  
  	
    <jsp:include page="../common/foot.jsp"></jsp:include>
  </body>
</html>

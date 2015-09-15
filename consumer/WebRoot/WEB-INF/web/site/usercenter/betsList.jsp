<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="no-js ie ie67 ie678 ie6789" lang="en"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie ie67 ie678 ie6789 ie7" lang="en"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie ie678 ie6789 ie8" lang="en"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie ie6789 ie9" lang="en"><![endif]-->
<!--[if !(IE)]><!-->
<html lang="en">
  <!--<![endif]-->
<head>
<title>个人中心</title>
<jsp:include page="../common/resource.jsp"></jsp:include>
</head>
<jsp:include page="header.jsp"></jsp:include>
<!--彩种类型-->
<div class="Menubox_title">
	<ul id="gameType">
		<li value="changGui" id="two1" class="hover"><span class="m">常规投注</span></li>
		<li value="zhuiHao" id="two1"><span>追号投注</span></li>
	</ul>
</div>
<form action="" method="post" name="search">
	<table class="formTable">
		<tbody>
		<tr>
			<td>彩种：
				<select>
					
				</select>
			期号：
				<input id="caiQi" name="caiQi" type="text" style="width: 70px"/> 
			日期：
				<input id="startTime" name="startTime" type="text"/> 至<input id="endTime" name="endTime" type="text"/> 
				<input type="submit" value="查询" class="formCheck" style="margin: 0px 0px;" />
			<td>
		</tr>
		</tbody>
	</table>

</form>
<table class="grayTable">
          <tbody><tr>
            <th>序号</th>
            <th >方案标题</th>
            <th >下单时间</th>
            <th >投注金额</th>
            <th >奖金</th>
            <th >开奖进度</th>
            <th >状态</th>
            <th >状态</th>
          </tr>
          <tr>
            <td colspan="8">您暂时没有短消息</td>
          </tr>
       	</tbody>
     </table>
<jsp:include page="../common/footer.jsp"></jsp:include>
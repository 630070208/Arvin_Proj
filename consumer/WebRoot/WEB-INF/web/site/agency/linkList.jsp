<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  <!--<![endif]-->
<head>
<title>推广链接</title>
<jsp:include page="../common/WerResources.jsp"></jsp:include>
<script src="/site/js/usercenter/RebateUtil.js"></script>
<script src="/site/js/usercenter/createSubUser.js"></script>
<script type="text/javascript" src = "/site/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/site/jquery/jquery.zclip.min.js"></script>
<script type="text/javascript">
	var copyUrl="请复制该URL发给会员";
	$(function(){
		$(".copy_input").zclip({
			path: '/site/jquery/ZeroClipboard.swf',
			copy: function(){
				return $(this).attr("url");
			},
			clickAfter:true
		});
	});
	function getUrl(url){
		copyUrl=url;
		//App.alert("提示！","请复制该URL发给会员   "+url+"");
	}
</script>

</head>
<body class="layout-two-column unibet custom-background">
	<div id="container">
		<jsp:include page="../common/WerHeader.jsp"></jsp:include>
		<div id="content">
			<div id="top">
				<div class="inner"></div>
			</div>

			<div id="main" role="main">

				<div class="main-container">
					<!-- 左侧菜单开始 -->
					<jsp:include page="AgencyMenu.jsp"></jsp:include>
					<!--彩种类型-->
					<div id="column-primary" class="stack gutter-col size4of5">
						<div class="header-image">
							<h2 class="heading">推广链接</h2>
						</div>

						<article class="rich-text-element main-column">
							<article class="widget bingo-game-chooser">
								<form action="" id="form" method="post" name="search">
									<div id="searchPanel">
									<input type="button" value="添加链接"
											class="btn" onclick="javascript:window.location.href='/uc/agency/link/addPage';"/>
									</div>
									<div id="top">
										<div class="inner"></div>
									</div>
									<table
										class="bingo-game-chooser-table table-decoration-7 color-theme-4">
										<thead>
											<tr>
												<th>
													<div class="title">
														<span>编号</span>
													</div></th>
												<th>
													<div class="title">
														<span>类型</span>
													</div></th>
												<th>
													<div class="title">
														<span>返点</span>
													</div></th>
												<th>
													<div class="title">
														<span>添加时间</span>
													</div></th>
												<th>
													<div class="title">
														<span>操作</span>
													</div></th>
											</tr>
										</thead>
										<tbody>
														
											<c:choose>
												<c:when test="${page != null}">
													<c:forEach var="item" items="${page.result}">		
														<tr>
															<td>${item.id }</td>
															<td>${item.memberType }</td>
															<td>${item.rebate }</td>
															<td><fmt:formatDate value="${item.time.time }"
																	pattern="yyyy-MM-dd HH:mm:ss" /></td>
															<td>
															<!-- <input type="button" class="btn green"
													                  value="修改" onclick ="javascript:window.location.href='';" > -->
															<input type="button" class="btn red"
													value="删除" onclick="javascript:window.location.href='/uc/agency/link/del?id=${item.id}';" >
															<input type="button" class="btn copy_input"  url="${item.encId }"
													value="复制链接" />
															</td>		
														</tr>
														</c:forEach>
													<tr class="lastTr">
														<td colspan="7"><input type="hidden" id="pageNo"  name="pageNo" value="1" /> <jsp:include
																page="../../common/frontpager.jsp" /></td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr class="lastTr">
														<td colspan="7">暂无记录！！</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</form>
							</article>
						</article>
							<div id="top">
								<div class="inner"></div>
							</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/WerFooter.jsp"></jsp:include>
	</div>
</body>
</html>
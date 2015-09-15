<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="wrapper">
	<h1 id="site-logo">
		<a href="/index.html"><img src="/imgs/logo.png" width="158px"
			height="60px" alt="Site Logo"> </a>
	</h1>
	<header id="header">
		<a href="javascript:;" data-toggle="collapse"
			data-target=".top-bar-collapse" id="top-bar-toggle"
			class="navbar-toggle collapsed"><i class="fa fa-cog"></i> </a> <a
			href="javascript:;" data-toggle="collapse"
			data-target=".sidebar-collapse" id="sidebar-toggle"
			class="navbar-toggle collapsed"><i class="fa fa-reorder"></i> </a>
	</header>
	<nav id="top-bar" class="collapse top-bar-collapse">
		<ul class="nav navbar-nav pull-left">
			<li class=""><a href="/index"><i class="fa fa-home"></i>系统首页</a>
			</li>
			<!-- li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="javascript:;">常用功能 <span
					class="caret"></span> </a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="javascript:;"><i class="fa fa-signal"></i>&nbsp;&nbsp;账号统计</a>
					</li>
					<li><a href="javascript:;"><i class="fa fa-comment"></i>&nbsp;&nbsp;网友反馈</a>
					</li>
					<li class="divider"></li>
					<li><a href="javascript:;"><i class="fa fa-tasks"></i>&nbsp;&nbsp;系统设置</a>
					</li>
				</ul>
			</li> -->
		</ul>
		<ul class="nav navbar-nav pull-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="javascript:;"><i class="fa fa-user"></i><%="admin"%><span
					class="caret"></span> </a>
				<ul class="dropdown-menu" role="menu">
					<!-- <li><a href="./page-profile.html"><i class="fa fa-user"></i>&nbsp;&nbsp;个人信息</a>
					</li>
					<li><a href="./page-calendar.html"><i
							class="fa fa-calendar"></i>&nbsp;&nbsp;我的日程</a>
					</li>
					<li><a href="./page-settings.html"><i class="fa fa-cogs"></i>&nbsp;&nbsp;个人设置</a>
					</li> -->
					<li class="divider"></li>
					<li><a href="/j_spring_security_logout"><i class="fa fa-sign-out"></i>&nbsp;&nbsp;退出登录</a>
					</li>
				</ul>
			</li>
		</ul>
	</nav>

	<div id="sidebar-wrapper" class="collapse sidebar-collapse">
		<div id="search">
			<form>
				<input class="form-control input-sm" type="text" name="search"
					placeholder="Search...">
				<button type="submit" id="search-btn" class="btn">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
		<!-- #search -->
		<nav id="sidebar">
			<ul id="main-nav" class="open-active">
				<li><a href="#"><i class="fa fa-dashboard"></i>
				</a></li>



				<li
					class="dropdown<c:if test="${'member'== pageId}"> active opened</c:if>"
					style="background-color: #ddd5741"><a href="javascript:;"><i
						class="fa fa-reorder"></i>会员管理<span class="caret"></span> </a>
					<ul class="sub-nav">
						<li><a href="/system/member/list"><i class="fa fa-tasks "></i>用户列表</a>
						</li>
						<li><a href="/system/member/list?istest=true"><i class="fa fa-tasks "></i>测试用户</a>
						</li>
						<li><a href="/system/memberlog/list"><i
								class="fa fa-sitemap"></i>登录日志</a>
						</li>
						<li><a href="/system/member/banklist"><i
								class="fa fa-reorder"></i>银行信息</a>
						</li>
					</ul>
				</li>


				<li
					class="dropdown<c:if test="${'gameConfig'== pageId}"> active opened</c:if>"><a
					href="javascript:;"><i class="fa fa-reorder"></i>游戏设置<span
						class="caret"></span> </a>
					<ul class="sub-nav">
						</li>
						<li><a href="/system/rebate/list"><i class="fa fa-tasks"></i>系统返点</a>
						</li>
						<li><a href="/system/dividend/list"><i
								class="fa fa-tasks"></i>总代分红</a>
						</li>
					</ul>
				</li>
				<li
					class="dropdown<c:if test="${'issue'== pageId}"> active opened</c:if>"><a
					href="javascript:;"><i class="fa fa-reorder"></i>彩期管理<span
						class="caret"></span> </a>
					<ul class="sub-nav">
						<li><a href="/system/issconf/list?type=CQSSC"><i
								class="fa fa-tasks "></i>彩期配置</a>
						</li>
						<li><a href="/system/issue/list?type=CQSSC"><i
								class="fa fa-tasks "></i>期数管理</a>
						</li>
					</ul></li>
				<li
					class="dropdown<c:if test="${'BusinessFlow'== pageId}"> active opened</c:if>"><a
					href="javascript:;"><i class="fa fa-reorder"></i>业务流水<span
						class="caret"></span> </a>
					<ul class="sub-nav">
						<li><a href="/system/business/tz/list"><i
								class="fa fa-reorder"></i>投注记录</a>
						</li>
						<li><a href="/system/business/txr/list"><i
								class="fa fa-tasks "></i>提现请求</a>
						</li>
						<li><a href="/system/business/cztk/list"><i
								class="fa fa-reorder"></i>帐变明细</a>
						</li>
						<li><a href="/system/member/findPayReques"><i
								class="fa fa-reorder"></i>用户充值流水</a>
						</li>
					</ul></li>
					
				<li class="dropdown <c:if test="${'proxyStat'== pageId}"> active opened</c:if>"><a
					href="javascript:;"><i class="fa fa-reorder"></i>流水统计<span
						class="caret"></span> </a>
					<ul class="sub-nav">
						<li>
							<a href="/system/proxy/proxyIndex"><i class="fa fa-reorder"></i>会员/代理流水统计</a>
						</li>
					</ul>
				</li>
				<li class="dropdown<c:if test="${'rebateConfig'== pageId}"> active opened</c:if>"><a
					href="javascript:;"><i class="fa fa-reorder"></i>系统管理<span
						class="caret"></span> </a>
					<ul class="sub-nav">
						<li><a href="/system/sysmsg"><i class="fa fa-reorder"></i>消息管理</a>
						</li>
						<li><a href="/system/business/rechargeIndex"><i
								class="fa fa-reorder"></i>用户充值</a>
						</li>
						<li><a href="/system/dividend/earningsIndex"><i
								class="fa fa-reorder"></i>盈利查询</a>
						</li>
						<li><a href="/system/member/indexAddProxy"><i
								class="fa fa-reorder"></i>添加总代理</a>
						</li>
						<li><a href="/system/member/indexAddMember"><i
								class="fa fa-reorder"></i>添加平台会员</a>
						</li>
						<li><a href="/system/game/alipayIndex"><i
								class="fa fa-reorder"></i>支护宝账户管理</a>
						</li>
						<li><a href="/system/deductConf/deductList"><i
								class="fa fa-reorder"></i>充值/提现手续费配置</a>
						</li>
					</ul>
				</li>
			</ul>
		</nav>
		<!-- #sidebar -->
	</div>
</div>
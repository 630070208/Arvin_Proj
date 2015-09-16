<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside id="column-secondary-2">
              <article class="sub-navigation-element compact">
                <div id="elastic-list-860168" class="widget elastic-list">
                  <h4 class="heading">代理信息</h4>
                  <ul class="menu">
                  	 <li class="visible <c:if test="${'link'== pageId}"> active</c:if>">
                      <a href="/uc/agency/userLink">推广链接 </a>							
                    </li>
                    <li class="visible <c:if test="${'interestReports'== pageId}"> active</c:if>">
                      <a href="/uc/interestReports">盈亏报表 </a>							
                    </li>
                    <li class="visible <c:if test="${'memberManagementPage'== pageId}"> active</c:if>">
                      <a href="/uc/memberManagementPage">间接下级管理</a>							
                    </li>
                    <li class="visible <c:if test="${'proxyManagementPage'== pageId}"> active</c:if>">
                      <a href="/uc/proxyManagementPage">直接下级管理</a>							
                    </li>
                    <li class="visible <c:if test="${'teamStatis'== pageId}"> active</c:if>">
                      <a href="/uc/teamStatis">团队预览</a>							
                    </li>
                    <li class="visible <c:if test="${'waterStatistics'== pageId}"> active</c:if>">
                      <a href="/uc/waterStatistics">流水统计</a>							
                    </li>
                    <c:if test="${!wer_member.istest}">
	                    <li class="visible <c:if test="${'registerSubordinatesPage'== pageId}"> active</c:if>">
	                      <a href="/uc/registerSubordinatesPage">会员注册   </a>							
	                    </li>
                    </c:if>
                    <li class="visible <c:if test="${'memberReportPage'== pageId}"> active</c:if>">
                      <a href="/uc/memberReportPage">会员报表   </a>							
                    </li>
                     <li class="visible <c:if test="${'commissionDetailPage'== pageId}"> active</c:if>">
                      <a href="/uc/commnDetail">佣金明细    </a>							
                    </li>
                     <%--  
	                    <li class="visible <c:if test="${'registeredQuotaPage'== pageId}"> active</c:if>">
	                      <a href="/uc/registeredQuotaPage">用户配额    </a>							
	                    </li>
	                    <li class="visible <c:if test="${'rebate'== pageId}"> active</c:if>">
	                      <a href="/uc/agency/rebatepage">返点详情    </a>							
	                    </li>
                     --%>
                  </ul>
                  <br>
                </div>
              </article>
            </aside>
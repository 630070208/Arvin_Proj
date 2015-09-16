<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside id="column-secondary-2">
              <article class="sub-navigation-element compact">
                <div id="elastic-list-860168" class="widget elastic-list">
                  <h4 class="heading">系统公告</h4>
                  <ul class="menu">
                    <li class="visible <c:if test="${'inboxPage'== pageId}"> active</c:if>">
                      <a href="/uc/inboxPage">系统公告</a>							
                    </li>
                     <li class="visible <c:if test="${'outboxPage'== pageId}"> active</c:if>">
                      <a href="/uc/outboxPage">系统消息</a>							
                    </li>
                   <%--  <li class="visible <c:if test="${'outboxPage'== pageId}"> active</c:if>">
                      <a href="/uc/outboxPage">已发信息   </a>							
                    </li>
                    <li class="visible <c:if test="${'sendPage'== pageId}"> active</c:if>">
                      <a href="/uc/sendPage">发送信息    </a>							
                    </li> --%>
                  </ul>
                 <br/>
                 <br/>
                 <br/>
                </div>
              </article>
            </aside>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside id="column-secondary-2">
              <article class="sub-navigation-element compact">
                <div id="elastic-list-860168" class="widget elastic-list">
                  <h4 class="heading">充值提现</h4>
                  <ul class="menu">
                    <li class="visible <c:if test="${'rechargePage'== pageId}"> active</c:if>">
                      <a href="/uc/rechargePage">在线充值</a>							
                    </li>
                    <li class="visible <c:if test="${'withdrawalPage'== pageId}"> active</c:if>">
                      <a href="/uc/withdrawalPage">彩金提现 </a>							
                    </li>
                    <li class="visible <c:if test="${'bindCardIdPage'== pageId}"> active</c:if>">
                      <a href="/uc/bindCardIdPage">绑定银行卡    </a>							
                    </li>
                    <li class="visible <c:if test="${'transferPage'== pageId}"> active</c:if>">
                      <a href="/uc/transferPage">会员转账    </a>							
                    </li>
                  </ul>
                  <br>
                </div>
              </article>
            </aside>

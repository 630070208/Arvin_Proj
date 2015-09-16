<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<footer id="footer">
        <div class="footer-row social-media">
          <div class="inner">
            <ul>
              <li>
              	建议使用浏览器
              </li>
              <li>
              <a href="http://www.google.com/chrome" class="has-icon-prefix automated" target="_blank"><i class="icon-prefix icon-browser-chrome"></i><span class="text">谷歌Chrome</span>   </a>
              </li>
             <!--  <li>
                <a href="http://chrome.360.cn/" class="has-icon-prefix automated" target="_blank" ><i class="icon-prefix icon icon-browser-360"></i><span class="text">奇虎360极速</span>   </a>		
              </li>
              <li>
              	<a href="http://windows.microsoft.com/zh-cn/internet-explorer/download-ie-MCM" class="has-icon-prefix automated" target="_blank" ><i class="icon-prefix icon icon-browser-ie"></i><span class="text">微软IE10</span>   </a>
              </li>
               <li>
               <a href="https://www.mozilla.org/zh-CN/firefox/new/" class="has-icon-prefix automated" target="_blank" ><i class="icon-prefix icon icon-browser-firefox"></i><span class="text">火狐Firefox</span>   </a>
              </li>
              <li>
              	<a href="http://www.apple.com/cn/safari/" class="has-icon-prefix automated" target="_blank" ><i class="icon-prefix icon icon-browser-safari"></i><span class="text">苹果Safari</span>   </a>
              </li> -->
            </ul>
          </div>
        </div>
        <div class="footer-row site-map">
          <div class="inner">
            <ul>
              <li>
                <h3>
                  <a href="javascript:;">
                  低频彩
                  </a>
                </h3>
                <ul>
					<li>
						<a href="/game/fc3d/bet">3D福彩</a>
					</li>
					<li>
						<a href="/game/pl3/bet">排列三</a>
					</li>
				</ul>
              </li>
              <li>
                <h3>
                  <a href="javascript:;">
                  高频彩
                  </a>
                </h3>
                <ul>
                 <li><a href="/game/cqssc/bet">重庆时时彩</a>
				</li>
				<li><a href="/game/jxssc/bet">江西时时彩</a>
				</li>
				<li><a href="/game/xjssc/bet">新疆时时彩</a>
				</li>
				<li><a href="/game/klsf/bet">快乐十分</a>
				</li>
				<li><a href="/game/jsk3/bet">江苏快3</a>
				</li>
				<!-- <li><a href="#">北京快乐8</a>
					 </li>
				 -->
                </ul>
              </li>
              <li>
                <h3>
                  <a href="javascript:;">
                  乐透彩
                  </a>
                </h3>
                <ul>
                  <li><a href="/game/cq115/bet">重庆11选5</a>
					</li>
					<li ><a href="/game/gd115/bet">广东11选5</a>
					</li>
					<li ><a href="/game/sd115/bet">山东11选5</a>
					</li>
                </ul>
              </li>
              <li>
                <h3>
                  <a href="javascript:;">
                  个人中心
                  </a>
                </h3>
                <ul>
                  <li>
					<a href="/uc/userIndexPage">账户总览</a></li>
				<li>
					<a href="/uc/buyListPage">钱包流水</a></li>
				<li>
					<a href="/uc/modifyUserInfoPage">完善资料 </a></li>
				<li>
					<a href="/uc/orderList">订单查询 </a></li>
				<li>
					<a href="/uc/winningListPage">中奖查询 </a></li>
                </ul>
              </li>
              <li>
                <h3>
                 <a href="javascript:;">
                  充值提现
                  </a>
                </h3>
                <ul>
                   <li>
                      <a href="/uc/rechargePage">在线充值</a>							
                    </li>
                    <li>
                      <a href="/uc/withdrawalPage">彩金提现 </a>							
                    </li>
                    <li>
                      <a href="/uc/bindCardIdPage">绑定银行卡    </a>
                       <c:if test="${wer_member.userType.toString()!='会员'}">							
                    </li>
                    <li>
                      <a href="/uc/transferPage">会员转账    </a>			
                    </li>
                     </c:if>
                </ul>
              </li>
               <c:if test="${wer_member.userType.toString()!='会员'}">
	              <li>
	                <h3>
	                 <a href="javascript:;">
	             		 代理信息
	                  </a>
	                </h3>
	                <ul>
	                 <li>
	                      <a href="/uc/memberManagementPage">会员管理</a>							
	                    </li>
	                    <li>
	                      <a href="/uc/registerSubordinatesPage">会员注册   </a>							
	                    </li>
	                    <li>
	                      <a href="/uc/memberReportPage">会员报表   </a>							
	                    </li>
	                     <li>
	                      <a href="/uc/commissionDetailPage">佣金明细    </a>							
	                    </li>
	                </ul>
	              </li>
              </c:if>
              <li>
                <h3>
                  <a href="javascript:;">关于我们</a>		
                </h3>
              </li>
            </ul>
          </div>
        </div>
        <div class="footer-row responsible-gaming">
          <div class="inner">
            <div class="responsible-gaming-container">
              <div class="logos">
                <ul>
                  <li>
                    <a href="/myaccount/responsiblegaming/whentostop#eighteenplus" class="logo-ulinkeighteenplus" title="Unibet only accepts customers who are over 18 years of age. We try our best to diminish the chance of underage gambling by asking for identification and documentation when we suspect that a customer may be less than 18 years old.">   </a>		
                  </li>
                </ul>
              </div>
              <div class="info">
               <p>Copyright© 2012-2014, WERCAI. All rights reserved..</p>
              </div>
              <div class="links">
                <ul>
                  <li>
                    <a href="javascript:()void">服务协议</a>		
                  </li>
                  <li>
                    <a href="javascript:()void">客户服务</a>		
                  </li>
                  <li>
                    <a href="javascript:()void">安全保障</a>		
                  </li>
                  <li>
                    <a href="javascript:()void">加入收藏</a>		
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </footer>
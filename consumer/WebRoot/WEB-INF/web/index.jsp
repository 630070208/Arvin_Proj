<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html manifest="mlottery.manifest">
<!DOCTYPE html>
<html>
<head>
<title>玩儿彩首页</title>
<jsp:include page="site/common/WerResources.jsp"></jsp:include>
<link rel="stylesheet" href="/wer/css/nivo-slider/themes/default/default.css" type="text/css" media="screen" />
<link rel="stylesheet" href="/wer/css/index.css" type="text/css" media="screen" />
<script src="/wer/js/jquery.nivo.slider.js"></script>
</head>
<body class="layout-two-column unibet custom-background">
<div id="container">
	<jsp:include page="site/common/WerHeader.jsp"></jsp:include>
	<div id="content">
		<div id="top">
          <div class="inner">
            <div class="site-takeover text-align-center color-theme-1">
              <div class="wrapper">
                <h2 class="headline">注册即送   ￥10</h2>
                <br>
                <p class="body">立即注册，享受网络购彩的便利和乐趣!</p>
                <br>
                <a href="/stan/campaign.do?cmpId=168805" data-track-action="Click" data-track-category="Sitetakeover" data-automated-function="clickTracker" data-track-label="Sitetakeover link" class="btn automated link-track">马上注册</a>
              </div>
            </div>
          </div>
        </div>
		
		<div id="main" role="main">
          <div class="main-container">
            <article id="column-primary" class="size3of4">
              <section class="box-teaser-container box-teaser-size-3">
                <div class="box-teaser-column">
                  <article class="teaser teaser-large teaser-single-link-with-text color-theme-1">
                    <a href="javascript:()void"> 爱心</a>		
                    <h3 class="heading has-icon-prefix">
                      <i class="icon icon-prefix icon-betting"></i>
                      <span class="text">
                      爱心
                      </span>
                    </h3>
                    <div class="image-frame">
                      <img src="/wer/imgs/res/ax.jpg">
                    </div>
                    <div class="teaser-content automated" data-automated-function="equalHeight" style="min-height: 151px;">
                      <button class="btn has-icon-suffix color-theme-1"><span class="text">了解更多</span><i class="icon-suffix icon icon icon-btn-arrow-right"></i></button>
                      <p>• 扶老、助残 <br>
                        •  传递爱心 温暖人心<br>
                      </p>
                    </div>
                  </article>
                </div>
                <div class="box-teaser-column">
                  <article class="teaser teaser-large teaser-single-link-with-text color-theme-2">
                    <a href="javascript:()void">公益</a>		
                    <h3 class="heading has-icon-prefix">
                      <i class="icon icon-prefix icon-casino"></i>
                      <span class="text">
                      公益
                      </span>
                    </h3>
                    <div class="image-frame">
                      <img src="/wer/imgs/res/gy.jpg">
                    </div>
                    <div class="teaser-content automated" data-automated-function="equalHeight" style="min-height: 151px;">
                      <button class="btn has-icon-suffix color-theme-2"><span class="text">了解更多</span><i class="icon-suffix icon icon icon-btn-arrow-right"></i></button>
                      <p>• 救孤、济困 <br> • 促进社会公益事业发展</p>
                    </div>
                  </article>
                </div>
                <div class="box-teaser-column">
                  <article class="teaser teaser-large teaser-single-link-with-text color-theme-3">
                    <a href="javascript:()void">了解更多</a>		
                    <h3 class="heading has-icon-prefix">
                      <i class="icon icon-prefix icon-poker"></i>
                      <span class="text">
                      娱乐
                      </span>
                    </h3>
                    <div class="image-frame">
                      <img src="/wer/imgs/res/yl.jpg">
                    </div>
                    <div class="teaser-content automated" data-automated-function="equalHeight" style="min-height: 151px;">
                      <button class="btn has-icon-suffix color-theme-3"><span class="text">了解更多</span><i class="icon-suffix icon icon icon-btn-arrow-right"></i></button>
                      <p>• <b>公开、公平、公正、诚实</b><br> • 玩法简单、赔率多样化  </p>
                    </div>
                  </article>
                </div>
              </section>
              <section class="box-teaser-container box-teaser-size-0">
              </section>
            </article>
            <aside id="column-secondary" class="size1of4">
              <article class="banner-element">
                <div class="box color-theme-none">
                  <div class="banner">
                    <a href="Javascript:void();" class="automated link-track" data-track-action="Click /start" data-track-category="Campaign Banner" data-automated-function="clickTracker" data-track-label="Mobile RFB (1.478430)"> <img src="/wer/imgs/res/gc.jpg"></a>		
                  </div>
                </div>
              </article>
              <article class="banner-element">
                <div class="box color-theme-none">
                  <h1 class="box-heading">邀请小伙伴一起玩儿吧!</h1>
                  <div class="banner">
                    <a href="Javascript:void();" class="automated link-track" data-track-action="Click /start" data-track-category="Campaign Banner" data-automated-function="clickTracker" data-track-label="RAF (1.564847)"><img src="/wer/imgs/res/1.jpg">   </a>		
                  </div>
                </div>
              </article>
              <a href="Javascript:void();">
                <div id="openSurvey"></div>
              </a>
              <style>
                #openSurvey {
                display: block;
                position: fixed;
                bottom: 0;
                right: 0;
                width: 51px;
                height: 50px;
                cursor: hand;
                z-index: 999;
                background: transparent url('/wer/imgs/res/bang.png') no-repeat;
                }
              </style>
              <script type="text/javascript">
                var newWindow;
                function openSurveyPopup(url)
                {
                	newWindow=window.open(url,'name','height=800,width=1000,resizable=yes,scrollbars=yes');
                	if (window.focus) {newwindow.focus()}
                }
              </script>
            </aside>
          </div>
        </div>
	</div>
	
	
	
	<jsp:include page="site/common/WerFooter.jsp"></jsp:include>
	

</div>

</body>
</html>

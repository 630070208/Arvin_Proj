<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/WEB-INF/tld/util-tags.tld"%>
<%@ taglib prefix="page" uri="/WEB-INF/tld/page-tags.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<title>游戏管理</title>
<jsp:include page="../common/headResources.jsp"></jsp:include>
</head>
<body>
<!-- 菜单 -->
<jsp:include page="../common/head.jsp"></jsp:include>
<div id="content">
<div id="content-header">
<h1>游戏管理</h1>
</div>
<div id="content-container">
<div class="row"><div class="col-md-12">

<form action="/gameConfig/save" method="post" class="form-horizontal">
<input type="hidden" name="id" value="${dataModel.id}" />
<div class="form-group">
<label class="col-md-2">null：</label>
<div class="col-md-5">
<input type="text" name="gameType" class="form-control" value="${dataModel.gameType}"/>
</div>
</div>

<div class="form-group">
<label class="col-md-2">null：</label>
<div class="col-md-5">
<input type="text" name="isOpen" class="form-control" value="${dataModel.isOpen}" required/>
</div>
</div>

<div class="form-group">
<label class="col-md-2">null：</label>
<div class="col-md-5">
<input type="text" name="isZh" class="form-control" value="${dataModel.isZh}" required/>
</div>
</div>

<div class="form-group">
<label class="col-md-2">null：</label>
<div class="col-md-5">
<input type="text" name="maxMulti" class="form-control" value="${dataModel.maxMulti}" required/>
</div>
</div>

<div class="form-group">
<label class="col-md-2">null：</label>
<div class="col-md-5">
<input type="text" name="playType" class="form-control" value="${dataModel.playType}"/>
</div>
</div>

<div class="form-group">
<label class="col-md-2">null：</label>
<div class="col-md-5">
<input type="text" name="rstctCode" class="form-control" value="${dataModel.rstctCode}"/>
</div>
</div>

<div class="form-group">
<label class="col-md-2">null：</label>
<div class="col-md-5">
<input type="text" name="rstctNumber" class="form-control" value="${dataModel.rstctNumber}" required/>
</div>
</div>
<div class="form-group">
<div class="col-md-7 col-md-push-3">
<input type="submit" class="btn btn-primary" value="保   存"></input>
</div>
</div>
</form>
</div>
</div>
</div>
</div>
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>
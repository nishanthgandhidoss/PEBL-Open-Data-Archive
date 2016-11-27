<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${webapp_path}/js/home.js"></script>

<style>
.btn-info, .btn-info:hover {
    color: #ffcd00;
    background-color: #222;
    font-weight: bold;
    border-width: 0px;
}
.btn-info:hover {
	border-color: #ffcd00;
	border-width: 2px 2px 1px 1px;
}
</style>

<div class="container-fluid">
	<h1><center>Welcome to PEBL Open Data Archive. We are building ourself.</center></h1>
	<div class="row" style="padding: 10% 0">
		<div class="col-md-1"></div>
		<a class="col-md-4 btn btn-info btn-lg" role="button" href="${webapp_path}/addStudy.sp">Create Study</a>
		<div class="col-md-2"></div>
		<a class="col-md-4 btn btn-info btn-lg" role="button" href="${webapp_path}/listStudy.sp">List Study</a>
		<div class="col-md-1"></div>
	</div>	
</div>

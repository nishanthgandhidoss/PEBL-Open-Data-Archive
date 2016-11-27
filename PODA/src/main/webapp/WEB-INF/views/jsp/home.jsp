<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${webapp_path}/js/home.js"></script>
<style>
.btn-info {
    color: #ffcd00;
    background-color: #222;
    border-color: #ffcd00;
    font-weight: bold;
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

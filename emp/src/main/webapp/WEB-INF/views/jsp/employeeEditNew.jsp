<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html  xmlns:th="http://www.thymeleaf.org">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<style type="text/css">
</style>

<title>従業員新規登録画面</title>
</head>

<body>


	<div class="container">
		<h2>従業員新規登録</h2>
		<div>
		<form:form
           action="${pageContext.request.contextPath}/create"
            method="post" modelAttribute="employeeForm">
            <div class="row">
     		<div class="col">
			<div class="row mb-3">
				<form:label path="id" class="col-sm-1 col-form-label">ID</form:label>
				<div class="col-sm-3">
       			<form:input path="id" class="form-control" value="" required="required"/>
       			</div>
       			<div class="col">
       			<p class="text-danger" style="display:inline">
       			<form:errors path="id"></form:errors>
       			<c:out value="${noUniq}"></c:out>
       			</p>
       			</div>
				<div class="col">
				</div>
				</div>
				
				</div>
				</div>
				
       			<div class="row mb-3">
       			<form:label path="name" class="col-sm-1 col-form-label">NAME</form:label>
       			<div class="col-sm-3">
       			<form:input path="name" class="form-control" value="" required="required"/>
       			</div>
       			</div>
       			
       			<div class="row mb-3">
       			<form:label path="kana" class="col-sm-1 col-form-label">KANA</form:label>
       			<div class="col-sm-3">
       			<form:input path="kana" class="form-control" value="" required="required"/>
       			</div>
       			</div>
       			
       			<div class="row mb-3">
       			<form:label path="email" class="col-sm-1 col-form-label">EMAIL</form:label>
       			<div class="col-sm-3">
       			<form:input path="email" class="form-control" value=""/>
       			</div>
       			</div>

				
					<form:button class="btn btn-danger">登録</form:button>

					<a class="btn btn-primary" href="${pageContext.request.contextPath}" role="button" >一覧へ戻る</a>
					
					
			 </form:form>
			
		</div>
	</div>
	
</body>
</html>

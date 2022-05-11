<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>従業員詳細情報編集画面</title>
</head>

<body>
	<div class="container">
		<h2 >従業員詳細情報編集</h2>
		
		<div>
		
			<form:form
           action="${pageContext.request.contextPath}/edit"
            method="post" modelAttribute="employeeForm">
			 <c:forEach items="${empList}" var="emp">
				<div class="row mb-3">
				<form:label path="id" class="col-sm-1 col-form-label">ID:</form:label>
           			<div class="col-sm-3">
					<form:input path="id" class="form-control" readonly="true"/>
				</div>	
				</div>
				<div class="row mb-3">
				<form:label path="name" class="col-sm-1 col-form-label" >NAME:</form:label>
           			<div class="col-sm-3">
					<form:input path="name" class="form-control" value="${emp.name}" required="required"/>
				</div>	
				</div>
				<div class="row mb-3">
				<form:label path="kana" class="col-sm-1 col-form-label">KANA:</form:label>
           			<div class="col-sm-3">
					<form:input path="kana" class="form-control" value="${emp.kana}" required="required"/>
				</div>	
				</div>
				<div class="row mb-3">
				<form:label path="email" class="col-sm-1 col-form-label">EMAIL:</form:label>
           			<div class="col-sm-3">
					<form:input path="email" class="form-control" value="${emp.email}"/>
				</div>	
				</div>
				</c:forEach>
				<div>
					<form:button class="btn btn-danger">更新</form:button>
					<a class="btn btn-primary" href="${pageContext.request.contextPath}/edit/show" role="button">詳細へ戻る</a>
				</div>
				
			</form:form>
		
		</div>
	
	</div>
	
</body>
</html>
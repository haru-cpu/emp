<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>従業員詳細画面</title>
</head>

<body>

	
	<div class="container">
		<h2>従業員詳細情報</h2>
		
		<c:forEach items="${empList}" var="emp">
		<div class="row mb-3">
           			<label class="col-sm-1 col-form-label">ID:</label>
           			<div class="col-sm-3">		
					<p class="form-control" ><c:out value="${emp.id}" /></p>
				</div>
				</div>	
			
		<div class="row mb-3">
           			<label class="col-sm-1 col-form-label">NAME:</label>
           			<div class="col-sm-3">		
					<p class="form-control" ><c:out value="${emp.name}" /></p>
				</div>
				</div>			
			
		<div class="row mb-3">
           			<label class="col-sm-1 col-form-label">KANA:</label>
           			<div class="col-sm-3">		
					<p class="form-control" ><c:out value="${emp.kana}" /></p>
				</div>
				</div>	
				
		<div class="row mb-3">
           			<label class="col-sm-1 col-form-label">EMAIL:</label>
           			<div class="col-sm-3">		
					<p class="form-control" ><c:out value="${emp.email}" /></p>
				</div>
				
				
				</div>		
				
	</c:forEach>
		

		<div >
		  
			<a class="btn btn-success" href="${pageContext.request.contextPath}/show/edit" role="button">編集</a>
			<a class="btn btn-primary"href="${pageContext.request.contextPath}" role="button">一覧へ戻る</a>
			
		</div>	
		</div>
		
	
	
</body>
</html>

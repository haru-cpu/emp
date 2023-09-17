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
		
			<form action="EmpList" method="post">
			<c:forEach items="${employeeList}" var="emp" >
				<div class="row mb-3">
				<label class="col-sm-1 col-form-label">ID:</label>
           			<div class="col-sm-3">
					<input type="text"  class="form-control" name="id" value="${emp.id}" disabled/>
				</div>	
				</div>
				<div class="row mb-3">
				<label class="col-sm-1 col-form-label">NAME:</label>
           			<div class="col-sm-3">
					<input type="text" class="form-control" name="name" value="${emp.name}"/>
				</div>	
				</div>
				<div class="row mb-3">
				<label class="col-sm-1 col-form-label">KANA:</label>
           			<div class="col-sm-3">
					<input type="text" class="form-control" name="kana" value="${emp.kana}"/>
				</div>	
				</div>
				<div class="row mb-3">
				<label class="col-sm-1 col-form-label">EMAIL:</label>
           			<div class="col-sm-3">
					<input type="text" class="form-control" name="email" value="${emp.email}"/>
				</div>	
				</div>
				</c:forEach>
				<div>
					<button type="submit" class="btn btn-danger"name="edit" value="edit">更新</button>
					<a class="btn btn-primary" href="EmpList?show=success" role="button">詳細へ戻る</a>
				</div>
				
			</form>
		
		</div>
	
	</div>
	
</body>
</html>
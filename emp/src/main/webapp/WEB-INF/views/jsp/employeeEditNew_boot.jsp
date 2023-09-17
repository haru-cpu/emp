<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

String error = (String)request.getAttribute("error");
%>
<!doctype html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<style type="text/css">
</style>

<title>従業員新規登録画面</title>
</head>

<body>
<form action="EmpList" method="post">
	<div class="container">
		<h2>従業員新規登録</h2>
		<div>
			
			<c:choose>
			
				<c:when test="${!empty error}">
				
     			 <div class="row">
     			  <div class="col">
					<div class="row mb-3">
						<label class="col-sm-1 col-form-label">ID:</label>
						<div class="col-sm-3">
						<input type="text" class="form-control" name="id"  value="${bean.id}"required/>
						</div>
						<div class="col">
						<p class="text-danger" style="display:inline"><c:out value="${error}"></c:out></p>
						</div>
						</div>
				
					</div>
					</div>
				
					<div class="row mb-3">
						<label class="col-sm-1 col-form-label">NAME:</label>
						<div class="col-sm-3">
						<input type="text" class="form-control" name="name"  value="${bean.name}" required/>
					</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-1 col-form-label">KANA:</label>
						<div class="col-sm-3">
						<input type="text" class="form-control" name="kana" value="${bean.kana}" required/>
					</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-1 col-form-label">EMAIL:</label>
						<div class="col-sm-3">
						<input type="text" class="form-control" name="email" value="${bean.email}"/>
					</div>
					</div>
					
				</c:when>
				
				<c:otherwise>
				<div class="row mb-3">
					<label class="col-sm-1 col-form-label">ID:</label>
           				<div class="col-sm-3">
						<input type="text" class="form-control" name="id" required/>
						</div>
					</div>
					<div class="row mb-3">
					<label class="col-sm-1 col-form-label">NAME:</label>
						<div class="col-sm-3">
						<input type="text" class="form-control" name="name" required/>
					</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-1 col-form-label">KANA:</label>
           				<div class="col-sm-3">
						<input type="text" class="form-control" name="kana" required/>
					</div>
					</div>
					<div class="row mb-3">
					<label class="col-sm-1 col-form-label">EMAIL:</label>
           			<div class="col-sm-3">
						<input type="text" class="form-control" name="email" />
						</div>
					</div>
				</c:otherwise>
				
			</c:choose>

				<div >
					<button type="submit"class="btn btn-danger" name="insert" value="insert">登録</button>

					<a class="btn btn-primary" href="EmpList" role="button" >一覧へ戻る</a>
					
					
				</div>
			
		</div>
	</div>
	</form>
	
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
    <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>従業員一覧</title>
    </head>
    <body>
<p class="container-xl">検索方法を選択してください</p>
			
       		<form:form
          	 action="${pageContext.request.contextPath}/list"
            method="post" modelAttribute="employeeForm">
            
            <div class="container-xl">
            
            	  	<p>
        	 			ID：<input type="radio" name="radio" value="id_radio"  required="required">
            			KANA：<input type="radio" name="radio" value="kana_radio" required="required">
        			</p>
        			<div class="row mb-2">
                		<label class="col-sm-1 col-form-label">ID:</label>
            				<div class="col-sm-3">
                				<input type="text" name="id" value="${id}" class="form-control"></input>
            				</div>
            		</div>
           			<div class="row mb-2">
           				<label class="col-sm-1 col-form-label">KANA:</label>
           					<div class="col-sm-3">
               					<input type="text" name="kana" value="${kana}" class="form-control" placeholder="あいまい検索できます"></input>
           					</div>
           			</div>
                <form:button class="btn btn-primary">検索</form:button>
       			<input type="reset" class="btn btn-primary" name="reset" value="リセット">
       			<c:out value="${nodata}"></c:out>
  
      </form:form>   
       
      <div class="container">
       <div class="row">
       
       <div class="col">
     	 <h2>従業員一覧</h2>
     	 </div>
       	<div class="col">
  		<div class="d-grid gap-2 d-md-flex justify-content-md-end">

       <!-- リンク -->
       <a class="btn btn-success" href="register" role="button">新規登録</a>
       </div>
       </div>
      </div>
       </div>
   

<div class="container-xl">
        <table class="table table-striped table-hover table table-bordered">
            
            <thead>
                <tr class="table-dark">
                    <th>ID</th>
                    <th>NAME</th>
                    <th>KANA</th>
                    <th>EMAIL</th>
                </tr>
            </thead>
            <tbody>
            
               <c:forEach items="${empList}" var="emp">
               <tr>
               <th><a href="show/${emp.id}"><c:out value="${emp.id}"></c:out></a></th>
               <th><c:out value="${emp.name}"></c:out></th>
               <th><c:out value="${emp.kana}"></c:out></th>
               <th><c:out value="${emp.email}"></c:out></th>
             </tr>  
               </c:forEach>  
            </tbody>
        </table>
</div>
    </body>
</html>
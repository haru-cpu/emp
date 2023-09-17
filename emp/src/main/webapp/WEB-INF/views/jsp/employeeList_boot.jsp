<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String id = (String)session.getAttribute("id");
String kana = (String)session.getAttribute("kana");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
   		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>従業員一覧</title>
    </head>
    <body>
		<p class="container-xl">検索方法を選択してください</p>
        <form action="EmpList" method="post">
     
        	<c:choose>
        		<c:when test="${!empty id}">
        		<div class="container-xl">
        			<p>
        				 ID：  <input type="radio" name="radio" value="id_radio" checked="checked" required>
            			 KANA：<input type="radio" name="radio" value="kana_radio" required>
        			</p>
        			<div class="row mb-2">
            			<label class="col-sm-1 col-form-label">ID:</label>
            				<div class="col-sm-3">
                				<input type="text" class="form-control"  name="id_text" value="${id}"></input>
            				</div>
            		</div>
           			<div class="row mb-2">
           				<label class="col-sm-1 col-form-label">KANA:</label>
           					<div class="col-sm-3">
               					<input type="text" class="form-control"　 name="kana_text" placeholder="あいまい検索できます">
           					</div>
           			</div>
           		</div>
            	</c:when>
            		
            	<c:when test="${!empty kana}">
            	<div class="container-xl">
            		<p>
        	 			ID：<input type="radio" name="radio" value="id_radio" required>
            			KANA：<input type="radio" name="radio" value="kana_radio"  checked="checked" required>
        			</p>
            	
            		
            		<div class="row mb-2">
            			<label class="col-sm-1 col-form-label">ID:</label>
            				<div class="col-sm-3">
                				<input type="text" class="form-control"  name="id_text" ></input>
            				</div>
            		</div>
           			<div class="row mb-2">
           				<label class="col-sm-1 col-form-label">KANA:</label>
           					<div class="col-sm-3">
               					<input type="text" class="form-control" name="kana_text" value="${kana}" placeholder="あいまい検索できます"></input>
           					</div>
           			</div>
           		</div>
            	</c:when>
            	
            	<c:otherwise>
            	<div class="container-xl">
            	  	<p>
        	 			ID：<input type="radio" name="radio" value="id_radio"   required>
            			KANA：<input type="radio" name="radio" value="kana_radio" required>
        			</p>
        			<div class="row mb-2">
            		<label class="col-sm-1 col-form-label">ID:</label>
            		<div class="col-sm-3">
                		<input type="text" class="form-control"  name="id_text" ></input>
            		</div>
            		</div>
           			<div class="row  mb-2" >
           			<label class="col-sm-1 col-form-label">KANA:</label>
           			<div class="col-sm-3">
               			<input type="text" class="form-control" name="kana_text" placeholder="あいまい検索できます">
           			</div>
           			</div>
           		</div>
            	</c:otherwise>
       		</c:choose>
       		<div class="container-xl">
                <button type="submit" class="btn btn-primary" name="search" value="search">検索</button>
       
  
				<input type="reset" class="btn btn-primary" name="reset" value="リセット">
				
				<c:out value="${error}"></c:out>
       			
            </div>
                
               
               
       </form>	    
       <div>
       <div class="container">
       <div class="row">
       
       <div class="col">
     	 <h2>従業員一覧</h2>
     	 </div>
       	<div class="col">
  		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
    	   <a class="btn btn-success" href="EmpList?editNew=success" role="button">新規登録</a>
       	</div>
       </div>
      </div>
       </div>
</div>
<div class="container-xl">
        <table class="table table-striped table-hover table table-bordered">
            
            <thead>
                <tr class="table-dark">
                    <th >ID</th>
                    <th >NAME</th>
                    <th >KANA</th>
                    <th >EMAIL</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${employeeList}" var="emp" >
                    <tr>
                        <th><a href="EmpList?number=${emp.id}"><c:out value="${emp.id}" /></a></th>
                        <td><c:out value="${emp.name}" /></td>
                        <td><c:out value="${emp.kana}" /></td>
                        <td><c:out value="${emp.email}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </div>
		
    </body>
</html>

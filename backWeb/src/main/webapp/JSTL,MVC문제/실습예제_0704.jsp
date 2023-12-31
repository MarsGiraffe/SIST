<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
   
    <script src = "https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    	// window.onload와 동일한 메서드
    	$(document).ready( function(){
    		
    		$("h2").text("jquery 로딩 성공")
    	});
    </script>      
<%--
1)
useBean 기본 속성
- 자바빈에 저장된 값을 표현하는 것
- 메서드 이름을 사용해서 프로퍼티의 이름을 결정
- setter
- getter
- boolean 타입일 경우 getter에 get대신 is 사용 가능
- 배열 지정 가능

 --%>    
</head>
<body>
	<jsp:useBean id="m1" class="backWeb.z01_vo.Member"/>
	<jsp:setProperty property="name" name="m1" value="오길동"/>
    <h3>회원이름1:<jsp:getProperty property="name" name="m1"/></h3>
    <h3>회원이름2:${m1.name}</h3>
    
    <jsp:useBean id="gugu" class="backWeb.z01_vo.Gugu"/>
    <jsp:setProperty property="*" name="gugu"/>
    <jsp:useBean id="list" class="java.util.ArrayList" scope="session"/>
    <c:if test="${not empty gugu.num1}">
    	${list.add(gugu)}
    </c:if>
    <div class="container mt-3">
    	<h2>구구단</h2>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="num1">숫자1:</label>
            <input type="number" class="form-control" 
      	     id="num1" placeholder="숫자1 입력" name="num1" value="${param.num1 }">
         	</div>
         	<select name="cal">
         		<option value='0'> + </option>
         		<option value='1'> - </option>
         		<option value='2'> * </option>
         		<option value='3'> / </option>
         	</select>
         	<div class="mb-3 mt-3">
            <label for="num2">숫자2:</label>
            <input type="text" class="form-control" 
      	     id="num2" placeholder="숫자2 입력" name="num2" value="${param.num2}">
         	</div>
         	<button type="submit" class="btn btn-primary">정답 확인</button>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>숫자1</th>
				    <th>연산자</th>
				    <th>숫자2</th>
				    <th>결과</th>
		      	</tr>
		    </thead>
		    <c:set var="chCal" value="${[li.num1+li.num2,
		    li.num1-li.num2,li.num1*li.num2,li.num1/li.num2]}"/>
		    <c:set var="calStr" value="${['+','-','×','÷']}"/>
		    <tbody>
		    	<c:forEach var="li" items="${list}">
			   	<tr class="text-center">
			        <td>${li.num1}</td>
			        <td>${calStr[li.cal]}</td>
			        <td>${li.num2}</td>
			        <td>${chCal[li.cal]}</td>
			   	</tr>
			   	</c:forEach>
		 	</tbody>
		</table>
	</div>	
	<jsp:useBean id="mem" class="backWeb.z01_vo.Member"/>
	<jsp:useBean id="dao" class="backWeb.a01_dao.A05_MemberDao"/>	      	
    <jsp:setProperty property="*" name="mem"/>
    <c:set var="msg" value="비회원"/>
    <c:if test="${dao.checkLogin(param.id,param.pass)}">
    	<c:set var="msg" value="로그인"/>
    </c:if>
    <div class="container mt-3">
    	<h2>회원 인증</h2>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="id">아이디:</label>
            <input type="text" class="form-control" 
      	     id="id" placeholder="아이디 입력" name="id">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="pass">비밀번호:</label>
            <input type="text" class="form-control" 
      	     id="pass" placeholder="비밀번호 입력" name="pass">
         	</div>
         	<button type="submit" class="btn btn-primary">인증</button>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>아이디</th>
				    <th>비밀번호</th>
				    <th>인증 여부</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr class="text-center">
			        <td>${mem.id}</td>
			        <td>${mem.pass}</td>
			        <td>${msg}</td>
			   	</tr>
		 	</tbody>
		</table>      	
    </div>
    <jsp:useBean id="dept" class="backWeb.z01_vo.Department"/>
    <jsp:setProperty property="*" name="dept"/>
    <jsp:useBean id="daoDept" class="backWeb.a01_dao.A04_PreparedDao"/>
    <c:if test="${not empty dept.department_id}">
    	${daoDept.insertDepartments(dept)}
    </c:if>
    <div class="container mt-3">
    	<h2>부서 정보</h2>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="department_id">부서ID:</label>
            <input type="number" class="form-control" 
      	     id="department_id" placeholder="부서ID 입력" name="department_id">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="department_name">부서명:</label>
            <input type="text" class="form-control" 
      	     id="department_name" placeholder="부서명 입력" name="department_name">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="manager_id">매니저ID:</label>
            <input type="number" class="form-control" 
      	     id="manager_id" placeholder="매니저ID 입력" name="manager_id">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="location_id">위치ID:</label>
            <input type="number" class="form-control" 
      	     id="location_id" placeholder="위치ID 입력" name="location_id">
         	</div>
         	<button type="submit" class="btn btn-primary">인증</button>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>부서ID</th>
				    <th>부서명</th>
				    <th>매니저ID</th>
				    <th>위치ID</th>
		      	</tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="d" items="${daoDept.getDept()}">
			   	<tr class="text-center">
			        <td>${d.department_id}</td>
			        <td>${d.department_name}</td>
			        <td>${d.manager_id}</td>
			        <td>${d.location_id}</td>
			   	</tr>
			   	</c:forEach>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>
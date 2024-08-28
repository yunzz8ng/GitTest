<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="action.jsp">
	<input type="hidden" name="action" id="action" value="">
	
	<label for="employee_id">사원번호:</label>
	<input type="text" id="employee_id" name="employeed_id">
	<label for="employee_name">사원명:</label>
	<input type="text" id="employee_name" name="employeed_name">
	<label for="department">부서:</label>
	<input type="text" id="department" name="department">
	<label for="hire_date">입사일:</label>
	<input type="text" id="hire_date" name="hire_date">
	<label for="salary">급여:</label>
	<input type="text" id="salary" name="salary">
	
	<input type="submit" value="조회" onclick="setAction('select')">
	<input type="submit" value="등록" onclick="setAction('insert')">
	<input type="submit" value="수정" onclick="setAction('update')">
	<input type="submit" value="삭제" onclick="setAction('delete')">
	</form>
	
	<script>
	 function setAction(actionValue){
		 document.getElementById("action").value = actionValue;
	 }
	</script>
</body>
</html>
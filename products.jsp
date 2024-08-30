<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<header>
<h2>Products</h2>
<form method="get" action="/First/searchProducts">
	<input type="text" name="searchId" size="10" placeholder="카테고리를 입력하세요">
	<input type="submit" name="searchType" value="search">
	<input type="submit" name="searchType" value="all">
	</form>
</header>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="/First/FormEx" method="post">
		이름 : <input type="text" name="name" size="10"><br/>
		아이디 : <input type="text" name="id" size="10"><br/>
		비밀번호 : <input type="password" name="pw" size="10"><br/>
		취미 : <input type="checkbox" name="hobby" value="독서">독서
		<input type="checkbox" name="hobby" value="요리">요리
		<input type="checkbox" name="hobby" value="조깅">조깅
		<input type="checkbox" name="hobby" value="수영">수영
		<input type="checkbox" name="hobby" value="취침">취침<br/>
		전공 :
		<input type="radio" name="major" value="국어">국어
		<input type="radio" name="major" value="영어" checked="checked">영어
		<input type="radio" name="major" value="수학" >수학
		<input type="radio" name="major" value="디자인" >디자인<br/>
		<select name="protocol">
			<option value="http">http</option>
			<option value="ftp" selected="selected">ftp</option>
			<option value="smtp">smtp</option>
			<option value="pop">pop</option>
		</select><br/>
		<input type="submit" value="전송"><input type="reset" value="초기화">
	</form>
	
</body>
</html>
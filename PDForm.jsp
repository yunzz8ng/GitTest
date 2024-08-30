<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 목록 조회</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>

$(document).ready(function() {

    $("#ProductForm input[type='submit']").click(function(event) {
        event.preventDefault();
        
     	// 클릭된 버튼의 값을 구분 (여기서는 전체상품 & 입력상품 2가지)
        var categoryType = $(this).val();
     	
	    // 폼 데이터를 직렬화 -> 쿼리 문자열로 변환
		// 클릭된 버튼의 값(CategoryType)을 추가하여 전송할 데이터의 문자열을 생성
		// encodeURIComponent = URL에 안전하게 포함될 수 있도록 값을 인코딩
        var productForm = $("#ProductForm").serialize() + "&CategoryType=" + encodeURIComponent(categoryType);

        $.ajax({
            type: "POST",
            url: "/First/PD",
            data: productForm,
	        // 여기까지 서버에 POST요청
            // 요청 데이터를 productForm 변수에 선언
            
            success: function(response) {
                $("#result").html(response);
            },
            error: function() {
                $("#result").html("오류가 발생했습니다.");
            }
        });
    });
});

</script>

<style>
	* {
		margin: 10px;
	}

</style>

</head>
<body>

<h1>제품 목록 조회하기</h1>


	<form action="/First/PD" method="post" id="ProductForm">
	
		<input type="text" name="Category" id="Category" value="" placeholder="제품종류 입력">
		
		<input type="submit" name="CategoryType" value="전체상품 조회">
		<input type="submit" name="CategoryType" value="입력상품 조회">
		
	</form>
	
		<section id="result"></section>


</body>
</html>
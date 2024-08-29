<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<head>
</head>
<body>
<h2>전화번호부</h2>
	<hr>
	<form id="calcForm" method="post" action="/First/phone">
	<br>이름: <input type="text" id="name" name="name" size="10"><br>
	전화번호: <input type="text" id="num" name="num" size="15"><br>
	주소: <input type="text" id="addr" name="addr" size="10"><br>
	<input type="submit" value="실행">
	</form>
	<div id="result">
	</div>
<script>

$(document).ready(function() {
  $("#calcForm").submit(function(event) {
    event.preventDefault(); // Prevent default form submission

    var name = $("#name").val();
    var num = $("#num").val();
    var addr = $("#addr").val(); // 연산자

    // Input Validation (Optional but recommended)
    // 입력유효성 검사
 
    $.ajax({
      url: "/First/phone",
      method: "POST",
      data: {name: name, num: num, addr: addr},
      beforeSend: function() {
        $("#result").html("Calculating..."); // Display loading indicator
      },
      success: function(data) {
        $("#result").html(data); // Update result div with response
      },
      error: function(jqXHR, textStatus, errorThrown) {
        console.error("Error:", textStatus, errorThrown);
        $("#result").html("An error occurred during calculation. Please try again.");
      }
    });
  });
});
</script>

</body>
</html>

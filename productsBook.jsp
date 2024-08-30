<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<body>
<h2>PRODUCTS</h2>
<hr>
<header>

<form id="proForm" method="get" action="/First/searchProducts">
	<input type="text" name="searchId" size="10" placeholder="카테고리를 입력하세요">
	<input type="submit" name="searchType" value="search">
	<input type="submit" name="searchType" value="all">
	</form>
</header>
<script>

$(document).ready(function() {
  	$("#proForm").submit(function(event) {
    event.preventDefault(); // Prevent default form submission

    var searchType = $(this).find('input[type="submit"]:focus').val();
    var searchId = $(this).find('input[name="searchId"]').val();
    
    $.ajax({
      url: "/First/searchProducts",
      method: "GET",
      data: {  searchId: searchId, searchType: searchType },
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
<footer>
	<div id="result"></div>
</footer>
</body>
</html>

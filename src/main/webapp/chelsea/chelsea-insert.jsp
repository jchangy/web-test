<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/chelsea/chelsea-insert-ok.jsp" method="POST">
		선수명 : <input type="text" name="CH_NAME"><br>
		주발 : <input type="text" name="CH_FOOT"><br>
		키 : <input type="text" name="CH_HEIGHT"><br>
		몸무게 : <input type="text" name="CH_WEIGHT"><br>
		포지션 : <input type="text" name="CH_POSITION">
		<button>선수등록</button>
	</form>
</body>
</html>
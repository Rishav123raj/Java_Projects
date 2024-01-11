<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function startExam() {
    window.location.href = 'examination.jsp'; // Redirect to the exam page
}
</script>
</head>
<body>
 <form action=login.jsp" method="post">
 <h3>Times Remaining</h3>
<button type="button" onclick="startExam()">Start Your Exam</button>
</form>
</body>
</html>
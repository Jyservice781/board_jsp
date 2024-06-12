<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<form action="/user/auth.jsp" method="post">
    아이디: <input type="text" name="username"><br/>
    비밀번호:<input type="password" name="password"><br/>
    <hr>
    <input type="submit" class="btn btn-light" value="로그인">
</form>
<hr>
<button class="btn btn-dark">
    <a href="/user/register.jsp">회원가입</a>
</button>
</body>
</html>

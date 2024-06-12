<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.UserController" %>
<%@ page import="model.UserDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>
</head>
<body>
<form action="/user/register_action.jsp" method="post">
    아이디:<input type="text" name="username"><br/>
    비밀번호: <input type="password" name="password"><br/>
    닉네임:<input type="text" name="nickname"><br/>
    <input type="submit" value="회원가입">
</form>

</body>
</html>

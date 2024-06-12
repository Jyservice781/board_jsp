<%@ page import="model.UserDTO" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.UserController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register_action</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String nickname = request.getParameter("nickname");

    // userDTO 에 값을 담아서 connect 로 연결해서 mysql 로 보내주고
    UserDTO userDTO = new UserDTO();
    userDTO.setUsername(username);
    userDTO.setPassword(password);
    userDTO.setNickname(nickname);

    MySqlConnector connector = new MySqlConnector();
    UserController userController = new UserController(connector);

    boolean result = userController.register(userDTO);

    if (result) {
        //회원가입 성공시에
        //인덱스로 돌아가라라는  / 뜻임.
        response.sendRedirect("/");
    } else {
        response.sendRedirect("/error/showError.jsp?code=duplicated");
    }
%>
</body>
</html>

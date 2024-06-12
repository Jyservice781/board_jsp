<%@ page import="model.UserDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BoardDTO" %>
<%@ page import="controller.BoardController" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 삭제</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<h1>해당 게시글을 삭제합니다.</h1>

<%
    UserDTO logIn = (UserDTO) session.getAttribute("logIn");
    MySqlConnector connector = new MySqlConnector();
    BoardController boardController = new BoardController(connector);
    if (logIn != null) {
        // 로그인 null != true 일때
        // 만들거임.
        BoardDTO boardDTO = new BoardDTO();
        ArrayList<BoardDTO> list = boardController.delete(boardDTO.getId());

%>

<%
    } else {
%>
<p>
    로그인을 하셔야 게시글을 삭제할 수 있습니다.
    <br/>
    게시글 삭제를 원하시면 로그인 먼저 진행해주세요
</p>

<%
    }
%>
</body>
</html>

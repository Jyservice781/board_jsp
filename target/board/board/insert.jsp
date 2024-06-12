<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.BoardController" %>
<%@ page import="model.BoardDTO" %>
<%@ page import="model.UserDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 입력</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        MySqlConnector connector = new MySqlConnector();
        BoardController boardController = new BoardController(connector);
        BoardDTO boardDTO = new BoardDTO();

        if (logIn != null){
            //로그인 상태일때 하기
    %>
    <form>
        제목: <input type="text" name="userTitle"><br/>
        내용: <input type="text" name="userContent"><br/>
        닉네임: <input type="text" name="userNickname"><br/>
        <input type="submit" class="btn btn-dark" name="저장하기">
    </form>
    <%
        boardDTO.setTitle(boardDTO.getTitle());
        boardDTO.setContent(boardDTO.getContent());
        boardDTO.setNickname(boardDTO.getNickname());
        boardController.insert(boardDTO);
    %>
    <button>
        <a href="/" class="btn btn-light">뒤로가기</a>
    </button>
    <%
        } else {
    %>
    <h2>잘못된 입력입니다.</h2>
    <a href="/" class="btn btn-dark">뒤로가기</a>
    <%
        }
    %>

</body>
</html>

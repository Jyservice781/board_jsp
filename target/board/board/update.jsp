<%@ page import="model.UserDTO" %>
<%@ page import="model.BoardDTO" %>
<%@ page import="controller.BoardController" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 수정</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        MySqlConnector connector = new MySqlConnector();
        BoardController boardController = new BoardController(connector);
        BoardDTO boardDTO = boardController.update(logIn.getId());
        //
        if(logIn.getId() == boardDTO.getWriterId()){
            // 로그인이 되어있을때 -> 본인만 수정 가능하게 해야함.
    %>
    <h1>수정할 내용을 입력해주세요!</h1>
    <form>
        제목 :<input type="text" name="newTitle">
        내용 : <input type="text" name="newContent">
        닉네임 : <input type="text" name="newNickname">
        <input type="submit" name="수정내용">
    </form>
    <%
        boardDTO.setTitle(boardDTO.getTitle());
        boardDTO.setContent(boardDTO.getContent());
        boardDTO.setNickname(boardDTO.getNickname());

        } else {

    %>

    <%
        }
    %>
</body>
</html>

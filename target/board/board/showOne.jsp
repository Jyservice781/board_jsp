<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.BoardController" %>
<%@ page import="model.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 개별보기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%
        int id = Integer.parseInt(request.getParameter("id"));

        MySqlConnector connector = new MySqlConnector();
        BoardController boardController = new BoardController(connector);
        BoardDTO boardDTO = boardController.selectOne(id);

        if(boardDTO != null){
    %>

        <h1>제목: <%=boardDTO.getTitle()%></h1><br/>
        <h2>글번호: <%=boardDTO.getId()%></h2><br/>
        <h2>작성자: <%=boardDTO.getNickname()%></h2><br/>
        <h2>작성일: <%=boardDTO.getEntryDate()%></h2><br/>
        <h2>수정일: <%=boardDTO.getModifyDate()%></h2><br/>
    <hr>
    <h3><%=boardDTO.getContent()%></h3>
    <button type="button" class="btn btn-light">
        <a href="/board/update.jsp">게시글 수정하기</a>
    </button>
    <button type="button" class="btn btn-dark">
        <a href="/board/delete.jsp">게시글 삭제하기</a>
    </button>
    <%
        }else{
    %>
    <h1>해당 글 번호는 유효하지 않습니다.</h1>
    <a href="/" class="btn btn-dark">뒤로가기</a>
    <%
        }
    %>
</body>
</html>

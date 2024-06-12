<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.BoardController" %>
<%@ page import="model.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.UserDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>showList</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
    // logIn (UserDTO) 를 선언하지 않으면 session은 무조건 object 객체를 가져오기 때문에
    // 반드시 (UserDTO)로 선언이 필요하다.
    UserDTO logIn = (UserDTO) session.getAttribute("logIn");

    MySqlConnector connector = new MySqlConnector();
    BoardController boardController = new BoardController(connector);
    ArrayList<BoardDTO> list = boardController.selectAll();

%>
<table border="1">
    <tr>
        <td>글 번호</td>
        <td>제목</td>
        <td>작성자</td>
        <td>작성일</td>
    </tr>
    <%
        for (BoardDTO b : list) {
    %>
    <tr>
        <td><%=b.getId()%>
        </td>
        <td>
            <%-- 클릭한 게시글의 주소값을 가져와서 One으로 상세 보여줌.
            get 방식으로 id 를 보내줌--%>
            <a href="/board/showOne.jsp?id=<%=b.getId()%>"><%=b.getTitle()%>
            </a>
        </td>
        <td><%=b.getNickname()%>
        </td>
        <td><%=b.getEntryDate()%>
        </td>
    </tr>
    <%
        }
    %>
</table>
<a href="/board/insert.jsp">게시글 입력하기</a>
</body>
</html>

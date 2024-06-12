
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>showError</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%
        String errorCode = request.getParameter("code");

        String message = "";

        if(errorCode.equalsIgnoreCase("duplicated")){
            message="중복된 아이디로는 가입하실 수 없습니다.";

        }
    %>

<h1>
    <%=message%>
</h1>
    <%// if 문으로 감싸주면 좋다.%>
    <button class="btn btn-dark">
        <a href="/">뒤로가기</a>
    </button>
</body>
</html>

<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: marat
  Date: 23.12.2022
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>First JSP</title>
    <style>
        h1{text-align: center;}
        h2{text-align: center;}
        body{color: cyan;}
        body{background-color: #5A5A5A;}
    </style>
</head>
<body>

<%
    Date date = new Date();
    String output = "Current date and time: " + date;

%>
<h1>
<%=output%>
</h1>
<P>
<h2>
    <a href="jsp2">
        GO TO NEXT
    </a>
</h2>
<meta http-equiv="refresh" content="1" />
</body>
</html>

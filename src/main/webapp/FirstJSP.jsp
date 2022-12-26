<%@ page import="java.util.Date" %>
<%@ page import="com.example.firstserverproject.UserHelper" %><%--
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
        h3{text-align: right}
        body{color: cyan;}
        body{background-color: #5A5A5A;}
        button {
            width: 120px;
            height: 50px;
            font-size: 20px;
        }
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
<h3> <%if(UserHelper.login2!=null){%>Logged in: <%=UserHelper.login2%><%}%></h3>
<P>
<h2>
    <button onclick="location.href='/jsp2'" style="color: #FF0099" type="button">
        <%
        UserHelper userHelper = new UserHelper();
        String loginOrLogout;
        if(UserHelper.isLoggedIn) loginOrLogout = "LOGOUT";
        else loginOrLogout = "LOGIN";
        %>
            <%=loginOrLogout%>
    </button>
    <% if(UserHelper.isLoggedIn){ %>
    <br>
    <%if(request.getParameter("textInput")!=null)userHelper.updateText(request.getParameter("textInput"));%>
    <form  method="post">
        <label for="textInput">Enter some text:</label><br>
        <textarea id = "textInput" name="textInput"
                  style="background-color: black; color: white;"
                  rows="20" cols="50"><%= userHelper.getText()%></textarea><br>
        <input type="submit" value="Save" style="color: #FF0099">
    </form>
    <% }%>
</h2>
<%--<meta http-equiv="refresh" content="1" />--%>

</body>
</html>

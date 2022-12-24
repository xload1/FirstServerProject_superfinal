<%@ page import="com.example.firstserverproject.UserHelper" %>
<%@ page import="com.example.firstserverproject.entity.UserAcc" %><%--
  Created by IntelliJ IDEA.
  User: marat
  Date: 24.12.2022
  Time: 00:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>
    MULTIPLIER
</title>
<head>
    <meta charset="UTF-8">
    <title>Number Multiplier</title>
    <style>
        h1{text-align: center;}
        body{text-align: center;}
        body{color: cyan;}
        body{background-color: #5A5A5A;}
    </style>
</head>
<body>
<h1>Login Form</h1>
<form method="post">
    Login: <input type="text" name="login">
    Password: <input type="password" name="password">
    <input type="submit" value="Log In">
</form>

<%
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    String reply ="";
    UserHelper userHelper = new UserHelper();
    if (login != null && !login.equals("")&&password != null && !password.equals(""))
    {
        if(userHelper.checkPresence(login)){
            if (userHelper.checkPassword(new UserAcc(login, password))){
                reply = "Successfully logged in!";
            }
            else reply = "Wrong password!";
        }
        else {
            userHelper.addUser(login, password);
            reply = "User successfully added";
        }
    }
%>
<p>
    <%= reply%>
</p>
</body>
</html>

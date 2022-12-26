<%@ page import="com.example.firstserverproject.UserHelper" %>
<%@ page import="com.example.firstserverproject.entity.UserAcc" %><%--
  Created by IntelliJ IDEA.
  User: marat
  Date: 24.12.2022
  Time: 00:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<title>
    Login
</title>
<head>
    <meta charset="UTF-8">
    <title>Number Multiplier</title>
    <style>
        h1{text-align: center;}
        body{text-align: center;}
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
<h1>Login Form</h1>
<form method="post">
    Login: <input type="text" name="login">
    Password: <input type="password" name="password">
    <br>
    <br>
    <input type="submit" value="Log In" style="color: #FF0099">
</form>

<%
    HttpSession httpSession = request.getSession();
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    String reply ="";
    UserHelper userHelper = new UserHelper();
    String color;
    httpSession.setAttribute("isLoggedIn", false);
    if (login != null && !login.equals("")&&password != null && !password.equals(""))
    {
        if(userHelper.checkPresence(login)){
            if (userHelper.checkPassword(login, password)){
                reply = "Successfully logged in!";
                httpSession.setAttribute("login", login);
                httpSession.setAttribute("isLoggedIn", true);
            }
            else reply = "Wrong password!";
        }
        else {
            userHelper.addUser(login, password);
            reply = "User successfully added";
            httpSession.setAttribute("isLoggedIn", true);
            httpSession.setAttribute("login", login);
            userHelper.addLoginToUserText(login);
        }
    }
     if(reply.equals("Wrong password!")) color = "red";
     else color = "lightgreen";
%>
<br>
<h2  style="color: <%=color%>" >
    <%=reply%>
</h2>
<button onclick="location.href='/jsp1'" style="color: #FF0099">GO BACK</button>
<%if(httpSession.getAttribute("isLoggedIn")!=null){
    if((boolean)httpSession.getAttribute("isLoggedIn")) { %>
<script>
    function redirect() {
        location.href = "/jsp1";
    }
    setTimeout(redirect, 1000);
</script>
<%}}%>
</body>
</html>

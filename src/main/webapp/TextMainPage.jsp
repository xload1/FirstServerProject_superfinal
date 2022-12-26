<%@ page import="java.util.Date" %>
<%@ page import="com.example.firstserverproject.UserHelper" %><%--
  Created by IntelliJ IDEA.
  User: marat
  Date: 23.12.2022
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Main</title>
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
    String output = "Current date and time: " + new Date();
    HttpSession httpSession = request.getSession();
    if(httpSession.getAttribute("isLoggedIn")==null) httpSession.setAttribute("isLoggedIn", false);
%>
<h1>
<%=output%>
</h1>
<h3> <%if((boolean)httpSession.getAttribute("isLoggedIn")){%>Logged in: <%=httpSession.getAttribute("login")%><%}%></h3>
<P>
<h2>
    <button onclick="location.href='/jsp2'" style="color: #FF0099" type="button">
        <%
        UserHelper userHelper = new UserHelper();
        String loginOrLogout;

        if ((boolean) httpSession.getAttribute("isLoggedIn")) loginOrLogout = "LOGOUT";
        else loginOrLogout = "LOGIN";
        %>
            <%=loginOrLogout%>
    </button>
    <%if((boolean)httpSession.getAttribute("isLoggedIn")){ %>
    <br>
    <%if(request.getParameter("textInput")!=null)userHelper.updateText(request.getParameter("textInput"),
            (String) httpSession.getAttribute("login"));%>
    <form  method="post">
        <label for="textInput">Enter some text:</label><br>
        <textarea id = "textInput" name="textInput"
                  style="background-color: black; color: white;"
                  rows="20" cols="50"><%= userHelper.getText((String) httpSession.getAttribute("login"))%></textarea><br>
        <input type="submit" value="Save" style="color: #FF0099">
    </form>
    <% }%>
</h2>
<%--<meta http-equiv="refresh" content="1" />--%>

</body>
</html>

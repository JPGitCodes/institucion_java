<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Evaluacion</title>
        <link rel="stylesheet" href="resources/css/login.css" type="text/css" media="screen" />
        <script src="resources/js/jquery-1.5.2.min.js" type="text/javascript"></script>
        <script src="resources/js/ejecutar.js" type="text/javascript"></script>
    </head>
    <body>
        <form method="POST" action="Login2">
            <h2><span class="entypo-login"></span> Sistema de Evaluacion </h2>
            <button class="submit"><span class="entypo-lock"></span></button>
            <span class="entypo-user inputUserIcon"></span>
            <input type="text" class="user" name="user" placeholder="usuario"/>
            <span class="entypo-key inputPassIcon"></span>
            <input type="password" class="pass" name="pass" placeholder="pass"/>
        </form>
    </body>
</html>

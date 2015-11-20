<%-- 
    Document   : mostrar
    Created on : 27-10-2015, 09:22:51 PM
    Author     : acardenas
--%>

<%@page import="cl.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        Usuario u = (Usuario)request.getSession().getAttribute("usuario");
        
        %>
        <h1>Hello World! <%= u.getId()+"--"+u.getNombre() %></h1>
    </body>
</html>

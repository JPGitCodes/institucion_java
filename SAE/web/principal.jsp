<%@page import="cl.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Usuario u = (Usuario)request.getSession().getAttribute("usuario");%>

<%

%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <title>Sistema de Evaluacion</title>

        <link rel="stylesheet" href="resources/css/layout.css" type="text/css" media="screen" />
        <script src="resources/js/jquery-1.5.2.min.js" type="text/javascript"></script>
        <script src="resources/js/hideshow.js" type="text/javascript"></script>
        <script src="resources/js/jquery.tablesorter.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="resources/js/jquery.equalHeight.js"></script>


    </head>

    <body>
        <header id="header">
            <hgroup>
                <h1 class="site_title">Bienvenido</h1>
                <h2 class="section_title">Sistema de Evaluacion</h2>
            </hgroup>
        </header> <!-- end of header bar -->

        <section id="secondary_bar">
            <div class="user">
                <p><%=u.getNombre()%></p>
                <!-- <a class="logout_user" href="#" title="Logout">Logout</a> -->
            </div>
            <div class="breadcrumbs_container">
                <article class="breadcrumbs"><a href="index.jsp">Sistema de Evaluacion</a></article>
            </div>
        </section><!-- end of secondary bar -->

        <aside id="sidebar" class="column">
            <h3>Contenido</h3>
            <ul class="toggle">
                    <li class="icn_photo"><a href="principal.jsp">Inicio</a></li> 
                <%
                switch (u.getPerfil()){ 
                    case 1:
                %>
                <li class="icn_new_article"><a href="subirArchivo.jsp">Subir archivo</a></li>
                <li class="icn_categories"><a href="verEstado.jsp">Ver estado</a></li>
                <%
                    break;
                    case 2:
                %>
                    <li class="icn_categories"><a href="verEstado.jsp">Ver estado</a></li>
                <%
                break;  
                case 3:
                %>
                    <li class="icn_edit"><a href="verEstado.jsp">Cambiar estado</a></li>
               <%
                break;
                }
               %> 
                    <li class="icn_jump_back"><a href="#">Logout</a></li>
            </ul>

            <footer>
                <hr />
                <p><strong>Copyright &copy; 2015 Alvaro Contreras Silva</strong></p>
            </footer>
        </aside><!-- end of sidebar -->

        <section id="main" class="column">
            <div class="clear"></div>
        </article><!-- end of stats article -->
        <div class="clear"></div>
    </div><!-- end of .tab_container -->

</article><!-- end of content manager article -->

<div class="spacer"></div>
</section>

</body>
</html>
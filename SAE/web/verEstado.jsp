
<%@page import="cl.control.Sede"%>
<%@page import="java.util.List"%>
<%@page import="cl.model.DatosSede"%>

<%@page import="java.util.LinkedList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="cl.model.DatosCarrera"%>
<%@page import="cl.control.Carrera"%>
<%@page import="cl.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Usuario u = (Usuario) request.getSession().getAttribute("usuario");%>


<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <title>Sistema de Evaluacion Prueba</title>

        <link rel="stylesheet" href="resources/css/layout.css" type="text/css" media="screen" />
        <script src="resources/js/jquery-2.1.3.min.js" type="text/javascript"></script>
        <script src="resources/js/hideshow.js" type="text/javascript"></script>
        <script src="resources/js/jquery.tablesorter.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="resources/js/jquery.equalHeight.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $(".tablesorter").tablesorter();
                //When page loads...
                $(".tab_content").hide(); //Hide all content
                $("ul.tabs li:first").addClass("active").show(); //Activate first tab
                $(".tab_content:first").show(); //Show first tab content

                //On Click Event
                $("ul.tabs li").click(function () {

                    $("ul.tabs li").removeClass("active"); //Remove any "active" class
                    $(this).addClass("active"); //Add "active" class to selected tab
                    $(".tab_content").hide(); //Hide all tab content

                    var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
                    $(activeTab).fadeIn(); //Fade in the active ID content
                    return false;
                });

            });
            $(function () {
                $('.column').equalHeight();
            });

        </script>
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
                        switch (u.getPerfil()) {
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
        <footer>
            <div class="submit_link" style="width:94%;">
                Sede: <SELECT NAME="Sede" placeholder="Sede.." id="sede" style="width:22%;" > 

                    <%
                        ArrayList<Sede> Sedes = DatosSede.getSede();

                        out.println("<option value='0'>Seleccione Sede</option>");
                        for (int i = 0; i < Sedes.size(); i++) {

                            out.println("<option value='" + Sedes.get(i).getIdSede() + "'>" + Sedes.get(i).getNombreSede() + "</option>");

                        }

                    %>
                </SELECT> Carrera: <SELECT NAME="Sede" placeholder="Sede.." id="carrera" style="width:22%;"> </SELECT> 
                Asignatura: <SELECT NAME="Sede" placeholder="Sede.." id="asignatura" style="width:22%;" > </SELECT> 
                <input type="submit" value="Buscar" class="alt_btn" />
            </div>
        </footer>


        <article class="module width_3_quarter">
            <header><h3 class="tabs_involved">Ver Estado de Evaluacion</h3></header>

            <div class="tab_container">
                <div id="tab1" class="tab_content">
                    <table class="tablesorter" cellspacing="0"> 
                        <thead> 
                            <tr> 
                                <th></th> 
                                <th>Fecha</th> 
                                <th>Sede</th> 
                                <th>Carrera</th> 
                                <th>Asignatura</th> 
                                <th>Profesor</th> 
                                <th>Archivo</th> 
                                <th>Estado</th>
                            </tr> 
                        </thead>

                        <tbody> 
                            <% LinkedList<Carrera> lista = DatosCarrera.getCarreras();

                                for (int i = 0; i < lista.size(); i++) {
                                    out.println("<tr>");
                                    out.println("<td>" + i + "</td>");

                                    out.println("<td>" + lista.get(i).getCarrera() + "</td>");
                                    out.println("<td>" + lista.get(i).getDirecion() + "</td>");
                                    out.println("<td>" + lista.get(i).getNombresede() + "</td>");
                                    out.println("<td>" + lista.get(i).getTelefono() + "</td>");

                                    out.println("</tr>");
                                }
                            %>

                        </tbody> 
                    </table>
                </div><!-- end of #tab1 -->
            </div><!-- end of .tab_container -->
        </article><!-- end of content manager article -->
    </section>

    <script type="text/javascript">
        $("#sede").on("change", function () {
            var sedeSeleccionada = $("#sede option:selected").attr("value");
            $.post('PeticionesServlet', {"operacion": "obtenerCarrerasDeSede", "sede": sedeSeleccionada},
            function (responseText) {
                $("#carrera").html(responseText);
            });

        });
    </script>

</body>
</html>

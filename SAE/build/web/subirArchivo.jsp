<%@page import="cl.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Usuario u = (Usuario)request.getSession().getAttribute("usuario");%>

<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8"/>
        <title>Sistema de Evaluacion</title>
        <link rel="stylesheet" href="resources/css/demo.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="resources/css/layout.css" type="text/css" media="screen" />
        <script src="resources/js/jquery-2.1.3.min.js" type="text/javascript"></script>
        <script src="resources/js/hideshow.js" type="text/javascript"></script>
        <!--<script src="resources/js/jquery.tablesorter.min.js" type="text/javascript"></script>-->
        <script type="text/javascript" src="resources/js/jquery.equalHeight.js"></script>
<script>
		$(document).ready(function() {
			$('.button').click(function() {
				type = $(this).attr('data-type');
				$('.overlay-container').fadeIn(function() {
				window.setTimeout(function(){
					$('.window-container.'+type).addClass('window-container-visible');
				}, 100);
				});
			});
			$('.close').click(function() {
				$('.overlay-container').fadeOut().end().find('.window-container').removeClass('window-container-visible');
			});
		});
	</script>
    </head>

    <style>
        #btnIngreso{
            margin-left: 5%;
            margin-top: 10px;
        }
    </style>

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

            <div class="clear"></div>
            <br>
               
          

            <div id="frmIngreso">
                <article class="module width_full">
                    <header><h3>Ingreso de Evaluacion</h3></header>
                    <div class="module_content">
                        <form action="" method="post" enctype="multipart/form-data">
                        <fieldset style="width:48%; float:left; margin-right: 3%;"> <!-- to make two field float next to one another, adjust values accordingly -->
                            <label>Sede</label>
                            <SELECT NAME="Sede" style="width:40%;"> </SELECT>
                            <br><br>
                            <label>Carrera</label>
                            <SELECT NAME="Carrera" style="width:40%;"> </SELECT>
                            <br><br>
                            <label>Asignatura</label>
                            <SELECT NAME="Ramo" style="width:40%;"> </SELECT>
                            <br><br>
                            <label>Profesor</label>
                            <SELECT NAME="profesor" style="width:40%;"> </SELECT>
                            <br><br>
                            <label>Prueba n°</label>
                            <input type="text" id="txtModelo" name="Modelo" style="width:30%;">
                            <br><br><br>
                            <label>Archivo</label>
                            <input type="file" id="txtModelo" name="Modelo" style="width:30%;">
                            <br><br>
                        </fieldset>

                        <fieldset style="width:48%; float:left;"> <!-- to make two field float next to one another, adjust values accordingly -->
                            <label>Observacion</label>
                            <textarea rows="12" id="txtObservacion" name="Observacion"></textarea>
                        </fieldset><div class="clear"></div>
                    </div>

                    <footer>
                        <div class="submit_link">
                            <input type="button" value="Subir Archivo" id="btnSubir" class="alt_btn btnStyle">
                        </div>
                    </footer>
 </form>
                </article>
            </div>
            
            <br><br>

                <% if (request.getAttribute("mensajeRetorno") != null) {%>
                <%=request.getAttribute("mensajeRetorno")%>
                <% }%>
                <div style="width:26%; float:left; margin-right: 3%;">
            </div>

            
            <div class="spacer"></div>
            <footer>
                <div class="submit_link"></div>
            </footer>
        </section>

        <script type="text/javascript" src="resources/js/jsArticulos.js"></script>
    </body>
</html>
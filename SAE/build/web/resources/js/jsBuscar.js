
$(document).ready(function () {
    $(".tablesorter").tablesorter();
    $.post("BuscarServlet", {"accion": "listar", "datoBusqueda": ""}, function (html) {
        $("#tblBuscar tbody").empty();
        $("#tblBuscar tbody").append(html);
    });


    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active"); //Remove any "active" class
        $(this).addClass("active"); //Add "active" class to selected tab
        $(".tab_content").hide(); //Hide all tab content

        var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
        $(activeTab).fadeIn(); //Fade in the active ID content
        return false;
    });


    $("#btnBuscar").click(function () {
        var datoBusqueda = $("#txtBuscar").val();
        
         var datoEstado = $('input:radio[name=estado]:checked').val();
        $.post("BuscarServlet", {"accion": "listar", "datoBusqueda": datoBusqueda,"estado":datoEstado}, function (html) {
            $("#tblBuscar tbody").empty();
            $("#tblBuscar tbody").append(html);
        });
    });

    $("#btnAgregar").click(function () {
        var request = $.ajax({
            url: "BuscarServlet",
            method: "POST",
            data: {
                accion: "agregar",
                FechaIngreso: $("#txtFechaIngreso").val(),
                Producto: $("#txtProducto").val(),
                Descripcion: $("#txtDescripcion").val(),
                Cantidad: $("#txtCantidad").val(),
                Categoria: $("#txtCategoria").val(),
                Modelo: $("#txtModelo").val(),
                Observacion: $("#txtObservacion").val()
            }
        });

        request.done(function (obj) {
            if ($.trim(obj) === "true") {
                alert("Se a ingresado el articulo");
                $.post("BuscarServlet", {"accion": "listar", "datoBusqueda": ""}, function (html) {
                    $(".tblBuscar tbody").empty();
                    $(".tblBuscar tbody").append(html);
                });
            } else {
                alert("Error, no se pudo ingresar el articulo");
            }
        });

    });
});

$(function () {
    $('.column').equalHeight();
});

function actualizarArticulo(id) {
    var aID = id.split("_");
    var idArticulo = aID[1];

    var request = $.ajax({
        url: "BuscarServlet",
        method: "POST",
        data: {
            accion: "actualizar",
            idArticulo: idArticulo
        }
    });

    request.done(function (obj) {
        if ($.trim(obj) === "true") {
            alert("Se a actualizado el articulo");
            $.post("BuscarServlet", {"accion": "listar", "datoBusqueda": ""}, function (html) {
                $(".tblBuscar tbody").empty();
                $(".tblBuscar tbody").append(html);
                //$(".tablesorter tbody").append("<tr><td>1</td><td>notebook</td><td>i5</td><td>2</td><td>notebook</td></tr>");

            });
        } else {
            alert("Error, no se pudo actualizar el articulo");
        }
    });
}



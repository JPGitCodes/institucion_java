
$(document).ready(function () {
     $("#product").load("ArticulosServlet",{"accion": "buscar"},function(data){
         
         
         alert(data)
     });
    
    $(".tablesorter").tablesorter();
    $.post("ArticulosServlet", {"accion": "listar", "datoBusqueda": ""}, function (html) {
        $(".tablesorter tbody").empty();
        $(".tablesorter tbody").append(html);
    });

    $(".tab_content, #frmIngreso").hide(); //Hide all content
    $("ul.tabs li:first").addClass("active").show(); //Activate first tab
    $(".tab_content:first").show(); //Show first tab content

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active"); //Remove any "active" class
        $(this).addClass("active"); //Add "active" class to selected tab
        $(".tab_content").hide(); //Hide all tab content

        var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
        $(activeTab).fadeIn(); //Fade in the active ID content
        return false;
    });

    $("#btnIngreso").click(function () {
        $("#frmIngreso").show();
    });

    $("#btnCerrarIngreso").click(function () {
        $("#frmIngreso").hide();
    });

    $("#btnBuscar").click(function () {
        var datoBusqueda = $("#txtBuscar").val();
        $.post("ArticulosServlet", {"accion": "listar", "datoBusqueda": datoBusqueda}, function (html) {
            $(".tablesorter tbody").empty();
            $(".tablesorter tbody").append(html);
        });
    });

    $("#btnAgregar").click(function () {
        var request = $.ajax({
            url: "ArticulosServlet",
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
                $.post("ArticulosServlet", {"accion": "listar", "datoBusqueda": ""}, function (html) {
                    $(".tablesorter tbody").empty();
                    $(".tablesorter tbody").append(html);
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
    
    type = $(this).attr('data-type');
				$('.overlay-container').fadeIn(function() {
				window.setTimeout(function(){
					$('.window-container.'+type).addClass('window-container-visible');
				}, 100);
				});
    
    
   /* var aID = id.split("_");
    var idArticulo = aID[1];

    var request = $.ajax({
        url: "ArticulosServlet",
        method: "POST",
        data: {
            accion: "actualizar",
            idArticulo: idArticulo
        }
    });

    request.done(function (obj) {
        if ($.trim(obj) === "true") {
            alert("Se a actualizado el articulo");
            $.post("ArticulosServlet", {"accion": "listar", "datoBusqueda": ""}, function (html) {
                $(".tablesorter tbody").empty();
                $(".tablesorter tbody").append(html);
            });
        } else {
            alert("Error, no se pudo actualizar el articulo");
        }
    });*/
}

function eliminarArticulo(id) {
    var aID = id.split("_");
    var idArticulo = aID[1];

    var request = $.ajax({
        url: "ArticulosServlet",
        method: "POST",
        data: {
            accion: "eliminar",
            idArticulo: idArticulo
        }
    });

    request.done(function (obj) {
        if ($.trim(obj) === "true") {
            alert("Se a eliminado el articulo");
            $.post("ArticulosServlet", {"accion": "listar", "datoBusqueda": ""}, function (html) {
                $(".tablesorter tbody").empty();
                $(".tablesorter tbody").append(html);
            });
        } else {
            alert("Error, no se pudo eliminar el articulo");
        }
    });
}
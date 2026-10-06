<?php

$conexion = new mysqli('localhost', 'root', '', 'skin-hair device')

$consulta = "SELEC * from productos";

$resultado = $conexion->query($consulta);

while($producto = $resultado -> fetch_array(MYSQLI_ASSOC)){
    echo '<div class="tarjeta-producto">';
    echo '<div class="imagen-contenedor">';
    echo '<img src="' . $producto["imagen_url"] . '" alt="Producto" class="producto-img">';
    echo '</div>';
    echo '<div class="contenido-detalle">';
    echo '<div class="texto-superior">';
    echo '<h2 class="producto-titulo">' . $producto["nombre_equipo"] . ' </h2>';
    echo '<p class="producto-descripcion">';
    echo $equipo["direccion_mac"];
    echo '</p>';
    echo '</div>';
    echo '<div class="producto-footer">';
    echo '<span class="producto-precio">' . $equipo["ip_tailscale"] . '</span>';
    echo '</div>';
    echo '</div>';
    echo '</div>';
    echo '</div>';
}

?>
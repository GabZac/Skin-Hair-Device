<?php foreach ($productos as $producto):
$imagen = trim((string) $producto['imagen_url']);
$segura = preg_match('~^https?://~i', $imagen) || preg_match('~^(?:IMG/)[a-zA-Z0-9_./ -]+$~D', $imagen);
if (!$segura) { $imagen = $base . 'IMG/favicon.png'; }
elseif (str_starts_with($imagen, 'IMG/')) { $imagen = $base . $imagen; }
?>
<article class="tarjeta-producto"><div class="imagen-contenedor"><img src="<?= e($imagen) ?>" alt="<?= e($producto['nombre']) ?>" class="producto-img" loading="lazy"></div><div class="contenido-detalle"><div class="texto-superior"><h2 class="producto-titulo"><?= e($producto['nombre']) ?></h2><p><?= e($producto['marca']) ?></p><p class="producto-descripcion"><?= e($producto['descripcion']) ?></p></div><div class="producto-footer"><?php if (!empty($producto['origen_url']) && preg_match('~^https://~i', $producto['origen_url'])): ?><a class="btn" href="<?= e($producto['origen_url']) ?>" target="_blank" rel="noopener noreferrer">Información del fabricante</a><?php endif; ?><a class="btn" href="https://listado.mercadolibre.com.ar/<?= e(rawurlencode($producto['nombre'])) ?>" target="_blank" rel="noopener noreferrer">Buscar en Mercado Libre</a><p class="tienda-aviso">Consultá precio y disponibilidad en la tienda. No vendemos productos.</p></div></div></article>
<?php endforeach; ?>

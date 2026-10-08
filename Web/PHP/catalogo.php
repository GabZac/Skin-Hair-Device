<?php
require_once __DIR__ . '/bootstrap.php';
require __DIR__ . '/zonas.php';
$zona = $zona ?? '';
if ($zona !== '' && !isset($zonas[$zona])) { http_response_code(404); exit('Categoría no encontrada.'); }
$base = $base ?? '../';
$rutaInicio = $base . 'HTML/inicio.php';
$titulo = $zona === '' ? 'Todos los productos' : $zonas[$zona][0];
$filtrar = logged() && ($_GET['filtrar'] ?? '') === '1';
$params = [];
$sql = 'SELECT p.*, i.origen_url FROM productos p JOIN subcategorias s ON s.Id_Subcategorias = p.id_subcategoria LEFT JOIN informacion_productos i ON i.id_producto = p.id_producto WHERE p.activo = 1';
if ($zona !== '') {
    [$nombreZona, $categoria, $subcategorias, $tags] = $zonas[$zona];
    $sql .= ' AND p.Id_Categorias = ?';
    $params[] = $categoria;
    $reglas = [];
    $reglaParams = [];
    if ($subcategorias) { $reglas[] = 's.Nombre IN (' . implode(',', array_fill(0, count($subcategorias), '?')) . ')'; $reglaParams = array_merge($reglaParams, $subcategorias); }
    if ($tags) { $reglas[] = 'EXISTS (SELECT 1 FROM tags_productos tz WHERE tz.id_producto = p.id_producto AND tz.tag IN (' . implode(',', array_fill(0, count($tags), '?')) . '))'; $reglaParams = array_merge($reglaParams, $tags); }
    $fallback = $reglas ? implode(' AND ', $reglas) : '1 = 1';
    $sql .= ' AND (EXISTS (SELECT 1 FROM secciones_productos sp WHERE sp.id_producto = p.id_producto AND sp.seccion = ?) OR (NOT EXISTS (SELECT 1 FROM secciones_productos sx WHERE sx.id_producto = p.id_producto) AND (' . $fallback . ')))';
    $params[] = $zona;
    $params = array_merge($params, $reglaParams);
}
$tieneFormulario = false;
if (logged()) {
    $q = db()->prepare('SELECT MAX(id_formulario) FROM formularios WHERE id_usuario = ?');
    $q->execute([$_SESSION['usuario']['id']]);
    $fid = $q->fetchColumn();
    $tieneFormulario = (bool) $fid;
    if ($filtrar) {
        $sql .= ' AND EXISTS (SELECT 1 FROM tags_productos tp JOIN opciones_respuesta o ON o.tag = tp.tag JOIN respuestas_formulario r ON r.id_opcion = o.id_opcion JOIN preguntas pr ON pr.id_pregunta = r.id_pregunta WHERE tp.id_producto = p.id_producto AND r.id_formulario = ? AND pr.activa = 1)';
        $params[] = $fid ?: 0;
    }
}
$sql .= ' ORDER BY p.fecha_creacion DESC, p.id_producto DESC';
$q = db()->prepare($sql);
$q->execute($params);
$productos = $q->fetchAll();
function urlZona(string $key, string $base, bool $filtrar): string {
    $carpeta = in_array($key, ['frente', 'labios', 'ojeras', 'piel'], true) ? 'rostro/' : (in_array($key, ['shampoo', 'acondicionador', 'capilar', 'hidratacion', 'nutricion', 'reparacion'], true) ? 'cabello/' : 'cuerpo/');
    if (in_array($key, ['capilar', 'hidratacion', 'nutricion', 'reparacion'], true)) { $carpeta .= 'tratamientos/'; }
    return $base . 'HTML/' . $carpeta . $key . '.php' . ($filtrar ? '?filtrar=1' : '');
}
?>
<!doctype html><html lang="es"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title><?= e($titulo) ?> | Skin-Hair Device</title><link rel="stylesheet" href="<?= e($base) ?>CSS/inicio.css"><link rel="stylesheet" href="<?= e($base) ?>CSS/fonts.css"><link rel="stylesheet" href="<?= e($base) ?>CSS/funciones.css"><link rel="icon" href="<?= e($base) ?>IMG/favicon.png"></head>
<body><header><h1>Skin-Hair Device</h1></header><aside class="sidebar" id="sidebar"><button type="button" class="menu-btn" id="toggle-sidebar" aria-label="Contraer menú" aria-expanded="true"><span id="toggle-icon">‹</span></button><div class="brand"><img src="<?= e($base) ?>IMG/favicon.png" alt="Logo"><span>Skin-Hair Device</span></div><ul class="menu"><li><a href="<?= e($rutaInicio . ($filtrar ? '?filtrar=1' : '')) ?>">Inicio</a></li>
<?php foreach (['Rostro' => ['frente', 'labios', 'ojeras', 'piel'], 'Cuerpo' => ['brazos', 'codos', 'espalda', 'torso', 'manos', 'piernas', 'pies'], 'Cabello' => ['shampoo', 'acondicionador']] as $grupo => $keys): ?>
<li class="menu-item menu-item-dropdown"><a href="#" class="menu-link" role="button" aria-expanded="false"><span><?= e($grupo) ?></span><span class="flecha-sub" aria-hidden="true">⌄</span></a><ul class="sub-menun">
<?php foreach ($keys as $key): ?><li><a class="sub-menun-link" href="<?= e(urlZona($key, $base, $filtrar)) ?>" <?= $zona === $key ? 'aria-current="page"' : '' ?>><?= e($zonas[$key][0]) ?></a></li><?php endforeach; ?>
<?php if ($grupo === 'Cabello'): ?><li class="menu-item-dropdown-interno"><a href="#" class="menu-link-interno" role="button" aria-expanded="false"><span>Tratamientos</span><span class="flecha-sub" aria-hidden="true">⌄</span></a><ul class="sub-menun-interno"><?php foreach (['capilar', 'hidratacion', 'nutricion', 'reparacion'] as $key): ?><li><a class="sub-menun-link" href="<?= e(urlZona($key, $base, $filtrar)) ?>" <?= $zona === $key ? 'aria-current="page"' : '' ?>><?= e($zonas[$key][0]) ?></a></li><?php endforeach; ?></ul></li><?php endif; ?></ul></li><?php endforeach; ?>
<li><a href="<?= e($base) ?>index.html">Presentación</a></li></ul></aside>
<main class="catalogo"><section class="cajaPrincipal"><h2><?= e($titulo) ?></h2><div class="sesion">
<?php if (logged()): ?><p>Hola, <?= e($_SESSION['usuario']['nombre']) ?></p><form method="post" action="<?= e($base) ?>HTML/salir.php"><input type="hidden" name="csrf" value="<?= e(csrf()) ?>"><button class="btn" type="submit">Cerrar sesión</button></form></div><a class="btn" href="<?= e($base) ?>HTML/formulario.php"><?= $tieneFormulario ? 'Actualizar cuestionario' : 'Completar cuestionario' ?></a><?php if ($tieneFormulario): ?><a class="btn" href="?filtrar=1">Filtrar según mis respuestas</a><a class="btn" href="?filtrar=0">Ver todos</a><?php endif; ?>
<?php else: ?><a class="btn" href="<?= e($base) ?>HTML/cuenta.php">Iniciar sesión</a><a class="btn" href="<?= e($base) ?>HTML/cuenta.php?modo=registro">Crear cuenta</a></div><p>Iniciá sesión para completar el cuestionario y filtrar productos.</p><?php endif; ?>
<p><?= count($productos) ?> producto(s)<?= $filtrar ? ' relacionados con tus respuestas' : ' para conocer' ?>.</p><?php if ($filtrar && !$tieneFormulario): ?><p>Completá el cuestionario para obtener resultados.</p><?php endif; ?></section>
<div class="productos"><?php require __DIR__ . '/tarjeta.php'; ?></div>
<?php if (!$productos): ?><section class="cajaPrincipal"><p><?= $filtrar ? 'No hay productos que coincidan con tus respuestas en esta sección. Podés actualizar el cuestionario o ver todos.' : 'Todavía no hay productos cargados para esta sección.' ?></p></section><?php endif; ?></main><script src="<?= e($base) ?>JS/menu.js"></script><script src="<?= e($base) ?>JS/tips.js" defer></script></body></html>

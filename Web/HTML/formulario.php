<?php
require __DIR__ . '/../PHP/bootstrap.php';
if (!logged()) { go('cuenta.php'); }
$preguntas = db()->query('SELECT * FROM preguntas WHERE activa = 1 ORDER BY orden, id_pregunta')->fetchAll();
$opciones = db()->query('SELECT o.* FROM opciones_respuesta o JOIN preguntas p ON p.id_pregunta = o.id_pregunta WHERE p.activa = 1 ORDER BY o.orden, o.id_opcion')->fetchAll();
$porPregunta = [];
foreach ($opciones as $opcion) { $porPregunta[$opcion['id_pregunta']][] = $opcion; }
$error = '';
$elegidas = [];
$q = db()->prepare('SELECT r.id_opcion FROM respuestas_formulario r WHERE r.id_formulario = (SELECT MAX(id_formulario) FROM formularios WHERE id_usuario = ?)');
$q->execute([$_SESSION['usuario']['id']]);
$elegidas = array_map('intval', $q->fetchAll(PDO::FETCH_COLUMN));
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    checkCsrf();
    $elegidas = [];
    $respuestas = [];
    foreach ($preguntas as $pregunta) {
        $pid = (int) $pregunta['id_pregunta'];
        $valores = $_POST['respuestas'][$pid] ?? [];
        if (!is_array($valores)) { $valores = [$valores]; }
        $validas = array_column($porPregunta[$pid] ?? [], 'id_opcion');
        if (!$valores || ($pregunta['tipo_pregunta'] === 'simple' && count($valores) !== 1)) { $error = 'Respondé todas las preguntas.'; break; }
        $valores = array_unique($valores, SORT_REGULAR);
        $tags = [];
        foreach ($valores as $valor) {
            if (!is_scalar($valor) || !ctype_digit((string) $valor) || !in_array((int) $valor, $validas)) { $error = 'Revisá las respuestas seleccionadas.'; break 2; }
            $elegidas[] = (int) $valor;
            $respuestas[] = [$pid, (int) $valor];
            foreach ($porPregunta[$pid] as $opcion) { if ((int) $opcion['id_opcion'] === (int) $valor) { $tags[] = $opcion['tag']; } }
        }
        if (count($tags) > 1 && (in_array('corporal_normal', $tags, true) || in_array('facial_sin_zonas', $tags, true))) { $error = 'No combines «Ninguna» con otras zonas en la misma pregunta.'; break; }
    }
    if (!$preguntas) { $error = 'No hay preguntas disponibles.'; }
    if ($error === '') {
        $conexion = db();
        $conexion->beginTransaction();
        try {
            $q = $conexion->prepare('INSERT INTO formularios (id_usuario) VALUES (?)');
            $q->execute([$_SESSION['usuario']['id']]);
            $fid = (int) $conexion->lastInsertId();
            $q = $conexion->prepare('INSERT INTO respuestas_formulario (id_formulario, id_pregunta, id_opcion) VALUES (?, ?, ?)');
            foreach ($respuestas as [$pid, $oid]) { $q->execute([$fid, $pid, $oid]); }
            $conexion->commit();
        } catch (Throwable $ex) { $conexion->rollBack(); throw $ex; }
        go('inicio.php?filtrar=1');
    }
}
?>
<!doctype html><html lang="es"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Cuestionario | Skin-Hair Device</title><link rel="stylesheet" href="../CSS/formulario.css"><link rel="stylesheet" href="../CSS/fonts.css"><link rel="stylesheet" href="../CSS/funciones.css"><link rel="icon" href="../IMG/favicon.png"></head>
<body><header><h1>Skin-Hair Device</h1></header><main><div class="cajaPrincipal"><h2>Cuestionario</h2><br><h3>¿Para qué sirve?</h3><p>Completá tus características para encontrar productos relacionados con tus necesidades de piel y cabello.</p><br><p class="aviso"><span>Nota importante:</span> Las recomendaciones son informativas. Consultá con tu dermatólogo antes de incorporar productos a tu rutina.</p><div class="quiz-actions"><a href="inicio.php">Ver todos los productos</a></div>
<?php if ($error): ?><p class="quiz-error" role="alert"><?= e($error) ?></p><?php endif; ?>
<form id="quizForm" method="post"><input type="hidden" name="csrf" value="<?= e(csrf()) ?>">
<?php foreach ($preguntas as $pregunta): $pid = (int) $pregunta['id_pregunta']; $multiple = $pregunta['tipo_pregunta'] === 'multiple'; ?>
<fieldset class="question-block"><legend class="question-text"><?= e($pregunta['texto_pregunta']) ?><?= $multiple ? ' (Elegí una o más opciones)' : '' ?></legend><ul class="options-list">
<?php foreach ($porPregunta[$pid] ?? [] as $opcion): ?><li class="option-item"><label><input type="<?= $multiple ? 'checkbox' : 'radio' ?>" name="respuestas[<?= $pid ?>]<?= $multiple ? '[]' : '' ?>" value="<?= (int) $opcion['id_opcion'] ?>" <?= in_array((int) $opcion['id_opcion'], $elegidas, true) ? 'checked' : '' ?> <?= $multiple ? '' : 'required' ?>><?= e($opcion['texto_opcion']) ?></label></li><?php endforeach; ?>
</ul></fieldset><?php endforeach; ?><button class="btn-submit" type="submit">Guardar y ver productos recomendados</button></form><a class="btn-submit volver-index" href="../index.html">Volver al inicio</a></div></main><script src="../JS/tips.js" defer></script></body></html>

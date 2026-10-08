<?php
require __DIR__ . '/../PHP/bootstrap.php';
$registro = ($_GET['modo'] ?? '') === 'registro';
$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    checkCsrf();
    $email = trim((string) ($_POST['email'] ?? ''));
    $password = (string) ($_POST['password'] ?? '');
    $nombre = trim((string) ($_POST['nombre'] ?? ''));
    if (!filter_var($email, FILTER_VALIDATE_EMAIL) || strlen($email) > 100) {
        $error = 'Ingresá un correo válido.';
    } elseif ($registro && ($nombre === '' || mb_strlen($nombre) > 100 || strlen($password) < 8 || strlen($password) > 72)) {
        $error = 'Ingresá tu nombre (hasta 100 caracteres) y una contraseña de entre 8 y 72 caracteres.';
    } else {
        if ($registro) {
            try {
                $q = db()->prepare('INSERT INTO usuarios (nombre, email, password) VALUES (?, ?, ?)');
                $q->execute([$nombre, $email, password_hash($password, PASSWORD_DEFAULT)]);
            } catch (PDOException $ex) {
                if ($ex->getCode() !== '23000') { throw $ex; }
                $error = 'Ese correo ya está registrado.';
            }
        }
        if ($error === '') {
            $q = db()->prepare('SELECT id_usuario, nombre, password FROM usuarios WHERE email = ?');
            $q->execute([$email]);
            $user = $q->fetch();
            if ($user && password_verify($password, $user['password'])) {
                session_regenerate_id(true);
                $_SESSION['usuario'] = ['id' => (int) $user['id_usuario'], 'nombre' => $user['nombre']];
                unset($_SESSION['csrf']);
                go('inicio.php');
            }
            $error = 'Correo o contraseña incorrectos.';
        }
    }
}
?>
<!doctype html><html lang="es"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Tu cuenta | Skin-Hair Device</title><link rel="stylesheet" href="../CSS/inicio.css"><link rel="stylesheet" href="../CSS/fonts.css"><link rel="stylesheet" href="../CSS/funciones.css"><link rel="icon" href="../IMG/favicon.png"></head>
<body><header><h1>Skin-Hair Device</h1></header><main><div class="cajaPrincipal"><h2><?= $registro ? 'Crear cuenta' : 'Iniciar sesión' ?></h2>
<?php if ($error): ?><p role="alert"><?= e($error) ?></p><?php endif; ?>
<form method="post" class="cuenta-form"><input type="hidden" name="csrf" value="<?= e(csrf()) ?>">
<?php if ($registro): ?><label>Nombre<input name="nombre" autocomplete="name" maxlength="100" value="<?= e($nombre ?? '') ?>" required></label><?php endif; ?>
<label>Correo<input type="email" name="email" autocomplete="email" maxlength="100" value="<?= e($email ?? '') ?>" required></label>
<label>Contraseña<input type="password" name="password" autocomplete="<?= $registro ? 'new-password' : 'current-password' ?>" <?= $registro ? 'minlength="8" maxlength="72"' : '' ?> required></label><button class="btn" type="submit"><?= $registro ? 'Registrarme' : 'Ingresar' ?></button></form>
<a class="btn" href="cuenta.php<?= $registro ? '' : '?modo=registro' ?>"><?= $registro ? 'Ya tengo cuenta' : 'Crear cuenta' ?></a><a class="btn" href="inicio.php">Ver productos</a></div></main><script src="../JS/tips.js" defer></script></body></html>

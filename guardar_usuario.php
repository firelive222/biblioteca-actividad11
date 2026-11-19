<?php

require_once __DIR__ . '/conexion.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    exit('Método no permitido.');
}

$nombre    = trim($_POST['nombre'] ?? '');
$documento = trim($_POST['documento'] ?? '');
$telefono  = trim($_POST['telefono'] ?? '');

if ($nombre === '' || mb_strlen($nombre) > 80) {
    http_response_code(400);
    exit('El nombre es obligatorio (máximo 80 caracteres).');
}

if ($documento === '' || mb_strlen($documento) > 20) {
    http_response_code(400);
    exit('El documento es obligatorio (máximo 20 caracteres).');
}

if (mb_strlen($telefono) > 15) {
    http_response_code(400);
    exit('El teléfono admite máximo 15 caracteres.');
}

try {
    $stmt = $pdo->prepare(
        'INSERT INTO usuarios (nombre, documento, telefono)
         VALUES (:nombre, :documento, :telefono)'
    );
    $stmt->execute([
        ':nombre'    => $nombre,
        ':documento' => $documento,
        ':telefono'  => $telefono === '' ? null : $telefono,
    ]);

    echo 'Usuario guardado correctamente. <a href="biblioteca.html">Volver</a>';

} catch (PDOException $e) {
    if (($e->errorInfo[1] ?? null) === 1062) {
        http_response_code(409);
        exit('Ya existe un usuario con ese documento. <a href="biblioteca.html">Volver</a>');
    }
    error_log($e->getMessage());
    http_response_code(500);
    exit('No se pudo guardar el usuario.');
}
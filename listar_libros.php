<?php

header('Content-Type: application/json; charset=utf-8');

try {
    require __DIR__ . '/conexion.php';

    $consulta = $pdo->query(
        'SELECT id_libro, titulo, autor, categoria
         FROM libros
         ORDER BY titulo'
    );

    echo json_encode([
        'ok' => true,
        'libros' => $consulta->fetchAll()
    ], JSON_UNESCAPED_UNICODE);

} catch (Throwable $e) {
    error_log($e->getMessage());
    http_response_code(500);
    echo json_encode([
        'ok' => false,
        'error' => 'Error del servidor'
    ], JSON_UNESCAPED_UNICODE);
}
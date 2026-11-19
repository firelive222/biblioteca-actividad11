<?php

require_once __DIR__ . '/conexion.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    exit('Método no permitido');
}

$usuario    = $_POST['id_usuario'] ?? '';
$libro      = $_POST['id_libro'] ?? '';
$prestamo   = $_POST['fecha_prestamo'] ?? '';
$devolucion = $_POST['fecha_devolucion_prevista'] ?? '';

function fechaValida(string $fecha): bool
{
    $d = DateTime::createFromFormat('Y-m-d', $fecha);
    return $d && $d->format('Y-m-d') === $fecha;
}

if (
    !ctype_digit((string)$usuario) ||
    !ctype_digit((string)$libro) ||
    !fechaValida($prestamo) ||
    !fechaValida($devolucion)
) {
    http_response_code(400);
    exit('Todos los campos son obligatorios y deben ser válidos. <a href="biblioteca.html">Volver</a>');
}

if ($devolucion < $prestamo) {
    http_response_code(400);
    exit('La devolución no puede ser anterior al préstamo. <a href="biblioteca.html">Volver</a>');
}

try {
    $pdo->beginTransaction();

    $consulta = $pdo->prepare(
        'SELECT id_prestamo FROM prestamos
         WHERE id_libro = ? AND fecha_devolucion_real IS NULL
         FOR UPDATE'
    );
    $consulta->execute([$libro]);

    if ($consulta->fetch()) {
        $pdo->rollBack();
        http_response_code(409);
        exit('El libro ya tiene un préstamo activo. <a href="biblioteca.html">Volver</a>');
    }

    $stmt = $pdo->prepare(
        'INSERT INTO prestamos
         (id_usuario, id_libro, fecha_prestamo, fecha_devolucion_prevista)
         VALUES (?, ?, ?, ?)'
    );
    $stmt->execute([$usuario, $libro, $prestamo, $devolucion]);

    $pdo->commit();

    echo 'Préstamo registrado correctamente. <a href="biblioteca.html">Volver</a>';

} catch (PDOException $e) {
    if ($pdo->inTransaction()) {
        $pdo->rollBack();
    }
    if (($e->errorInfo[1] ?? null) === 1452) {
        http_response_code(400);
        exit('El usuario o el libro seleccionado no existe.');
    }
    error_log($e->getMessage());
    http_response_code(500);
    echo 'No se pudo registrar el préstamo.';
}
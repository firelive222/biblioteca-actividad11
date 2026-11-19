<?php

$host = 'localhost';
$base = 'biblioteca_db';
$usuario = 'root';
$contrasena = '';

$pdo = new PDO(
    "mysql:host=$host;dbname=$base;charset=utf8mb4",
    $usuario,
    $contrasena,
    [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ]
);
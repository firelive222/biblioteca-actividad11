# 📚 Biblioteca Lectura para Todos

Aplicación web para gestionar una biblioteca: consultar libros, registrar usuarios y registrar préstamos. Proyecto de práctica desarrollado con **HTML, CSS, JavaScript, PHP y MySQL** como parte de mi formación como Técnico en Programación de Software del SENA.

## ✨ Funcionalidades

- Consulta del catálogo de libros en una tabla (cargada desde la base de datos).
- Registro de usuarios (nombre, documento y teléfono opcional).
- Registro de préstamos con selección de usuario y libro desde listas desplegables.
- Validación de datos en el servidor (campos obligatorios, fechas válidas, fecha de devolución posterior a la de préstamo).
- Control para que un libro no tenga dos préstamos activos al mismo tiempo.
- Consultas preparadas con PDO para evitar inyección SQL.

## 🛠️ Tecnologías

| Parte | Tecnología |
|---|---|
| Interfaz | HTML5, CSS3 |
| Interacción | JavaScript (`fetch` y JSON) |
| Servidor | PHP 8 con PDO |
| Base de datos | MySQL / MariaDB |
| Entorno local | XAMPP |

## 📁 Estructura del proyecto

```
actividad11/
├── biblioteca.html        # Página principal
├── estilos.css            # Estilos
├── conexion.php           # Conexión a la base de datos
├── listar_libros.php      # Devuelve los libros en JSON
├── listar_usuarios.php    # Devuelve los usuarios en JSON
├── guardar_usuario.php    # Registra un usuario
├── guardar_prestamo.php   # Registra un

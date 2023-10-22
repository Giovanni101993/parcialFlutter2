<?php
require_once("db.php");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    // Si la solicitud no es un POST, muestra un mensaje de error.
    echo json_encode("Método no permitido");
    exit;
}

// Obtiene los datos del formulario POST
$email = isset($_POST['email']) ? $_POST['email'] : '';
$password = isset($_POST['password']) ? $_POST['password'] : '';

if (empty($email) || empty($password)) {
    // Si falta el correo electrónico o la contraseña, muestra un mensaje de error.
    echo json_encode("Faltan datos obligatorios");
} else {
    // Escapa los valores para proteger contra la inyección SQL
    $email = mysqli_real_escape_string($db, $email);
    $password = mysqli_real_escape_string($db, $password);

    // Realiza la consulta utilizando una consulta preparada
    $query = "SELECT * FROM usuarios WHERE email = ? AND password = MD5(?)";
    $stmt = mysqli_prepare($db, $query);
    mysqli_stmt_bind_param($stmt, "ss", $email, $password);
    mysqli_stmt_execute($stmt);

    // Obtiene el resultado de la consulta
    $result = mysqli_stmt_get_result($stmt);

    if (mysqli_num_rows($result) == 1) {
        // Si se encontró una fila en la base de datos, el inicio de sesión es exitoso.
        echo json_encode("Success");
    } else {
        // Si no se encontró una fila, muestra un mensaje de error.
        echo json_encode("Error");
    }
}
?>
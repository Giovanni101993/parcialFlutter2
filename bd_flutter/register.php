<?php
require_once('db.php');

if (!$db) {
    echo 'Connection failed';
} else {
    // Verifica si se están enviando datos POST
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $name = $_POST['name'] ?? '';
        $email = $_POST['email'] ?? '';
        $phone = $_POST['phone'] ?? '';
        $password = $_POST['password'] ?? '';

        // Verifica si los datos requeridos no están vacíos
        if (!empty($name) && !empty($email) && !empty($password)) {
            // Verifica si el correo electrónico ya existe en la base de datos
            $query = "SELECT email FROM usuarios WHERE email = ?";
            $stmt = $db->prepare($query);
            $stmt->bind_param('s', $email);
            $stmt->execute();
            $stmt->store_result();

            if ($stmt->num_rows == 0) {
                // El correo electrónico no existe, inserta un nuevo registro
                $query = "INSERT INTO usuarios (name, email, phone, password) VALUES (?, ?, ?, ?)";
                $stmt = $db->prepare($query);
                $hashedPassword = md5($password);
                $stmt->bind_param('ssss', $name, $email, $phone, $hashedPassword);

                if ($stmt->execute()) {
                    echo json_encode("Success");
                } else {
                    echo json_encode("Error al registrar el usuario");
                }
            } else {
                echo json_encode("El correo electrónico ya existe");
            }
        } else {
            echo json_encode("Faltan datos obligatorios");
        }
    } else {
        echo json_encode("Método no permitido");
    }
}
?>

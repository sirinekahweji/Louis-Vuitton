<?php
include 'database/dbconnect.php';
session_start();

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $query = "SELECT * FROM membre WHERE id_membre = :id";
    $stmt = $pdo->prepare($query);
    $stmt->bindValue(':id', $id, PDO::PARAM_INT);
    $stmt->execute();

    $cls = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($cls) {
        $titrepage = "admin_Profile";
        $template = 'admin_dashboard';
        include './layout.phtml';
    } else {
        echo "Utilisateur non trouvé.";
    }
} else {
    echo "ID non spécifié dans la requête GET.";
}
?>

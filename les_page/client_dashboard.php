
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
        $titrepage = "client_Profile";
        $template = 'client_dashboard';
        include './layout.phtml';
    } 
} else {
    echo "ID non spécifié dans la requête GET.";
}
?>
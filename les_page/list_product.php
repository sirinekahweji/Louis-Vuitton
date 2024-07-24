<?php
include 'database/dbconnect.php';


if(isset($_GET['id'])) {
    $id = $_GET['id'];
 
    $query = "SELECT * FROM commande WHERE id_membre = :id";
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':id', $id, PDO::PARAM_INT);
    $stmt->execute();
 
    $cls = $stmt->fetch(PDO::FETCH_ASSOC);
if(!empty( $cls))
{
    $titrepage="admin_Profile";
    $template = 'list_product';
    include './list_product.phtml';
}
else{
    echo "n'existe aucun commande";
}
}
?>
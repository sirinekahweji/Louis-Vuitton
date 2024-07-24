<?php
include 'database/dbconnect.php';


$query = "SELECT * FROM membre";
$stmt = $pdo->prepare($query);
$stmt->execute();
$clients = $stmt->fetchAll(PDO::FETCH_ASSOC);
$titrepage="admin_Profile";
$template = 'afficherlisteClient';
include './afficherlisteClient.phtml';
?>
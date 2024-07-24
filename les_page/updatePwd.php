<?php
include 'database/dbconnect.php';
session_start();
if(isset($_GET['id'])) {
    $id = $_GET['id'];

    
        $newPassword = password_hash('nouveaumotdepasse', PASSWORD_DEFAULT); 
        $updateQuery = "UPDATE membre SET mdp = :newPassword WHERE id_membre = :id";
        $updateStmt = $pdo->prepare($updateQuery);
        $updateStmt->bindValue(':newPassword', $newPassword, PDO::PARAM_STR);
        $updateStmt->bindValue(':id', $id, PDO::PARAM_INT);
        $updateStmt->execute();

     
    }
    $titrepage = "client_profile";
    $template = 'update_pwd';
    include './updatePwd.phtml';
    session_destroy();
?>

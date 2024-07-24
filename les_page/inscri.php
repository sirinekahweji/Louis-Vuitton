<?php
include 'database/dbconnect.php';
session_start();

/
if ($_SERVER["REQUEST_METHOD"] == "POST") {
   
    $nom = $_POST["nom"];
    $prenom = $_POST["prenom"];
    $email = $_POST["email"];
    $mdp = $_POST["mdp"];
    $confirmer_mdp = $_POST["confirmer_mdp"];
    $adresse = $_POST["adresse"];
    $tel = $_POST["tel"];

    
    if ($mdp != $confirmer_mdp) {
        header("Location: inscri.php?error=Passwords do not match, check your password");
        exit();
    }

    $query = $pdo->prepare('INSERT INTO membre (nom, prenom, email, mdp, adresse, Tel) VALUES (:nom, :prenom, :email, :mdp, :adresse, :tel)');
    $query->bindValue(':nom', $nom, PDO::PARAM_STR);
    $query->bindValue(':prenom', $prenom, PDO::PARAM_STR);
    $query->bindValue(':email', $email, PDO::PARAM_STR);
    $query->bindValue(':mdp', $mdp, PDO::PARAM_STR);
    $query->bindValue(':adresse', $adresse, PDO::PARAM_STR);
    $query->bindValue(':tel', $tel, PDO::PARAM_STR);
    $query->execute();

    header("Location: client_dashboard.php?success=Inscription réussie");
    exit();
}

$titrepage = "create a new acount";
$template = 'inscri';
include './layout.phtml';
?>

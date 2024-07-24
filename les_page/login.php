<?php
include 'database/dbconnect.php';

session_start();
/*if (isset($_SESSION["user"])) {
    if ($_SESSION["statut"] == 1) {
        header("location:admin_dashboard.php");
    } else {
        header("location:client_dashboard.php");
    }
    exit();
}
*/

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $email = $_POST["email"];
    $pwd = $_POST["password"];

    
    $query = $pdo->prepare('SELECT * FROM membre WHERE email = :email AND mdp = :password');
    $query->execute(array('email' => $email, 'password' => $pwd));
    $user = $query->fetch(PDO::FETCH_ASSOC);

    if ($user) {
      
        $_SESSION['id_membre'] = $user['id'];
        $_SESSION['statut'] = $user['statut']; 

        if ($user['statut'] == 1) {
            
            header('Location: admin_dashboard.php?id=' . $user['id_membre']);
            exit();
        } 
        else {
            
            header('Location: client_dashboard.php?id=' . $user['id_membre']);
            exit();
        }
    }
    else {
        
        header("Location: login.php?error=Invalid credentials");
        exit();
    }
}

$titrepage = "Log In";
$template = 'login';
include './layout.phtml';
session_destroy();
?>

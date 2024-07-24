
<?php
include 'database/dbconnect.php';

session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $categorie = $_POST["categorie"];
    $titre = $_POST["titre"];
    $description = $_POST["description"];
    $couleur = $_POST["couleur"];
    $taille = $_POST["taille"];
    $public = $_POST["public"];
    $prix = $_POST["prix"];
    $stock = $_POST["stock"];

    
    $photo = $_FILES["photo"];
    $photoName = $photo["name"];
    $photoTmp = $photo["tmp_name"];
    move_uploaded_file($photoTmp, "uploads/" . $photoName);

       
        $stmt = $pdo->prepare("INSERT INTO produit (categorie, titre, description, couleur, taille, public,  photo,prix, stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([$categorie, $titre, $description, $couleur, $taille, $public,$photoName, $prix, $stock ]);

      
        header("Location: ./admin_dashboard.php?id=1 && sec=1");
        exit();
   
}
$titrepage="admin_Profile";
$template = 'add_product';
include './add_product.phtml';
?>


<!--?php
include 'database/dbconnect.php';
session_start();



if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $categorie = $_POST["categorie"];
    $titre = $_POST["titre"];
    $description = $_POST["description"];
    $couleur = $_POST["couleur"];
    $taille = $_POST["taille"];
    $public = $_POST["public"];
    $prix = $_POST["prix"];
    $stock = $_POST["stock"];

    $photo = $_FILES["photo"];
    $photoName = $photo["name"];
    $photoTmp = $photo["tmp_name"];
    move_uploaded_file($photoTmp, "uploads/" . $photoName);
   
   

   

    $stmt = $pdo->prepare("INSERT INTO produit (categorie, titre, description, couleur, taille, public,  photo, prix, stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([$categorie, $titre, $description, $couleur, $taille, $public, $photoName, $prix, $stock]);

    header("Location: ./admin_dashboard.php");
    exit();
}

$titrepage = "admin_Profile";
$template = 'add_product';
include './add_product.phtml';
?-->

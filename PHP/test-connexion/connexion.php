
<?php
//Début de la session
session_start();
// Connexion à la base de données
try
{
    $bdd = new PDO('mysql:host=localhost;dbname=musicon;charset=utf8', 'root', '');
}
catch(Exception $e)
{
        die('Erreur : '.$e->getMessage());
}
if (isset($_POST['valider'])) {
$message = '';
    if (empty($_POST['pseudo']) || empty($_POST['pass']) ){ //Oublie d'un champ
        $message = 'Veuillez remplir tous les champs';
    }
    else{ //On check le mot de passe
    $req=$bdd->prepare('SELECT pass, pseudo FROM utilisateur WHERE pseudo = :pseudo');
    $req->bindValue(':pseudo',$_POST['pseudo'], PDO::PARAM_STR);
    $req->execute();
    $data=$req->fetch();
		if ($data['pass'] == md5($_POST['pass'])){ // Acces OK /!\ATTENTION à la taille du VARCHAR dans la DB
			$_SESSION['pseudo'] = $data['pseudo'];
			$message = 'Bienvenue '.$data['pseudo'].'!'; 
		}
		else{ // Acces pas OK !
			$message = 'Une erreur s\'est produite pendant votre identification.<br /> 
			Le mot de passe ou le pseudo n\'est pas correcte.';
		}
    $req->CloseCursor();
    }
	echo $message;
}
?>

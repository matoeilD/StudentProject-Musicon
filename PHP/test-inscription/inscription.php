<?php

// Connexion à la base de données
try
{
    $bdd = new PDO('mysql:host=localhost;dbname=musicon;charset=utf8', 'root', '');
}
catch(Exception $e)
{
        die('Erreur : '.$e->getMessage());
}

// Test des valeurs du formulaire
if (isset($_POST['valider'])) {
	//Selection dans la base les pseudos identiques à celui entré par l'utilisateur
	$req = $bdd->query('SELECT id_utilisateur FROM utilisateur WHERE pseudo =\''.$_POST['pseudo'].'\';');
	//Si il y a au moins un pseudo identique -> erreur, les pseudos doivent être uniques
	if ($req->rowCount() >= 1){
		$message = 'Ce pseudo existe deja veuillez choisir un autre pseudo';
	}
     elseif (empty($_POST['pseudo'])) {
 
          $message = 'Veuillez choisir un pseudo.';
     }
	 elseif (empty($_POST['pass'])) {
 
          $message = 'Veuillez choisir un mot de passe.';
     }
	 elseif (empty($_POST['pass2'])) {
 
          $message = 'Veuillez confirmer le mot de passe.';
     }
	 elseif ($_POST['pass2'] != $_POST['pass']) {
 
          $message = 'Le mot de passe et la confirmation sont différents';
     }
 
     elseif (empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
 
          $message = 'Veuillez saisir une adresse e-mail valide.';
     }
	 
     else {
          // on considére que les données peuvent être enregistrées 
		  if(!empty($_POST['pseudo'])){
		  // Ajout de l'utilisateur à la base de donnée
			$req = $bdd->prepare('INSERT INTO utilisateur(pseudo, pass, email) VALUES(:pseudo, :pass, :email)');
			$req->execute(array(
			'pseudo' => $_POST['pseudo'],
			'pass' => md5($_POST['pass']),
			'email' => $_POST['email'],
			));
			$message = 'Vous êtes bien inscrit '.$_POST['pseudo'].' !';
		  }
     }
	 echo $message;
}
?>
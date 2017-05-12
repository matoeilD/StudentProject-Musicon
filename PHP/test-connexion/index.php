<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<title>Test Connexion</title>
</head>

<body>
 <h1>Test formulaire de connexion</h1>
 <form method="post" action="connexion.php" >

<label>Pseudo: <input type="text" name="pseudo"/></label><br/>
<label>Mot de passe: <input type="password" name="pass"/></label><br/>
<input type="submit" value="Connexion" name='valider'/>
</form>
<?php
phpinfo() ;
?>
</body>
</html>

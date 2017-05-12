<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<title>Test Inscription</title>
</head>

<body>
 <h1>Test formulaire d'inscription</h1>
 <form method="post" action="inscription.php">

<label>Pseudo: <input type="text" name="pseudo"/></label><br/>
<label>Mot de passe: <input type="password" name="pass"/></label><br/>
<label>Confirmation du mot de passe: <input type="password" name="pass2"/></label><br/>
<label>Adresse e-mail: <input type="text" name="email"/></label><br/>
<input type="submit" value="M'inscrire" name='valider'/>
</form>

</body>
</html>

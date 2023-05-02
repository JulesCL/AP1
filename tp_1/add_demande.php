<?php


	include_once("config.php");
	session_start();

	// recuperation des données rentrer dans le formulaire
	$id= $_SESSION['id'];
	$demande= $_POST['demande'];
	$commentaire= $_POST['commentaire'];
	$nom= $_POST['nom'];


	// requete pour ajouter une demande 
	$add = mysqli_query($mysqli, "INSERT INTO `demande` (`id_demande`, `type_demande`, `commentaire`, `id_us`, `id_eta`, `id_prio`, `nom_employe`) 
								  VALUES (NULL, '$demande', '$commentaire', '$id', '1', '1', '$nom');");
	//redirection 	
	header ("location: annonces.php")
	
	

?>
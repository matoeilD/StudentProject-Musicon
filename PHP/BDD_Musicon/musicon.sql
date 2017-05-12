-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 07 Mars 2016 à 18:20
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `musicon`
--

-- --------------------------------------------------------

--
-- Structure de la table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `id_album` int(11) NOT NULL AUTO_INCREMENT,
  `titre_album` varchar(25) DEFAULT NULL,
  `cover` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_album`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `faire_parti`
--

CREATE TABLE IF NOT EXISTS `faire_parti` (
  `id_utilisateur` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  PRIMARY KEY (`id_utilisateur`,`id_groupe`),
  KEY `FK_faire_parti_id_groupe` (`id_groupe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE IF NOT EXISTS `groupe` (
  `id_groupe` int(11) NOT NULL AUTO_INCREMENT,
  `nom_groupe` varchar(25) DEFAULT NULL,
  `image_groupe` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_groupe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `instrument`
--

CREATE TABLE IF NOT EXISTS `instrument` (
  `id_instrument` int(11) NOT NULL AUTO_INCREMENT,
  `nom_instrument` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_instrument`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `jouer`
--

CREATE TABLE IF NOT EXISTS `jouer` (
  `id_instrument` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_instrument`,`id_utilisateur`),
  KEY `FK_jouer_id_utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `musique`
--

CREATE TABLE IF NOT EXISTS `musique` (
  `id_musique` int(11) NOT NULL AUTO_INCREMENT,
  `titre_musique` varchar(25) DEFAULT NULL,
  `son` varchar(25) DEFAULT NULL,
  `id_style` int(11) DEFAULT NULL,
  `id_album` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_musique`),
  KEY `FK_musique_id_style` (`id_style`),
  KEY `FK_musique_id_album` (`id_album`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `publie`
--

CREATE TABLE IF NOT EXISTS `publie` (
  `id_musique` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_musique`,`id_utilisateur`),
  KEY `FK_publie_id_utilisateur` (`id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE IF NOT EXISTS `statut` (
  `id_statut` int(11) NOT NULL AUTO_INCREMENT,
  `nom_statut` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_statut`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `style`
--

CREATE TABLE IF NOT EXISTS `style` (
  `id_style` int(11) NOT NULL AUTO_INCREMENT,
  `nom_style` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_style`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(25) DEFAULT NULL,
  `pass` varchar(40) DEFAULT NULL,
  `email` varchar(25) NOT NULL,
  `id_statut` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`),
  KEY `FK_utilisateur_id_statut` (`id_statut`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `pseudo`, `pass`, `email`, `id_statut`) VALUES
(5, 'nabil', '3ba09afd34c67831f55d98525186f7e2', 'nabil@hotmail.fr', NULL);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `faire_parti`
--
ALTER TABLE `faire_parti`
  ADD CONSTRAINT `FK_faire_parti_id_groupe` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id_groupe`),
  ADD CONSTRAINT `FK_faire_parti_id_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `jouer`
--
ALTER TABLE `jouer`
  ADD CONSTRAINT `FK_jouer_id_instrument` FOREIGN KEY (`id_instrument`) REFERENCES `instrument` (`id_instrument`),
  ADD CONSTRAINT `FK_jouer_id_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `musique`
--
ALTER TABLE `musique`
  ADD CONSTRAINT `FK_musique_id_album` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`),
  ADD CONSTRAINT `FK_musique_id_style` FOREIGN KEY (`id_style`) REFERENCES `style` (`id_style`);

--
-- Contraintes pour la table `publie`
--
ALTER TABLE `publie`
  ADD CONSTRAINT `FK_publie_id_musique` FOREIGN KEY (`id_musique`) REFERENCES `musique` (`id_musique`),
  ADD CONSTRAINT `FK_publie_id_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_utilisateur_id_statut` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id_statut`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

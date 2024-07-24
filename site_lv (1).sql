-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 09 déc. 2023 à 18:57
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `site_lv`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int NOT NULL AUTO_INCREMENT,
  `id_membre` int DEFAULT NULL,
  `prix` int NOT NULL,
  `date_enregistrement` datetime NOT NULL,
  `etat` varchar(50) NOT NULL DEFAULT '''en cours de traitement''',
  PRIMARY KEY (`id_commande`),
  KEY `id_membre` (`id_membre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `details_commande`
--

DROP TABLE IF EXISTS `details_commande`;
CREATE TABLE IF NOT EXISTS `details_commande` (
  `id_details_commande` int NOT NULL AUTO_INCREMENT,
  `id_commande` int DEFAULT NULL,
  `id_produit` int DEFAULT NULL,
  `quantite` int NOT NULL,
  `prix` int NOT NULL,
  PRIMARY KEY (`id_details_commande`),
  KEY `id_commande` (`id_commande`),
  KEY `id_produit` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `id_membre` int NOT NULL AUTO_INCREMENT,
  `mdp` varchar(32) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) NOT NULL,
  `adresse` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tel` int NOT NULL,
  `statut` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_membre`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id_membre`, `mdp`, `nom`, `prenom`, `email`, `adresse`, `Tel`, `statut`) VALUES
(1, '12345', 'hammami', 'nesrine', 'nesrinehammami@gmail.com', 'tunis', 23456178, 1),
(2, '12345678', 'kahweji', 'sirine', 'kahwejisirine@gmail.com', 'bizerte el aliya', 2345674, 0),
(3, '12345678', 'kahweji', 'sirine', 'sirinekahweji@gmail.com', 'bizerte el aliya', 2345674, 0),
(4, '123ED', 'riahi', 'zied', 'zied@gmail.com', 'NEBEL', 9876543, 0),
(5, '123', 'riahi', 'zied', 'zied@gmail.com', 'NEBEL', 9876543, 0),
(6, '123', 'riahi', 'zied', 'zied@gmail.com', 'NEBEL', 9876543, 0),
(7, '123', 'riahi', 'zied', 'zied@gmail.com', 'NEBEL', 9876543, 0),
(8, '223', 'riahi', 'zied', 'zied@gmail.com', 'NEBEL', 9876543, 0),
(9, 'nesrine', 'hammami', 'nesrine', 'nesrinehammami1234@gmail.com', 'NEBEL', 234567, 0),
(10, 'rawaa', 'salhi', 'rawaa', 'rawaasalhi@gmail.com', 'kef', 8765430, 0),
(11, 'karwi123', 'karwi', 'sahar', 'karwisahar@gmail.com', 'ariana', 77654398, 0),
(12, '12345678', 'hhhh', 'oksddd', 'hdghgdgd@gmail.com', 'paris', 345678, 0);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id_produit` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NOT NULL DEFAULT '1',
  `categorie` varchar(20) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `couleur` varchar(20) NOT NULL,
  `taille` varchar(5) NOT NULL,
  `public` enum('M','F','mixte') NOT NULL,
  `photo` varchar(255) NOT NULL,
  `prix` int NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `admin_id`, `categorie`, `titre`, `description`, `couleur`, `taille`, `public`, `photo`, `prix`, `stock`) VALUES
(2, 1, 'dresse', 'Bustier Velvet Hem Dress', 'black dress', 'black', '34', '', 'louis-vuitton-zipper-neckline-dress --FQDR37SM4900_PM2_Front view.webp', 35, 20),
(3, 1, 'dresse', 'Bustier Velvet Hem Dress', 'ssss', '#5e2b2b', '34', '', 'louis-vuitton-ruffle-detail-dress--FQDR40QCY900_PM2_Front view.webp', 1, 6),
(4, 1, 'dresse', 'Bustier Velvet Hem Dress', 'ssss', '#5e2b2b', '34', '', 'louis-vuitton-ruffle-detail-dress--FQDR40QCY900_PM2_Front view.webp', 1, 6),
(5, 1, 'dresse', 'Bustier Velvet Hem Dress', 'ssss', '#5e2b2b', '34', '', 'louis-vuitton-ruffle-detail-dress--FQDR40QCY900_PM2_Front view.webp', 1, 6),
(6, 1, 'dresse', 'Bustier Velvet Hem Dress', 'ssss', '#5e2b2b', '34', '', 'louis-vuitton-ruffle-detail-dress--FQDR40QCY900_PM2_Front view.webp', 1, 6),
(7, 1, 'dresse', 'Bustier Velvet Hem Dress', 'sas', '#5f2121', '34', '', 'louis-vuitton-zipper-neckline-dress --FQDR37SM4900_PM2_Front view.webp', 2, 48),
(8, 1, 'dresse', 'Bustier Velvet Hem Dress', 'qq', '#317c6d', '34', '', 'louis-vuitton-lv-floragram-necklace-s00-fashion-jewelry--M00981_PM1_Worn view.webp', 0, 21),
(9, 1, 'dresse', 'Bustier Velvet Hem Dress', 'dddd', '#d03e3e', '10', '', 'louis-vuitton-graphic-pleated-accent-gown --FQDR02NJ8002_PM2_Front view.webp', 0, 1),
(10, 1, 'DGFG', 'FVDFBDFB', 'TRTT', '#000000', '34', '', 'louis-vuitton-diane--M46386_PM2_Front view.webp', 44, 33),
(11, 1, 'DGFG', 'FVDFBDFB', 'aa', '#671914', '34', '', 'louis-vuitton-lv-heirloom-necklace--M01282_PM2_Front view.webp', 22, 222),
(12, 1, 'DGFG', 'Bustier Velvet Hem Dress', 'SS', '#000000', '34', '', 'louis-vuitton-onthego-pm--M46569_PM2_Front view.webp', 3333, 33),
(13, 1, 'dresse', 'Bustier Velvet Hem Dress', 'HH', '#ab7373', '34', '', 'Personalization.webp', 44, 66),
(14, 1, 'dresse', 'Bustier Velvet Hem Dress', 'rrr', '#000000', '34', '', 'louis-vuitton-nano-speedy--M82450_PM2_Front view.webp', 11, 444),
(15, 1, 'DGFG', 'Bustier Velvet Hem Dress', 'DD', '#000000', '22', '', 'louis-vuitton-pochette-métis-east-west--M22942_PM2_Front view.webp', 22, 33),
(16, 1, 'dresse', 'Bustier Velvet Hem Dress', 'ss', '#6b5252', '34', '', 'louis-vuitton-onthego-pm--M46569_PM2_Front view.webp', 44, 22),
(17, 1, 'dresse', 'Bustier Velvet Hem Dress', 'zzzz', '#000000', '34', '', 'louis-vuitton-lv-floragram-necklace-s00-fashion-jewelry--M00981_PM1_Worn view.webp', 444, 333);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_membre`) REFERENCES `membre` (`id_membre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD CONSTRAINT `details_commande_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `details_commande_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

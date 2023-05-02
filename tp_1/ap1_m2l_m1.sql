-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 02 mai 2023 à 16:28
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
-- Base de données : `ap1_m2l_m1`
--

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

CREATE TABLE `demande` (
  `id_demande` int NOT NULL,
  `type_demande` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `commentaire` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `id_us` int DEFAULT NULL,
  `id_eta` int DEFAULT '1',
  `id_prio` int DEFAULT '1',
  `nom_employe` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `demande`
--

INSERT INTO `demande` (`id_demande`, `type_demande`, `commentaire`, `id_us`, `id_eta`, `id_prio`, `nom_employe`) VALUES
(6, 'help', '', 3, 3, 1, 1),
(7, 'zzzzzzzzzzzzzzzz', 'aaaaaa', 3, 1, 1, 4),
(8, 'jai un probleme', NULL, 3, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id_etat` int NOT NULL,
  `libelle_etat` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id_etat`, `libelle_etat`) VALUES
(1, 'non affecter'),
(2, 'en attente'),
(3, 'en cours'),
(4, 'fini');

-- --------------------------------------------------------

--
-- Structure de la table `priorite`
--

CREATE TABLE `priorite` (
  `id_prio` int NOT NULL,
  `libelle_prio` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `priorite`
--

INSERT INTO `priorite` (`id_prio`, `libelle_prio`) VALUES
(1, 'Pas urgent'),
(2, 'Moyen urgent'),
(3, 'Urgent');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id_role` int NOT NULL,
  `nom_role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `nom_role`) VALUES
(1, 'Responsable'),
(2, 'Employe'),
(3, 'Utilisateur');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `login` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mdp` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `role` int NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `login`, `mdp`, `role`) VALUES
(1, 'tech3', 'tech3', 2),
(2, 'admin', 'admin', 1),
(3, 'user', 'user', 3),
(4, 'tech1', 'tech1', 2),
(5, 'tech2', 'tech2', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `demande`
--
ALTER TABLE `demande`
  ADD PRIMARY KEY (`id_demande`),
  ADD KEY `demande_ibfk_1` (`id_eta`),
  ADD KEY `id_user` (`id_us`),
  ADD KEY `id_prio` (`id_prio`),
  ADD KEY `nom_employe` (`nom_employe`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id_etat`);

--
-- Index pour la table `priorite`
--
ALTER TABLE `priorite`
  ADD PRIMARY KEY (`id_prio`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_role` (`role`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `demande`
--
ALTER TABLE `demande`
  MODIFY `id_demande` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `priorite`
--
ALTER TABLE `priorite`
  MODIFY `id_prio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `demande`
--
ALTER TABLE `demande`
  ADD CONSTRAINT `demande_ibfk_1` FOREIGN KEY (`id_eta`) REFERENCES `etat` (`id_etat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `demande_ibfk_2` FOREIGN KEY (`id_us`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `demande_ibfk_3` FOREIGN KEY (`id_prio`) REFERENCES `priorite` (`id_prio`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `demande_ibfk_4` FOREIGN KEY (`nom_employe`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id_role`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

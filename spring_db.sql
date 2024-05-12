-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 12 mai 2024 à 22:11
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `spring_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

CREATE TABLE `avion` (
  `id_avion` bigint(20) NOT NULL,
  `celometrage_avion` int(11) NOT NULL,
  `date_fabrication` date DEFAULT NULL,
  `matricule_avion` varchar(255) DEFAULT NULL,
  `type_av_id_av` bigint(20) DEFAULT NULL,
  `type_av_id_typ` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `avion`
--

INSERT INTO `avion` (`id_avion`, `celometrage_avion`, `date_fabrication`, `matricule_avion`, `type_av_id_av`, `type_av_id_typ`) VALUES
(2, 553003, '2024-04-14', 'Airbus_A3', 2, NULL),
(3, 300000, '2024-04-21', 'boeing123', 1, NULL),
(4, 1222200, '2024-04-23', 'Boeing233', 1, NULL),
(5, 3333300, '2024-04-23', 'Airline231', 1, NULL),
(112, 6300343, '2024-05-03', 'Airbus_A380', 2, NULL),
(114, 3274394, '2024-04-05', 'MiG-31', 1, NULL),
(115, 7762312, '2024-04-21', 'Airbus_A555', 2, NULL),
(116, 42404666, '2024-04-14', 'airlines', 2, NULL),
(120, 42404662, '2024-05-01', 'MiG-311', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `role_id` bigint(20) NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, 'ADMIN'),
(2, 'AGENT'),
(3, 'USER');

-- --------------------------------------------------------

--
-- Structure de la table `type_av`
--

CREATE TABLE `type_av` (
  `id_av` bigint(20) NOT NULL,
  `matricule_av` varchar(255) DEFAULT NULL,
  `info_av` varchar(255) DEFAULT NULL,
  `nom_typ` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_av`
--

INSERT INTO `type_av` (`id_av`, `matricule_av`, `info_av`, `nom_typ`) VALUES
(1, 'Chasse', 'Les avions de chasse', NULL),
(2, 'civils', 'Les avions civils', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`user_id`, `enabled`, `password`, `username`) VALUES
(1, b'1', '$2a$10$hv9WTQsw0URJBVh21665aek3zOh4FY5V9KUG9SG08N87SPIbWy17m', 'admin'),
(2, b'1', '$2a$10$0APwAoi1kzMMXGrS2bFhO.4jMMTH2VUuugnYAY.m2EUnQdtyCbZBe', 'souleimen'),
(3, b'1', '$2a$10$dgDg0tPNZTqK6O5qMxVbJu51b8Bt2uQk.G3okbr/UCdf2Efy052Di', 'user1');

-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 3),
(2, 2),
(3, 3),
(3, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`id_avion`),
  ADD KEY `FKfkkautiifnndohdh7w7k3olvh` (`type_av_id_av`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Index pour la table `type_av`
--
ALTER TABLE `type_av`
  ADD PRIMARY KEY (`id_av`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Index pour la table `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  ADD KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `avion`
--
ALTER TABLE `avion`
  MODIFY `id_avion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `type_av`
--
ALTER TABLE `type_av`
  MODIFY `id_av` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avion`
--
ALTER TABLE `avion`
  ADD CONSTRAINT `FKfkkautiifnndohdh7w7k3olvh` FOREIGN KEY (`type_av_id_av`) REFERENCES `type_av` (`id_av`);

--
-- Contraintes pour la table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

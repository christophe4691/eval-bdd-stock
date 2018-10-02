-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  mar. 02 oct. 2018 à 21:13
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `bdd_stock`
--

-- --------------------------------------------------------

--
-- Structure de la table `Article`
--

CREATE TABLE `Article` (
  `id_article` int(11) NOT NULL,
  `nom_article` varchar(100) NOT NULL,
  `quantite_article` int(11) NOT NULL,
  `prix_article` int(11) NOT NULL,
  `categorie_article` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Article`
--

INSERT INTO `Article` (`id_article`, `nom_article`, `quantite_article`, `prix_article`, `categorie_article`) VALUES
(1, 'cerise', 7, 4, '5');

-- --------------------------------------------------------

--
-- Structure de la table `Commande`
--

CREATE TABLE `Commande` (
  `id_commande` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `nom_article` varchar(100) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` float NOT NULL,
  `fournisseur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Commande`
--

INSERT INTO `Commande` (`id_commande`, `date_commande`, `nom_article`, `quantite`, `prix`, `fournisseur`) VALUES
(5, '2018-10-04', 'orange', 8, 9, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Fournisseur`
--

CREATE TABLE `Fournisseur` (
  `id_fournisseur` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `prix` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Fournisseur`
--

INSERT INTO `Fournisseur` (`id_fournisseur`, `nom`, `adresse`, `prix`) VALUES
(2, 'pommier', 'route de lili', 7);

-- --------------------------------------------------------

--
-- Structure de la table `Mouvement`
--

CREATE TABLE `Mouvement` (
  `id_mouvement` int(11) NOT NULL,
  `nom_article` varchar(100) NOT NULL,
  `quantite_article` int(11) NOT NULL,
  `mouvement_article` varchar(100) NOT NULL,
  `articles` int(11) NOT NULL,
  `commandes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Mouvement`
--

INSERT INTO `Mouvement` (`id_mouvement`, `nom_article`, `quantite_article`, `mouvement_article`, `articles`, `commandes`) VALUES
(4, 'cerise', 6, 'vendue', 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `Prix_Achat_Vente_Fournisseure`
--

CREATE TABLE `Prix_Achat_Vente_Fournisseure` (
  `id` int(11) NOT NULL,
  `prix_achat` float NOT NULL,
  `prix_vente` float NOT NULL,
  `quantite` int(11) NOT NULL,
  `commandes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Prix_Achat_Vente_Fournisseure`
--

INSERT INTO `Prix_Achat_Vente_Fournisseure` (`id`, `prix_achat`, `prix_vente`, `quantite`, `commandes`) VALUES
(8, 9, 10, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `Quantite`
--

CREATE TABLE `Quantite` (
  `id_quantite` int(11) NOT NULL,
  `nom_article` varchar(100) NOT NULL,
  `quantite_article` int(11) NOT NULL,
  `mouvement_article` varchar(100) NOT NULL,
  `mouvements` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Quantite`
--

INSERT INTO `Quantite` (`id_quantite`, `nom_article`, `quantite_article`, `mouvement_article`, `mouvements`) VALUES
(4, 'banane', 4, 'vendue', 4);

-- --------------------------------------------------------

--
-- Structure de la table `User`
--

CREATE TABLE `User` (
  `id_user` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `User`
--

INSERT INTO `User` (`id_user`, `email`, `password`) VALUES
(1, 'doignon.christophe@orange.fr', '1234');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Article`
--
ALTER TABLE `Article`
  ADD PRIMARY KEY (`id_article`);

--
-- Index pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `fournisseur` (`fournisseur`);

--
-- Index pour la table `Fournisseur`
--
ALTER TABLE `Fournisseur`
  ADD PRIMARY KEY (`id_fournisseur`);

--
-- Index pour la table `Mouvement`
--
ALTER TABLE `Mouvement`
  ADD PRIMARY KEY (`id_mouvement`),
  ADD KEY `articles` (`articles`),
  ADD KEY `commandes` (`commandes`);

--
-- Index pour la table `Prix_Achat_Vente_Fournisseure`
--
ALTER TABLE `Prix_Achat_Vente_Fournisseure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commandes` (`commandes`);

--
-- Index pour la table `Quantite`
--
ALTER TABLE `Quantite`
  ADD PRIMARY KEY (`id_quantite`),
  ADD KEY `mouvements` (`mouvements`);

--
-- Index pour la table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Article`
--
ALTER TABLE `Article`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Commande`
--
ALTER TABLE `Commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `Fournisseur`
--
ALTER TABLE `Fournisseur`
  MODIFY `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Mouvement`
--
ALTER TABLE `Mouvement`
  MODIFY `id_mouvement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Prix_Achat_Vente_Fournisseure`
--
ALTER TABLE `Prix_Achat_Vente_Fournisseure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `Quantite`
--
ALTER TABLE `Quantite`
  MODIFY `id_quantite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `User`
--
ALTER TABLE `User`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`fournisseur`) REFERENCES `Fournisseur` (`id_fournisseur`);

--
-- Contraintes pour la table `Mouvement`
--
ALTER TABLE `Mouvement`
  ADD CONSTRAINT `mouvement_ibfk_1` FOREIGN KEY (`articles`) REFERENCES `Article` (`id_article`),
  ADD CONSTRAINT `mouvement_ibfk_2` FOREIGN KEY (`commandes`) REFERENCES `Commande` (`id_commande`);

--
-- Contraintes pour la table `Prix_Achat_Vente_Fournisseure`
--
ALTER TABLE `Prix_Achat_Vente_Fournisseure`
  ADD CONSTRAINT `prix_achat_vente_fournisseure_ibfk_1` FOREIGN KEY (`commandes`) REFERENCES `Commande` (`id_commande`);

--
-- Contraintes pour la table `Quantite`
--
ALTER TABLE `Quantite`
  ADD CONSTRAINT `quantite_ibfk_1` FOREIGN KEY (`mouvements`) REFERENCES `Mouvement` (`id_mouvement`);




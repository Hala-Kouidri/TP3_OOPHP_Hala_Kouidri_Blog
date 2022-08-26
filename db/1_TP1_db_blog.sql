-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 24, 2022 at 09:56 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `1_TP1_db_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `Article`
--

CREATE TABLE `Article` (
  `id` int(11) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `text` longtext NOT NULL,
  `date` date NOT NULL,
  `idCategorie` int(11) NOT NULL,
  `idAuteur` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Article`
--

INSERT INTO `Article` (`id`, `titre`, `text`, `date`, `idCategorie`, `idAuteur`) VALUES
(1, 'Apprendre le Design', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', '2022-03-05', 1, 'HalaKo'),
(2, 'Améliorer son Lifestyle', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', '2022-04-05', 2, 'HalaKo'),
(3, 'Débuter en Programmation', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2022-02-05', 3, 'HalaKo');

-- --------------------------------------------------------

--
-- Table structure for table `Categorie`
--

CREATE TABLE `Categorie` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Categorie`
--

INSERT INTO `Categorie` (`id`, `nom`) VALUES
(1, 'Design'),
(2, 'Mode De Vie'),
(3, 'Programmation');

-- --------------------------------------------------------

--
-- Table structure for table `Commentaire`
--

CREATE TABLE `Commentaire` (
  `id` int(11) NOT NULL,
  `texte` mediumtext NOT NULL,
  `date` date NOT NULL,
  `idArticle` int(11) NOT NULL,
  `idUsager` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `privilege`
--

DROP TABLE IF EXISTS `Privilege`;
CREATE TABLE IF NOT EXISTS `Privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Privilege` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `privilege`
--

INSERT INTO `Privilege` (`id`, `privilege`) VALUES
(1, 'Auteur'),
(2, 'Lecteur');


-- --------------------------------------------------------


--
-- Table structure for table `Usager`
--

DROP TABLE IF EXISTS `Usager`;
CREATE TABLE `Usager` (
  `nomUsager` varchar(45) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `courriel` varchar(255) NOT NULL,
  `temp_password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `privilege_id` int(11) NOT NULL,
  PRIMARY KEY (`nomUsager`),
  KEY `fk_user_privilege1_idx` (`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Usager`
--

INSERT INTO `Usager` (`nomUsager`, `mdp`, `courriel`, `temp_password`, `privilege_id`) VALUES
('HalaKo', '$2y$10$LG5uKyDU5C84hn.hHeKUKeu2lcAQrwmfMebUCA2g3cLsHHaa7KzTG', 'halako@gmail.com', NULL, 1),
('Marcos', '$2y$10$PLcRAeScuMyjt70zvG0ZYOvyQA.KqBjmHOJyetQs72/rwhoKnSZXG', 'marcos@gmail.com', NULL, 1),
('MeriKo', '$2y$10$9Nj5/URHRb9tSA974FuLdOsl4L/iwn/gRLH8bVbAclGKOZHNitA6S', 'meriko@gmail.com', NULL, 2);


--
-- Indexes for table `Article`
--
ALTER TABLE `Article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategorie_idx` (`idCategorie`),
  ADD KEY `idAuteur_idx` (`idAuteur`);

--
-- Indexes for table `Categorie`
--
ALTER TABLE `Categorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Commentaire`
--
ALTER TABLE `Commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsager_idx` (`idUsager`),
  ADD KEY `idArticle_idx` (`idArticle`);

--
-- AUTO_INCREMENT for table `Article`
--
ALTER TABLE `Article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Categorie`
--
ALTER TABLE `Categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Commentaire`
--
ALTER TABLE `Commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Article`
--
ALTER TABLE `Article`
  ADD CONSTRAINT `idAuteur` FOREIGN KEY (`idAuteur`) REFERENCES `Usager` (`nomUsager`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idCategorie` FOREIGN KEY (`idCategorie`) REFERENCES `Categorie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Commentaire`
--
ALTER TABLE `Commentaire`
  ADD CONSTRAINT `idArticle` FOREIGN KEY (`idArticle`) REFERENCES `Article` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idUsager` FOREIGN KEY (`idUsager`) REFERENCES `Usager` (`nomUsager`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

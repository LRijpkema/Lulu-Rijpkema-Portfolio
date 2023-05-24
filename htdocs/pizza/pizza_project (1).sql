-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 29 mrt 2023 om 21:14
-- Serverversie: 10.4.25-MariaDB
-- PHP-versie: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizza_project`
--
CREATE DATABASE IF NOT EXISTS `pizza_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pizza_project`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `category`
--

INSERT INTO `category` (`id`, `name`, `image`, `description`) VALUES
(1, 'Vlees', 'img/category_vlees.png\r\n', 'Verse en smaakvolle vleespizza\'s met toppings, waaronder klassieke pepperoni - perfect voor elke vleesliefhebber.'),
(2, 'Vis', 'img/category_vis.png', 'Verse zeevruchtentoppings zoals Tonijn,  maken de viscategorie van pizza\'s een heerlijke en unieke keuze voor liefhebbers van vis.'),
(3, 'Vegetarisch', 'img/category_vegetarisch.png', 'Heerlijke selectie vegetarische pizza\'s met verse en gezonde toppings. deze pizza\'s zullen zeker aan je trekken voldoen.');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230323152236', '2023-03-23 16:28:36', 327);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `pizza_id` int(11) NOT NULL,
  `costumer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adres` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `order`
--

INSERT INTO `order` (`id`, `pizza_id`, `costumer`, `adres`, `email`, `size`, `status`) VALUES
(10, 1, 'Voornaam Achternaam', 'Straat 123 Den Haag', 'email@email.com', '20cm', 'Besteld');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pizza`
--

CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `pizza`
--

INSERT INTO `pizza` (`id`, `category_id`, `name`, `image`, `description`, `price`) VALUES
(1, 2, 'Tonijn', 'img/pizza_tuna.png\r\n', 'Tuna Treat pizza: voor liefhebbers van tonijn De Tuna Treat pizza is de lekkerste vispizza van New York Pizza. Hij zit namelijk boordevol tonijn en is ook nog eens super gezond.', 19.99),
(2, 1, 'Pepperoni', 'img/pizza_pepperoni.png', 'De Double Pepperoni van New York Pizza is er eentje waarbij alles in het teken staat van super lekkere pepperoni.\r\nDe pizza is goed belegd met heerlijke pepperoni en te bestellen op onze New York Style bodem op 25cm, 30cm en 35cm.\r\nWil je een dunne bodem?', 19.99),
(6, 1, 'Hawaii', 'img/pizza_hawaii.png', 'De Hawaii-pizza dankt haar naam aan de Amerikaanse staat Hawaii, waar veel ananas wordt gekweekt. Deze pizza zorgt nogal voor verdeeldheid... Of je bent voor fruit op je pizza of niet. Daarom is het een echte pizza of je bent er weg van of je bent anti. ', 15.49),
(7, 1, 'BBQ Chicken', 'img/pizza_bbqchicken.png', 'BBQ Chicken pizza: een zoete pizza gevuld met kip. De BBQ Chicken pizza is super lekker en krijgt zijn zoetige smaak dankzij de barbecuesaus. De perfecte keuze voor iedereen die gek is op kip en de smaak van barbecuesaus.\r\n', 17.99),
(8, 3, 'Courgette', 'img/pizza_courgette.png', 'Onze nieuwste, heerlijke vegetarische pizza met courgette en gorgonzola. ', 14.99),
(9, 3, 'Californian Veggie', 'img/pizza_californianveggie.png', 'De Vegan Californian Veggie pizza is de perfecte pizza als je geen vlees of vis eet en vegetariër of veganist bent. Deze vegan pizza is gevuld met allerlei gezonde toppings waar je echt van kan genieten!', 13.99),
(10, 3, '5 Cheese', 'img/pizza_5cheese.png', 'De 5 Cheese pizza is een pizza met maar liefst vijf verschillende kazen. Als je dol bent op het eten van kaas, dan is dit de juiste keuze voor een middag- of avondmaaltijd. ', 18.99);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398D41D1D42` (`pizza_id`);

--
-- Indexen voor tabel `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CFDD826F12469DE2` (`category_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398D41D1D42` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`);

--
-- Beperkingen voor tabel `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `FK_CFDD826F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jul 2024 pada 05.30
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `drink`
--

CREATE TABLE `drink` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `price` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `stock` int(11) NOT NULL,
  `imageUrl` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `drink`
--

INSERT INTO `drink` (`id`, `name`, `description`, `price`, `createdAt`, `updatedAt`, `stock`, `imageUrl`) VALUES
(4, 'Kopi Nuju', 'Kopi', 1000, '2024-07-03 01:23:48.528', '2024-07-03 03:30:38.323', 83, 'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/09a03f52-279d-4219-996d-ca001602c781_Go-Biz_20231101_023704.jpeg'),
(6, 'Kopi', 'Kopi', 15000, '2024-07-03 01:37:57.762', '2024-07-03 03:00:25.287', 97, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt86DsU1Q3xw88uFHJBX_QMC8I3y-B6g4TyQ&s'),
(7, 'Kopi + Cookie', 'Kopi', 25000, '2024-07-03 03:20:03.178', '2024-07-03 03:20:03.178', 100, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsVpReHzIAQ2UDvO1xy0mvM1NejIeQw2rjVQ&s'),
(8, 'Americano', 'Kopi', 15000, '2024-07-03 03:23:38.739', '2024-07-03 03:23:38.739', 100, 'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/68b79a3c-e3a4-4a5e-836f-769dfd25f57a_Go-Biz_20220216_232959.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `drinkId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order`
--

INSERT INTO `order` (`id`, `drinkId`, `quantity`, `createdAt`, `updatedAt`) VALUES
(59, 4, 1, '2024-07-03 03:29:38.800', '2024-07-03 03:29:38.800'),
(60, 4, 1, '2024-07-03 03:30:38.318', '2024-07-03 03:30:38.318');

-- --------------------------------------------------------

--
-- Struktur dari tabel `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('0924af1f-07ce-4799-8c3e-2a16720e79bd', 'fbb5375d2c6837e2aec3e0f9ddaca3630f9c633390b4c162d9bcafb7aaa7263e', '2024-07-03 01:19:19.520', '20240703011919_add_image_url_to_drink', NULL, NULL, '2024-07-03 01:19:19.515', 1),
('3f7b5164-09cd-4e74-b30b-1785f27cf2e1', '233d1ad4033123f2e5f2c984c30522ec50b932dcc1bf5227abaacaf35751970c', '2024-07-03 00:46:10.359', '20240703004610_', NULL, NULL, '2024-07-03 00:46:10.356', 1),
('57210569-747e-4d82-b9f7-8afbf5c1ee56', 'd89626158ccbe1539c94708fc6c43758c3e2843a212e3b47a41ae36b4609ca7a', '2024-07-03 00:46:10.235', '20240703004516_add_stock_column', NULL, NULL, '2024-07-03 00:46:10.208', 1),
('84c45fb5-cff2-4535-a4e4-5da40857619d', '155bfd209f8fa0dc1df68a6b737c3378d41e0535154f84a669b3b1d79afa9a6f', '2024-07-03 00:35:14.871', '20240703003514_init', NULL, NULL, '2024-07-03 00:35:14.866', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `drink`
--
ALTER TABLE `drink`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Order_drinkId_fkey` (`drinkId`);

--
-- Indeks untuk tabel `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `drink`
--
ALTER TABLE `drink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `Order_drinkId_fkey` FOREIGN KEY (`drinkId`) REFERENCES `drink` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

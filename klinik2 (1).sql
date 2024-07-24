-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2024 at 04:21 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klinik2`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_hapus_asisten` (IN `p_asisten_id` INT)   BEGIN
    DELETE FROM asisten WHERE asisten_id = p_asisten_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_tambah_dokter` (IN `p_nama` VARCHAR(50), IN `p_spesialist` VARCHAR(50), IN `p_alamat` VARCHAR(100))   BEGIN
    INSERT INTO dokter (nama, spesialist, alamat)
    VALUES (p_nama, p_spesialist, p_alamat);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_pasien` (IN `p_pasien_id` INT, IN `p_nama` VARCHAR(50), IN `p_alamat` VARCHAR(100), IN `p_jenis_kelamin` VARCHAR(10))   BEGIN
    UPDATE pasien
    SET nama = p_nama,
        alamat = p_alamat,
        jenis_kelamin = p_jenis_kelamin
    WHERE pasien_id = p_pasien_id;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `get_nama_dokter` (`dokter_id` INT) RETURNS VARCHAR(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci  BEGIN
    DECLARE nama VARCHAR(50);
    SELECT nama INTO nama
    FROM dokter
    WHERE id_dokter = dokter_id;
    RETURN nama;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `get_spesialis_dokter` (`dokter_id` INT) RETURNS VARCHAR(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci  BEGIN
    DECLARE spesialis VARCHAR(50);
    SELECT spesialist INTO spesialis
    FROM dokter
    WHERE id_dokter = dokter_id;
    RETURN spesialis;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `hitung_asisten` (`dokter_id` INT) RETURNS INT(11)  BEGIN
    DECLARE jumlah_asisten INT;
    SELECT COUNT(*) INTO jumlah_asisten
    FROM asisten
    WHERE id_dokter = dokter_id;
    RETURN jumlah_asisten;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `asisten`
--

CREATE TABLE `asisten` (
  `asisten_id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asisten`
--

INSERT INTO `asisten` (`asisten_id`, `nama`, `alamat`, `id_dokter`, `created_at`) VALUES
(2342, 'wildan', 'lampung', 7642, '2024-07-07 18:08:38'),
(2672, 'angga', 'toraja', 7642, '2024-07-07 18:08:38'),
(4623, 'gilang', 'surabaya', 7642, '2024-07-07 18:08:38'),
(6452, 'enggar', 'sleman', 7642, '2024-07-07 18:08:38'),
(6725, 'yanto', 'magelang', 6548, '2024-07-07 18:08:38'),
(6735, 'dimas', 'jambi', 6548, '2024-07-07 18:08:38'),
(6752, 'nando', 'klaten', 6548, '2024-07-07 18:08:38'),
(7256, 'regi', 'jakarta', 5342, '2024-07-07 18:08:38'),
(7263, 'adam', 'bangka', 7642, '2024-07-07 18:08:38'),
(7432, 'evan', 'sulawesi', 5342, '2024-07-07 18:08:38'),
(7523, 'pandi', 'jogja', 5342, '2024-07-07 18:08:38'),
(7634, 'ucok', 'sulawesi', 5342, '2024-07-07 18:08:38'),
(8353, 'asep', 'sleman', 6548, '2024-07-07 18:08:38'),
(8643, 'alan', 'bantul', 5342, '2024-07-07 18:08:38'),
(8734, 'andi', 'klaten', 6548, '2024-07-07 18:08:38'),
(8735, 'tunggal', 'kebumen', 5431, '2024-07-07 18:08:38'),
(8743, 'rio', 'magelang', 5431, '2024-07-07 18:08:38'),
(8765, 'kikin', 'jambi', 5431, '2024-07-07 18:08:38'),
(8940, 'alek', 'balikpapan', 5431, '2024-07-07 18:08:38'),
(9475, 'arya', 'kalimantan', 5431, '2024-07-07 18:08:38');

--
-- Triggers `asisten`
--
DELIMITER $$
CREATE TRIGGER `before_asisten_insert` BEFORE INSERT ON `asisten` FOR EACH ROW BEGIN
    SET NEW.created_at = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_asisten_update` BEFORE UPDATE ON `asisten` FOR EACH ROW BEGIN
    SET NEW.nama = UPPER(NEW.nama);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `spesialist` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama`, `spesialist`, `alamat`) VALUES
(5342, 'Aziz', 'Hati', 'Lampung'),
(5431, 'Hasarela', 'Hidung', 'Sumatra'),
(6548, 'Brilyan', 'Mata', 'Sulawesi'),
(7642, 'Chika', 'Mulut', 'Batak');

--
-- Triggers `dokter`
--
DELIMITER $$
CREATE TRIGGER `after_dokter_update` AFTER UPDATE ON `dokter` FOR EACH ROW BEGIN
    INSERT INTO log_dokter_changes (dokter_id, old_nama, new_nama, old_spesialist, new_spesialist, changed_at)
    VALUES (OLD.id_dokter, OLD.nama, NEW.nama, OLD.spesialist, NEW.spesialist, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `id_dokter` int(11) DEFAULT NULL,
  `id_resepsionist` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `tanggal`, `waktu`, `id_dokter`, `id_resepsionist`) VALUES
(235, '2024-03-08', '05:15:00', 6548, 6573),
(345, '2024-05-14', '16:00:00', 7642, 4367),
(436, '2023-04-19', '17:00:00', 7642, 5632),
(546, '2024-02-06', '13:30:00', 6548, 7821),
(547, '2024-04-16', '02:30:00', 5342, 4543),
(548, '2024-03-14', '08:00:00', 5431, 7424),
(568, '2024-04-28', '13:00:00', 5342, 6474),
(569, '2023-04-25', '14:15:00', 6548, 5468),
(675, '2024-04-19', '14:30:00', 5342, 1434),
(679, '2024-03-23', '06:00:00', 7642, 6734),
(683, '2023-04-24', '04:10:00', 5431, 4564),
(743, '2024-05-10', '12:00:00', 5431, 2346),
(745, '2023-03-13', '07:30:00', 5342, 6784),
(784, '2023-04-17', '10:10:00', 7642, 7535),
(786, '2023-02-03', '11:00:00', 5342, 7543),
(804, '2024-02-05', '12:00:00', 5431, 7642),
(805, '2024-02-18', '15:30:00', 7642, 7845),
(854, '2024-05-13', '15:25:00', 6548, 3456),
(875, '2024-03-27', '07:30:00', 5431, 6542),
(895, '2024-03-16', '09:25:00', 6548, 7434);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` int(11) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `nama_obat`, `harga`, `stok`) VALUES
(235, 'Mertigo', 35000.00, 67),
(345, 'Cefadrixil', 25000.00, 75),
(346, 'Vitamin B1', 60000.00, 45),
(368, 'Demacolin', 45000.00, 45),
(369, 'Vitamin A', 63000.00, 46),
(542, 'Amoxcilin', 7000.00, 15),
(563, 'Paracetamol', 5000.00, 10),
(568, 'Vitamin B', 76000.00, 75),
(632, 'Celixime', 15000.00, 50),
(634, 'Acyclofir', 6000.00, 20),
(673, 'Betametason', 75000.00, 23),
(684, 'Sohobion', 40000.00, 45),
(689, 'Oralit', 30000.00, 48),
(743, 'Vitamin D', 52000.00, 89),
(746, 'Antalgin', 10000.00, 16),
(790, 'Vitamin C', 35000.00, 56),
(854, 'Captopril', 17000.00, 34),
(863, 'Bodrex', 10000.00, 20),
(905, 'Vitamin com', 90000.00, 42),
(978, 'Betahistine', 15000.00, 56);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `pasien_id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`pasien_id`, `nama`, `alamat`, `jenis_kelamin`) VALUES
(1467, 'muti', 'sulawesi', 'P'),
(1734, 'vincen', 'sumatra', 'L'),
(2346, 'rin', 'bali', 'P'),
(2836, 'hao', 'surabaya', 'L'),
(3462, 'zoe', 'surabaya', 'P'),
(6253, 'antok', 'jambi', 'L'),
(6523, 'barto', 'jambi', 'L'),
(6752, 'sejati', 'surabaya', 'L'),
(7623, 'arung', 'sulawesi', 'L'),
(7634, 'siti', 'jambi', 'P'),
(8364, 'nopal', 'sumatra', 'L'),
(8624, 'usni', 'palembang', 'P'),
(8742, 'queen', 'sulawesi', 'P'),
(8745, 'meise', 'jogja', 'P'),
(8763, 'mira', 'toraja', 'P'),
(9374, 'andri', 'bali', 'P'),
(9564, 'yori', 'jogja', 'L'),
(9834, 'putri', 'sleman', 'P'),
(9852, 'rina', 'palembang', 'P'),
(9853, 'luna', 'jogja', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `resepsionist`
--

CREATE TABLE `resepsionist` (
  `id_resepsionist` int(11) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `shift` varchar(10) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resepsionist`
--

INSERT INTO `resepsionist` (`id_resepsionist`, `jenis_kelamin`, `nama`, `id_pasien`, `shift`, `id_obat`) VALUES
(1434, 'L', 'Cendrik', 2836, 'Siang', 368),
(2346, 'L', 'Andre', 6752, 'Malam', 568),
(3456, 'P', 'Marta', 6523, 'Malam', 563),
(4367, 'P', 'Luna', 9852, 'Siang', 905),
(4543, 'L', 'Cairo', 2346, 'Siang', 346),
(4564, 'L', 'Fajri', 3462, 'Siang', 369),
(5468, 'L', 'Paul', 9374, 'Pagi', 790),
(5632, 'L', 'Aldi', 8742, 'Malam', 689),
(6474, 'P', 'Sevanya', 8745, 'Pagi', 743),
(6542, 'P', 'Rina', 6253, 'Malam', 542),
(6573, 'L', 'Betran', 8624, 'Siang', 684),
(6734, 'P', 'Dinda', 7623, 'Pagi', 632),
(6784, 'P', 'Ica', 9564, 'Malam', 854),
(7424, 'P', 'Putri', 8364, 'Siang', 673),
(7434, 'P', 'Naomi', 9853, 'Pagi', 978),
(7535, 'P', 'Serli', 8763, 'Siang', 746),
(7543, 'L', 'Leo', 9834, 'Siang', 863),
(7642, 'L', 'Arka', 1467, 'Malam', 235),
(7821, 'P', 'Wika', 1734, 'Malam,', 345),
(7845, 'P', 'Intan', 7634, 'Pagi', 634);

-- --------------------------------------------------------

--
-- Table structure for table `struk`
--

CREATE TABLE `struk` (
  `struk_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `pasien_id` int(11) DEFAULT NULL,
  `obat_id` int(11) DEFAULT NULL,
  `jumlah_obat` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `struk`
--

INSERT INTO `struk` (`struk_id`, `tanggal`, `total_harga`, `pasien_id`, `obat_id`, `jumlah_obat`) VALUES
(346, '2024-03-08', 40000.00, 2346, 863, 4),
(456, '2024-03-16', 105000.00, 9853, 235, 3),
(457, '2024-03-14', 60000.00, 6752, 689, 2),
(462, '2023-04-24', 30000.00, 8624, 632, 2),
(467, '2024-02-18', 120000.00, 9834, 346, 2),
(546, '2023-03-13', 15000.00, 8745, 563, 3),
(568, '2024-04-28', 180000.00, 1734, 905, 2),
(578, '2023-02-03', 252000.00, 9374, 369, 4),
(579, '2023-04-19', 70000.00, 3462, 790, 2),
(658, '2023-04-17', 14000.00, 8763, 542, 2),
(659, '2024-02-06', 30000.00, 6253, 746, 3),
(673, '2024-05-13', 50000.00, 9852, 345, 2),
(780, '2024-03-27', 30000.00, 1467, 978, 2),
(793, '2024-02-05', 135000.00, 9564, 368, 3),
(807, '2024-04-16', 104000.00, 6523, 743, 2),
(870, '2024-05-14', 68000.00, 2836, 854, 4),
(890, '2023-04-25', 120000.00, 7623, 684, 3),
(956, '2024-04-19', 225000.00, 7634, 673, 3),
(980, '2024-05-10', 228000.00, 8742, 568, 3),
(989, '2024-03-23', 12000.00, 8364, 634, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_dokter_asisten`
-- (See below for the actual view)
--
CREATE TABLE `view_dokter_asisten` (
`id_dokter` int(11)
,`nama_dokter` varchar(50)
,`spesialist` varchar(50)
,`alamat_dokter` varchar(100)
,`asisten_id` int(11)
,`nama_asisten` varchar(50)
,`alamat_asisten` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_jadwal_dokter`
-- (See below for the actual view)
--
CREATE TABLE `view_jadwal_dokter` (
`id_jadwal` int(11)
,`tanggal` date
,`waktu` time
,`id_dokter` int(11)
,`nama_dokter` varchar(50)
,`id_resepsionist` int(11)
,`nama_resepsionist` varchar(50)
,`shift` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_pasien_struk`
-- (See below for the actual view)
--
CREATE TABLE `view_pasien_struk` (
`struk_id` int(11)
,`tanggal` date
,`pasien_id` int(11)
,`nama_pasien` varchar(50)
,`alamat_pasien` varchar(100)
,`jenis_kelamin` varchar(10)
,`id_obat` int(11)
,`nama_obat` varchar(50)
,`jumlah_obat` int(10)
,`total_harga` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Structure for view `view_dokter_asisten`
--
DROP TABLE IF EXISTS `view_dokter_asisten`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_dokter_asisten`  AS SELECT `d`.`id_dokter` AS `id_dokter`, `d`.`nama` AS `nama_dokter`, `d`.`spesialist` AS `spesialist`, `d`.`alamat` AS `alamat_dokter`, `a`.`asisten_id` AS `asisten_id`, `a`.`nama` AS `nama_asisten`, `a`.`alamat` AS `alamat_asisten` FROM (`dokter` `d` join `asisten` `a` on(`d`.`id_dokter` = `a`.`id_dokter`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_jadwal_dokter`
--
DROP TABLE IF EXISTS `view_jadwal_dokter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_jadwal_dokter`  AS SELECT `j`.`id_jadwal` AS `id_jadwal`, `j`.`tanggal` AS `tanggal`, `j`.`waktu` AS `waktu`, `d`.`id_dokter` AS `id_dokter`, `d`.`nama` AS `nama_dokter`, `r`.`id_resepsionist` AS `id_resepsionist`, `r`.`nama` AS `nama_resepsionist`, `r`.`shift` AS `shift` FROM ((`jadwal` `j` join `dokter` `d` on(`j`.`id_dokter` = `d`.`id_dokter`)) join `resepsionist` `r` on(`j`.`id_resepsionist` = `r`.`id_resepsionist`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_pasien_struk`
--
DROP TABLE IF EXISTS `view_pasien_struk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pasien_struk`  AS SELECT `s`.`struk_id` AS `struk_id`, `s`.`tanggal` AS `tanggal`, `p`.`pasien_id` AS `pasien_id`, `p`.`nama` AS `nama_pasien`, `p`.`alamat` AS `alamat_pasien`, `p`.`jenis_kelamin` AS `jenis_kelamin`, `o`.`id_obat` AS `id_obat`, `o`.`nama_obat` AS `nama_obat`, `s`.`jumlah_obat` AS `jumlah_obat`, `s`.`total_harga` AS `total_harga` FROM ((`struk` `s` join `pasien` `p` on(`s`.`pasien_id` = `p`.`pasien_id`)) join `obat` `o` on(`s`.`obat_id` = `o`.`id_obat`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asisten`
--
ALTER TABLE `asisten`
  ADD PRIMARY KEY (`asisten_id`),
  ADD KEY `asisten` (`id_dokter`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_resepsionist` (`id_resepsionist`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`pasien_id`);

--
-- Indexes for table `resepsionist`
--
ALTER TABLE `resepsionist`
  ADD PRIMARY KEY (`id_resepsionist`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `resepsionist_ibfk_1` (`id_obat`);

--
-- Indexes for table `struk`
--
ALTER TABLE `struk`
  ADD PRIMARY KEY (`struk_id`),
  ADD KEY `pasien_id` (`pasien_id`),
  ADD KEY `obat_id` (`obat_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asisten`
--
ALTER TABLE `asisten`
  ADD CONSTRAINT `asisten` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`id_resepsionist`) REFERENCES `resepsionist` (`id_resepsionist`);

--
-- Constraints for table `resepsionist`
--
ALTER TABLE `resepsionist`
  ADD CONSTRAINT `resepsionist_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`pasien_id`);

--
-- Constraints for table `struk`
--
ALTER TABLE `struk`
  ADD CONSTRAINT `struk_ibfk_1` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`pasien_id`),
  ADD CONSTRAINT `struk_ibfk_2` FOREIGN KEY (`obat_id`) REFERENCES `obat` (`id_obat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

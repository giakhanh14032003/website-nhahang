-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2025 at 04:46 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bobittet`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked`
--

CREATE TABLE `booked` (
  `id` int(11) NOT NULL,
  `idUser` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `bookedDay` date NOT NULL,
  `time` time NOT NULL,
  `note` text DEFAULT NULL,
  `numberPeople` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `reasonRefused` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booked`
--

INSERT INTO `booked` (`id`, `idUser`, `name`, `phone`, `bookedDay`, `time`, `note`, `numberPeople`, `status`, `reasonRefused`) VALUES
(13, 'user_67e19533ca19d9.53005307', 'class_id', '0987654321', '2025-03-26', '00:08:00', 'a', 4, 'bị từ chối', 'he t');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `item_id`, `quantity`, `created_at`) VALUES
(15, 'user_67e117694b75d7.14971447', 2, 1, '2025-03-24 13:40:11'),
(75, 'user_67fcf3bdc01381.26118827', 1, 2, '2025-04-14 11:39:20');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Khai vị', 'Món ăn nhẹ trước bữa chính'),
(2, 'Món chính', 'Các món chính trong thực đơn'),
(3, 'Tráng miệng', 'Món tráng miệng ngọt'),
(4, 'Đồ uống', 'Các loại nước giải khát');

-- --------------------------------------------------------

--
-- Table structure for table `detailordered`
--

CREATE TABLE `detailordered` (
  `id` int(11) NOT NULL,
  `idOrdered` int(11) NOT NULL,
  `idItem` int(11) NOT NULL,
  `nameItem` varchar(255) NOT NULL,
  `priceItem` int(11) NOT NULL,
  `quantityItem` int(11) NOT NULL,
  `imageItem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detailordered`
--

INSERT INTO `detailordered` (`id`, `idOrdered`, `idItem`, `nameItem`, `priceItem`, `quantityItem`, `imageItem`) VALUES
(41, 32, 1, 'Súp bí đỏ', 49000, 1, 'supbido.png'),
(42, 33, 27, 'Súp hành kiểu Pháp', 89000, 1, 'sup_hanh_phap.png'),
(43, 33, 31, 'Phô mai que', 89000, 1, 'pho_mai_que.png'),
(62, 59, 1, 'Súp bí đỏ', 49000, 2, 'supbido.png'),
(65, 61, 6, 'Bít tết T-bone', 329000, 1, 'bit_tet_tbone.png'),
(66, 61, 2, 'Bò Mỹ', 199000, 1, 'bomy.png');

-- --------------------------------------------------------

--
-- Table structure for table `discarded_items`
--

CREATE TABLE `discarded_items` (
  `id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `discard_date` date NOT NULL DEFAULT curdate(),
  `expiry_date` date NOT NULL,
  `lost_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discarded_items`
--

INSERT INTO `discarded_items` (`id`, `ingredient_id`, `quantity`, `discard_date`, `expiry_date`, `lost_amount`) VALUES
(1, 20, 3, '2025-03-31', '2025-04-01', 180000),
(2, 20, 1, '2025-03-31', '2025-04-01', 60000),
(3, 21, 1, '2025-03-31', '2025-04-01', 55000);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `unit`, `description`, `price`) VALUES
(1, 'Bí đỏ', 'kg', 'Nguyên liệu chính cho súp bí đỏ', 25000),
(2, 'Hành tây', 'kg', 'Nguyên liệu chính cho súp hành kiểu Pháp', 30000),
(3, 'Bơ', 'g', 'Dùng làm sốt cho bánh mì bơ tỏi', 320000),
(4, 'Tỏi', 'g', 'Dùng làm sốt cho bánh mì bơ tỏi', 100000),
(5, 'Cánh gà', 'kg', 'Dùng cho món cánh gà sốt mật ong', 80000),
(6, 'Mật ong', 'ml', 'Làm sốt cho cánh gà sốt mật ong', 150000),
(7, 'Khoai tây', 'kg', 'Nguyên liệu chính cho súp khoai tây bacon', 25000),
(8, 'Bacon', 'g', 'Dùng trong súp khoai tây bacon', 180000),
(9, 'Phô mai Mozzarella', 'g', 'Dùng làm phô mai que', 220000),
(10, 'Bột chiên xù', 'g', 'Dùng làm vỏ phô mai que', 40000),
(12, 'Dầu ăn', 'ml', 'Chiên các món', 40000),
(13, 'Bò', 'kg', 'Nguyên liệu chính cho các món bít tết', 320000),
(14, 'Cá hồi', 'kg', 'Dùng cho gỏi cá hồi', 450000),
(15, 'Hàu', 'kg', 'Dùng cho hàu nướng phô mai', 120000),
(16, 'Mỳ Ý', 'g', 'Nguyên liệu chính cho các món mì Ý', 70000),
(17, 'Nước sốt cà chua', 'ml', 'Dùng trong mì Ý sốt bò bằm', 50000),
(18, 'Trứng', 'quả', 'Dùng cho mì Ý Carbonara', 5000),
(19, 'Bánh mousse', 'cái', 'Tráng miệng vị chanh leo', 50000),
(20, 'Bánh Tiramisu', 'cái', 'Tráng miệng kiểu Ý', 60000),
(21, 'Cheesecake dâu', 'cái', 'Bánh phô mai dâu tây', 55000),
(22, 'Bánh Lava Chocolate', 'cái', 'Bánh chocolate tan chảy', 70000),
(23, 'Panna Cotta', 'cái', 'Thạch sữa Ý', 45000),
(24, 'Nước cam', 'ml', 'Nước cam tươi nguyên chất', 40000),
(25, 'Trà đào cam sả', 'ml', 'Trà trái cây tươi mát', 45000),
(26, 'Nước ép dưa hấu', 'ml', 'Dưa hấu ép nguyên chất', 35000),
(27, 'Cà phê', 'g', 'Dùng pha cà phê sữa đá', 200000),
(28, 'Sữa đặc', 'ml', 'Dùng pha cà phê sữa đá', 30000),
(29, 'Xà lách', 'kg', 'Dùng cho các món salad', 20000),
(30, 'Gà', 'kg', 'Dùng cho món salad Caesar', 90000),
(31, 'Cá ngừ', 'kg', 'Dùng cho món salad cá ngừ', 250000),
(32, 'Sốt mè rang', 'ml', 'Dùng làm sốt cho salad cá ngừ', 50000),
(33, 'Cà chua', 'kg', 'Dùng trong salad Hy Lạp', 35000),
(34, 'Olive', 'g', 'Dùng trong salad Hy Lạp', 80000),
(35, 'Feta cheese', 'g', 'Phô mai dùng trong salad Hy Lạp', 250000);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `stock_quantity` float NOT NULL DEFAULT 0,
  `unit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `ingredient_id`, `stock_quantity`, `unit`) VALUES
(36, 1, 2, 'unit'),
(37, 2, 5, 'unit'),
(38, 3, 2, 'unit'),
(39, 4, 10, 'unit'),
(40, 5, 10, 'unit'),
(41, 6, 2, 'unit'),
(42, 7, 5, 'unit'),
(43, 8, 10, 'unit'),
(44, 9, 2, 'unit'),
(45, 10, 4, 'unit'),
(46, 12, 2, 'unit'),
(47, 13, 9.2, 'unit'),
(48, 14, 9.8, 'unit'),
(49, 15, 5, 'unit'),
(50, 16, 4.7, 'unit'),
(51, 17, 5, 'unit'),
(52, 18, 18, 'unit'),
(53, 19, 5, 'unit'),
(54, 20, 1, 'unit'),
(55, 21, 4, 'unit'),
(56, 22, 5, 'unit'),
(57, 23, 4, 'unit'),
(58, 24, 3, 'unit'),
(59, 25, 2.5, 'unit'),
(60, 26, 2.5, 'unit'),
(61, 27, 2, 'unit'),
(62, 28, 1, 'unit'),
(63, 29, 5, 'unit'),
(64, 30, 5, 'unit'),
(65, 31, 5, 'unit'),
(66, 32, 3, 'unit'),
(67, 33, 5, 'unit'),
(68, 34, 3, 'unit'),
(69, 35, 2, 'unit');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_details`
--

CREATE TABLE `inventory_details` (
  `id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `entry_date` date NOT NULL DEFAULT curdate(),
  `purchase_order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_details`
--

INSERT INTO `inventory_details` (`id`, `ingredient_id`, `quantity`, `expiry_date`, `entry_date`, `purchase_order_id`) VALUES
(13, 1, 2, '2025-04-14', '2025-03-31', 6),
(14, 2, 5, '2025-04-14', '2025-03-31', 6),
(15, 3, 2, '2025-04-30', '2025-03-31', 6),
(16, 4, 5, '2025-05-07', '2025-03-31', 6),
(17, 5, 10, '2025-04-20', '2025-03-31', 6),
(18, 6, 2, '2025-05-30', '2025-03-31', 6),
(19, 7, 5, '2025-04-30', '2025-03-31', 6),
(20, 8, 10, '2025-04-20', '2025-03-31', 6),
(21, 9, 2, '2025-05-30', '2025-03-31', 6),
(22, 10, 4, '2025-05-30', '2025-03-31', 6),
(23, 12, 2, '2025-05-30', '2025-03-31', 6),
(24, 13, 10, '2025-04-20', '2025-03-31', 6),
(25, 14, 10, '2025-04-20', '2025-03-31', 6),
(26, 15, 5, '2025-04-20', '2025-03-31', 6),
(27, 16, 5, '2025-04-30', '2025-03-31', 6),
(28, 17, 5, '2025-04-30', '2025-03-31', 6),
(29, 18, 18, '2025-06-30', '2025-03-31', 6),
(30, 19, 5, '2025-05-02', '2025-03-31', 6),
(31, 20, 1, '2025-04-01', '2025-03-31', 6),
(32, 21, 4, '2025-04-01', '2025-03-31', 6),
(33, 22, 5, '2025-04-02', '2025-03-31', 6),
(34, 23, 4, '2025-04-01', '2025-03-31', 6),
(35, 24, 3, '2025-04-02', '2025-03-31', 6),
(36, 25, 3, '2025-04-02', '2025-03-31', 6),
(37, 26, 3, '0000-00-00', '2025-03-31', 6),
(38, 27, 2, '2025-05-30', '2025-03-31', 6),
(39, 28, 1, '2025-05-30', '2025-03-31', 6),
(40, 29, 5, '2025-04-03', '2025-03-31', 6),
(41, 30, 5, '2025-04-20', '2025-03-31', 6),
(42, 31, 5, '2025-04-20', '2025-03-31', 6),
(43, 32, 3, '2025-05-30', '2025-03-31', 6),
(44, 33, 5, '2025-04-04', '2025-03-31', 6),
(45, 34, 3, '2025-04-04', '2025-03-31', 6),
(46, 35, 2, '2025-05-30', '2025-03-31', 6),
(47, 1, 0, '2025-04-06', '2025-03-31', 7),
(48, 4, 5, '2025-04-30', '2025-03-31', 7);

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `category_id`, `name`, `description`, `price`, `image`, `status`) VALUES
(1, 1, 'Súp bí đỏ', 'Súp kem bí đỏ với kem tươi', 49000, '67f202910b2d4.png', 'active'),
(2, 2, 'Bò Mỹ', 'Bò Mỹ nướng sốt tiêu đen', 199000, 'bomy.png', 'active'),
(3, 3, 'Bánh mousse', 'Bánh mousse vị chanh leo', 59000, '67fce4fb086c2.png', 'active'),
(4, 4, 'Nước cam', 'Nước cam tươi nguyên chất', 39000, '67fcf1f111da4.jpg', 'active'),
(5, 2, 'Bít tết bò Mỹ', 'Bò Mỹ nhập khẩu, nướng than', 249000, '67e2debf080ec.png', 'active'),
(6, 2, 'Bít tết T-bone', 'Thịt bò T-bone nướng sốt tiêu đen', 329000, '67f2054e32043.png', 'active'),
(7, 2, 'Bít tết Wagyu', 'Bò Wagyu Nhật Bản, mềm tan', 499000, '67f205a5d2d2f.png', 'active'),
(8, 2, 'Bít tết Ribeye', 'Ribeye thơm béo, sốt vang đỏ', 289000, '67f2060e6ac92.png', 'active'),
(9, 2, 'Bít tết Tomahawk', 'Tomahawk siêu lớn, ăn kèm khoai', 799000, '67f2064ea1936.png', 'active'),
(10, 2, 'Bít tết Fillet Mignon', 'Fillet thượng hạng, mềm mịn', 379000, '67f20697aa947.png', 'active'),
(11, 2, 'Bít tết kiểu Pháp', 'Steak kiểu Pháp, sốt kem nấm', 269000, '67f20736e67fb.png', 'active'),
(12, 2, 'Bít tết sốt tiêu xanh', 'Bò Úc, sốt tiêu xanh cay nhẹ', 259000, '67f2079e15ef9.png', 'active'),
(13, 2, 'Bít tết sốt bơ tỏi', 'Bít tết bò Mỹ, sốt bơ tỏi', 269000, '67f207eb7babe.png', 'active'),
(14, 2, 'Bít tết thăn ngoại', 'Thăn ngoại nướng lửa lớn', 289000, '67f20881b8502.png', 'active'),
(15, 2, 'Bít tết sốt nấm', 'Steak sốt nấm rừng, thơm ngậy', 279000, '67f208c5b4fdb.png', 'active'),
(16, 2, 'Bít tết sốt BBQ', 'Bò Mỹ tẩm sốt BBQ, nướng lửa lớn', 259000, '67f208ff60f8a.png', 'active'),
(17, 2, 'Mỳ Ý sốt bò bằm', 'Spaghetti bò bằm, sốt cà chua', 149000, '67f209f6011df.png', 'active'),
(18, 2, 'Mỳ Ý Carbonara', 'Spaghetti sốt kem trứng, bacon', 159000, '67f20a32599cd.png', 'active'),
(19, 2, 'Mỳ Ý hải sản', 'Spaghetti hải sản, sốt tỏi ớt', 179000, '67f20a91bc410.png', 'active'),
(20, 2, 'Mỳ Ý sốt pesto', 'Mỳ Ý sốt húng quế xanh', 159000, '67f20abb440b1.png', 'active'),
(21, 2, 'Mỳ Ý sốt nấm truffle', 'Sốt kem nấm truffle, phô mai', 199000, '67f20adfb6146.png', 'active'),
(22, 2, 'Mỳ Ý bò Wagyu', 'Bò Wagyu lát mỏng, sốt vang đỏ', 249000, '67f20b1a5da43.png', 'active'),
(23, 2, 'Caesar Salad', 'Salad xà lách, gà nướng, phô mai', 129000, '67f20b5da9f24.png', 'active'),
(24, 2, 'Salad cá ngừ', 'Cá ngừ tươi, sốt mè rang', 149000, '67f20c22120e7.png', 'active'),
(25, 2, 'Salad Hy Lạp', 'Cà chua, olive, feta cheese', 139000, '67f20c9a56dcf.png', 'active'),
(26, 2, 'Salad bò nướng', 'Bò nướng tái, rau rocket', 189000, '67f20ccdd3915.png', 'active'),
(27, 1, 'Súp hành kiểu Pháp', 'Hành tây hầm phô mai, đậm đà', 89000, '67f202d19c3f1.png', 'active'),
(28, 1, 'Bánh mì bơ tỏi', 'Bánh mì giòn, sốt bơ tỏi', 49000, '67f203479d639.png', 'active'),
(29, 1, 'Cánh gà sốt mật ong', 'Cánh gà chiên giòn, sốt mật ong', 129000, '67f2038115d76.png', 'active'),
(30, 1, 'Súp khoai tây bacon', 'Khoai tây nghiền, bacon chiên', 99000, '67f203c378fd7.png', 'active'),
(31, 1, 'Phô mai que', 'Mozzarella chiên giòn, sốt cà', 89000, '67f204142589e.png', 'active'),
(32, 1, 'Khoai tây chiên', 'Khoai tây vàng giòn, sốt phô mai', 79000, '67f2046cb0fae.png', 'active'),
(33, 1, 'Chả giò bò', 'Chả giò nhân bò, sốt tương đặc biệt', 99000, '67f204afb109e.png', 'active'),
(34, 1, 'Gỏi cá hồi', 'Cá hồi tươi, sốt chanh dây', 159000, '67f204f3eb62f.png', 'active'),
(35, 1, 'Hàu nướng phô mai', 'Hàu tươi, phô mai tan chảy', 179000, '67f20525dbdf1.png', 'active'),
(36, 3, 'Bánh Tiramisu', 'Bánh Ý, kem mascarpone', 99000, '67fce5144e5c1.jpg', 'active'),
(37, 3, 'Cheesecake dâu', 'Cheesecake dâu tây tươi', 109000, '67fce534e755c.jpg', 'active'),
(38, 3, 'Bánh Lava Chocolate', 'Chocolate tan chảy', 129000, '67fcef93e4093.png', 'active'),
(39, 3, 'Panna Cotta', 'Thạch sữa Ý, sốt trái cây', 99000, '67fcefbc3d01c.png', 'active'),
(40, 3, 'Kem Gelato Ý', 'Kem Ý hương vị đặc biệt', 79000, '67fcf00f8bb81.png', 'active'),
(41, 3, 'Bánh flan caramel', 'Flan mềm, sốt caramel', 79000, '67fcf03ce6ceb.png', 'active'),
(42, 3, 'Chè khúc bạch', 'Chè thạch hạnh nhân, trái cây', 89000, '67fcf172a6444.png', 'active'),
(43, 3, 'Mousse matcha', 'Mousse trà xanh, kem tươi', 109000, '67fcf1a7c15b5.jpg', 'active'),
(44, 3, 'Bánh macaron', 'Bánh macaron nhiều màu sắc', 119000, '67fcf1d4ba758.jpg', 'active'),
(45, 4, 'Trà đào cam sả', 'Trà đào cam sả tươi mát', 69000, '67fcf21eb8108.png', 'active'),
(46, 4, 'Nước ép dưa hấu', 'Dưa hấu ép nguyên chất', 59000, '67fcf246621b4.jpg', 'active'),
(47, 4, 'Nước ép táo', 'Nước ép táo tươi', 59000, '67fcf279b5e98.png', 'active'),
(48, 4, 'Cà phê sữa đá', 'Cà phê Việt Nam, sữa đặc', 49000, '67fcf29700e11.jpg', 'active'),
(49, 4, 'Latte macchiato', 'Cà phê sữa Ý, béo ngậy', 79000, '67fcf2b613bd1.png', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_ingredients`
--

CREATE TABLE `menu_item_ingredients` (
  `id` int(11) NOT NULL,
  `menu_item_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_item_ingredients`
--

INSERT INTO `menu_item_ingredients` (`id`, `menu_item_id`, `ingredient_id`, `quantity`) VALUES
(95, 1, 1, 0.5),
(186, 27, 2, 0.3),
(232, 23, 29, 0.2),
(233, 23, 30, 0.15),
(234, 23, 9, 0.05),
(235, 24, 31, 0.15),
(236, 24, 29, 0.2),
(237, 24, 32, 0.05),
(238, 25, 33, 0.1),
(239, 25, 34, 0.05),
(240, 25, 35, 0.05),
(241, 26, 3, 0.2),
(242, 26, 29, 0.15),
(243, 49, 27, 0.05),
(244, 49, 28, 0.1),
(290, 28, 3, 0.05),
(291, 28, 4, 0.01),
(335, 29, 5, 0.5),
(336, 29, 6, 0.03),
(337, 30, 7, 0.4),
(338, 30, 8, 0.05),
(339, 31, 9, 0.06),
(340, 31, 10, 0.02),
(345, 32, 7, 0.3),
(346, 32, 12, 0.05),
(347, 2, 13, 0.2),
(348, 5, 13, 0.2),
(349, 6, 13, 0.3),
(350, 7, 13, 0.3),
(351, 8, 13, 0.25),
(352, 9, 13, 0.5),
(353, 10, 13, 0.25),
(354, 11, 13, 0.25),
(355, 12, 13, 0.2),
(356, 13, 13, 0.2),
(357, 14, 13, 0.25),
(358, 15, 13, 0.25),
(359, 16, 13, 0.2),
(360, 34, 14, 0.2),
(361, 35, 15, 0.3),
(362, 35, 9, 0.05),
(363, 17, 16, 0.1),
(364, 17, 17, 0.05),
(365, 18, 16, 0.1),
(366, 18, 18, 1),
(367, 19, 16, 0.1),
(368, 20, 16, 0.1),
(369, 21, 16, 0.1),
(370, 22, 16, 0.1),
(371, 22, 13, 0.1),
(372, 3, 19, 1),
(373, 36, 20, 1),
(374, 37, 21, 1),
(375, 38, 22, 1),
(376, 39, 23, 1),
(377, 4, 24, 0.25),
(378, 45, 25, 0.25),
(379, 46, 26, 0.25),
(380, 48, 27, 0.01),
(381, 48, 28, 0.02);

-- --------------------------------------------------------

--
-- Table structure for table `menu_reviews`
--

CREATE TABLE `menu_reviews` (
  `id` int(11) NOT NULL,
  `menu_item_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_reviews`
--

INSERT INTO `menu_reviews` (`id`, `menu_item_id`, `user_id`, `rating`, `comment`, `created_at`) VALUES
(1, 1, '1', 5, 'Súp rất ngon, béo và thơm!', '2025-03-16 05:07:56'),
(2, 2, '2', 4, 'Bò mềm nhưng hơi ít sốt', '2025-03-16 05:07:56'),
(3, 3, '3', 5, 'Bánh mousse quá tuyệt vời!', '2025-03-16 05:07:56'),
(4, 4, '4', 3, 'Nước cam hơi chua nhưng vẫn ổn', '2025-03-16 05:07:56'),
(5, 1, '1', 5, 'Súp rất ngon, béo và thơm!', '2025-03-16 18:02:43'),
(6, 2, '2', 4, 'Bò mềm nhưng hơi ít sốt', '2025-03-16 18:02:43'),
(7, 3, '3', 5, 'Bánh mousse quá tuyệt vời!', '2025-03-16 18:02:43'),
(8, 4, '4', 3, 'Nước cam hơi chua nhưng vẫn ổn', '2025-03-16 18:02:43'),
(9, 3, '0', 5, 'ngon', '2025-03-23 05:33:54'),
(10, 2, '0', 5, 'ngon vc', '2025-03-24 01:50:20'),
(14, 28, 'user_67e19533ca19d9.53005307', 5, 'Hmmmm', '2025-03-25 03:04:23'),
(15, 1, 'user_67e19533ca19d9.53005307', 5, 'Hmmm', '2025-03-25 03:07:58');

-- --------------------------------------------------------

--
-- Table structure for table `ordered`
--

CREATE TABLE `ordered` (
  `id` int(11) NOT NULL,
  `idUser` varchar(255) NOT NULL,
  `voucher` varchar(50) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `shipCost` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `status` enum('Chờ xác nhận','Đang chuẩn bị','Đang giao','Hoàn thành','Đã hủy') DEFAULT 'Chờ xác nhận',
  `note` varchar(255) NOT NULL,
  `e_wallet` varchar(50) DEFAULT NULL,
  `reasonRefused` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordered`
--

INSERT INTO `ordered` (`id`, `idUser`, `voucher`, `quantity`, `shipCost`, `total`, `createdAt`, `status`, `note`, `e_wallet`, `reasonRefused`) VALUES
(32, 'user_67e19533ca19d9.53005307', NULL, 1, 23072, 72072, '2025-03-31 06:59:52', 'Đã hủy', '', NULL, 'Quán chưa mở cửa'),
(33, 'user_67e19533ca19d9.53005307', 'DISCOUNT50', 2, 23072, 151072, '2025-03-31 07:05:24', 'Hoàn thành', '', NULL, NULL),
(59, 'user_67e19533ca19d9.53005307', NULL, 2, 23072, 121072, '2025-03-31 21:51:29', 'Hoàn thành', '\n                        ', 'Đã thanh toán', NULL),
(61, 'user_67e19533ca19d9.53005307', NULL, 2, 23072, 551072, '2025-04-01 00:16:28', 'Hoàn thành', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(11) NOT NULL,
  `order_date` date NOT NULL DEFAULT curdate(),
  `total_amount` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `order_date`, `total_amount`, `status`, `code`) VALUES
(6, '2025-03-31', 19175000, 'Đã nhận hàng', 'ljs46GWPSU'),
(7, '2025-03-31', 625000, 'Đã nhận hàng', 'ljsMEPRWCZ');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_details`
--

CREATE TABLE `purchase_order_details` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_order_details`
--

INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `ingredient_id`, `quantity`, `price`, `expiry_date`) VALUES
(81, 6, 1, 5, 25000, NULL),
(82, 6, 2, 5, 30000, NULL),
(83, 6, 3, 2, 320000, NULL),
(84, 6, 4, 5, 100000, NULL),
(85, 6, 5, 10, 80000, NULL),
(86, 6, 6, 2, 150000, NULL),
(87, 6, 7, 5, 25000, NULL),
(88, 6, 8, 10, 180000, NULL),
(89, 6, 9, 2, 220000, NULL),
(90, 6, 10, 4, 40000, NULL),
(91, 6, 12, 2, 40000, NULL),
(92, 6, 13, 10, 320000, NULL),
(93, 6, 14, 10, 450000, NULL),
(94, 6, 15, 5, 120000, NULL),
(95, 6, 16, 5, 70000, NULL),
(96, 6, 17, 5, 50000, NULL),
(97, 6, 18, 20, 5000, NULL),
(98, 6, 19, 5, 50000, NULL),
(99, 6, 20, 5, 60000, NULL),
(100, 6, 21, 5, 55000, NULL),
(101, 6, 22, 5, 70000, NULL),
(102, 6, 23, 5, 45000, NULL),
(103, 6, 24, 3, 40000, NULL),
(104, 6, 25, 3, 45000, NULL),
(105, 6, 26, 3, 35000, NULL),
(106, 6, 27, 2, 200000, NULL),
(107, 6, 28, 1, 30000, NULL),
(108, 6, 29, 5, 20000, NULL),
(109, 6, 30, 5, 90000, NULL),
(110, 6, 31, 5, 250000, NULL),
(111, 6, 32, 3, 50000, NULL),
(112, 6, 33, 5, 35000, NULL),
(113, 6, 34, 3, 80000, NULL),
(114, 6, 35, 2, 250000, NULL),
(115, 7, 1, 5, 25000, NULL),
(116, 7, 4, 5, 100000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `Id` int(11) NOT NULL,
  `roleName` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`Id`, `roleName`, `description`) VALUES
(1, 'Admin', 'Quản trị viên hệ thống'),
(2, 'User', 'Người dùng thông thường');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` int(11) NOT NULL,
  `table_number` int(11) NOT NULL,
  `status` enum('trong','co_khach','khoa') DEFAULT 'trong'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `table_number`, `status`) VALUES
(1, 1, 'trong'),
(2, 2, 'trong'),
(3, 3, 'trong'),
(4, 4, 'trong'),
(5, 5, 'trong'),
(6, 6, 'trong'),
(7, 7, 'trong'),
(8, 8, 'trong'),
(9, 9, 'trong'),
(10, 10, 'trong'),
(11, 11, 'trong'),
(12, 12, 'trong'),
(13, 13, 'trong'),
(14, 14, 'trong'),
(15, 15, 'trong'),
(16, 16, 'trong'),
(17, 17, 'trong'),
(18, 18, 'trong'),
(19, 19, 'trong'),
(20, 20, 'trong');

-- --------------------------------------------------------

--
-- Table structure for table `table_orders`
--

CREATE TABLE `table_orders` (
  `id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  `status` enum('dang_phuc_vu','da_thanh_toan') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin_id` varchar(255) DEFAULT NULL,
  `voucher` varchar(255) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_orders`
--

INSERT INTO `table_orders` (`id`, `table_id`, `status`, `created_at`, `admin_id`, `voucher`, `total_price`) VALUES
(42, 7, 'da_thanh_toan', '2025-03-27 16:15:24', 'user_67d64fcc01a440.12836174', 'DISCOUNT50', 337000),
(44, 13, 'da_thanh_toan', '2025-03-27 16:19:47', 'user_67d64fcc01a440.12836174', 'DISCOUNT50', 79000),
(46, 8, 'da_thanh_toan', '2025-03-27 16:56:09', 'user_67d64fcc01a440.12836174', 'DISCOUNT50', 228000),
(52, 6, 'da_thanh_toan', '2025-03-28 16:25:02', 'user_67d64fcc01a440.12836174', 'discount50', 378000),
(53, 7, 'da_thanh_toan', '2025-03-28 16:26:20', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 98000),
(56, 6, 'da_thanh_toan', '2025-03-28 16:33:54', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 129000),
(57, 10, 'da_thanh_toan', '2025-03-28 16:34:25', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 588000),
(58, 10, 'da_thanh_toan', '2025-03-28 16:38:13', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 49000),
(59, 9, 'da_thanh_toan', '2025-03-28 16:40:35', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 237000),
(60, 9, 'da_thanh_toan', '2025-03-28 17:08:28', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 98000),
(61, 9, 'da_thanh_toan', '2025-03-28 17:10:25', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 288000),
(62, 10, 'da_thanh_toan', '2025-03-28 17:13:29', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 148000),
(63, 14, 'da_thanh_toan', '2025-03-28 17:13:43', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 178000),
(64, 10, 'da_thanh_toan', '2025-03-28 17:15:58', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 248000),
(65, 3, 'da_thanh_toan', '2025-03-28 17:21:59', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 178000),
(66, 6, 'da_thanh_toan', '2025-03-31 09:09:57', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 188000),
(67, 9, 'da_thanh_toan', '2025-03-31 09:14:11', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 188000),
(68, 9, 'da_thanh_toan', '2025-03-31 09:18:31', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 188000),
(69, 7, 'da_thanh_toan', '2025-03-31 09:22:28', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 168000),
(70, 9, 'da_thanh_toan', '2025-03-31 12:35:21', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 248000),
(71, 4, 'da_thanh_toan', '2025-03-31 12:36:20', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 228000),
(72, 4, 'da_thanh_toan', '2025-03-31 12:38:24', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 138000),
(73, 11, 'da_thanh_toan', '2025-03-31 12:47:51', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 138000),
(74, 16, 'da_thanh_toan', '2025-03-31 12:52:05', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 218000),
(75, 13, 'da_thanh_toan', '2025-03-31 12:55:26', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 98000),
(76, 11, 'da_thanh_toan', '2025-03-31 12:57:53', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 98000),
(77, 15, 'da_thanh_toan', '2025-03-31 12:59:43', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 98000),
(78, 19, 'da_thanh_toan', '2025-03-31 13:04:57', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 98000),
(79, 6, 'da_thanh_toan', '2025-03-31 13:08:08', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 98000),
(80, 10, 'da_thanh_toan', '2025-03-31 13:09:59', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 98000),
(81, 11, 'da_thanh_toan', '2025-03-31 13:10:45', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 98000),
(82, 3, 'da_thanh_toan', '2025-03-31 14:14:02', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 98000),
(83, 1, 'da_thanh_toan', '2025-04-01 02:02:49', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 1341000),
(84, 10, 'da_thanh_toan', '2025-04-01 06:04:05', 'user_67d64fcc01a440.12836174', 'DISCOUNT50', 1473000),
(85, 13, 'da_thanh_toan', '2025-04-01 06:07:11', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 1624000),
(86, 16, 'da_thanh_toan', '2025-04-01 06:07:42', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 98000),
(87, 17, 'da_thanh_toan', '2025-04-01 06:10:59', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 2130000),
(88, 18, 'da_thanh_toan', '2025-04-01 06:13:18', 'user_67d64fcc01a440.12836174', 'Không áp dụng', 835000),
(89, 15, 'da_thanh_toan', '2025-04-01 06:15:02', 'user_67d64fcc01a440.12836174', 'DISCOUNT50', 1033000);

-- --------------------------------------------------------

--
-- Table structure for table `table_orders_detail`
--

CREATE TABLE `table_orders_detail` (
  `id` int(11) NOT NULL,
  `id_table_order` int(11) NOT NULL,
  `id_table` int(11) NOT NULL,
  `menu_item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_orders_detail`
--

INSERT INTO `table_orders_detail` (`id`, `id_table_order`, `id_table`, `menu_item_id`, `quantity`, `note`) VALUES
(87, 42, 7, 18, 1, ''),
(88, 42, 7, 29, 1, ''),
(89, 42, 7, 30, 1, ''),
(91, 44, 13, 29, 1, ''),
(94, 46, 8, 30, 1, ''),
(95, 46, 8, 35, 1, ''),
(104, 52, 6, 6, 1, ''),
(105, 52, 6, 30, 1, ''),
(106, 53, 7, 28, 2, ''),
(110, 56, 6, 29, 1, ''),
(111, 57, 10, 7, 1, ''),
(112, 57, 10, 31, 1, ''),
(113, 58, 10, 28, 1, ''),
(114, 59, 9, 1, 1, ''),
(115, 59, 9, 30, 1, ''),
(116, 59, 9, 31, 1, ''),
(117, 60, 9, 1, 1, ''),
(118, 60, 9, 28, 1, ''),
(119, 61, 9, 2, 1, ''),
(120, 61, 9, 27, 1, ''),
(121, 62, 10, 28, 1, ''),
(122, 62, 10, 30, 1, ''),
(123, 63, 14, 27, 1, ''),
(124, 63, 14, 31, 1, ''),
(125, 64, 10, 2, 1, ''),
(126, 64, 10, 28, 1, ''),
(127, 65, 3, 27, 1, ''),
(128, 65, 3, 27, 1, ''),
(129, 65, 3, 27, 1, ''),
(130, 65, 3, 31, 1, ''),
(131, 66, 6, 30, 1, ''),
(132, 66, 6, 31, 1, ''),
(133, 67, 9, 30, 1, ''),
(134, 67, 9, 31, 1, ''),
(135, 68, 9, 30, 1, ''),
(136, 68, 9, 31, 1, ''),
(137, 69, 7, 31, 1, ''),
(138, 69, 7, 32, 1, ''),
(139, 70, 9, 1, 1, ''),
(140, 70, 9, 2, 1, ''),
(141, 71, 4, 29, 1, ''),
(142, 71, 4, 30, 1, ''),
(143, 72, 4, 1, 1, ''),
(144, 72, 4, 31, 1, ''),
(145, 72, 4, 1, 1, ''),
(146, 72, 4, 31, 1, ''),
(147, 73, 11, 1, 1, ''),
(148, 73, 11, 31, 1, ''),
(149, 74, 16, 29, 1, ''),
(150, 74, 16, 31, 1, ''),
(151, 75, 13, 1, 2, ''),
(152, 76, 11, 1, 2, ''),
(153, 77, 15, 1, 2, ''),
(154, 78, 19, 1, 2, ''),
(155, 79, 6, 1, 2, ''),
(156, 80, 10, 1, 2, ''),
(157, 81, 11, 1, 2, ''),
(158, 82, 3, 1, 2, ''),
(159, 83, 1, 1, 1, ''),
(160, 83, 1, 10, 1, ''),
(161, 83, 1, 16, 1, ''),
(162, 83, 1, 22, 1, ''),
(163, 83, 1, 27, 1, ''),
(164, 83, 1, 31, 1, ''),
(165, 83, 1, 39, 1, ''),
(166, 83, 1, 45, 1, ''),
(167, 83, 1, 46, 1, ''),
(168, 84, 10, 9, 1, ''),
(169, 84, 10, 18, 1, ''),
(170, 84, 10, 20, 1, ''),
(171, 84, 10, 21, 1, ''),
(172, 84, 10, 45, 1, ''),
(173, 84, 10, 46, 1, ''),
(174, 84, 10, 49, 1, ''),
(175, 85, 13, 9, 1, ''),
(176, 85, 13, 12, 1, ''),
(177, 85, 13, 17, 1, ''),
(178, 85, 13, 18, 1, ''),
(179, 85, 13, 19, 1, ''),
(180, 85, 13, 41, 1, ''),
(181, 86, 16, 1, 2, ''),
(182, 87, 17, 2, 1, ''),
(183, 87, 17, 6, 1, ''),
(184, 87, 17, 7, 2, ''),
(185, 87, 17, 32, 1, ''),
(186, 87, 17, 35, 1, ''),
(187, 87, 17, 41, 1, ''),
(188, 87, 17, 43, 1, ''),
(189, 87, 17, 49, 2, ''),
(190, 88, 18, 2, 1, ''),
(191, 88, 18, 11, 1, ''),
(192, 88, 18, 22, 1, ''),
(193, 88, 18, 46, 2, ''),
(194, 89, 15, 8, 1, ''),
(195, 89, 15, 21, 2, ''),
(196, 89, 15, 33, 1, ''),
(197, 89, 15, 34, 1, ''),
(198, 89, 15, 45, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `KeyValue` varchar(255) NOT NULL,
  `birthDate` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roleId` int(11) NOT NULL,
  `houseNumber` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `ward` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`KeyValue`, `birthDate`, `email`, `fullName`, `gender`, `phoneNumber`, `password`, `roleId`, `houseNumber`, `street`, `ward`, `district`, `city`) VALUES
('user_67d64fcc01a440.12836174', '2003-05-13', 'adminthanhhao@gmail.com', 'Thanh Hao', 'male', '0987654321', '$2y$10$xjay4sp4NdE/rHveBt3YrOvs04zz4GjzWZh9D.nPPK68zubFpfTmS', 1, '12/9D Khu phố Hòa Long', 'Lái Thiêu 96', 'Lái Thiêu', 'Thuận An', 'Bình Dương'),
('user_67d64fcc01a440.52374620', '2000-01-01', 'Hao@gmail.com', 'Hào Thanh', 'male', '0123456789', '123456', 1, '', '', '', '', ''),
('user_67e117694b75d7.14971447', '2003-03-03', 'dsafasd@gmail.com', 'Gia Khanh', 'male', '0123421212', '123456', 2, '10/1A Khu phố Hòa Long', '30 tháng 4', 'Hòa Cường Bắc', 'Hải Châu', 'Đà nẵng'),
('user_67e19533ca19d9.53005307', '2003-10-04', 'qcnncc@gmail.com', 'Quang Cuong', 'male', '0868675411', '$2y$10$PQthknV08BJzxKQCiZRsweYP29lUGM9FkW/Mp44WmR.Vrm.jjy7XW', 2, '10/1A ', 'Bình Chuẩn 18', 'Bình Chuẩn', 'Thuận An', 'Bình Dương'),
('user_67f0a714bc3c60.00550085', '2003-12-03', 'khanhdzlikeme@gmail.com', 'Khanhs', 'male', '0399378204', '123456', 1, 'gadfa', 'dfadfad', 'dâfas', 'sadfadf', 'adfadsfa'),
('user_67f0ab2da00998.88297700', '2003-03-14', '1234@gmail.com', 'fadfa', 'male', '2323232323', '$2y$10$CqHqgeP5JUXlDq9zBf3S7.j3.pxBCzz2T3qrKbPJU.MnoeL1psrTi', 1, 'd1d', 'jkh', 'kjhkj', 'kjkj', 'kjhkjh'),
('user_67fcf3bdc01381.26118827', '2000-12-12', '2312312312@gmail.com', 'fadfa', 'male', '4444444444', '$2y$10$0hUJq/gpcoazX7fcL/OlPeYnyq/CoMIrrypKyKbXeLaQwn5sWMJNy', 2, '123123', '21221', '23231', '31231231', 'BInhDuong');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `KeyValue` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `expired_at` datetime NOT NULL,
  `usage_limit` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `usage_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`KeyValue`, `created_at`, `expired_at`, `usage_limit`, `usage_count`, `discount_amount`) VALUES
('DISCOUNT50', '2025-03-25 10:30:52', '2025-04-18 23:59:59', 15, 13, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `voucherused`
--

CREATE TABLE `voucherused` (
  `id` int(11) NOT NULL,
  `idUser` varchar(255) NOT NULL,
  `voucher_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voucherused`
--

INSERT INTO `voucherused` (`id`, `idUser`, `voucher_id`) VALUES
(8, 'user_67e19533ca19d9.53005307', 'DISCOUNT50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked`
--
ALTER TABLE `booked`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detailordered`
--
ALTER TABLE `detailordered`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idOrdered` (`idOrdered`),
  ADD KEY `idItem` (`idItem`);

--
-- Indexes for table `discarded_items`
--
ALTER TABLE `discarded_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `inventory_details`
--
ALTER TABLE `inventory_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredient_id` (`ingredient_id`),
  ADD KEY `fk_inventory_purchase` (`purchase_order_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `menu_item_ingredients`
--
ALTER TABLE `menu_item_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_item_id` (`menu_item_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `menu_reviews`
--
ALTER TABLE `menu_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_item_id` (`menu_item_id`);

--
-- Indexes for table `ordered`
--
ALTER TABLE `ordered`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `fk_ordered_voucher` (`voucher`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredient_id` (`ingredient_id`),
  ADD KEY `purchase_order_details_ibfk_1` (`purchase_order_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `table_number` (`table_number`);

--
-- Indexes for table `table_orders`
--
ALTER TABLE `table_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_orders_detail`
--
ALTER TABLE `table_orders_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_table_order` (`id_table_order`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`KeyValue`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `roleId` (`roleId`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`KeyValue`);

--
-- Indexes for table `voucherused`
--
ALTER TABLE `voucherused`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `voucher_id` (`voucher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booked`
--
ALTER TABLE `booked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detailordered`
--
ALTER TABLE `detailordered`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `discarded_items`
--
ALTER TABLE `discarded_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `inventory_details`
--
ALTER TABLE `inventory_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `menu_item_ingredients`
--
ALTER TABLE `menu_item_ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=382;

--
-- AUTO_INCREMENT for table `menu_reviews`
--
ALTER TABLE `menu_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ordered`
--
ALTER TABLE `ordered`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `table_orders`
--
ALTER TABLE `table_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `table_orders_detail`
--
ALTER TABLE `table_orders_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `voucherused`
--
ALTER TABLE `voucherused`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booked`
--
ALTER TABLE `booked`
  ADD CONSTRAINT `booked_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`KeyValue`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`KeyValue`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `detailordered`
--
ALTER TABLE `detailordered`
  ADD CONSTRAINT `detailordered_ibfk_1` FOREIGN KEY (`idOrdered`) REFERENCES `ordered` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detailordered_ibfk_2` FOREIGN KEY (`idItem`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discarded_items`
--
ALTER TABLE `discarded_items`
  ADD CONSTRAINT `discarded_items_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_details`
--
ALTER TABLE `inventory_details`
  ADD CONSTRAINT `fk_inventory_purchase` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventory_details_ibfk_1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_item_ingredients`
--
ALTER TABLE `menu_item_ingredients`
  ADD CONSTRAINT `menu_item_ingredients_ibfk_1` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_item_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_reviews`
--
ALTER TABLE `menu_reviews`
  ADD CONSTRAINT `menu_reviews_ibfk_1` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ordered`
--
ALTER TABLE `ordered`
  ADD CONSTRAINT `fk_ordered_voucher` FOREIGN KEY (`voucher`) REFERENCES `voucher` (`KeyValue`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `ordered_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`KeyValue`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD CONSTRAINT `purchase_order_details_ibfk_1` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `table_orders_detail`
--
ALTER TABLE `table_orders_detail`
  ADD CONSTRAINT `table_orders_detail_ibfk_1` FOREIGN KEY (`id_table_order`) REFERENCES `table_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`Id`);

--
-- Constraints for table `voucherused`
--
ALTER TABLE `voucherused`
  ADD CONSTRAINT `voucherused_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`KeyValue`),
  ADD CONSTRAINT `voucherused_ibfk_2` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`KeyValue`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

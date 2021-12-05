-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 08, 2020 lúc 01:14 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mock_project`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bus`
--

CREATE TABLE `bus` (
  `Id` int(11) NOT NULL,
  `name_bus` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `road` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bus`
--

INSERT INTO `bus` (`Id`, `name_bus`, `road`) VALUES
(1, 'Ligtning', 'Ha Noi - Hai Phong'),
(2, 'Thu Ky', 'Sai Gon - Cu Jut'),
(3, 'Hoang Long', 'Gia Nghia - Ca Mau'),
(4, 'Quoc Dat', 'Phu Yen - Sai Gon');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticket`
--

CREATE TABLE `ticket` (
  `Id` int(11) NOT NULL,
  `Id_user` int(11) DEFAULT 0,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Id_bus` int(11) NOT NULL,
  `seat` int(2) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `ticket`
--

INSERT INTO `ticket` (`Id`, `Id_user`, `name`, `Id_bus`, `seat`, `price`, `status`, `date`, `time`) VALUES
(101, 3, 'Lonely Star 12', 1, 1, 1, 1, '2020-04-08', '14:00:00'),
(102, 3, '', 1, 2, 123123, 0, '2020-04-07', '15:00:00'),
(103, 4, 'Douglas', 1, 3, 123123, 1, '2020-04-08', '15:00:00'),
(104, 3, NULL, 1, 4, 123123, 0, '2020-04-08', '15:00:00'),
(105, 4, 'Douglas', 1, 5, 123123, 1, '2020-04-08', '15:00:00'),
(106, 3, NULL, 1, 7, 123123, 0, '2020-04-08', '15:00:00'),
(107, 3, NULL, 1, 8, 123123, 0, '2020-04-08', '15:00:00'),
(108, 3, NULL, 1, 9, 123123, 0, '2020-04-08', '15:00:00'),
(109, 3, NULL, 1, 10, 123123, 0, '2020-04-08', '15:00:00'),
(110, 3, NULL, 1, 11, 123123, 0, '2020-04-08', '15:00:00'),
(111, 3, NULL, 1, 12, 123123, 0, '2020-04-08', '15:00:00'),
(112, 3, NULL, 1, 13, 123123, 0, '2020-04-08', '15:00:00'),
(113, 3, NULL, 1, 14, 123123, 0, '2020-04-08', '15:00:00'),
(114, 3, NULL, 1, 15, 123123, 0, '2020-04-08', '15:00:00'),
(115, 3, NULL, 1, 16, 123123, 0, '2020-04-08', '15:00:00'),
(116, 3, NULL, 1, 17, 123123, 0, '2020-04-08', '15:00:00'),
(117, 3, 'Cuong', 1, 18, 123123, 0, '2020-04-06', '15:00:00'),
(118, 5, 'Denesik', 2, 2, 123123, 1, '2020-04-08', '15:00:00'),
(119, 3, '', 2, 2, 123123, 0, '2020-04-08', '15:00:00'),
(120, 3, '', 2, 3, 123123, 0, '2020-04-08', '15:00:00'),
(121, 5, 'Denesik', 2, 4, 123123, 1, '2020-04-08', '15:00:00'),
(122, 3, '', 2, 5, 123123, 0, '2020-04-08', '15:00:00'),
(123, 3, '', 2, 6, 123123, 0, '2020-04-08', '15:00:00'),
(124, 3, '', 2, 7, 123123, 0, '2020-04-08', '15:00:00'),
(125, 3, '', 2, 8, 123123, 0, '2020-04-08', '15:00:00'),
(126, 3, '', 2, 9, 123123, 0, '2020-04-08', '15:00:00'),
(127, 3, '', 2, 10, 123123, 0, '2020-04-08', '15:00:00'),
(128, 3, '', 2, 11, 123123, 0, '2020-04-08', '15:00:00'),
(129, 3, '', 2, 12, 123123, 0, '2020-04-08', '15:00:00'),
(130, 3, '', 2, 13, 123123, 0, '2020-04-08', '15:00:00'),
(131, 3, '', 2, 3, 123123, 0, '2020-04-08', '15:00:00'),
(132, 3, '', 2, 14, 123123, 0, '2020-04-08', '15:00:00'),
(133, 3, '', 2, 15, 123123, 0, '2020-04-08', '15:00:00'),
(134, 3, '', 2, 16, 123123, 0, '2020-04-08', '15:00:00'),
(135, 3, '', 2, 17, 123123, 0, '2020-04-08', '15:00:00'),
(136, 3, '', 2, 18, 123123, 0, '2020-04-08', '15:00:00'),
(137, 3, '', 2, 19, 123123, 0, '2020-04-08', '15:00:00'),
(138, 3, '', 1, 1, 123123123, 0, '2020-04-08', '14:00:00'),
(139, 6, 'Rempel', 3, 3, 123123123, 1, '2020-04-08', '08:00:00'),
(140, 3, '', 3, 4, 123123123, 0, '2020-04-08', '08:00:00'),
(141, 3, '', 3, 5, 123123123, 0, '2020-04-08', '08:00:00'),
(142, 6, 'Rempel', 3, 6, 123123123, 1, '2020-04-08', '08:00:00'),
(143, 3, '', 3, 7, 123123123, 0, '2020-04-08', '08:00:00'),
(144, 3, '', 3, 8, 123123123, 0, '2020-04-08', '08:00:00'),
(145, 3, '', 3, 9, 123123123, 0, '2020-04-08', '08:00:00'),
(146, 3, '', 3, 10, 123123123, 0, '2020-04-08', '08:00:00'),
(147, 3, '', 3, 11, 123123123, 0, '2020-04-08', '08:00:00'),
(148, 3, '', 3, 12, 123123123, 0, '2020-04-08', '08:00:00'),
(149, 3, '', 3, 13, 123123123, 0, '2020-04-08', '08:00:00'),
(150, 14, '', 3, 14, 123123123, 0, '2020-04-07', '08:00:00'),
(151, 3, '', 3, 15, 123123123, 0, '2020-04-08', '08:00:00'),
(152, 3, '', 3, 16, 123123123, 0, '2020-04-08', '08:00:00'),
(153, 7, 'Klocko', 4, 1, 123123123, 1, '2020-04-08', '06:00:00'),
(154, 3, '', 4, 2, 123123123, 0, '2020-04-08', '06:00:00'),
(155, 7, 'Klocko', 4, 3, 123123123, 1, '2020-04-07', '06:00:00'),
(156, 3, '', 4, 4, 123123123, 0, '2020-04-08', '06:00:00'),
(157, 3, '', 4, 5, 123123123, 0, '2020-04-08', '06:00:00'),
(158, 3, '', 4, 6, 123123123, 0, '2020-04-08', '06:00:00'),
(159, 3, '', 4, 7, 123123123, 0, '2020-04-08', '06:00:00'),
(160, 3, '', 4, 8, 123123123, 0, '2020-04-08', '06:00:00'),
(161, 3, '', 4, 9, 123123123, 0, '2020-04-08', '06:00:00'),
(162, 3, '', 4, 10, 123123123, 0, '2020-04-08', '06:00:00'),
(163, 3, '', 4, 11, 123123123, 0, '2020-04-08', '06:00:00'),
(164, 3, '', 4, 12, 123123123, 0, '2020-04-08', '06:00:00'),
(165, 3, '', 4, 13, 123123123, 0, '2020-04-08', '06:00:00'),
(166, 3, '', 4, 14, 123123123, 0, '2020-04-08', '06:00:00'),
(167, 3, '', 4, 15, 123123123, 0, '2020-04-08', '06:00:00'),
(168, 3, '', 4, 16, 123123123, 0, '2020-04-08', '06:00:00'),
(169, 3, '', 4, 17, 123123123, 0, '2020-04-08', '06:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `name_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cmnd` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`Id`, `name_user`, `email`, `username`, `password`, `phone`, `cmnd`, `role`) VALUES
(1, 'TicketSeller', 'abc@gmail.com', 'ticket', '123', '0361234567', '123456789', 1),
(2, 'admin', 'admin@gmail.com', 'admin', '123', '0361234567', '123456789', 2),
(3, 'Lonely Star 12', 'abccc123@gmail.com', 'cus', '123', '4564564561', '456456456', 0),
(4, 'Douglas', 'hamill.maya@example.com', 'gruecker', '123', '276.131.17', '625738507', 0),
(5, 'Denesik', 'crystel.bahringer@example.com', 'qwalker', '123', '(106)578-1', '633294988', 0),
(6, 'Rempel', 'lori55@example.net', 'kerluke.d\'angelo', '123', '1-285-930-', '651189990', 0),
(7, 'Klocko', 'camille.schuster@example.com', 'flossie.trantow', '123', '760-376-14', '025804720', 0),
(8, 'Orn', 'jacobs.burley@example.com', 'sawayn.kylie', '123', '172-935-99', '000252338', 0),
(9, 'Lindgren', 'vincenzo.carter@example.net', 'durgan.florida', '123', '1-116-002-', '762230334', 0),
(10, 'Russel', 'goodwin.ashley@example.net', 'wintheiser.enid', 'eda6f0ebe9452c3f80c929a80ee1f83b4aeda6cd', '424-465-94', '959747063', 0),
(11, 'Nitzsche', 'maverick.sawayn@example.org', 'enader', 'cecc5426d0b4bdbab73173cfe1c794396ceac080', '583.075.62', '659148722', 0),
(12, 'Corona', 'stone.murphy@example.com', 'cmorissette123', '123', '9041740123', '333959123', 0),
(13, 'Bednar', 'fahey.alvina@example.net', 'von.rogers', '426b8f4eb29ccedcb3d762e0074e8dce949b1b8b', '(116)471-2', '520105213', 0),
(14, 'Hilpert', 'brennon56@example.net', 'fmurphy', 'd2152d1a4d259400c8d24bf09e08160113572866', '730-245-78', '816009833', 0),
(15, 'Kovacek', 'sklocko@example.org', 'kunze.dessie', '961c512ad04b7b64704d90a89bde88d43074086e', '481.729.89', '780507973', 0),
(16, 'Gerlach', 'emilia86@example.com', 'roxane66', '316c303134e00a70f8ae908b90e9a843b72f1c8b', '783-756-21', '374618567', 0),
(17, 'Fisher', 'minerva.adams@example.net', 'kohler.zora', '22aee97933c7d3282ea91085732735cbe17f1d29', '+91(4)4341', '273781548', 0),
(18, 'Bruen', 'claire.morar@example.net', 'ida.jacobi', 'e6ead27cbd24823e5dcf6db75a8744f444f2d15d', '474-212-65', '200503629', 0),
(19, 'Nicolas', 'thiel.collin@example.net', 'tkuhlman', '6fee7dd73abc65a80f29e3db70d91dac2d4a255b', '(176)973-7', '185492326', 0),
(20, 'Crona', 'abernathy.colten@example.net', 'kobe03', 'ea79aebd77b87c9a5c1d4e9cb788550fa8aa3e1c', '934-024-91', '503644911', 0),
(21, 'Towne', 'camilla03@example.com', 'tframi', '737dfc0ae52826d112388ce7b532748446555a18', '424.336.94', '102535622', 0),
(22, 'Terry', 'conrad.maggio@example.org', 'oberbrunner.kailey', '533099cae17b694531a560bc93a8612a3df0b1c1', '817.915.71', '629465831', 0),
(23, 'Botsford', 'justyn.corwin@example.net', 'joshua.ebert', '045aaf1bbd048cea7d65c38643b4bdf521138ea1', '(388)789-8', '481899500', 0),
(24, 'Howell', 'janelle.miller@example.net', 'vnader', 'ce9bf6a03ea48bd112ec39e0f72a9b34b8868885', '373.357.63', '283842271', 0),
(25, 'Mohr', 'botsford.lee@example.net', 'heidenreich.aletha', 'fa9e3c600f033e0f63f5b0d8f5ff646abf3aa836', '513-822-51', '999301012', 0),
(26, 'Ledner', 'manley.eichmann@example.net', 'radams', 'cc3f9c8f13dd276093ab8176637a750029cc95b1', '1-444-251-', '852794891', 0),
(27, 'Leannon', 'xbashirian@example.org', 'columbus19', '054e60d84437cff53596672ad0daab9b20942b33', '+02(9)9226', '076271971', 0),
(28, 'Sawayn', 'noemi35@example.com', 'herzog.kariane', '0fbf24acab640937658ae0139711785c66f06ec7', '(383)576-0', '345466913', 0),
(29, 'Lowe', 'icarroll@example.org', 'ernie.torphy', 'c9af8b689bfb3d2078df2ab720d42eddf189ac46', '941-253-46', '364399576', 0),
(30, 'Nienow', 'adrian20@example.com', 'adelbert37', 'a8701e3349c2820dfe50304bf30de656346ce61a', '576-441-58', '184617970', 0),
(31, 'Nicolas', 'bernadine.weimann@example.org', 'meda91', '9b4d8b7d2079e79d84b3d9a294e4cafb6ea85c51', '1-607-678-', '685745141', 0),
(32, 'Bechtelar123', 'thelma.fisher@example.net', 'qrice123', 'a2b0ab7e634ba38455d2b0438bba0cd0f0ec85ac', '1234567890', '691219129', 0),
(33, 'Langosh', 'waldo54@example.org', 'kgibson', '6eb3139f7ae2fcaf109bd0b8b990a554810dd7d1', '1-885-172-', '999843236', 0),
(34, 'Moore', 'hiram19@example.com', 'igorczany', '0253c5075cf353359565c11233fb1aeb47f26da0', '(335)261-1', '150305781', 0),
(35, 'Sipes', 'tina.collier@example.com', 'kimberly37', '114c1cf19ab32da780ec792bc45f03d36fb12ba4', '1-009-168-', '387575398', 0),
(36, 'Lehner', 'clint.stamm@example.org', 'xeichmann', '75201421c3b185831e5adf14e86b494da0f2ac72', '514-022-70', '723661660', 0),
(37, 'Lesch', 'isabell35@example.net', 'tschulist', '66174d9e38254a48f26dd041b20b47c0c3c11d59', '043-029-88', '734628272', 0),
(38, 'Smitham', 'sheridan50@example.org', 'yost.bridgette', '8215fe7610418e448482683afc8fab02f2073a54', '594-518-24', '870498103', 0),
(39, 'Schmitt', 'rspinka@example.org', 'smitham.wilton', '03d39d5ac04cefc04509c69c731e6fa7ce57ca67', '+57(3)4720', '588109225', 0),
(40, 'Hilll', 'ziemann.aditya@example.com', 'goodwin.georgianna', '9f27278997ee26e713a3b2b4c2bb8b18abf21f45', '+92(8)5197', '128376035', 0),
(41, 'Thien Dia', 'abc@gmail.com', 'thiendia', '123', '1231231231', '123123123', 0),
(42, 'adsa2', 'ádasd', 'ádad', 'ádasd', 'ádasd', 'ádasd', 0),
(45, 'Troi Dat', 'abc@gmail.com', 'omg', '123', '1231231231', '123123123', 0),
(47, 'customer', 'null@gmail.com', 'test', '123', '1231231231', '123123123', 0),
(48, 'adadadad', 'asdasd@gmail.com', 'qwe', '123', '1231231231', '123123123', 0),
(49, 'adadadad123123', 'asdasd@gmail.com', 'qwe123123', '12345', '1231231231', '123123123', 0),
(50, 'adadadad123123', 'asdasd@gmail.com', 'qwe123123', '12345', '1231231231', '123123123', 0),
(51, 'Ready', 'null@gmail.com', 'none', 'none', '0000000000', '000000000', 0),
(52, 'test123', '123asd@gmail.com', 'test', '123', '1231231231', '123123123', 0),
(53, 'test123', '123asd@gmail.com', 'test', '123', '1231231231', '123123123', 0),
(54, 'testagian', 'asdasd@gmail.com', '12312', '123123', '1231231231', '123123123', 0),
(55, 'testagian', 'asdasd@gmail.com', '12312', '123123', '1231231231', '123123123', 0),
(56, 'test123', 'asdasd@gmail.com', '12312', '123123', '1231231231', '123123123', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bus`
--
ALTER TABLE `bus`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `ticket`
--
ALTER TABLE `ticket`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

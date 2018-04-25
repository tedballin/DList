-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 27, 2018 at 09:21 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DList`
--
CREATE DATABASE IF NOT EXISTS `DList` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `DList`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `physicianID` int(11) NOT NULL,
  `userFisrt` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `userLast` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `userEmail` text COLLATE utf8_unicode_ci NOT NULL,
  `ratings` int(1) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`physicianID`, `userFisrt`, `userLast`, `userEmail`, `ratings`, `comment`) VALUES
(1, 'test', 'test', 'test@email.com', 5, 'Creat doctor!');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `firstName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hashedPassword` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(3) NOT NULL,
  `gender` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`firstName`, `lastName`, `email`, `hashedPassword`, `age`, `gender`, `address`) VALUES
('test', 'test', 'test@email.com', '$2y$10$YIaRNOrMO84MnmAeGz.BlewFobu/1dNTLAaSr4xZ/l9xf0aRYm/wG', 56, 'Female', '306 hello st');

-- --------------------------------------------------------

--
-- Table structure for table `physicians`
--

CREATE TABLE `physicians` (
  `ID` int(11) NOT NULL,
  `firstName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` text COLLATE utf8_unicode_ci NOT NULL,
  `availableForNewPt` varchar(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `physicians`
--

INSERT INTO `physicians` (`ID`, `firstName`, `lastName`, `type`, `gender`, `address`, `phoneNumber`, `availableForNewPt`) VALUES
(1, 'Jerome', 'Ableman', 'General Family Practice', 'Male', 'Foothills Medical Clinic\r\n203-3387 David Ave\r\nCoquitlam, BC\r\nV3E 0K4', '778-285-5859', 'Yes'),
(2, 'Yasmin', 'Ali', 'General Family Practice', 'Female', '102-1173 The High St\r\nCoquitlam, BC\r\nV3B 0B1', '604-945-0032', 'Yes'),
(3, 'Andrey', 'Babkis', 'General Family Practice', 'Male', '308-545 Sydney Ave\r\nCoquitlam, BC\r\nV3K 3J7', '306-240-4852', 'Yes'),
(4, 'Michelle', 'Birch', 'General Family Practice', 'Female', 'Austin Family Physicians\r\n102-1015 Austin Ave\r\nCoquitlam, BC\r\nV3K 3N9', '604-939-9251', 'No'),
(5, 'Daniel', 'Wong', 'General Family Practice', 'Male', 'Medicalwest\r\n212-3001 Gordon Ave\r\nCoquitlam, BC\r\nV3C 2K7\r\n', '604-944-4077', 'Yes'),
(7, ' Donald', 'Anderson', 'Otolaryngology', 'Male', '212-3030 Lincoln Ave\r\nCoquitlam, BC\r\nV3B 6B4', '604-945-0711', 'Yes'),
(8, 'Brian', 'Freitas', 'Psychiatry', 'Male', '202-1130 Austin Ave\r\nCoquitlam, BC\r\nV3K 3P5', '604-939-8143', 'No'),
(9, 'Mariana', 'Deevska', 'Pediatrics', 'Female', '203 3030 Lincoln Ave\r\nCoquitlam, BC\r\nV3B 6B4', '604-942-1119', 'Yes'),
(10, 'Kenneth', 'Wong', 'Diagnostic Radiology', 'Male', 'Medray Imaging\r\n100-3001 Gordon Ave\r\nCoquitlam, BC\r\nV3C 2K7', '604-941-7611', 'Yes'),
(11, 'Kiran', 'Manhas', 'Rheumatology', 'Female', 'Gain Medical Centre\r\n1199 Austin Ave\r\nCoquitlam, BC\r\nV3K 3P4', '604-939-7345', 'No'),
(12, 'Zareena', 'Abidin', 'Psychiatry', 'Female', 'Burnaby Mental Health, Burnaby Hospital\r\n3935 Kincaid St\r\nBurnaby, BC\r\nV5G 2X6', '604-675-3922', 'Yes'),
(13, 'Sarah-Jane', 'Anand', 'Obstetrics and Gynecology', 'Female', '3809 Sunset St\r\nBurnaby, BC\r\nV5G 1T4', '604-565-9447\r\n', 'Yes'),
(14, 'Margaret', 'Aron', 'Otolaryngology', 'Female', 'Burnaby ENT Associates\r\n410-4460\r\nBeresford Street\r\nBurnaby, BC\r\nV5H 0B8', '604-428-5301', 'No'),
(15, 'Virender', 'Bhan', 'Neurology', 'Male', '3935 Kincaid St\r\nFraser Health Ms Clinic\r\nBurnaby, BC\r\nV5G 2X6\r\n', '604-412-6405', 'Yes'),
(16, 'Siu Him', 'Chan', 'Cardiology', 'Male', 'Centrio Medical Specialists\r\n209 6411 Nelson Ave\r\nBurnaby, BC\r\nV5H 4H3', '604-436-9509', 'Yes'),
(17, 'Ross', 'Chang', 'Immunology and Allergy', 'Male', '600-4980 Kingsway\r\nBurnaby, BC\r\nV5H 4K7', '604-433-0545', 'No'),
(18, 'Afroza', 'Begum', 'General Family Practice', 'Female', 'Elicare Medical\r\n282-9600 Cameron St\r\nBurnaby, BC\r\nV3J 7N3', '778-999-9966', 'Yes'),
(19, 'Tatjana', 'Radovic', 'General Family Practice', 'Female', '104-3965 Kingsway\r\nBurnaby, BC\r\nV5H 1Y8', '778-782-4615', 'No'),
(20, 'Donna', 'Sue', 'General Family Practice	', 'Female', '203-3825 Sunset St\r\nBurnaby, BC\r\nV5G 1T4', '604-434-9515\r\n', 'No'),
(21, 'Vorobeychik', 'Yelena ', 'General Family Practice', 'Female', 'Burnaby Medical Center\r\nM37-4277 Kingsway\r\nBurnaby, BC\r\nV5H 3Z2', '604-438-9991\r\n', 'Yes'),
(22, 'Kathleen', 'Dann', 'General Family Practice', 'Female', 'Primary Care, Raven Song Community Health Centre\r\n2450 Ontario St\r\nVancouver, BC\r\nV5T 4T7', '604-709-6400', 'Yes'),
(23, 'Alexandra ', 'Greenhill', 'General Family Practice', 'Female', 'CrossRoads Clinics\r\n3rd Floor-507 Broadway St W\r\nVancouver, BC\r\nV5Z 1E6', '604-568-7229', 'Yes'),
(24, 'Dounia', 'Kayal', 'General Family Practice', 'Female', 'South Hill Family Health Center\r\n202-1193 Kingsway\r\nVancouver, BC\r\nV5V 3C9', '604-709-6400', 'No'),
(25, 'Stefan', 'Finke', 'General Family Practice	', 'Male', 'Mount Saint Joseph Hospital\r\n3080 Prince Edward St\r\nVancouver, BC\r\nV5T 3N4', '604-738-2151', 'Yes'),
(26, 'Kevin', 'Li', 'General Family Practice', 'Male', '1018 Seymour St\r\nVancouver, BC\r\nV6B 3M6', '604-681-1080\r\n', 'No'),
(27, 'Matthias ', 'Dahlmanns', 'General Family Practice', 'Male', 'Seymour Health Centre\r\n1530 7th Ave W\r\nVancouver, BC\r\nV6G 1S3', '604-738-2151', 'Yes'),
(28, 'Man', 'Leung', 'General Family Practice', 'Male', '1775 Grandview RPO\r\nPO Box 78048\r\nVancouver, BC\r\nV5N 5W1', '604-738-2151', 'No'),
(29, 'Lica', 'Chui', 'Ophthalmology', 'Female', 'A	\r\nBroadway Medical Building\r\nSuite 520-943 West Broadway\r\nVancouver, BC\r\nV5Z 4E', '604-875-6985', 'Yes'),
(30, 'Danni ', 'Li', 'Endocrinology', 'Female', '209-650 41st Ave W\r\nVancouver, BC\r\nV5Z 2M9', '604-600-7282', 'No'),
(31, 'Robert', 'Baird', 'Pediatric ', 'Male', 'Ambulatory Care Building\r\n4500 Oak St\r\nBc Childrens Hospital\r\nVancouver, BC\r\nV6H 3N1', '604-875-2667', 'Yes'),
(32, 'Simon', 'Bruce', 'Anesthesiology', 'Male', 'Dept of Anesthesia, St. Paul\s Hospital\r\n1081 Burrard St\r\nVancouver, BC\r\nV6Z 1Y6', '604-806-8337', 'Yes');
(33, 'Arman', 'Abdalkhani', 'Otolaryngology', 'Male', '300-1144 Burrard St Vancouver, BC V6Z 2A5', '604-757-1831', 'Yes'),
(34, 'Benjamin Larry', 'Achtem', 'Otolaryngology', 'Male', '203-3330 Richter St Kelowna, BC V1W 4V5', '250-763-3322', 'Yes'),
(35, 'Elaheh', 'Akbari', 'Otolaryngology', 'Female', '303-2963 Glen Dr Coquitlam, BC V3B 2P7', '604-941-2344', 'Yes'),
(36, 'Donald Willis', 'Anderson', 'Otolaryngology', 'Male', '212-2030 Lincoln Ave Coquitlam, BC V3B 6B4', '604-941-9191', 'No'),
(37, 'Clark Graham', 'Bartlett', 'Otolaryngology', 'Male', '617 Fort St Victoria, BC V8W 1G1', '250-920-5500', 'Yes'),
(38, 'Michelle', 'Bosch', 'Otolaryngology', 'Female', '500-4634 Park Ave Terrace, BC V8G 1V7', '778-634-2176', 'Yes'),
(39, 'Trudy Jean', 'Adam', 'Psychiatry', 'Female', '4500 Oak Street Vancouver, BC V6H 3N1', '604-875-2070', 'Yes'),
(40, 'Eugene Alexander', 'Agranovich', 'Psychiatry', 'Male', '803 West 12th Ave Vancouver, BC V5Z 1M9', '604-675-3710', 'Yes'),
(41, 'Zareena', 'Abidin', 'Psychiatry', 'Female', '3935 Kincaid St Burnaby, BC V5G 2X6', '604-453-1900', 'Yes'),
(42, 'Ataa', 'Azarbar', 'Psychiatry', 'Male', '3405 Willingdon Ave Burnaby, BC V5G 3H4', '604-675-3950', 'Yes'),
(43, 'Vijender Singh', 'Balain', 'Psychiatry', 'Male', '250-3405 Willingdon Ave Burnaby, BC V5G 3H4', '604-675-3951', 'No'),
(44, 'Johann Helgard', 'Brink', 'Psychiatry', 'Male', '70 Colony Farm Rd Coquitlam, Bc V3C 5X9', '604-524-7702', 'Yes'),
(45, 'Miroslava', 'Stingu-Baxter', 'Psychiatry', 'Female', '70 Colony Farm Rd Coquitlam, Bc V3C 5X9', '604-524-7956', 'Yes'),
(46, 'Ruth Sharon', 'Abrahams', 'Obstetrics and Gynecology', 'Female', 'MD Wellness 313-2626 Croydon Dr Surrey, BC V3Z 0S8', '604-385-3838', 'Yes'),
(47, 'Safiya Hana', 'Adam', 'Obstetrics and Gynecology', 'Female', '401-571 6th Ave N Cariboo Memorial Hospital Williams Lake, BC V2G 2G8', '250-392-1137', 'Yes'),
(48, 'Erin Roseanne Mary', 'Adams', 'Obstetrics and Gynecology', 'Female', '520 Nicola St Kamloops, BC V2C 2R1', '250-374-4456', 'No'),
(49, 'Adewale', 'Adegbenro', 'Obstetrics and Gynecology', 'Male', '200-10504 100th Ave Fort St. John, BC V1J 1Z2', '250-785-7732', 'Yes'),
(50, 'Oluremi', 'Adelasoye', 'Obstetrics and Gynecology', 'Male', '375 2nd Ave Campbell River, BC V9W 3V1', '250-286-7100', 'No'),
(51, 'Frank Walter', 'Ahman', 'Obstetrics and Gynecology', 'Male', '32900 Marshall Rd Abbotsford, BC V2S 0C2', '604-851-4767', 'Yes'),
(52, 'Kamal', 'Abdulwahab', 'Pediatrics', 'Male', '301-8425 120th St Delta, BC V4C 6R2', '604-591-0500', 'Yes'),
(53, 'Samuel Kofi Asante', 'Affram', 'Pediatrics', 'Male', '3949 Port Alberni Hwy Port Alberni, BC V9Y 4S1', '250-731-1370', 'No'),
(54, 'Jane Natalie', 'Aird', 'Pediatrics', 'Female', '102-1757 Beaufort Ave Comox, BC V9M 1R8', '250-339-5254', 'Yes'),
(55, 'Mary Margaret', 'Bennett', 'Pediatrics', 'Female', '4500 Oak St Vancouver, BC V6H 3N1', '604-875-2744', 'Yes'),
(56, 'James Neil', 'Bergman', 'Pediatrics', 'Male', '1803-805 Broadway W Vancouver, BC V5Z 1K1', '604-876-4433', 'Yes'),
(57, 'Karim Sultan', 'Ahamed', 'Diagnostic Radiology', 'Male', '15521 Russell Ave White Rock, BC V4B 2R4', '604-531-5512', 'Yes'),
(58, 'Ismail Tawakol', 'Ali', 'Diagnostic Radiology', 'Male', '3350 10th Ave W Vancouver, BC', '604-875-4165', 'Yes'),
(59, 'Jennifer Mary', 'Allen', 'Diagnostic Radiology', 'Female', '330 Columbia St E New Westminster, BC V3L 3W7', '604-520-4253', 'Yes'),
(60, 'Laila Khalid', 'Ashkar', 'Diagnostic Radiology', 'Female', '505-750 Broadway W Vancouver, BC V5Z 1H4', '604-879-4177', 'Yes'),
(61, 'John Edward', 'Barberie', 'Diagnostic Radiology', 'Male', 'A-1804 Bowen Rd Nanaimo, BC V9S 5W4', '250-753-4351', 'Yes'),
(62, 'Donald Frederick', 'Beach', 'Diagnostic Radiology', 'Male', '601 10th St NE Salmon Arm, BC V1E 4N6', '250-833-3607', 'No'),
(63, 'Annalisa', 'Becker', 'Diagnostic Radiology', 'Female', '5732 Victoria Dr Vancouver, BC V5P 3W6', '604-321-6774', 'No'),
(64, 'Neda', 'Amiri-Bostan-Abad', 'Rheumatology', 'Female', '630-221 Esplanade W North Vancouver, BC V7M 3J3', '604-770-4054', 'Yes'),
(65, 'Brent Evan', 'Appleton', 'Rheumatology', 'Male', '403-301 Columbia St E New Westminster, BC V3L 3W5', '604-526-2140', 'Yes'),
(66, 'Nicole', 'Baur', 'Rheumatology', 'Female', '206-1650 Terminal Ave Nanaimo, BC V9S 0A3', '250-591-4293', 'Yes'),
(67, 'Carson Chee', 'Chin', 'Rheumatology', 'Male', '510-4400 Dominion St Burnaby, BC V5G 4G3', '604-566-0077', 'Yes'),
(68, 'Jolanda', 'Cibere', 'Rheumatology', 'Female', '5591 No 3 Rd Richmond, BC V6X 2C7', '604-207-4011', 'Yes'),
(69, 'David Robert', 'Collins', 'Rheumatology', 'Male', '8205B-2775 Laurel St Vancouver, BC V5Z 1M9', '604-875-8270', 'No'),
(70, 'Ziad', 'Abu Sharar', 'Neurology', 'Male', '4480 Oak St Vancouver, BC V6H 3V4', '604-875-2121', 'Yes'),
(71, 'Edward John', 'Atkins', 'Neurology', 'Male', '1952 Bay St Victoria, BC V8R 1J8', '778-265-4423', 'Yes'),
(72, 'Kristen Alexandra', 'Attwell', 'Neurology', 'Female', '2587 Penrhyn St Victoria, BC V8N 1G4', '250-380-2545', 'Yes'),
(73, 'Jeffrey Howard', 'Beckman', 'Neurology', 'Male', '8209-2775 Laurel St W Vancouver, BC V5Z 1M9', '604-875-5319', 'Yes'),
(74, 'Oscar', 'Benavente', 'Neurology', 'Male', 'S469-2211 Wesbrook Mall Vancouver, BC V6T 2B5', '604-822-1789', 'No'),
(75, 'Sina', 'Alipour', 'Cardiology', 'Male', '103-245 Columbia St E New Westminster, BC V3L 3W4', '604-522-1644', 'Yes'),
(76, 'Jason Guy', 'Andrade', 'Cardiology', 'Male', '2775 Laurel St Vancouver, BC V5Z 1M9', '604-875-5069', 'Yes'),
(77, 'Eve Diana', 'Aymong', 'Cardiology', 'Female', '310-1144 Burrard St', '604-669-1014', 'Yes'),
(78, 'Margaret Mary', 'Blackwell', 'Cardiology', 'Female', '204-250 Keary St New Westminster, BC V3L 5E7', '604-515-2912', 'Yes'),
(79, 'Gary Bernard', 'Bloomberg', 'Cardiology', 'Male', '103-4900 Kingsway Ave Burnaby, BC V5H 2E3', '604-439-1277', 'No'),
(80, 'Gregory Kent', 'Appelt', 'Immunology and Allergy', 'Male', '302-3975 Lakeshore Rd Kelowna, BC V1W 1V3', '778-477-5806', 'Yes'),
(81, 'James Neil', 'Bergman', 'Immunology and Allergy', 'Male', '1803-805 Broadway W Vancouver, BC V5Z 1K1', '604-876-4433', 'No'),
(82, 'Catherine Mary', 'Biggs', 'Immunology and Allergy', 'Female', '4480 Oak St Vancouver, BC V6H 3V4', '604-875-2118', 'Yes'),
(83, 'Scott Brody', 'Cameron', 'Immunology and Allergy', 'Male', '4092 Shelbourne St Victoria, BC V8N 4P6', '250-595-8111', 'Yes'),
(84, 'Ross Everett', 'Chang', 'Immunology and Allergy', 'Male', '600-4980 Kingsway Burnaby, BC V5H 4K7', '604-433-0545', 'Yes'),
(85, 'Victoria Elizabeth', 'Cook', 'Immunology and Allergy', 'Female', '4480 Oak St Vancouver, BC V6H 3V4', '604-875-2118', 'No'),
(86, 'John Margrave', 'Esdaile', 'Immunology and Allergy', 'Male', '802-1200 Burrard St Vancouver, BC V6C 2Z7', '604-806-9407', 'Yes'),
(87, 'Kyla Jade', 'Hildebrand', 'Immunology and Allergy', 'Female', '4480 Oak St Vancouver, BC V6H 3V4', '604-875-2118', 'Yes'),
(88, 'David Andrew', 'Albiani', 'Ophthalmology', 'Male', '2550 Willow St Vancouver, BC V5Z 3N9', '604-875-1661', 'No'),
(89, 'Noor Helal', 'Alotaibi', 'Ophthalmology', 'Female', '311-15240 Highway 10 Surrey, BC V3S 5K7', '514-550-4784', 'Yes'),
(90, 'Carolyn Kim', 'Anderson', 'Ophthalmology', 'Female', '201-20434 64th Ave Langley, BC V2Y 1N4', '604-530-6879', 'No'),
(91, 'Duncan Barry', 'Anderson', 'Ophthalmology', 'Male', '2550 Willow St Vancouver, BC V5Z 3N9', '604-875-4339', 'Yes'),
(92, 'Maryam', 'Aroichane', 'Ophthalmology', 'Female', '301-9600 Cameron St Burnaby, BC V3J 7N3', '604-563-3415', 'Yes'),
(93, 'Stephen Michael', 'Baker', 'Ophthalmology', 'Male', '302-1625 Oak Bay Ave Victoria, BC V8R 1B1', '250-380-0397', 'Yes'),
(94, 'Shazhan', 'Amed', 'Endocrinology', 'Female', '4500 Oak St Vancouver, BC V6H 3N1', '604-875-2117', 'Yes'),
(95, 'Sarah Elizabeth', 'Capes', 'Endocrinology', 'Female', '308-1990 Fort St Victoria, BC V8R 6V4', '250-595-6210', 'No'),
(96, 'Jean-Pierre', 'Chanoine', 'Endocrinology', 'Male', '4500 Oakt St Vancouver, BC V6H 3N1', '604-875-2624', 'Yes'),
(97, 'Keith Granger', 'Dawson', 'Endocrinology', 'Male', '4197 Yuculta Cres Vancouver, BC V6N 4A9', '604-351-5565', 'No'),
(98, 'Thomas George', 'Elliott', 'Endocrinology', 'Male', '400-210 Broadway W Vancouver, BC V5Y 3W2', '604-683-3734', 'Yes'),
(99, 'Juliet Ann', 'Atherstone', 'Anesthesiology', 'Female', '855 12th Ave W Vancouver, BC V5Z 1M9', '604-875-4304', 'Yes'),
(100, 'Katherine Mary', 'Bailey', 'Anesthesiology', 'Female', '4480 Oak St Vancouver, BC V6H 3V4', '604-875-2345', 'Yes'),
(101, 'Breanna Audrey', 'Balaton', 'Anesthesiology', 'Female', '2268 Pandosy St Kelowna, BC V1Y 1T2', '250-862-4000', 'No');
-- --------------------------------------------------------

--
-- Table structure for table `physiciansList`
--

CREATE TABLE `physiciansList` (
  `userEmail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `physicianID` int(11) NOT NULL,
  `physicianFirst` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `physicianLast` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `physiciansList`
--

INSERT INTO `physiciansList` (`userEmail`, `physicianID`, `physicianFirst`, `physicianLast`, `description`) VALUES
('test@email.com', 1, 'Jerome', 'Ableman', 'My family doctor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `physicians`
--
ALTER TABLE `physicians`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `physicians`
--
ALTER TABLE `physicians`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"DList\",\"table\":\"physiciansList\"},{\"db\":\"DList\",\"table\":\"comments\"},{\"db\":\"DList\",\"table\":\"members\"},{\"db\":\"DList\",\"table\":\"physicians\"},{\"db\":\"classicmodels\",\"table\":\"orderdetails\"},{\"db\":\"classicmodels\",\"table\":\"orders\"},{\"db\":\"classicmodels\",\"table\":\"users\"},{\"db\":\"classicmodels\",\"table\":\"watchlist\"},{\"db\":\"classicmodels\",\"table\":\"employees\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

--
-- Dumping data for table `pma__relation`
--

INSERT INTO `pma__relation` (`master_db`, `master_table`, `master_field`, `foreign_db`, `foreign_table`, `foreign_field`) VALUES
('DList', 'comments', 'physicianID', 'DList', 'physicians', 'ID'),
('DList', 'comments', 'userEmail', 'DList', 'members', 'email'),
('DList', 'physiciansList', 'physicianID', 'DList', 'physicians', 'ID'),
('DList', 'physiciansList', 'userEmail', 'DList', 'members', 'email');

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2018-03-13 02:23:57', '{\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

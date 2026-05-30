-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2021 at 05:00 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cancercare_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add image_tb', 1, 'add_image_tb'),
(2, 'Can change image_tb', 1, 'change_image_tb'),
(3, 'Can delete image_tb', 1, 'delete_image_tb'),
(4, 'Can view image_tb', 1, 'view_image_tb'),
(5, 'Can add login_tb', 2, 'add_login_tb'),
(6, 'Can change login_tb', 2, 'change_login_tb'),
(7, 'Can delete login_tb', 2, 'delete_login_tb'),
(8, 'Can view login_tb', 2, 'view_login_tb'),
(9, 'Can add patientreg_tb', 3, 'add_patientreg_tb'),
(10, 'Can change patientreg_tb', 3, 'change_patientreg_tb'),
(11, 'Can delete patientreg_tb', 3, 'delete_patientreg_tb'),
(12, 'Can view patientreg_tb', 3, 'view_patientreg_tb'),
(13, 'Can add share_tb', 4, 'add_share_tb'),
(14, 'Can change share_tb', 4, 'change_share_tb'),
(15, 'Can delete share_tb', 4, 'delete_share_tb'),
(16, 'Can view share_tb', 4, 'view_share_tb'),
(17, 'Can add sponserreg_tb', 5, 'add_sponserreg_tb'),
(18, 'Can change sponserreg_tb', 5, 'change_sponserreg_tb'),
(19, 'Can delete sponserreg_tb', 5, 'delete_sponserreg_tb'),
(20, 'Can view sponserreg_tb', 5, 'view_sponserreg_tb'),
(21, 'Can add log entry', 6, 'add_logentry'),
(22, 'Can change log entry', 6, 'change_logentry'),
(23, 'Can delete log entry', 6, 'delete_logentry'),
(24, 'Can view log entry', 6, 'view_logentry'),
(25, 'Can add permission', 7, 'add_permission'),
(26, 'Can change permission', 7, 'change_permission'),
(27, 'Can delete permission', 7, 'delete_permission'),
(28, 'Can view permission', 7, 'view_permission'),
(29, 'Can add group', 8, 'add_group'),
(30, 'Can change group', 8, 'change_group'),
(31, 'Can delete group', 8, 'delete_group'),
(32, 'Can view group', 8, 'view_group'),
(33, 'Can add user', 9, 'add_user'),
(34, 'Can change user', 9, 'change_user'),
(35, 'Can delete user', 9, 'delete_user'),
(36, 'Can view user', 9, 'view_user'),
(37, 'Can add content type', 10, 'add_contenttype'),
(38, 'Can change content type', 10, 'change_contenttype'),
(39, 'Can delete content type', 10, 'delete_contenttype'),
(40, 'Can view content type', 10, 'view_contenttype'),
(41, 'Can add session', 11, 'add_session'),
(42, 'Can change session', 11, 'change_session'),
(43, 'Can delete session', 11, 'delete_session'),
(44, 'Can view session', 11, 'view_session'),
(45, 'Can add stories_tb', 12, 'add_stories_tb'),
(46, 'Can change stories_tb', 12, 'change_stories_tb'),
(47, 'Can delete stories_tb', 12, 'delete_stories_tb'),
(48, 'Can view stories_tb', 12, 'view_stories_tb'),
(49, 'Can add doctorreg_tb', 13, 'add_doctorreg_tb'),
(50, 'Can change doctorreg_tb', 13, 'change_doctorreg_tb'),
(51, 'Can delete doctorreg_tb', 13, 'delete_doctorreg_tb'),
(52, 'Can view doctorreg_tb', 13, 'view_doctorreg_tb'),
(53, 'Can add userreg_tb', 14, 'add_userreg_tb'),
(54, 'Can change userreg_tb', 14, 'change_userreg_tb'),
(55, 'Can delete userreg_tb', 14, 'delete_userreg_tb'),
(56, 'Can view userreg_tb', 14, 'view_userreg_tb'),
(57, 'Can add doctorlogin_tb', 15, 'add_doctorlogin_tb'),
(58, 'Can change doctorlogin_tb', 15, 'change_doctorlogin_tb'),
(59, 'Can delete doctorlogin_tb', 15, 'delete_doctorlogin_tb'),
(60, 'Can view doctorlogin_tb', 15, 'view_doctorlogin_tb'),
(61, 'Can add docreg_tb', 16, 'add_docreg_tb'),
(62, 'Can change docreg_tb', 16, 'change_docreg_tb'),
(63, 'Can delete docreg_tb', 16, 'delete_docreg_tb'),
(64, 'Can view docreg_tb', 16, 'view_docreg_tb'),
(65, 'Can add chat_tb', 17, 'add_chat_tb'),
(66, 'Can change chat_tb', 17, 'change_chat_tb'),
(67, 'Can delete chat_tb', 17, 'delete_chat_tb'),
(68, 'Can view chat_tb', 17, 'view_chat_tb'),
(69, 'Can add fnsprt_tb', 18, 'add_fnsprt_tb'),
(70, 'Can change fnsprt_tb', 18, 'change_fnsprt_tb'),
(71, 'Can delete fnsprt_tb', 18, 'delete_fnsprt_tb'),
(72, 'Can view fnsprt_tb', 18, 'view_fnsprt_tb'),
(73, 'Can add records_tb', 19, 'add_records_tb'),
(74, 'Can change records_tb', 19, 'change_records_tb'),
(75, 'Can delete records_tb', 19, 'delete_records_tb'),
(76, 'Can view records_tb', 19, 'view_records_tb'),
(77, 'Can add verifysponser_tb', 20, 'add_verifysponser_tb'),
(78, 'Can change verifysponser_tb', 20, 'change_verifysponser_tb'),
(79, 'Can delete verifysponser_tb', 20, 'delete_verifysponser_tb'),
(80, 'Can view verifysponser_tb', 20, 'view_verifysponser_tb'),
(81, 'Can add viewrec_tb', 21, 'add_viewrec_tb'),
(82, 'Can change viewrec_tb', 21, 'change_viewrec_tb'),
(83, 'Can delete viewrec_tb', 21, 'delete_viewrec_tb'),
(84, 'Can view viewrec_tb', 21, 'view_viewrec_tb'),
(85, 'Can add viewapp_tb', 22, 'add_viewapp_tb'),
(86, 'Can change viewapp_tb', 22, 'change_viewapp_tb'),
(87, 'Can delete viewapp_tb', 22, 'delete_viewapp_tb'),
(88, 'Can view viewapp_tb', 22, 'view_viewapp_tb'),
(89, 'Can add docchat_tb', 23, 'add_docchat_tb'),
(90, 'Can change docchat_tb', 23, 'change_docchat_tb'),
(91, 'Can delete docchat_tb', 23, 'delete_docchat_tb'),
(92, 'Can view docchat_tb', 23, 'view_docchat_tb'),
(93, 'Can add userstory_tb', 24, 'add_userstory_tb'),
(94, 'Can change userstory_tb', 24, 'change_userstory_tb'),
(95, 'Can delete userstory_tb', 24, 'delete_userstory_tb'),
(96, 'Can view userstory_tb', 24, 'view_userstory_tb'),
(97, 'Can add sp_applicaton_tb', 25, 'add_sp_applicaton_tb'),
(98, 'Can change sp_applicaton_tb', 25, 'change_sp_applicaton_tb'),
(99, 'Can delete sp_applicaton_tb', 25, 'delete_sp_applicaton_tb'),
(100, 'Can view sp_applicaton_tb', 25, 'view_sp_applicaton_tb'),
(101, 'Can add appointment_tb', 26, 'add_appointment_tb'),
(102, 'Can change appointment_tb', 26, 'change_appointment_tb'),
(103, 'Can delete appointment_tb', 26, 'delete_appointment_tb'),
(104, 'Can view appointment_tb', 26, 'view_appointment_tb'),
(105, 'Can add docinstructions_tb', 27, 'add_docinstructions_tb'),
(106, 'Can change docinstructions_tb', 27, 'change_docinstructions_tb'),
(107, 'Can delete docinstructions_tb', 27, 'delete_docinstructions_tb'),
(108, 'Can view docinstructions_tb', 27, 'view_docinstructions_tb'),
(109, 'Can add patientchat_tb', 28, 'add_patientchat_tb'),
(110, 'Can change patientchat_tb', 28, 'change_patientchat_tb'),
(111, 'Can delete patientchat_tb', 28, 'delete_patientchat_tb'),
(112, 'Can view patientchat_tb', 28, 'view_patientchat_tb');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_appointment_tb`
--

CREATE TABLE `cancercareapp_appointment_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `doctorname` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `doctor_id_id` int(11) NOT NULL,
  `patient_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancercareapp_appointment_tb`
--

INSERT INTO `cancercareapp_appointment_tb` (`id`, `name`, `contact`, `email`, `doctorname`, `time`, `doctor_id_id`, `patient_id_id`) VALUES
(1, 'tania', '5555555555', 'tania@gmail.com', '4', '9:00 a.m. - 11:00 a.m.', 4, 1),
(2, 'kesia', '1111111111', 'kesia@gmail.com', '2', '9:00 p.m. - 12:00 p.m.', 2, 2),
(3, 'livin', '2222222222', 'livin@gmail.com', '1', '9:00 p.m. - 12:00 p.m.', 1, 3),
(4, 'sonia', '4444444444', 'sonia@gmail.com', '4', '9:00 a.m. - 11:00 a.m.', 4, 5),
(5, 'dona', '6666666666', 'dona@gmail.com', '9', '10:00 p.m. - 1:00 p.m.', 9, 6),
(6, 'feona', '9999999999', 'feona@gmail.com', '3', '9:00 p.m. - 12:00 p.m.', 3, 7),
(7, 'tania', '5555555555', 'tania@gmail.com', '6', '9:00 a.m. - 11:00 a.m.', 6, 1),
(8, 'cinta', '9999999999', 'cinta@gmail.com', '1', '9:00 p.m. - 12:00 p.m.', 1, 16);

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_docchat_tb`
--

CREATE TABLE `cancercareapp_docchat_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `msg` varchar(100) NOT NULL,
  `doctor_id_id` int(11) NOT NULL,
  `patient_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancercareapp_docchat_tb`
--

INSERT INTO `cancercareapp_docchat_tb` (`id`, `name`, `msg`, `doctor_id_id`, `patient_id_id`) VALUES
(1, '3', 'wndkjkdj', 1, 3),
(2, '2', 'kjhkwhdkwdhkkd', 2, 2),
(3, '7', 'kjhfkejirodlekd', 3, 7),
(4, '1', 'jksdhkwjdh', 4, 1),
(5, '5', 'ksjkasjqlkjs', 4, 5),
(6, '6', 'wkqjkqhdkj', 9, 6),
(8, '2', 'kkkkkkkkkkkkk', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_docinstructions_tb`
--

CREATE TABLE `cancercareapp_docinstructions_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cancertype` varchar(100) NOT NULL,
  `diet` varchar(100) NOT NULL,
  `exercise` varchar(100) NOT NULL,
  `doctor_id_id` int(11) NOT NULL,
  `patient_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancercareapp_docinstructions_tb`
--

INSERT INTO `cancercareapp_docinstructions_tb` (`id`, `name`, `cancertype`, `diet`, `exercise`, `doctor_id_id`, `patient_id_id`) VALUES
(2, '1', 'bloodcancer', 'low fat proteins', 'stretching', 1, 1),
(3, '2', 'bloodcancer', 'fruits,vegetables', 'jogging', 1, 2),
(4, '3', 'bloodcancer', 'whole grains', 'jogging', 1, 3),
(5, '5', 'bloodcancer', 'fat free dairy', 'swimming', 1, 5),
(6, '6', 'bloodcancer', 'fruits', 'stretching', 1, 6),
(7, '7', 'bloodcancer', 'vegetables,fat free dairy', 'swimming,jogging', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_docreg_tb`
--

CREATE TABLE `cancercareapp_docreg_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancercareapp_docreg_tb`
--

INSERT INTO `cancercareapp_docreg_tb` (`id`, `name`, `email`, `password`, `contact`, `address`) VALUES
(1, 'ann', 'ann@gmail.com', '123', '3333333333', 'aaa'),
(2, 'poly', 'poly@gmail.com', '123', '8888888888', 'ppp'),
(3, 'joy', 'joy@gmail.com', '123', '7777777777', 'jjj'),
(4, 'liz', 'liz@gmail.com', '123', '6666666666', 'lll'),
(5, 'arathy', 'arathy@gmail.com', '123', '9999999999', 'aaa'),
(6, 'delna', 'delna@gmail.com', '123', '4444444444', 'ddd'),
(9, 'irene', 'irene@gmail.com', '123', '6666666666', 'iiii');

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_fnsprt_tb`
--

CREATE TABLE `cancercareapp_fnsprt_tb` (
  `id` int(11) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `cancertype` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `doctor` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_image_tb`
--

CREATE TABLE `cancercareapp_image_tb` (
  `id` int(11) NOT NULL,
  `img` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_patientchat_tb`
--

CREATE TABLE `cancercareapp_patientchat_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `msg` varchar(100) NOT NULL,
  `doctor_id_id` int(11) NOT NULL,
  `patient_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancercareapp_patientchat_tb`
--

INSERT INTO `cancercareapp_patientchat_tb` (`id`, `name`, `msg`, `doctor_id_id`, `patient_id_id`) VALUES
(1, '1', 'isjdisjslkf', 1, 3),
(2, '1', 'dfvdbgfn', 1, 1),
(3, '2', 'lkdfjdehlefk', 2, 2),
(4, '4', 'ejhfrkle', 4, 5),
(5, '5', 'dkfj;dfk', 5, 6),
(6, '2', 'fjoleoek', 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_patientreg_tb`
--

CREATE TABLE `cancercareapp_patientreg_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `age` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancercareapp_patientreg_tb`
--

INSERT INTO `cancercareapp_patientreg_tb` (`id`, `name`, `dob`, `age`, `email`, `password`, `contact`, `address`, `gender`, `status`) VALUES
(1, 'tania', '2021-02-04', '20', 'tania@gmail.com', '123', '5555555555', 'ttt', 'female', '0'),
(2, 'kesia', '2021-02-05', '24', 'kesia@gmail.com', '123', '1111111111', 'kkk', 'female', '0'),
(3, 'livin', '2021-02-06', '22', 'livin@gmail.com', '123', '2222222222', 'lil', 'male', '0'),
(4, 'rose', '', '', 'rose@gmail.com', '123', '', '', '', 'admin'),
(5, 'sonia', '2021-02-03', '20', 'sonia@gmail.com', '123', '4444444444', 'sss', 'female', '0'),
(6, 'dona', '2021-02-11', '33', 'dona@gmail.com', '123', '6666666666', 'ddd', 'female', '0'),
(7, 'feona', '2021-02-10', '27', 'feona@gmail.com', '123', '9999999999', 'fff', 'female', '0'),
(15, 'sandra', '2021-02-12', '32', 'sandra@gmail.com', '123', '3333333333', 'ssss', 'female', '0'),
(16, 'cinta', '2021-02-26', '24', 'cinta@gmail.com', '123', '9999999999', 'cccc', 'female', '0');

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_records_tb`
--

CREATE TABLE `cancercareapp_records_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `disease` varchar(100) NOT NULL,
  `symptoms` varchar(100) NOT NULL,
  `medicine` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancercareapp_records_tb`
--

INSERT INTO `cancercareapp_records_tb` (`id`, `name`, `contact`, `disease`, `symptoms`, `medicine`, `gender`, `status`) VALUES
(1, 'tania', '5555555555', 'cancer', 'weight loss', 'yes', 'female', 'approved'),
(2, 'kesia', '1111111111', 'cancer', 'fatigue', 'yes', 'female', 'approved'),
(3, 'livin', '2222222222', 'cancer', 'chronic headache', 'no', 'male', 'pending'),
(4, 'sonia', '4444444444', 'cancer', 'fatigue', 'no', 'female', 'approved'),
(5, 'dona', '6666666666', 'cancer', 'weight loss', 'yes', 'female', 'pending'),
(6, 'feona', '9999999999', 'cancer', 'chronic headache', 'no', 'female', 'pending'),
(7, 'sandra', '3333333333', 'cancer', 'weight loss', 'no', 'female', 'pending'),
(8, 'cinta', '9999999999', 'cancer', 'chronic headache', 'yes', 'female', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_share_tb`
--

CREATE TABLE `cancercareapp_share_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `msg` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancercareapp_share_tb`
--

INSERT INTO `cancercareapp_share_tb` (`id`, `name`, `msg`) VALUES
(1, '', ''),
(2, '', ''),
(3, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_sponserreg_tb`
--

CREATE TABLE `cancercareapp_sponserreg_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `admin_status` varchar(100) NOT NULL,
  `patient_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancercareapp_sponserreg_tb`
--

INSERT INTO `cancercareapp_sponserreg_tb` (`id`, `name`, `dob`, `email`, `password`, `contact`, `address`, `gender`, `admin_status`, `patient_status`) VALUES
(1, 'sheena', '2021-02-03', 'sheena@gmail.com', '123', '4444444444', 'sss', 'female', 'pending', 'pending'),
(2, 'noel', '2021-02-12', 'noel@gmail.com', '123', '7777777777', 'nnn', 'male', 'approved', 'selected'),
(3, 'merly', '2021-02-07', 'merly@gmail.com', '123', '4444444444', 'mmm', 'female', 'pending', 'pending'),
(4, 'jikku', '2021-02-08', 'jikku@gmail.com', '123', '8888888888', 'jjj', 'male', 'pending', 'pending'),
(5, 'rosmy', '2021-02-18', 'rosmy@gmail.com', '123', '4444444444', 'rrr', 'female', 'pending', 'pending'),
(6, 'tosmy', '2021-02-05', 'tosmy@gmail.com', '123', '5555555555', 'ttt', 'female', 'pending', 'pending'),
(7, 'hila', '2021-02-11', 'hila@gmail.com', '123', '6666666666', 'hhh', 'female', 'pending', '');

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_sp_applicaton_tb`
--

CREATE TABLE `cancercareapp_sp_applicaton_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `doctor` varchar(100) NOT NULL,
  `cancertype` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `patient_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancercareapp_sp_applicaton_tb`
--

INSERT INTO `cancercareapp_sp_applicaton_tb` (`id`, `name`, `contact`, `email`, `doctor`, `cancertype`, `amount`, `status`, `patient_id_id`) VALUES
(1, 'tania', '5555555555', 'tania@gmail.com', 'poly', 'bloodcancer', '500000', '0', 1),
(2, 'kesia', '1111111111', 'kesia@gmail.com', 'ann', 'bloodcancer', '400000', '0', 2),
(3, 'livin', '2222222222', 'livin@gmail.com', 'joy', 'bloodcancer', '600000', '0', 3),
(4, 'sonia', '4444444444', 'sonia@gmail.com', 'liz', 'bloodcancer', '500000', '0', 5),
(5, 'dona', '6666666666', 'dona@gmail.com', 'arathy', 'bloodcancer', '400000', '0', 6),
(6, 'feona', '9999999999', 'feona@gmail.com', 'delna', 'bloodcancer', '500000', '0', 7);

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_stories_tb`
--

CREATE TABLE `cancercareapp_stories_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `story` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancercareapp_stories_tb`
--

INSERT INTO `cancercareapp_stories_tb` (`id`, `name`, `email`, `story`) VALUES
(2, 'jacob', 'jacob@gmail.com', 'kjnkjl'),
(3, 'silvy', 'silvy@gmail.com', 'jhwsjgwhskwsk'),
(4, 'lilly', 'lilly@gmail.com', 'kqjsdlqwkjdnbdb'),
(5, 'lia', 'lia@gmail.com', 'hjgyhfjjkj'),
(6, 'hiran', 'hiran@gmail.com', 'jljllllljhjfgjg'),
(7, 'arun', 'arun@gmail.com', 'jhkjskwqsnwdkj');

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_userreg_tb`
--

CREATE TABLE `cancercareapp_userreg_tb` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancercareapp_userreg_tb`
--

INSERT INTO `cancercareapp_userreg_tb` (`id`, `name`, `email`, `password`, `contact`, `address`) VALUES
(1, 'jacob', 'jacob@gmail.com', '123', '7777777777', 'jjj'),
(2, 'silvy', 'silvy@gmail.com', '123', '9999999999', 'sss'),
(3, 'lilly', 'lilly@gmail.com', '123', '3333333333', 'lill'),
(4, 'lia', 'lia@gmail.com', '123', '2222222222', 'lll'),
(5, 'arun', 'arun@gmail.com', '123', '1111111111', 'aaa'),
(6, 'hiran', 'hiran@gmail.com', '123', '7777777777', 'hhh');

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_verifysponser_tb`
--

CREATE TABLE `cancercareapp_verifysponser_tb` (
  `id` int(11) NOT NULL,
  `sponser_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_viewapp_tb`
--

CREATE TABLE `cancercareapp_viewapp_tb` (
  `id` int(11) NOT NULL,
  `patient_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cancercareapp_viewrec_tb`
--

CREATE TABLE `cancercareapp_viewrec_tb` (
  `id` int(11) NOT NULL,
  `patient_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'admin', 'logentry'),
(8, 'auth', 'group'),
(7, 'auth', 'permission'),
(9, 'auth', 'user'),
(26, 'cancercareapp', 'appointment_tb'),
(17, 'cancercareapp', 'chat_tb'),
(23, 'cancercareapp', 'docchat_tb'),
(27, 'cancercareapp', 'docinstructions_tb'),
(16, 'cancercareapp', 'docreg_tb'),
(15, 'cancercareapp', 'doctorlogin_tb'),
(13, 'cancercareapp', 'doctorreg_tb'),
(18, 'cancercareapp', 'fnsprt_tb'),
(1, 'cancercareapp', 'image_tb'),
(2, 'cancercareapp', 'login_tb'),
(28, 'cancercareapp', 'patientchat_tb'),
(3, 'cancercareapp', 'patientreg_tb'),
(19, 'cancercareapp', 'records_tb'),
(4, 'cancercareapp', 'share_tb'),
(5, 'cancercareapp', 'sponserreg_tb'),
(25, 'cancercareapp', 'sp_applicaton_tb'),
(12, 'cancercareapp', 'stories_tb'),
(14, 'cancercareapp', 'userreg_tb'),
(24, 'cancercareapp', 'userstory_tb'),
(20, 'cancercareapp', 'verifysponser_tb'),
(22, 'cancercareapp', 'viewapp_tb'),
(21, 'cancercareapp', 'viewrec_tb'),
(10, 'contenttypes', 'contenttype'),
(11, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-02-03 12:45:58.634829'),
(2, 'auth', '0001_initial', '2021-02-03 12:46:00.870429'),
(3, 'admin', '0001_initial', '2021-02-03 12:46:11.309587'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-02-03 12:46:14.960855'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-03 12:46:15.086841'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-02-03 12:46:16.087865'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-02-03 12:46:17.170396'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-02-03 12:46:17.441887'),
(9, 'auth', '0004_alter_user_username_opts', '2021-02-03 12:46:17.554173'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-02-03 12:46:19.414989'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-02-03 12:46:19.509190'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-02-03 12:46:19.602076'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-02-03 12:46:19.802572'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-02-03 12:46:19.998456'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-02-03 12:46:20.218430'),
(16, 'auth', '0011_update_proxy_permissions', '2021-02-03 12:46:20.310937'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-02-03 12:46:20.585763'),
(18, 'cancercareapp', '0001_initial', '2021-02-03 12:46:24.251978'),
(19, 'sessions', '0001_initial', '2021-02-03 12:46:25.028534'),
(20, 'cancercareapp', '0002_stories_tb', '2021-02-04 01:54:38.982978'),
(21, 'cancercareapp', '0003_delete_login_tb', '2021-02-04 04:15:19.697526'),
(22, 'cancercareapp', '0004_login_tb', '2021-02-04 04:24:23.742746'),
(23, 'cancercareapp', '0005_auto_20210204_0957', '2021-02-04 04:27:56.134979'),
(24, 'cancercareapp', '0006_delete_login_tb', '2021-02-04 04:31:51.278605'),
(25, 'cancercareapp', '0007_doctorreg_tb', '2021-02-04 04:57:09.322025'),
(26, 'cancercareapp', '0008_userreg_tb', '2021-02-04 05:06:17.837559'),
(27, 'cancercareapp', '0009_doctorlogin_tb', '2021-02-04 05:17:05.244541'),
(28, 'cancercareapp', '0010_delete_doctorlogin_tb', '2021-02-04 05:21:52.521611'),
(29, 'cancercareapp', '0011_delete_doctorreg_tb', '2021-02-04 06:38:51.806284'),
(30, 'cancercareapp', '0012_docreg_tb', '2021-02-04 12:37:49.123172'),
(31, 'cancercareapp', '0013_chat_tb', '2021-02-05 04:53:23.325430'),
(32, 'cancercareapp', '0014_fnsprt_tb', '2021-02-05 05:26:13.873420'),
(33, 'cancercareapp', '0015_auto_20210205_1124', '2021-02-05 05:54:27.691759'),
(34, 'cancercareapp', '0016_fnsprt_tb_name', '2021-02-05 06:00:29.005258'),
(35, 'cancercareapp', '0017_remove_fnsprt_tb_name', '2021-02-05 06:21:47.671571'),
(36, 'cancercareapp', '0018_fnsprt_tb_status', '2021-02-05 06:25:12.644686'),
(37, 'cancercareapp', '0019_remove_fnsprt_tb_status', '2021-02-05 06:44:49.359338'),
(38, 'cancercareapp', '0020_sponserreg_tb_status', '2021-02-05 06:50:27.252784'),
(39, 'cancercareapp', '0021_records_tb', '2021-02-07 02:56:34.310411'),
(40, 'cancercareapp', '0022_verifysponser_tb', '2021-02-07 03:22:36.371689'),
(41, 'cancercareapp', '0023_auto_20210208_0635', '2021-02-08 01:05:11.279546'),
(42, 'cancercareapp', '0024_sponserreg_tb_patient_status', '2021-02-08 01:08:06.569500'),
(43, 'cancercareapp', '0025_viewrec_tb', '2021-02-08 01:42:30.165588'),
(44, 'cancercareapp', '0026_records_tb_admin_status', '2021-02-08 01:43:49.025995'),
(45, 'cancercareapp', '0027_auto_20210208_0714', '2021-02-08 01:44:33.798523'),
(46, 'cancercareapp', '0028_auto_20210208_1123', '2021-02-08 05:53:36.104363'),
(47, 'cancercareapp', '0029_viewapp_tb', '2021-02-08 06:00:30.260631'),
(48, 'cancercareapp', '0002_sp_applicaton_tb', '2021-02-09 04:59:33.904697'),
(49, 'cancercareapp', '0003_auto_20210209_1101', '2021-02-09 05:32:01.442105'),
(50, 'cancercareapp', '0004_auto_20210209_1122', '2021-02-09 05:52:42.169342'),
(51, 'cancercareapp', '0002_appointment_tb', '2021-02-10 05:05:30.816109'),
(52, 'cancercareapp', '0002_docchat_tb', '2021-02-11 05:45:44.685647'),
(53, 'cancercareapp', '0002_docinstructions_tb', '2021-02-12 05:29:00.003723'),
(54, 'cancercareapp', '0002_delete_chat_tb', '2021-02-12 06:38:33.966801'),
(55, 'cancercareapp', '0002_patientchat_tb', '2021-02-15 01:41:16.923130'),
(56, 'cancercareapp', '0003_patientreg_tb_status', '2021-02-15 04:39:40.437756');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0sor6ql07uipb0tc10ys0zarw2qfrovv', 'eyJpZCI6MX0:1l8y0m:-W79wIhvf-3S7nvOSKcXvDijCDuBQ5HqRWwFh7m2ItA', '2021-02-22 04:18:56.212840'),
('0wu9ai4zlc65zh37w24jzcnry3gz7h42', 'eyJpZCI6NH0:1l8vZd:H0xY5m0-qmXZY3jvZYHxN7e7WHDN2UQUfiap0oDoUtE', '2021-02-22 01:42:45.788331'),
('1fjytu6a2nf5wklqez8yxfgexe1oiaav', 'e30:1lBLGM:3RUnabrDHerCiNvgLsZdEk1Rg6BB_BE8btrhWhH3BTs', '2021-02-28 17:32:50.713808'),
('3a605ktxj8zl4d7zkgq2jtlvt0wux696', 'eyJpZCI6MX0:1l9olP:jR6Y6PYbH-Hp7E26DTooje6T49Pb5UoXROuCiHtyXFo', '2021-02-24 12:38:35.817747'),
('3fun9g95fw9ozmnfdvzxc0zegitu7mdl', 'eyJpZCI6MX0:1lBrV8:T4bX6L1gsQzzevCAi5g0xRRHwAtd9-ym_J_m8JaHViY', '2021-03-02 03:58:14.673210'),
('425jigdikcwcqjm0pa226ykik3jwivqr', 'eyJpZCI6MX0:1l7een:Bz1IaRZhAgzPsgNksjclP0ESNnUTWnINQmyfLHxcDzA', '2021-02-18 13:26:49.430562'),
('51csgawym9t4982yzy046b1du6c4k1lm', 'eyJpZCI6MX0:1lA1FF:xAUc4SO2y4xwxjZk-M5eAPRqKHcGc2bDfjg26krTkNk', '2021-02-25 01:58:13.329733'),
('b6li3406zmk79d8k0c6qm4usilfkhyg8', 'eyJpZCI6MX0:1l8NXq:Qk_Pn9FhHMacAqXVKMMjkjdu22mIdbBAPRiFqGYekZU', '2021-02-20 13:22:38.542858'),
('c3mm3b9brt0jtygb5lnslxxq4t82ey5d', 'eyJpZCI6NH0:1l9IQv:zWE6h823kz8ayNOkHxNHIh2fYEiXUTn2hP5qWgYOSOE', '2021-02-23 02:07:17.700997'),
('gchxm6lhv7v4p5j283dxgpaj94i0m7xw', 'eyJpZCI6Mn0:1l7v11:3O0EYKqGwVKdPdTcH3w7rUx0s_TUelaCoJtg6SW64PM', '2021-02-19 06:54:51.995056'),
('lbgaqveywudbcxdqcua7rezcs4qd7sy4', 'eyJpZCI6Mn0:1l9jOh:FBsXtdxunXD21Fwhj1VKJpMVozQGVOKoNZtyFcxV_aQ', '2021-02-24 06:54:47.479097'),
('m9tzcjrmfcd5dcm6143awcrwwaqhxtfq', 'eyJpZCI6MX0:1l7Y46:J0Lo6SHJFXRxxJ4pnn500K9ebVgmfB0Ya3TCXYZQ3Z8', '2021-02-18 06:24:30.300575'),
('md9j2v6dziqpy5r8hekqxsov7khglp3o', 'eyJpZCI6Mn0:1l905h:dUPYlI9g3r6QdwG7WXfxBTcuvuZv_NMpYORkwbv_c_o', '2021-02-22 06:32:09.274493'),
('na4ki4jn61bn47dlq0j8j6alebxcrkno', 'eyJpZCI6NH0:1l7iRU:9PdJYzWThtmA9xTvT4-qIGS8iN0SnZw1SHi3WWl6UGU', '2021-02-18 17:29:20.025916'),
('ncr46jggiv8kib32n0z3du3752g7tsy0', 'eyJpZCI6NH0:1l8afN:lrb_Dc6ZUBHva3Qot_ygJ85xNaHO1eEMlyr6A33BE5s', '2021-02-21 03:23:17.417558'),
('nqa1knuc8cfj89zofo6n95p6wpespnu9', 'eyJpZCI6MTZ9:1l9RAe:dk_2JvmzKRDcFUE74Iud1aqGP62Li2Jndp1cDd7tnBs', '2021-02-23 11:27:04.664868'),
('nqf96g7637jwz4bljbzrfpr1bj63ifj5', 'eyJpZCI6MX0:1lABZi:uH3_6PHPok6VnNFf5iM46wVlt1MrYBybxSSuJKKkfKs', '2021-02-25 13:00:02.449987'),
('nwvt6l9isc7jnqlj6d9nbzzrs4l4lzc9', 'eyJpZCI6NH0:1lANZY:2e5ovwzyfqCArL71r1IVWuDIeHQRM6Cv-Fm7B8ruMRw', '2021-02-26 01:48:40.928432'),
('o84oynvyo6iytrrkj0zjkqceib1phghs', 'eyJpZCI6MX0:1l9M2K:cKJoDj5T-r4-bRH2sHM4HVnopCUVFXHv7E2dafT-kvU', '2021-02-23 05:58:08.503070'),
('pb3u7n8i60kv330zioc243wqeyf19xf7', 'eyJpZCI6MX0:1l9JbR:LoqWHNHjTh7u_4oyIWLaEwdfYpHXsv1FCLdST80kFyY', '2021-02-23 03:22:13.907514'),
('peilundhyyhs4qk3d3czmfffh7ohsp45', 'eyJpZCI6MX0:1lASAg:rvo6XudAh_uIhmkx9DjRyOO2bLkaX6179dM_Ig28tZc', '2021-02-26 06:43:18.366719'),
('pjz9vjjn6yd0jwnc7n8xcyuj25kcuju1', 'eyJpZCI6NH0:1lBTCQ:WDEKwM8RcI9ekdtKd90I2xb3MFzqRr-os2IQSb1GmrQ', '2021-03-01 02:01:18.914919'),
('pnnpmup6v10bomrllks0ran9xriyw8lb', 'eyJpZCI6MX0:1lA5ua:d9re1i7jo2dGvvdR11oZ4sSIq9xr4SqkWYwKU0QhbhY', '2021-02-25 06:57:12.454936'),
('s9kgycj9nxndr3y6udc0qpzln05jl0rh', 'eyJpZCI6MX0:1l9eFn:_XukefnBnZjdfxdZ75_l6oneXlls8K0UXeqeOIk7U1g', '2021-02-24 01:25:15.540936'),
('skpjiom2ki8lc63ce4n21lpmfor7czmb', 'eyJpZCI6MX0:1l7elB:i6137G063wvHSQYq3FCcBdsf5ag2kSerN55-I-eqC9Y', '2021-02-18 13:33:25.777530'),
('u8qj0ri4ct7j6tecgtcbjoui2fh0rhtp', 'eyJpZCI6MX0:1l7qTT:6-ckKqp2ap35w4_OeecToA49gzDqL_sfnTR4qjHSQJ0', '2021-02-19 02:03:55.228586'),
('v4v6tnjs18058pq8m3dxpzp97wdu9ikp', 'eyJpZCI6MX0:1l8kyZ:M1tqhPCmGztUpiVJeV_mTvRBb4CAI4IOZQ6dIrcOO4A', '2021-02-21 14:23:47.255204'),
('vtc91l0vhlv3cetpwxlyjb3sx0cmg2f9', 'eyJpZCI6MX0:1l9RjI:V3TZUZ1f650pwV0LHVoBUuuOkfUXzj3CFYnqK5KhhWo', '2021-02-23 12:02:52.359644');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cancercareapp_appointment_tb`
--
ALTER TABLE `cancercareapp_appointment_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancercareapp_appoin_doctor_id_id_8c0a5a25_fk_cancercar` (`doctor_id_id`),
  ADD KEY `cancercareapp_appoin_patient_id_id_3e815869_fk_cancercar` (`patient_id_id`);

--
-- Indexes for table `cancercareapp_docchat_tb`
--
ALTER TABLE `cancercareapp_docchat_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancercareapp_doccha_doctor_id_id_682e0cb1_fk_cancercar` (`doctor_id_id`),
  ADD KEY `cancercareapp_doccha_patient_id_id_3b9fdfe9_fk_cancercar` (`patient_id_id`);

--
-- Indexes for table `cancercareapp_docinstructions_tb`
--
ALTER TABLE `cancercareapp_docinstructions_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancercareapp_docins_doctor_id_id_83f5aed6_fk_cancercar` (`doctor_id_id`),
  ADD KEY `cancercareapp_docins_patient_id_id_b6c012a7_fk_cancercar` (`patient_id_id`);

--
-- Indexes for table `cancercareapp_docreg_tb`
--
ALTER TABLE `cancercareapp_docreg_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancercareapp_fnsprt_tb`
--
ALTER TABLE `cancercareapp_fnsprt_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancercareapp_image_tb`
--
ALTER TABLE `cancercareapp_image_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancercareapp_patientchat_tb`
--
ALTER TABLE `cancercareapp_patientchat_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancercareapp_patien_doctor_id_id_c509149a_fk_cancercar` (`doctor_id_id`),
  ADD KEY `cancercareapp_patien_patient_id_id_0e455339_fk_cancercar` (`patient_id_id`);

--
-- Indexes for table `cancercareapp_patientreg_tb`
--
ALTER TABLE `cancercareapp_patientreg_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancercareapp_records_tb`
--
ALTER TABLE `cancercareapp_records_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancercareapp_share_tb`
--
ALTER TABLE `cancercareapp_share_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancercareapp_sponserreg_tb`
--
ALTER TABLE `cancercareapp_sponserreg_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancercareapp_sp_applicaton_tb`
--
ALTER TABLE `cancercareapp_sp_applicaton_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancercareapp_sp_app_patient_id_id_d887d299_fk_cancercar` (`patient_id_id`);

--
-- Indexes for table `cancercareapp_stories_tb`
--
ALTER TABLE `cancercareapp_stories_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancercareapp_userreg_tb`
--
ALTER TABLE `cancercareapp_userreg_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancercareapp_verifysponser_tb`
--
ALTER TABLE `cancercareapp_verifysponser_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancercareapp_verify_sponser_id_id_4050ac1d_fk_cancercar` (`sponser_id_id`);

--
-- Indexes for table `cancercareapp_viewapp_tb`
--
ALTER TABLE `cancercareapp_viewapp_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancercareapp_viewap_patient_id_id_86d49f9b_fk_cancercar` (`patient_id_id`);

--
-- Indexes for table `cancercareapp_viewrec_tb`
--
ALTER TABLE `cancercareapp_viewrec_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancercareapp_viewre_patient_id_id_4b8332cc_fk_cancercar` (`patient_id_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancercareapp_appointment_tb`
--
ALTER TABLE `cancercareapp_appointment_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cancercareapp_docchat_tb`
--
ALTER TABLE `cancercareapp_docchat_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cancercareapp_docinstructions_tb`
--
ALTER TABLE `cancercareapp_docinstructions_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cancercareapp_docreg_tb`
--
ALTER TABLE `cancercareapp_docreg_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cancercareapp_fnsprt_tb`
--
ALTER TABLE `cancercareapp_fnsprt_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancercareapp_image_tb`
--
ALTER TABLE `cancercareapp_image_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancercareapp_patientchat_tb`
--
ALTER TABLE `cancercareapp_patientchat_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cancercareapp_patientreg_tb`
--
ALTER TABLE `cancercareapp_patientreg_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cancercareapp_records_tb`
--
ALTER TABLE `cancercareapp_records_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cancercareapp_share_tb`
--
ALTER TABLE `cancercareapp_share_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cancercareapp_sponserreg_tb`
--
ALTER TABLE `cancercareapp_sponserreg_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cancercareapp_sp_applicaton_tb`
--
ALTER TABLE `cancercareapp_sp_applicaton_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cancercareapp_stories_tb`
--
ALTER TABLE `cancercareapp_stories_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cancercareapp_userreg_tb`
--
ALTER TABLE `cancercareapp_userreg_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cancercareapp_verifysponser_tb`
--
ALTER TABLE `cancercareapp_verifysponser_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancercareapp_viewapp_tb`
--
ALTER TABLE `cancercareapp_viewapp_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancercareapp_viewrec_tb`
--
ALTER TABLE `cancercareapp_viewrec_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cancercareapp_appointment_tb`
--
ALTER TABLE `cancercareapp_appointment_tb`
  ADD CONSTRAINT `cancercareapp_appoin_doctor_id_id_8c0a5a25_fk_cancercar` FOREIGN KEY (`doctor_id_id`) REFERENCES `cancercareapp_docreg_tb` (`id`),
  ADD CONSTRAINT `cancercareapp_appoin_patient_id_id_3e815869_fk_cancercar` FOREIGN KEY (`patient_id_id`) REFERENCES `cancercareapp_patientreg_tb` (`id`);

--
-- Constraints for table `cancercareapp_docchat_tb`
--
ALTER TABLE `cancercareapp_docchat_tb`
  ADD CONSTRAINT `cancercareapp_doccha_doctor_id_id_682e0cb1_fk_cancercar` FOREIGN KEY (`doctor_id_id`) REFERENCES `cancercareapp_docreg_tb` (`id`),
  ADD CONSTRAINT `cancercareapp_doccha_patient_id_id_3b9fdfe9_fk_cancercar` FOREIGN KEY (`patient_id_id`) REFERENCES `cancercareapp_patientreg_tb` (`id`);

--
-- Constraints for table `cancercareapp_docinstructions_tb`
--
ALTER TABLE `cancercareapp_docinstructions_tb`
  ADD CONSTRAINT `cancercareapp_docins_doctor_id_id_83f5aed6_fk_cancercar` FOREIGN KEY (`doctor_id_id`) REFERENCES `cancercareapp_docreg_tb` (`id`),
  ADD CONSTRAINT `cancercareapp_docins_patient_id_id_b6c012a7_fk_cancercar` FOREIGN KEY (`patient_id_id`) REFERENCES `cancercareapp_patientreg_tb` (`id`);

--
-- Constraints for table `cancercareapp_patientchat_tb`
--
ALTER TABLE `cancercareapp_patientchat_tb`
  ADD CONSTRAINT `cancercareapp_patien_doctor_id_id_c509149a_fk_cancercar` FOREIGN KEY (`doctor_id_id`) REFERENCES `cancercareapp_docreg_tb` (`id`),
  ADD CONSTRAINT `cancercareapp_patien_patient_id_id_0e455339_fk_cancercar` FOREIGN KEY (`patient_id_id`) REFERENCES `cancercareapp_patientreg_tb` (`id`);

--
-- Constraints for table `cancercareapp_sp_applicaton_tb`
--
ALTER TABLE `cancercareapp_sp_applicaton_tb`
  ADD CONSTRAINT `cancercareapp_sp_app_patient_id_id_d887d299_fk_cancercar` FOREIGN KEY (`patient_id_id`) REFERENCES `cancercareapp_patientreg_tb` (`id`);

--
-- Constraints for table `cancercareapp_verifysponser_tb`
--
ALTER TABLE `cancercareapp_verifysponser_tb`
  ADD CONSTRAINT `cancercareapp_verify_sponser_id_id_4050ac1d_fk_cancercar` FOREIGN KEY (`sponser_id_id`) REFERENCES `cancercareapp_sponserreg_tb` (`id`);

--
-- Constraints for table `cancercareapp_viewapp_tb`
--
ALTER TABLE `cancercareapp_viewapp_tb`
  ADD CONSTRAINT `cancercareapp_viewap_patient_id_id_86d49f9b_fk_cancercar` FOREIGN KEY (`patient_id_id`) REFERENCES `cancercareapp_fnsprt_tb` (`id`);

--
-- Constraints for table `cancercareapp_viewrec_tb`
--
ALTER TABLE `cancercareapp_viewrec_tb`
  ADD CONSTRAINT `cancercareapp_viewre_patient_id_id_4b8332cc_fk_cancercar` FOREIGN KEY (`patient_id_id`) REFERENCES `cancercareapp_records_tb` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

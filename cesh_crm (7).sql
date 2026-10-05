-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2026 at 01:57 PM
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
-- Database: `cesh_crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) DEFAULT NULL,
  `patient_name` varchar(200) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `provider` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT 'General',
  `doctor_id` int(11) DEFAULT NULL,
  `status` enum('Pending','Confirmed','In Progress','Completed','Cancelled') DEFAULT 'Pending',
  `contact` varchar(20) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `completed_at` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `doctor_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_email_log`
--

CREATE TABLE `appointment_email_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `email_type` varchar(50) NOT NULL,
  `recipient_email` varchar(255) NOT NULL,
  `sent_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointment_email_log`
--

INSERT INTO `appointment_email_log` (`id`, `appointment_id`, `email_type`, `recipient_email`, `sent_at`) VALUES
(1, 30, 'confirmation', 'mark.adrian.lumongsod@gmail.com', '2026-08-23 09:49:07'),
(2, 31, 'confirmation', 'mark.adrian.lumongsod@gmail.com', '2026-08-23 09:52:24'),
(3, 32, 'confirmation', 'iamzesarjen@gmail.com', '2026-08-23 23:27:50');

-- --------------------------------------------------------

--
-- Table structure for table `diagnoses`
--

CREATE TABLE `diagnoses` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `provider` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `diagnosis_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedule`
--

CREATE TABLE `doctor_schedule` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `schedule_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `department` varchar(50) DEFAULT 'General',
  `is_available` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_schedule`
--

INSERT INTO `doctor_schedule` (`id`, `doctor_id`, `schedule_date`, `start_time`, `end_time`, `department`, `is_available`, `created_at`) VALUES
(1, 3, '2026-06-10', '08:00:00', '17:00:00', 'Pediatrics', 1, '2026-06-09 16:37:46');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedules`
--

CREATE TABLE `doctor_schedules` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `department` varchar(100) NOT NULL,
  `day_of_week` varchar(20) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `uploaded` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_history`
--

CREATE TABLE `family_history` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `relation` varchar(50) DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `immunizations`
--

CREATE TABLE `immunizations` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `vaccine` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_activity`
--

CREATE TABLE `login_activity` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `status` enum('Success','Failed') NOT NULL,
  `reason` varchar(255) NOT NULL,
  `attempted_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical_history`
--

CREATE TABLE `medical_history` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `diagnosis` text DEFAULT NULL,
  `medications` text DEFAULT NULL,
  `allergies` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `mrn` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `primary_physician` varchar(100) DEFAULT NULL,
  `status` enum('Active','Archived') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`mrn`, `first_name`, `middle_name`, `last_name`, `suffix`, `dob`, `gender`, `contact`, `email`, `address`, `primary_physician`, `status`, `created_at`) VALUES
(1037, 'Mark Gregor', '', 'Lumongsod', '', '2005-01-22', 'Male', '09121231234', '', 'gumamela', '', 'Active', '2026-10-04 14:28:47');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `queue_number` int(11) NOT NULL,
  `priority` enum('Normal','Senior','PWD','Emergency') DEFAULT 'Normal',
  `status` enum('Waiting','In Consultation','Completed','Cancelled','No Show') DEFAULT 'Waiting',
  `doctor_id` int(11) DEFAULT NULL,
  `department` varchar(50) DEFAULT 'General',
  `called_at` datetime DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `appointment_id` int(11) DEFAULT NULL,
  `is_from_appointment` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queue_display`
--

CREATE TABLE `queue_display` (
  `id` int(11) NOT NULL,
  `currently_serving` int(11) DEFAULT NULL,
  `last_called` datetime DEFAULT NULL,
  `department` varchar(50) DEFAULT 'General'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queue_settings`
--

CREATE TABLE `queue_settings` (
  `id` int(11) NOT NULL,
  `department` varchar(50) NOT NULL,
  `current_number` int(11) DEFAULT 0,
  `last_reset_date` date DEFAULT NULL,
  `prefix` varchar(10) DEFAULT 'Q'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queue_settings`
--

INSERT INTO `queue_settings` (`id`, `department`, `current_number`, `last_reset_date`, `prefix`) VALUES
(9, 'General', 11, '2026-08-25', 'Q'),
(10, 'Pediatrics', 6, '2026-08-18', 'P'),
(11, 'OB-Gyne', 1, '2026-06-08', 'G'),
(12, 'Internal Medicine', 1, '2026-06-10', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `surgeries`
--

CREATE TABLE `surgeries` (
  `id` int(11) NOT NULL,
  `patient_mrn` int(11) NOT NULL,
  `surgery` varchar(255) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('admin','doctor','nurse','staff') NOT NULL DEFAULT 'staff',
  `assigned_department` varchar(50) DEFAULT 'General',
  `can_access_all_depts` tinyint(1) DEFAULT 0,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `two_factor_secret` varchar(64) DEFAULT NULL,
  `two_factor_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `email`, `role`, `assigned_department`, `can_access_all_depts`, `status`, `is_available`, `two_factor_secret`, `two_factor_enabled`, `last_login`, `created_at`) VALUES
(1, 'admin', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Zesar jen bejona', 'admin@cesh.gov.ph', 'admin', 'General Medicine', 1, 'Active', 1, 'VM3JF3ESPVF7UJ4X', 1, '2026-10-04 22:26:22', '2026-05-18 06:43:28'),
(3, 'dr.peds', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Dr. Maria Reyes', 'peds@cesh.gov.ph', 'doctor', 'Pediatrics', 0, 'Active', 1, NULL, 0, '2026-08-18 13:28:04', '2026-05-18 06:43:28'),
(4, 'dr.obgyn', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Dr. Anna Cruz', 'obgyn@cesh.gov.ph', 'doctor', 'OB-Gyne', 0, 'Active', 1, NULL, 0, '2026-05-31 21:02:24', '2026-05-18 06:43:28'),
(5, 'dr.internal', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Dr. Robert Lim', 'internal@cesh.gov.ph', 'doctor', 'Internal Medicine', 0, 'Active', 1, NULL, 0, '2026-06-10 01:12:16', '2026-05-18 06:43:28'),
(6, 'fd.general', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Front Desk - General', 'fd.general@cesh.gov.ph', 'staff', 'General', 0, 'Active', 1, NULL, 0, '2026-08-25 18:23:35', '2026-05-18 06:43:28'),
(7, 'fd.peds', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Front Desk - Pediatrics', 'fd.peds@cesh.gov.ph', 'staff', 'Pediatrics', 0, 'Active', 1, NULL, 0, '2026-08-18 13:27:51', '2026-05-18 06:43:28'),
(8, 'fd.obgyn', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Front Desk - OB-Gyne', 'fd.obgyn@cesh.gov.ph', 'staff', 'OB-Gyne', 0, 'Active', 1, NULL, 0, '2026-05-31 23:43:23', '2026-05-18 06:43:28'),
(9, 'fd.internal', '$2y$10$3a9t5wEd6lcJLeUIEjRYY.MGz9O9Gnx.aihbrQRW2MRvvjMZzmKOS', 'Front Desk - Internal Med', 'fd.internal@cesh.gov.ph', 'staff', 'Internal Medicine', 0, 'Active', 1, NULL, 0, '2026-06-10 01:11:30', '2026-05-18 06:43:28'),
(10, 'dr.mark', '$2y$10$ViKVN45ENL9CKlGY3Qty5uijqSWIVctWURqNTpPi4Xj1utg5Df0Fm', 'Mark Adrian Lumongsod', 'mark.adrian.lumongsod@gmail.com', 'doctor', 'General Medicine', 0, 'Active', 1, NULL, 0, '2026-08-25 05:25:37', '2026-08-24 21:24:38'),
(11, 'dr.bejona', '$2y$10$t46IkrYs1HrTmV0Fk.X0y.aDBnSVBqYVJo23aa8XiFrPmeqxXUIAC', 'Zesar Jen', '', 'admin', 'General Medicine', 0, 'Active', 0, NULL, 0, '2026-08-25 18:29:27', '2026-08-25 06:06:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`),
  ADD KEY `idx_date` (`date`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `fk_appointment_doctor` (`doctor_id`);

--
-- Indexes for table `appointment_email_log`
--
ALTER TABLE `appointment_email_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_appointment_email` (`appointment_id`,`email_type`),
  ADD KEY `idx_email_log_appointment` (`appointment_id`);

--
-- Indexes for table `diagnoses`
--
ALTER TABLE `diagnoses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `doctor_schedule`
--
ALTER TABLE `doctor_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`,`schedule_date`);

--
-- Indexes for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_doctor_dept` (`doctor_id`,`department`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `family_history`
--
ALTER TABLE `family_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `immunizations`
--
ALTER TABLE `immunizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `login_activity`
--
ALTER TABLE `login_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_login_activity_time` (`attempted_at`),
  ADD KEY `idx_login_activity_username` (`username`),
  ADD KEY `idx_login_activity_status` (`status`);

--
-- Indexes for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`mrn`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `queue_display`
--
ALTER TABLE `queue_display`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queue_settings`
--
ALTER TABLE `queue_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `department` (`department`);

--
-- Indexes for table `surgeries`
--
ALTER TABLE `surgeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_mrn` (`patient_mrn`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `appointment_email_log`
--
ALTER TABLE `appointment_email_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `diagnoses`
--
ALTER TABLE `diagnoses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_schedule`
--
ALTER TABLE `doctor_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `family_history`
--
ALTER TABLE `family_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `immunizations`
--
ALTER TABLE `immunizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_activity`
--
ALTER TABLE `login_activity`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `medical_history`
--
ALTER TABLE `medical_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `mrn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1038;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `queue_display`
--
ALTER TABLE `queue_display`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `queue_settings`
--
ALTER TABLE `queue_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `surgeries`
--
ALTER TABLE `surgeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_appointment_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `diagnoses`
--
ALTER TABLE `diagnoses`
  ADD CONSTRAINT `diagnoses_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `doctor_schedules`
--
ALTER TABLE `doctor_schedules`
  ADD CONSTRAINT `doctor_schedules_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `family_history`
--
ALTER TABLE `family_history`
  ADD CONSTRAINT `family_history_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `immunizations`
--
ALTER TABLE `immunizations`
  ADD CONSTRAINT `immunizations_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD CONSTRAINT `medical_history_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `queue`
--
ALTER TABLE `queue`
  ADD CONSTRAINT `queue_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;

--
-- Constraints for table `surgeries`
--
ALTER TABLE `surgeries`
  ADD CONSTRAINT `surgeries_ibfk_1` FOREIGN KEY (`patient_mrn`) REFERENCES `patients` (`mrn`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : flashcardsv3

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 19/07/2022 14:07:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card`  (
  `CardID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Term` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Meaning` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CourseID` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Creator` mediumint(9) NOT NULL,
  PRIMARY KEY (`CardID`) USING BTREE,
  INDEX `Creator`(`Creator`) USING BTREE,
  INDEX `CourseID`(`CourseID`) USING BTREE,
  CONSTRAINT `card_ibfk_1` FOREIGN KEY (`Creator`) REFERENCES `user` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `card_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `ClassID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `School` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Creator` mediumint(9) NOT NULL,
  PRIMARY KEY (`ClassID`) USING BTREE,
  INDEX `Creator`(`Creator`) USING BTREE,
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`Creator`) REFERENCES `user` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `CourseID` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Creator` mediumint(9) NOT NULL,
  PRIMARY KEY (`CourseID`) USING BTREE,
  INDEX `Creator`(`Creator`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Creator`) REFERENCES `user` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for course_in_folder
-- ----------------------------
DROP TABLE IF EXISTS `course_in_folder`;
CREATE TABLE `course_in_folder`  (
  `Course` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Folder` mediumint(9) NOT NULL,
  PRIMARY KEY (`Course`, `Folder`) USING BTREE,
  INDEX `Folder`(`Folder`) USING BTREE,
  CONSTRAINT `course_in_folder_ibfk_1` FOREIGN KEY (`Course`) REFERENCES `course` (`CourseID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `course_in_folder_ibfk_2` FOREIGN KEY (`Folder`) REFERENCES `folder` (`FolderID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for folder
-- ----------------------------
DROP TABLE IF EXISTS `folder`;
CREATE TABLE `folder`  (
  `FolderID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Creator` mediumint(9) NOT NULL,
  PRIMARY KEY (`FolderID`) USING BTREE,
  INDEX `Creator`(`Creator`) USING BTREE,
  CONSTRAINT `folder_ibfk_1` FOREIGN KEY (`Creator`) REFERENCES `user` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for marked_card
-- ----------------------------
DROP TABLE IF EXISTS `marked_card`;
CREATE TABLE `marked_card`  (
  `UserID` mediumint(9) NOT NULL,
  `CardID` mediumint(9) NOT NULL,
  PRIMARY KEY (`UserID`, `CardID`) USING BTREE,
  INDEX `CardID`(`CardID`) USING BTREE,
  CONSTRAINT `marked_card_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `marked_card_ibfk_2` FOREIGN KEY (`CardID`) REFERENCES `card` (`CardID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `UserID` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Password` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JoiningDate` date NOT NULL,
  `Role` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UserID`) USING BTREE,
  UNIQUE INDEX `Email`(`Email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

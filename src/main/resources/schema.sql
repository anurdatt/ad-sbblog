-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blogdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blogdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blogdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `blogdb` ;

-- -----------------------------------------------------
-- Table `blogdb`.`POST_PART`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogdb`.`POST_PART` (
  `POST_PART_ID` INT NOT NULL AUTO_INCREMENT,
  `BODY` LONGTEXT NOT NULL,
  PRIMARY KEY (`POST_PART_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blogdb`.`POST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogdb`.`POST` (
  `POST_ID` INT NOT NULL AUTO_INCREMENT,
  `TITLE` VARCHAR(100) NOT NULL,
  `AUTHOR` VARCHAR(45) NULL DEFAULT NULL,
  `POSTED_DT` DATETIME NULL DEFAULT NULL,
  `SOURCE_CODE` MEDIUMTEXT NULL DEFAULT NULL,
  `POST_PART_ID` INT NOT NULL,
  PRIMARY KEY (`POST_ID`),
  INDEX `POS_PART_ID_idx` (`POST_PART_ID` ASC) VISIBLE,
  CONSTRAINT `POS_PART_ID_fk`
    FOREIGN KEY (`POST_PART_ID`)
    REFERENCES `blogdb`.`POST_PART` (`POST_PART_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blogdb`.`COMMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogdb`.`COMMENT` (
  `COMMENT_ID` INT NOT NULL AUTO_INCREMENT,
  `AUTHOR` VARCHAR(45) NOT NULL,
  `EMAIL` VARCHAR(50) NULL DEFAULT NULL,
  `SITE` VARCHAR(80) NULL DEFAULT NULL,
  `BODY` MEDIUMTEXT NOT NULL,
  `IP_ADDRESS` VARCHAR(20) NULL DEFAULT NULL,
  `RATING` INT NULL DEFAULT NULL,
  `POSTED_DT` DATETIME NOT NULL,
  `POST_ID` INT NOT NULL,
  PRIMARY KEY (`COMMENT_ID`),
  INDEX `POST_ID_fk_idx` (`POST_ID` ASC) VISIBLE,
  CONSTRAINT `COMMENT_POST_ID_fk`
    FOREIGN KEY (`POST_ID`)
    REFERENCES `blogdb`.`POST` (`POST_ID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blogdb`.`TAG`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogdb`.`TAG` (
  `TAG_ID` INT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`TAG_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blogdb`.`POST_TAG`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogdb`.`POST_TAG` (
  `POST_ID` INT NOT NULL,
  `TAG_ID` INT NOT NULL,
  INDEX `POST_ID_fk_idx` (`POST_ID` ASC) VISIBLE,
  INDEX `TAG_ID_fk_idx` (`TAG_ID` ASC) VISIBLE,
  CONSTRAINT `POST_ID_fk`
    FOREIGN KEY (`POST_ID`)
    REFERENCES `blogdb`.`POST` (`POST_ID`)
    ON DELETE CASCADE,
  CONSTRAINT `TAG_ID_fk`
    FOREIGN KEY (`TAG_ID`)
    REFERENCES `blogdb`.`TAG` (`TAG_ID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blogdb`.`ROLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogdb`.`ROLE` (
  `ROLE_ID` INT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ROLE_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blogdb`.`USER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogdb`.`USER` (
  `USER_ID` INT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(50) NOT NULL,
  `PASSWORD` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blogdb`.`USER_ROLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogdb`.`USER_ROLE` (
  `USER_ID` INT NOT NULL,
  `ROLE_ID` INT NOT NULL,
  INDEX `USER_ID_fk_idx` (`USER_ID` ASC) VISIBLE,
  INDEX `ROLE_ID_fk_idx` (`ROLE_ID` ASC) VISIBLE,
  CONSTRAINT `ROLE_ID_fk`
    FOREIGN KEY (`ROLE_ID`)
    REFERENCES `blogdb`.`ROLE` (`ROLE_ID`)
    ON DELETE CASCADE,
  CONSTRAINT `USER_ID_fk`
    FOREIGN KEY (`USER_ID`)
    REFERENCES `blogdb`.`USER` (`USER_ID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blogdb`.`ticks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogdb`.`ticks` (
  `tick` TIMESTAMP NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `blogdb` ;

-- -----------------------------------------------------
-- Placeholder table for view `blogdb`.`V_POST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogdb`.`V_POST` (`POST_ID` INT, `TITLE` INT, `AUTHOR` INT, `SOURCE_CODE` INT, `POSTED_DT` INT, `POST_PART_ID` INT, `BODY` INT, `TEASER` INT);

-- -----------------------------------------------------
-- Placeholder table for view `blogdb`.`V_TAG`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blogdb`.`V_TAG` (`TAG_ID` INT, `NAME` INT, `COUNT` INT);

-- -----------------------------------------------------
-- View `blogdb`.`V_POST`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blogdb`.`V_POST`;
USE `blogdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`bloguser`@`%` SQL SECURITY DEFINER VIEW `blogdb`.`V_POST` AS select `blogdb`.`POST`.`POST_ID` AS `POST_ID`,`blogdb`.`POST`.`TITLE` AS `TITLE`,`blogdb`.`POST`.`AUTHOR` AS `AUTHOR`,`blogdb`.`POST`.`SOURCE_CODE` AS `SOURCE_CODE`,`blogdb`.`POST`.`POSTED_DT` AS `POSTED_DT`,`blogdb`.`POST`.`POST_PART_ID` AS `POST_PART_ID`,`blogdb`.`POST_PART`.`BODY` AS `BODY`,substr(`blogdb`.`POST_PART`.`BODY`,1,100) AS `TEASER` from (`blogdb`.`POST` join `blogdb`.`POST_PART`) where (`blogdb`.`POST`.`POST_PART_ID` = `blogdb`.`POST_PART`.`POST_PART_ID`);

-- -----------------------------------------------------
-- View `blogdb`.`V_TAG`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blogdb`.`V_TAG`;
USE `blogdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`bloguser`@`%` SQL SECURITY DEFINER VIEW `blogdb`.`V_TAG` AS select `t`.`TAG_ID` AS `TAG_ID`,`t`.`NAME` AS `NAME`,`pt`.`count` AS `COUNT` from (`blogdb`.`TAG` `t` join (select `blogdb`.`POST_TAG`.`TAG_ID` AS `TAG_ID`,count(0) AS `count` from `blogdb`.`POST_TAG` group by `blogdb`.`POST_TAG`.`TAG_ID`) `pt` on((`t`.`TAG_ID` = `pt`.`TAG_ID`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

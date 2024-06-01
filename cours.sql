-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`phoneNumber`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`phoneNumber` (
  `idphoneNumber` INT NOT NULL AUTO_INCREMENT,
  `phoneNumber` VARCHAR(45) NULL,
  PRIMARY KEY (`idphoneNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`email` (
  `idemail` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idemail`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`lessonStat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lessonStat` (
  `idlessonStat` INT NOT NULL AUTO_INCREMENT,
  `hourDisciplin` INT NULL,
  `mark` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idlessonStat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`lesson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lesson` (
  `idlesson` INT NOT NULL AUTO_INCREMENT,
  `lessonName` VARCHAR(45) NOT NULL,
  `lessonStat_idlessonStat` INT NOT NULL,
  PRIMARY KEY (`idlesson`))
ENGINE = InnoDB;

CREATE INDEX `fk_lesson_lessonStat1_idx` ON `mydb`.`lesson` (`lessonStat_idlessonStat` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`students` (
  `students_id` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `MiddleName` VARCHAR(45) NULL,
  `phoneNumber_idphoneNumber` INT NOT NULL,
  `email_idemail` INT NOT NULL,
  `lesson_idlesson` INT NOT NULL,
  `lessonStat_idlessonStat` INT NOT NULL,
  PRIMARY KEY (`students_id`))
ENGINE = InnoDB;

CREATE INDEX `fk_students_phoneNumber1_idx` ON `mydb`.`students` (`phoneNumber_idphoneNumber` ASC) VISIBLE;

CREATE INDEX `fk_students_email1_idx` ON `mydb`.`students` (`email_idemail` ASC) VISIBLE;

CREATE INDEX `fk_students_lesson1_idx` ON `mydb`.`students` (`lesson_idlesson` ASC) VISIBLE;

CREATE INDEX `fk_students_lessonStat1_idx` ON `mydb`.`students` (`lessonStat_idlessonStat` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`passport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`passport` (
  `idpassport` INT NOT NULL AUTO_INCREMENT,
  `Series` VARCHAR(45) NOT NULL,
  `Number` VARCHAR(45) NOT NULL,
  `students_students_id` INT NOT NULL,
  PRIMARY KEY (`idpassport`))
ENGINE = InnoDB;

CREATE INDEX `fk_passport_students_idx` ON `mydb`.`passport` (`students_students_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`adress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`adress` (
  `idadress` INT NOT NULL AUTO_INCREMENT,
  `City` VARCHAR(45) NULL,
  `Index` VARCHAR(45) NULL,
  `students_students_id` INT NOT NULL,
  PRIMARY KEY (`idadress`))
ENGINE = InnoDB;

CREATE INDEX `fk_adress_students1_idx` ON `mydb`.`adress` (`students_students_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`age`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`age` (
  `idage` INT NOT NULL AUTO_INCREMENT,
  `age` VARCHAR(45) NULL,
  `students_students_id` INT NOT NULL,
  PRIMARY KEY (`idage`))
ENGINE = InnoDB;

CREATE INDEX `fk_age_students1_idx` ON `mydb`.`age` (`students_students_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`dateOfBirthday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dateOfBirthday` (
  `iddateOfBirthday` INT NOT NULL AUTO_INCREMENT,
  `day` VARCHAR(45) NOT NULL,
  `month` VARCHAR(45) NOT NULL,
  `year` VARCHAR(45) NOT NULL,
  `students_students_id` INT NOT NULL,
  PRIMARY KEY (`iddateOfBirthday`))
ENGINE = InnoDB;

CREATE INDEX `fk_dateOfBirthday_students1_idx` ON `mydb`.`dateOfBirthday` (`students_students_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`specialization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`specialization` (
  `idspecialization` INT NOT NULL AUTO_INCREMENT,
  `specializationName` VARCHAR(45) NULL,
  `students_students_id` INT NOT NULL,
  PRIMARY KEY (`idspecialization`))
ENGINE = InnoDB;

CREATE INDEX `fk_specialization_students1_idx` ON `mydb`.`specialization` (`students_students_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`faculty` (
  `idfaculty` INT NOT NULL AUTO_INCREMENT,
  `facultyName` VARCHAR(45) NOT NULL,
  `students_students_id` INT NOT NULL,
  `specialization_idspecialization` INT NOT NULL,
  PRIMARY KEY (`idfaculty`))
ENGINE = InnoDB;

CREATE INDEX `fk_faculty_students1_idx` ON `mydb`.`faculty` (`students_students_id` ASC) VISIBLE;

CREATE INDEX `fk_faculty_specialization1_idx` ON `mydb`.`faculty` (`specialization_idspecialization` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`group` (
  `idgroup` INT NOT NULL AUTO_INCREMENT,
  `groupName` VARCHAR(45) NOT NULL,
  `students_students_id` INT NOT NULL,
  PRIMARY KEY (`idgroup`))
ENGINE = InnoDB;

CREATE INDEX `fk_group_students1_idx` ON `mydb`.`group` (`students_students_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`chief`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`chief` (
  `idchief` INT NOT NULL AUTO_INCREMENT,
  `chief` TINYINT NULL,
  `students_students_id` INT NOT NULL,
  PRIMARY KEY (`idchief`))
ENGINE = InnoDB;

CREATE INDEX `fk_chief_students1_idx` ON `mydb`.`chief` (`students_students_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

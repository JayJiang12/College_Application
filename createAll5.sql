
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Professors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professors` (
  `Professors ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Professors ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Department` (
  `Departemnt name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Departemnt name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Graduate Degree Program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Graduate Degree Program` (
  `Degree` VARCHAR(25) NULL,
  `Phone number` VARCHAR(15) NULL,
  `Email` VARCHAR(45) NULL,
  `Director` INT NULL,
  `Department_Departemnt name` VARCHAR(25) NULL,
  PRIMARY KEY (`Degree`, `Director`, `Department_Departemnt name`),
  INDEX `fk_Graduate Degree Program_Professors1_idx` (`Director` ASC),
  INDEX `fk_Graduate Degree Program_Department1_idx` (`Department_Departemnt name` ASC),
  CONSTRAINT `fk_Graduate Degree Program_Professors1`
    FOREIGN KEY (`Director`)
    REFERENCES `mydb`.`Professors` (`Professors ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Graduate Degree Program_Department1`
    FOREIGN KEY (`Department_Departemnt name`)
    REFERENCES `mydb`.`Department` (`Departemnt name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Applicant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Applicant` (
  `Applicant ID` INT NULL,
  `Name` VARCHAR(50) NULL,
  `Gender` VARCHAR(10) NULL,
  `Date of Birth` VARCHAR(10) NULL,
  PRIMARY KEY (`Applicant ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Application`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Application` (
  `Application ID` INT NULL,
  `semester/year` VARCHAR(45) NULL,
  `Date of GRE` VARCHAR(45) NULL,
  `essay` VARCHAR(45) NULL,
  `emails of references1` VARCHAR(45) NULL,
  `emails of references3` VARCHAR(45) NULL,
  `emails of references2` VARCHAR(45) NULL,
  `application Answer` VARCHAR(45) NULL,
  `Graduate Degree Program_Degree` VARCHAR(25) NOT NULL,
  `Applicant_Applicant ID` INT NOT NULL,
  PRIMARY KEY (`Application ID`, `Graduate Degree Program_Degree`, `Applicant_Applicant ID`),
  INDEX `fk_Application_Graduate Degree Program1_idx` (`Graduate Degree Program_Degree` ASC),
  INDEX `fk_Application_Applicant1_idx` (`Applicant_Applicant ID` ASC),
  CONSTRAINT `fk_Application_Graduate Degree Program1`
    FOREIGN KEY (`Graduate Degree Program_Degree`)
    REFERENCES `mydb`.`Graduate Degree Program` (`Degree`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Application_Applicant1`
    FOREIGN KEY (`Applicant_Applicant ID`)
    REFERENCES `mydb`.`Applicant` (`Applicant ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GRE Score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GRE Score` (
  `verbal` INT NULL,
  `Quantitative` INT NULL,
  `Analytical` INT NULL,
  `Application_Application ID` INT NOT NULL,
  PRIMARY KEY (`Application_Application ID`),
  CONSTRAINT `fk_GRE Score_Application1`
    FOREIGN KEY (`Application_Application ID`)
    REFERENCES `mydb`.`Application` (`Application ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Application Evaluation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Application Evaluation` (
  `Application_Application ID` INT NULL,
  `Professors1` INT NULL,
  `Professors2` INT NULL,
  `score` INT NULL,
  `final decision` VARCHAR(25) NULL,
  `Date/Time` VARCHAR(25) NULL,
  PRIMARY KEY (`Application_Application ID`, `Professors1`, `Professors2`),
  INDEX `fk_Application Evaluation_Professors1_idx` (`Professors1` ASC),
  CONSTRAINT `fk_Application Eevaluation_Application1`
    FOREIGN KEY (`Application_Application ID`)
    REFERENCES `mydb`.`Application` (`Application ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Application Evaluation_Professors1`
    FOREIGN KEY (`Professors1`)
    REFERENCES `mydb`.`Professors` (`Professors ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Application Evaluation_Professors2`
    FOREIGN KEY (`Professors2`)
    REFERENCES `mydb`.`Professors` (`Professors ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proir Education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proir Education` (
  `Application_Application ID` INT NULL,
  `College/University name` VARCHAR(50) NULL,
  `Major` VARCHAR(25) NULL,
  `Degree` VARCHAR(25) NULL,
  `GPA` float NULL,
  `Graduation date` VARCHAR(45) NULL,
  PRIMARY KEY (`Application_Application ID`),
  CONSTRAINT `fk_Proir Education_Application1`
    FOREIGN KEY (`Application_Application ID`)
    REFERENCES `mydb`.`Application` (`Application ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Admission Requirement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Admission Requirement` (
  `Addition requirement` VARCHAR(10) NULL,
  `Answer` VARCHAR(10) NULL,
  `Question` VARCHAR(10) NULL,
  `Graduate Degree Program_Department` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Graduate Degree Program_Department`),
  CONSTRAINT `fk_Admission Requirement_Graduate Degree Program1`
    FOREIGN KEY (`Graduate Degree Program_Department`)
    REFERENCES `mydb`.`Graduate Degree Program` (`Degree`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Admission Rubrics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Admission Rubrics` (
  `undergraduate education` VARCHAR(10) NULL,
  `prerequest knowledge` VARCHAR(10) NULL,
  `letters of recommendation` VARCHAR(10) NULL,
  `standardized scores` VARCHAR(10) NULL,
  `statement of purpose` VARCHAR(10) NULL,
  `Graduate Degree Program_Department` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Graduate Degree Program_Department`),
  CONSTRAINT `fk_Admission Rubrics_Graduate Degree Program1`
    FOREIGN KEY (`Graduate Degree Program_Department`)
    REFERENCES `mydb`.`Graduate Degree Program` (`Degree`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Contact Infor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Contact Infor` (
  `address` VARCHAR(25) NULL DEFAULT NULL,
  `phone number` VARCHAR(15) NULL DEFAULT NULL,
  `email address` VARCHAR(45) NULL DEFAULT NULL,
  `Applicant_Applicant ID` INT NULL,
  PRIMARY KEY (`Applicant_Applicant ID`),
  CONSTRAINT `fk_Contact Infor_Applicant`
    FOREIGN KEY (`Applicant_Applicant ID`)
    REFERENCES `mydb`.`Applicant` (`Applicant ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Course` (
  `Course ID` INT NOT NULL,
  `Course Name` VARCHAR(45) NULL,
  `Department_Departemnt name` VARCHAR(25) NOT NULL,
  `Offering` VARCHAR(45) NULL,
  PRIMARY KEY (`Course ID`, `Department_Departemnt name`),
  INDEX `fk_Cousre_Department1_idx` (`Department_Departemnt name` ASC),
  CONSTRAINT `fk_Cousre_Department1`
    FOREIGN KEY (`Department_Departemnt name`)
    REFERENCES `mydb`.`Department` (`Departemnt name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

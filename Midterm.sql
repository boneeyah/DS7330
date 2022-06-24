-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BasketballTournament
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BasketballTournament
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BasketballTournament` DEFAULT CHARACTER SET utf8 ;
USE `BasketballTournament` ;

-- -----------------------------------------------------
-- Table `BasketballTournament`.`Teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BasketballTournament`.`Teams` (
  `TeamID` INT NOT NULL,
  `TeamName` VARCHAR(30) NULL,
  `Coach_FirstName` VARCHAR(45) NULL,
  `Coach_LastName` VARCHAR(45) NULL,
  PRIMARY KEY (`TeamID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BasketballTournament`.`Players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BasketballTournament`.`Players` (
  `PlayerID` INT NOT NULL,
  `PlayerFirstName` VARCHAR(45) NULL,
  `PlayerLastName` VARCHAR(45) NULL,
  `PlayerAddress` VARCHAR(45) NULL,
  `PlayerCity` VARCHAR(45) NULL,
  `PlayerState` VARCHAR(45) NULL,
  `PlayerZip` VARCHAR(45) NULL,
  `TeamID` INT NULL,
  PRIMARY KEY (`PlayerID`),
  INDEX `TeamID_idx` (`TeamID` ASC) VISIBLE,
  CONSTRAINT `TeamID`
    FOREIGN KEY (`TeamID`)
    REFERENCES `BasketballTournament`.`Teams` (`TeamID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BasketballTournament`.`Tournaments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BasketballTournament`.`Tournaments` (
  `TourneyID` INT NOT NULL,
  `TourneyDate` DATE NULL,
  `TournamentLocation` VARCHAR(45) NULL,
  PRIMARY KEY (`TourneyID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BasketballTournament`.`Matches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BasketballTournament`.`Matches` (
  `GameID` INT NOT NULL,
  `TourneyID` INT NULL,
  `HomeTeam` INT NULL,
  `AwayTeam` INT NULL,
  `WinningTeam` INT NULL,
  PRIMARY KEY (`GameID`),
  INDEX `TourneyID_idx` (`TourneyID` ASC) VISIBLE,
  INDEX `HomeTeam_idx` (`HomeTeam` ASC) VISIBLE,
  INDEX `AwayTeam_idx` (`AwayTeam` ASC) VISIBLE,
  INDEX `WinningTeam_idx` (`WinningTeam` ASC) VISIBLE,
  CONSTRAINT `TourneyID`
    FOREIGN KEY (`TourneyID`)
    REFERENCES `BasketballTournament`.`Tournaments` (`TourneyID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `HomeTeam`
    FOREIGN KEY (`HomeTeam`)
    REFERENCES `BasketballTournament`.`Teams` (`TeamID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AwayTeam`
    FOREIGN KEY (`AwayTeam`)
    REFERENCES `BasketballTournament`.`Teams` (`TeamID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `WinningTeam`
    FOREIGN KEY (`WinningTeam`)
    REFERENCES `BasketballTournament`.`Teams` (`TeamID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BasketballTournament`.`Scores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BasketballTournament`.`Scores` (
  `GameID` INT NOT NULL,
  `PlayerID` INT NOT NULL,
  `PlayerScore` INT NULL,
  INDEX `GameID_idx` (`GameID` ASC) VISIBLE,
  INDEX `PlayerID_idx` (`PlayerID` ASC) VISIBLE,
  PRIMARY KEY (`GameID`, `PlayerID`),
  CONSTRAINT `GameID`
    FOREIGN KEY (`GameID`)
    REFERENCES `BasketballTournament`.`Matches` (`GameID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PlayerID`
    FOREIGN KEY (`PlayerID`)
    REFERENCES `BasketballTournament`.`Players` (`PlayerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Synchronization
-- Generated: 2026-03-12 22:07
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: My PC

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `banking_1` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `banking_1`.`customers` (
  `Customer_ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'stores the UNIQUE ID of each customers of the bank',
  `First_Name` VARCHAR(45) NULL DEFAULT NULL COMMENT 'stores the first name of each customer of the bank',
  `Last_Name` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(225) NULL DEFAULT NULL,
  `Phone` VARCHAR(45) NULL DEFAULT NULL,
  `Address` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `Country` VARCHAR(45) NULL DEFAULT NULL,
  `Created_At` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`),
  INDEX `idx_first_name` (`First_Name` ASC, `Last_Name` ASC) VISIBLE,
  INDEX `idx_city` (`City` ASC) INVISIBLE,
  INDEX `idx_country` (`Country` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `banking_1`.`accounts` (
  `Account_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Customer_ID` INT(11) NULL DEFAULT NULL,
  `Account_Type` VARCHAR(45) NULL DEFAULT NULL,
  `Balance` DOUBLE NULL DEFAULT NULL,
  `Status` VARCHAR(45) NULL DEFAULT NULL,
  `Created_At` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`Account_ID`),
  INDEX `fk_customer_id` (`Customer_ID` ASC) INVISIBLE,
  INDEX `idx_type` (`Account_Type` ASC) INVISIBLE,
  INDEX `idx_status` (`Status` ASC) INVISIBLE,
  CONSTRAINT `fk_accounts_customers`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `banking_1`.`customers` (`Customer_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `banking_1`.`transactions` (
  `Transaction_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `customers_Customer_ID` INT(11) NOT NULL,
  `accounts_Account_ID` INT(11) NOT NULL,
  `Transaction_Type` VARCHAR(45) NULL DEFAULT NULL,
  `Amount` DOUBLE NULL DEFAULT NULL,
  `Transaction_Date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `Description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Transaction_ID`),
  INDEX `fk_transactions_customers1_idx` (`customers_Customer_ID` ASC) VISIBLE,
  INDEX `fk_transactions_accounts1_idx` (`accounts_Account_ID` ASC) VISIBLE,
  INDEX `idx_type` (`Transaction_Type` ASC) VISIBLE,
  CONSTRAINT `fk_transactions_customers1`
    FOREIGN KEY (`customers_Customer_ID`)
    REFERENCES `banking_1`.`customers` (`Customer_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_transactions_accounts1`
    FOREIGN KEY (`accounts_Account_ID`)
    REFERENCES `banking_1`.`accounts` (`Account_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

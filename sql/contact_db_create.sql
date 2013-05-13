SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `contact_db` DEFAULT CHARACTER SET utf8 ;
USE `contact_db` ;

-- -----------------------------------------------------
-- Table `contact_db`.`people`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact_db`.`people` ;

CREATE  TABLE IF NOT EXISTS `contact_db`.`people` (
  `people_id` INT NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(200) NULL ,
  `last_name` VARCHAR(200) NULL ,
  PRIMARY KEY (`people_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact_db`.`email_lkp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact_db`.`email_lkp` ;

CREATE  TABLE IF NOT EXISTS `contact_db`.`email_lkp` (
  `email_id` INT NOT NULL AUTO_INCREMENT ,
  `people_id` INT NULL DEFAULT NULL ,
  `email` VARCHAR(200) NULL ,
  PRIMARY KEY (`email_id`) ,
  INDEX `secondary` (`people_id` ASC) ,
  CONSTRAINT `fk_email_lkp_people1`
    FOREIGN KEY (`people_id` )
    REFERENCES `contact_db`.`people` (`people_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact_db`.`number_lkp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact_db`.`number_lkp` ;

CREATE  TABLE IF NOT EXISTS `contact_db`.`number_lkp` (
  `phone_number_id` INT NOT NULL AUTO_INCREMENT ,
  `people_id` INT NULL DEFAULT NULL ,
  `phone_number` VARCHAR(15) NULL ,
  PRIMARY KEY (`phone_number_id`) ,
  INDEX `secondary` (`people_id` ASC) ,
  CONSTRAINT `fk_number_lkp_people1`
    FOREIGN KEY (`people_id` )
    REFERENCES `contact_db`.`people` (`people_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact_db`.`country_lkp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact_db`.`country_lkp` ;

CREATE  TABLE IF NOT EXISTS `contact_db`.`country_lkp` (
  `country_id` INT NOT NULL AUTO_INCREMENT ,
  `people_id` INT NULL DEFAULT NULL ,
  `country` VARCHAR(200) NULL ,
  PRIMARY KEY (`country_id`) ,
  INDEX `secondary` (`people_id` ASC) ,
  CONSTRAINT `fk_country_lkp_people1`
    FOREIGN KEY (`people_id` )
    REFERENCES `contact_db`.`people` (`people_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact_db`.`city_lkp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact_db`.`city_lkp` ;

CREATE  TABLE IF NOT EXISTS `contact_db`.`city_lkp` (
  `city_id` INT NOT NULL AUTO_INCREMENT ,
  `people_id` INT NULL DEFAULT NULL ,
  `city` VARCHAR(200) NULL ,
  PRIMARY KEY (`city_id`) ,
  INDEX `secondary` (`people_id` ASC) ,
  CONSTRAINT `fk_city_lkp_people1`
    FOREIGN KEY (`people_id` )
    REFERENCES `contact_db`.`people` (`people_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact_db`.`state_lkp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact_db`.`state_lkp` ;

CREATE  TABLE IF NOT EXISTS `contact_db`.`state_lkp` (
  `state_id` INT NOT NULL AUTO_INCREMENT ,
  `people_id` INT NULL DEFAULT NULL ,
  `state` VARCHAR(200) NULL ,
  PRIMARY KEY (`state_id`) ,
  INDEX `secondary` (`people_id` ASC) ,
  CONSTRAINT `fk_state_lkp_people1`
    FOREIGN KEY (`people_id` )
    REFERENCES `contact_db`.`people` (`people_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact_db`.`address_lkp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact_db`.`address_lkp` ;

CREATE  TABLE IF NOT EXISTS `contact_db`.`address_lkp` (
  `address_id` INT NOT NULL AUTO_INCREMENT ,
  `people_id` INT NULL DEFAULT NULL ,
  `address` VARCHAR(150) NULL ,
  PRIMARY KEY (`address_id`) ,
  INDEX `secondary` (`people_id` ASC) ,
  CONSTRAINT `fk_address_lkp_people1`
    FOREIGN KEY (`people_id` )
    REFERENCES `contact_db`.`people` (`people_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `contact_db`.`zip_lkp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contact_db`.`zip_lkp` ;

CREATE  TABLE IF NOT EXISTS `contact_db`.`zip_lkp` (
  `zip_id` INT NOT NULL AUTO_INCREMENT ,
  `people_id` INT NULL DEFAULT NULL ,
  `zip` VARCHAR(25) NULL ,
  PRIMARY KEY (`zip_id`) ,
  INDEX `secondary` (`people_id` ASC) ,
  CONSTRAINT `fk_zip_lkp_people1`
    FOREIGN KEY (`people_id` )
    REFERENCES `contact_db`.`people` (`people_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

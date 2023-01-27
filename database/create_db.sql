-- MySQL Script generated by MySQL Workbench
-- Tue Jan 24 18:40:18 2023
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clients` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(30) NOT NULL,
  `Prenom` TEXT(30) NOT NULL,
  `Num_tel` DECIMAL(10) NULL,
  `Addr_mail` TEXT(60) NULL,
  `Addr_postale` TEXT(255) NULL,
  `Code_postal` DECIMAL(5) NULL,
  `Ville` TEXT(40) NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE INDEX `id_client_UNIQUE` (`id_client` ASC) VISIBLE,
  UNIQUE INDEX `Nom_UNIQUE` (`Nom` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Plateformes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Plateformes` (
  `id_plateformes` INT NOT NULL AUTO_INCREMENT,
  `Nom_plateforme` TEXT(20) NULL,
  `Coordo_GPS` TEXT(20) NULL,
  PRIMARY KEY (`id_plateformes`),
  UNIQUE INDEX `id_plateformes_UNIQUE` (`id_plateformes` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Colis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Colis` (
  `id_colis` INT NOT NULL AUTO_INCREMENT,
  `id_client` INT NOT NULL,
  `id_plateforme` INT NOT NULL,
  PRIMARY KEY (`id_colis`),
  UNIQUE INDEX `id_colis_UNIQUE` (`id_colis` ASC) VISIBLE,
  UNIQUE INDEX `id_client_UNIQUE` (`id_client` ASC) VISIBLE,
  INDEX `id_plateformes_idx` (`id_plateforme` ASC) VISIBLE,
  CONSTRAINT `id_client`
    FOREIGN KEY (`id_client`)
    REFERENCES `mydb`.`Clients` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_plateformes`
    FOREIGN KEY (`id_plateforme`)
    REFERENCES `mydb`.`Plateformes` (`id_plateformes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
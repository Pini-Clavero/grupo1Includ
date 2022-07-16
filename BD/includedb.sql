-- Creamos la BD de Includ

CREATE SCHEMA `includedb` DEFAULT CHARACTER SET utf8 ;

-- Creamos la tabla catergoryProduct

CREATE TABLE `includedb`.`categoryProduct` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Creaamos la tabla colors

CREATE TABLE `includedb`.`colors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `colors` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Creaamos la tabla sizes

CREATE TABLE `includedb`.`size` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `size` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Creamos la tabla products

CREATE TABLE `includedb`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(300) NOT NULL,
  `characteristics` VARCHAR(300) NOT NULL,
  `sizing` VARCHAR(300) NOT NULL,
  `categoryProductId` INT NOT NULL,
  `colorsId` INT NOT NULL,
  `sizeId` INT NOT NULL,
  `price` INT NOT NULL,
  `stock` VARCHAR(45) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_product_categoryProduct_id`
    FOREIGN KEY (`categoryProductId`)
    REFERENCES `includedb`.`categoryProduct` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_colors_id`
    FOREIGN KEY (`colorsId`)
    REFERENCES `includedb`.`colors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_size_id`
    FOREIGN KEY (`sizeId`)
    REFERENCES `includedb`.`size` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Creamos la tabla permissions

CREATE TABLE `includedb`.`permissions` (
  `id` INT NOT NULL,
  `permission` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Creamos la tabla users

CREATE TABLE `includedb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `avatar` VARCHAR(45) NOT NULL,
  `permissionId` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_users_permissions_id`
    FOREIGN KEY (`permissionId`)
    REFERENCES `includedb`.`permissions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);





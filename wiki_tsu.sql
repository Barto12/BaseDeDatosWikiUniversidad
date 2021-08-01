-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema wiki_tsu
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wiki_tsu
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wiki_tsu` DEFAULT CHARACTER SET utf8 ;
USE `wiki_tsu` ;

-- -----------------------------------------------------
-- Table `wiki_tsu`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`comentarios` (
  `idcomentarios` INT NOT NULL AUTO_INCREMENT,
  `pagina_etiqueta` VARCHAR(100) NOT NULL,
  `hora` DATETIME NOT NULL,
  `comentario` TEXT NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `parent` INT NOT NULL,
  `status` ENUM('borrado') NOT NULL,
  PRIMARY KEY (`idcomentarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`recursos infograficos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`recursos infograficos` (
  `id recurso` INT NOT NULL AUTO_INCREMENT,
  `tipo de recurso` VARCHAR(100) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `autor` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `imagenes` VARCHAR(100) NOT NULL,
  `recursos relacionados` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id recurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`materiales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`materiales` (
  `id material` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(100) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `indice de materiales` TINYINT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `audio` VARCHAR(45) NOT NULL,
  `materialescol` VARCHAR(100) NOT NULL,
  `video` VARCHAR(100) NOT NULL,
  `recursos inforgraficos_id recurso` INT NOT NULL,
  PRIMARY KEY (`id material`, `recursos inforgraficos_id recurso`),
  INDEX `fk_materiales_recursos inforgraficos1_idx` (`recursos inforgraficos_id recurso` ASC) VISIBLE,
  CONSTRAINT `fk_materiales_recursos inforgraficos1`
    FOREIGN KEY (`recursos inforgraficos_id recurso`)
    REFERENCES `wiki_tsu`.`recursos infograficos` (`id recurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`temas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`temas` (
  `id tema` INT NOT NULL AUTO_INCREMENT,
  `tipo de tema` VARCHAR(100) NOT NULL,
  `nombre de tema` VARCHAR(100) NOT NULL,
  `autor` VARCHAR(100) NOT NULL,
  `nombre del articulo` VARCHAR(100) NOT NULL,
  `descripcion del articulo` VARCHAR(100) NOT NULL,
  `referencias` VARCHAR(100) NOT NULL,
  `articulos relacionados` VARCHAR(100) NOT NULL,
  `materiales_id material` INT NOT NULL,
  `materiales_recursos inforgraficos_id recurso` INT NOT NULL,
  PRIMARY KEY (`id tema`, `materiales_id material`, `materiales_recursos inforgraficos_id recurso`),
  INDEX `fk_temas_materiales1_idx` (`materiales_id material` ASC, `materiales_recursos inforgraficos_id recurso` ASC) VISIBLE,
  CONSTRAINT `fk_temas_materiales1`
    FOREIGN KEY (`materiales_id material` , `materiales_recursos inforgraficos_id recurso`)
    REFERENCES `wiki_tsu`.`materiales` (`id material` , `recursos inforgraficos_id recurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`Actividades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`Actividades` (
  `id actividad` INT NOT NULL AUTO_INCREMENT,
  `tipo de actividad` VARCHAR(100) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `fecha` DATE NOT NULL,
  `programas_id programa` INT NOT NULL,
  `materiales_id material` INT NOT NULL,
  `materiales_recursos inforgraficos_id recurso` INT NOT NULL,
  PRIMARY KEY (`id actividad`, `programas_id programa`, `materiales_id material`, `materiales_recursos inforgraficos_id recurso`),
  INDEX `fk_Actividades_materiales1_idx` (`materiales_id material` ASC, `materiales_recursos inforgraficos_id recurso` ASC) VISIBLE,
  CONSTRAINT `fk_Actividades_materiales1`
    FOREIGN KEY (`materiales_id material` , `materiales_recursos inforgraficos_id recurso`)
    REFERENCES `wiki_tsu`.`materiales` (`id material` , `recursos inforgraficos_id recurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`programas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`programas` (
  `id programa` INT NOT NULL AUTO_INCREMENT,
  `tipo de programa` VARCHAR(100) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `plan de estudio` VARCHAR(100) NOT NULL,
  `materiales_id material` INT NOT NULL,
  `materiales_recursos inforgraficos_id recurso` INT NOT NULL,
  PRIMARY KEY (`id programa`, `materiales_id material`, `materiales_recursos inforgraficos_id recurso`),
  INDEX `fk_programas_materiales1_idx` (`materiales_id material` ASC, `materiales_recursos inforgraficos_id recurso` ASC) VISIBLE,
  CONSTRAINT `fk_programas_materiales1`
    FOREIGN KEY (`materiales_id material` , `materiales_recursos inforgraficos_id recurso`)
    REFERENCES `wiki_tsu`.`materiales` (`id material` , `recursos inforgraficos_id recurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`paginas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`paginas` (
  `idpaginas` INT NOT NULL AUTO_INCREMENT,
  `etiqueta` VARCHAR(100) NOT NULL,
  `titulo` VARCHAR(150) NOT NULL,
  `hora` DATETIME NOT NULL,
  `cuerpo` TEXT NOT NULL,
  `autor` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `ultimo` ENUM('Y', 'N') NOT NULL,
  `nota` VARCHAR(100) NOT NULL,
  `comentarios_idcomentarios` INT NOT NULL,
  `referrer_pagina_etiqueta` VARCHAR(100) NOT NULL,
  `programas_id programa` INT NOT NULL,
  `Actividades_id actividad` INT NOT NULL,
  `comentarios_idcomentarios1` INT NOT NULL,
  `materiales_id material` INT NOT NULL,
  `temas_id tema` INT NOT NULL,
  `Actividades_id actividad1` INT NOT NULL,
  `Actividades_programas_id programa` INT NOT NULL,
  `programas_id programa1` INT NOT NULL,
  `links_de_etiqueta` VARCHAR(100) NOT NULL,
  `recursos infograficos_id recurso` INT NOT NULL,
  PRIMARY KEY (`idpaginas`, `comentarios_idcomentarios`, `referrer_pagina_etiqueta`, `programas_id programa`, `Actividades_id actividad`, `comentarios_idcomentarios1`, `materiales_id material`, `programas_id programa1`, `links_de_etiqueta`, `recursos infograficos_id recurso`),
  INDEX `fk_paginas_comentarios1_idx` (`comentarios_idcomentarios1` ASC) VISIBLE,
  INDEX `fk_paginas_materiales1_idx` (`materiales_id material` ASC) VISIBLE,
  INDEX `fk_paginas_temas1_idx` (`temas_id tema` ASC) VISIBLE,
  INDEX `fk_paginas_Actividades1_idx` (`Actividades_id actividad1` ASC, `Actividades_programas_id programa` ASC) VISIBLE,
  INDEX `fk_paginas_programas1_idx` (`programas_id programa1` ASC) VISIBLE,
  INDEX `fk_paginas_recursos inforgraficos1_idx` (`recursos infograficos_id recurso` ASC) VISIBLE,
  CONSTRAINT `fk_paginas_comentarios1`
    FOREIGN KEY (`comentarios_idcomentarios1`)
    REFERENCES `wiki_tsu`.`comentarios` (`idcomentarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paginas_materiales1`
    FOREIGN KEY (`materiales_id material`)
    REFERENCES `wiki_tsu`.`materiales` (`id material`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paginas_temas1`
    FOREIGN KEY (`temas_id tema`)
    REFERENCES `wiki_tsu`.`temas` (`id tema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paginas_Actividades1`
    FOREIGN KEY (`Actividades_id actividad1` , `Actividades_programas_id programa`)
    REFERENCES `wiki_tsu`.`Actividades` (`id actividad` , `programas_id programa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paginas_programas1`
    FOREIGN KEY (`programas_id programa1`)
    REFERENCES `wiki_tsu`.`programas` (`id programa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paginas_recursos inforgraficos1`
    FOREIGN KEY (`recursos infograficos_id recurso`)
    REFERENCES `wiki_tsu`.`recursos infograficos` (`id recurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`wiki_tsu usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`wiki_tsu usuarios` (
  `id usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `contraseña` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `cuentarevision` INT NOT NULL,
  `cuentacambios` INT NOT NULL,
  `ediciondobleclick` ENUM('Y', 'N') NOT NULL,
  `horaderegistro` DATETIME NOT NULL,
  `mostrarcomentarios` ENUM('Y', 'N') NOT NULL,
  `status` ENUM('active', 'inactive') NOT NULL,
  `tema` VARCHAR(50) NOT NULL,
  `mostrarcomentariodefault` INT NOT NULL,
  `acls_pagina_etiqueta` VARCHAR(100) NOT NULL,
  `paginas_idpaginas` INT NOT NULL,
  `paginas_comentarios_idcomentarios` INT NOT NULL,
  `paginas_referrer_pagina_etiqueta` VARCHAR(100) NOT NULL,
  `paginas_programas_id programa` INT NOT NULL,
  `paginas_Actividades_id actividad` INT NOT NULL,
  PRIMARY KEY (`id usuario`, `acls_pagina_etiqueta`, `paginas_idpaginas`, `paginas_comentarios_idcomentarios`, `paginas_referrer_pagina_etiqueta`, `paginas_programas_id programa`, `paginas_Actividades_id actividad`),
  INDEX `fk_wiki_tsu usuarios_paginas1_idx` (`paginas_idpaginas` ASC, `paginas_comentarios_idcomentarios` ASC, `paginas_referrer_pagina_etiqueta` ASC, `paginas_programas_id programa` ASC, `paginas_Actividades_id actividad` ASC) VISIBLE,
  CONSTRAINT `fk_wiki_tsu usuarios_paginas1`
    FOREIGN KEY (`paginas_idpaginas` , `paginas_comentarios_idcomentarios` , `paginas_referrer_pagina_etiqueta` , `paginas_programas_id programa` , `paginas_Actividades_id actividad`)
    REFERENCES `wiki_tsu`.`paginas` (`idpaginas` , `comentarios_idcomentarios` , `referrer_pagina_etiqueta` , `programas_id programa` , `Actividades_id actividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`carreras_produccion grafica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`carreras_produccion grafica` (
  `id carrera` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `recursos infograficos_id recurso` INT NOT NULL,
  PRIMARY KEY (`id carrera`, `recursos infograficos_id recurso`),
  INDEX `fk_carreras_produccion grafica_recursos infograficos1_idx` (`recursos infograficos_id recurso` ASC) VISIBLE,
  CONSTRAINT `fk_carreras_produccion grafica_recursos infograficos1`
    FOREIGN KEY (`recursos infograficos_id recurso`)
    REFERENCES `wiki_tsu`.`recursos infograficos` (`id recurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`carreras_software`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`carreras_software` (
  `id carrera` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `recursos infograficos_id recurso` INT NOT NULL,
  PRIMARY KEY (`id carrera`, `recursos infograficos_id recurso`),
  INDEX `fk_carreras_software_recursos infograficos1_idx` (`recursos infograficos_id recurso` ASC) VISIBLE,
  CONSTRAINT `fk_carreras_software_recursos infograficos1`
    FOREIGN KEY (`recursos infograficos_id recurso`)
    REFERENCES `wiki_tsu`.`recursos infograficos` (`id recurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`carreras_Hoteles y restaurantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`carreras_Hoteles y restaurantes` (
  `id carrera` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `recursos infograficos_id recurso` INT NOT NULL,
  PRIMARY KEY (`id carrera`, `recursos infograficos_id recurso`),
  INDEX `fk_carreras_Hoteles y restaurantes_recursos infograficos1_idx` (`recursos infograficos_id recurso` ASC) VISIBLE,
  CONSTRAINT `fk_carreras_Hoteles y restaurantes_recursos infograficos1`
    FOREIGN KEY (`recursos infograficos_id recurso`)
    REFERENCES `wiki_tsu`.`recursos infograficos` (`id recurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`carreras_ gestion de proyectos sociales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`carreras_ gestion de proyectos sociales` (
  `id carrera` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `recursos infograficos_id recurso` INT NOT NULL,
  PRIMARY KEY (`id carrera`, `recursos infograficos_id recurso`),
  INDEX `fk_carreras_ gestion de proyectos sociales_recursos infogra_idx` (`recursos infograficos_id recurso` ASC) VISIBLE,
  CONSTRAINT `fk_carreras_ gestion de proyectos sociales_recursos infografi1`
    FOREIGN KEY (`recursos infograficos_id recurso`)
    REFERENCES `wiki_tsu`.`recursos infograficos` (`id recurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`carreras_sistemas administrativos y contables`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`carreras_sistemas administrativos y contables` (
  `id carrera` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `recursos infograficos_id recurso` INT NOT NULL,
  PRIMARY KEY (`id carrera`, `recursos infograficos_id recurso`),
  INDEX `fk_carreras_sistemas administrativos y contables_recursos i_idx` (`recursos infograficos_id recurso` ASC) VISIBLE,
  CONSTRAINT `fk_carreras_sistemas administrativos y contables_recursos inf1`
    FOREIGN KEY (`recursos infograficos_id recurso`)
    REFERENCES `wiki_tsu`.`recursos infograficos` (`id recurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`carreras-diseño mecanico y manufactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`carreras-diseño mecanico y manufactura` (
  `id carrera` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `recursos infograficos_id recurso` INT NOT NULL,
  PRIMARY KEY (`id carrera`, `recursos infograficos_id recurso`),
  INDEX `fk_carreras-diseño mecanico y manufactura_recursos infogra_idx` (`recursos infograficos_id recurso` ASC) VISIBLE,
  CONSTRAINT `fk_carreras-diseño mecanico y manufactura_recursos infografi1`
    FOREIGN KEY (`recursos infograficos_id recurso`)
    REFERENCES `wiki_tsu`.`recursos infograficos` (`id recurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`acls`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`acls` (
  `pagina_etiqueta` VARCHAR(100) NOT NULL,
  `leer_acl` TEXT NOT NULL,
  `escribir_acl` TEXT NOT NULL,
  `comentar_leer_acl` TEXT NOT NULL,
  `comentar_post_acl` TEXT NOT NULL,
  `paginas_idpaginas` INT NOT NULL,
  `paginas_comentarios_idcomentarios` INT NOT NULL,
  `paginas_programas_id programa` INT NOT NULL,
  `paginas_Actividades_id actividad` INT NOT NULL,
  `wiki_tsu usuarios_id usuario` INT NOT NULL,
  `wiki_tsu usuarios_acls_pagina_etiqueta` VARCHAR(100) NOT NULL,
  `wiki_tsu usuarios_paginas_idpaginas` INT NOT NULL,
  `wiki_tsu usuarios_paginas_comentarios_idcomentarios` INT NOT NULL,
  `wiki_tsu usuarios_paginas_referrer_pagina_etiqueta` VARCHAR(100) NOT NULL,
  `wiki_tsu usuarios_paginas_programas_id programa` INT NOT NULL,
  `wiki_tsu usuarios_paginas_Actividades_id actividad` INT NOT NULL,
  PRIMARY KEY (`pagina_etiqueta`, `paginas_idpaginas`, `paginas_comentarios_idcomentarios`, `paginas_programas_id programa`, `paginas_Actividades_id actividad`, `wiki_tsu usuarios_id usuario`, `wiki_tsu usuarios_acls_pagina_etiqueta`, `wiki_tsu usuarios_paginas_idpaginas`, `wiki_tsu usuarios_paginas_comentarios_idcomentarios`, `wiki_tsu usuarios_paginas_referrer_pagina_etiqueta`, `wiki_tsu usuarios_paginas_programas_id programa`, `wiki_tsu usuarios_paginas_Actividades_id actividad`),
  INDEX `fk_acls_paginas1_idx` (`paginas_idpaginas` ASC, `paginas_comentarios_idcomentarios` ASC, `paginas_programas_id programa` ASC, `paginas_Actividades_id actividad` ASC) VISIBLE,
  INDEX `fk_acls_wiki_tsu usuarios1_idx` (`wiki_tsu usuarios_id usuario` ASC, `wiki_tsu usuarios_acls_pagina_etiqueta` ASC, `wiki_tsu usuarios_paginas_idpaginas` ASC, `wiki_tsu usuarios_paginas_comentarios_idcomentarios` ASC, `wiki_tsu usuarios_paginas_referrer_pagina_etiqueta` ASC, `wiki_tsu usuarios_paginas_programas_id programa` ASC, `wiki_tsu usuarios_paginas_Actividades_id actividad` ASC) VISIBLE,
  CONSTRAINT `fk_acls_paginas1`
    FOREIGN KEY (`paginas_idpaginas` , `paginas_comentarios_idcomentarios` , `paginas_programas_id programa` , `paginas_Actividades_id actividad`)
    REFERENCES `wiki_tsu`.`paginas` (`idpaginas` , `comentarios_idcomentarios` , `programas_id programa` , `Actividades_id actividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acls_wiki_tsu usuarios1`
    FOREIGN KEY (`wiki_tsu usuarios_id usuario` , `wiki_tsu usuarios_acls_pagina_etiqueta` , `wiki_tsu usuarios_paginas_idpaginas` , `wiki_tsu usuarios_paginas_comentarios_idcomentarios` , `wiki_tsu usuarios_paginas_referrer_pagina_etiqueta` , `wiki_tsu usuarios_paginas_programas_id programa` , `wiki_tsu usuarios_paginas_Actividades_id actividad`)
    REFERENCES `wiki_tsu`.`wiki_tsu usuarios` (`id usuario` , `acls_pagina_etiqueta` , `paginas_idpaginas` , `paginas_comentarios_idcomentarios` , `paginas_referrer_pagina_etiqueta` , `paginas_programas_id programa` , `paginas_Actividades_id actividad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`sesiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`sesiones` (
  `idsesion` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `sesion_iniciada` TINYINT NOT NULL,
  `wiki_tsu usuarios_id usuario` INT NOT NULL,
  `wiki_tsu usuarios_acls_pagina_etiqueta` VARCHAR(100) NOT NULL,
  `acls_pagina_etiqueta` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idsesion`, `wiki_tsu usuarios_id usuario`, `wiki_tsu usuarios_acls_pagina_etiqueta`, `acls_pagina_etiqueta`),
  INDEX `fk_sesiones_wiki_tsu usuarios1_idx` (`wiki_tsu usuarios_id usuario` ASC, `wiki_tsu usuarios_acls_pagina_etiqueta` ASC) VISIBLE,
  INDEX `fk_sesiones_acls1_idx` (`acls_pagina_etiqueta` ASC) VISIBLE,
  CONSTRAINT `fk_sesiones_wiki_tsu usuarios1`
    FOREIGN KEY (`wiki_tsu usuarios_id usuario` , `wiki_tsu usuarios_acls_pagina_etiqueta`)
    REFERENCES `wiki_tsu`.`wiki_tsu usuarios` (`id usuario` , `acls_pagina_etiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sesiones_acls1`
    FOREIGN KEY (`acls_pagina_etiqueta`)
    REFERENCES `wiki_tsu`.`acls` (`pagina_etiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`profesores` (
  `id profesor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `id departamento` INT NOT NULL,
  `id usuario` INT NOT NULL,
  `sesiones_idsesion` INT NOT NULL,
  PRIMARY KEY (`id profesor`, `sesiones_idsesion`),
  INDEX `id departamento_idx` (`id departamento` ASC) VISIBLE,
  INDEX `id usuario_idx` (`id usuario` ASC) VISIBLE,
  INDEX `fk_profesores_sesiones1_idx` (`sesiones_idsesion` ASC) VISIBLE,
  CONSTRAINT `id departamento`
    FOREIGN KEY (`id departamento`)
    REFERENCES `wiki_tsu`.`departamento` (`id departamento`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `id usuario`
    FOREIGN KEY (`id usuario`)
    REFERENCES `wiki_tsu`.`wiki_tsu usuarios` (`id usuario`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_profesores_sesiones1`
    FOREIGN KEY (`sesiones_idsesion`)
    REFERENCES `wiki_tsu`.`sesiones` (`idsesion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`TSU`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`TSU` (
  `id tsu` INT NOT NULL AUTO_INCREMENT,
  `nombre programa` VARCHAR(45) NOT NULL,
  `tipo de programa` VARCHAR(45) NOT NULL,
  `carreras` VARCHAR(100) NOT NULL,
  `profesores_id profesor` INT NOT NULL,
  `profesores_sesiones_idsesion` INT NOT NULL,
  `alumnos_id alumno` INT NOT NULL,
  `alumnos_wiki_tsu usuarios_id usuario` INT NOT NULL,
  `alumnos_wiki_tsu usuarios_acls_pagina_etiqueta` VARCHAR(100) NOT NULL,
  `alumnos_sesiones_idsesion` INT NOT NULL,
  `tsu_carreras_id carrera` INT NOT NULL,
  `comentarios_idcomentarios` INT NOT NULL,
  PRIMARY KEY (`id tsu`, `tsu_carreras_id carrera`, `comentarios_idcomentarios`),
  INDEX `fk_TSU_profesores1_idx` (`profesores_id profesor` ASC, `profesores_sesiones_idsesion` ASC) VISIBLE,
  INDEX `fk_TSU_alumnos1_idx` (`alumnos_id alumno` ASC, `alumnos_wiki_tsu usuarios_id usuario` ASC, `alumnos_wiki_tsu usuarios_acls_pagina_etiqueta` ASC, `alumnos_sesiones_idsesion` ASC) VISIBLE,
  INDEX `fk_TSU_tsu_carreras1_idx` (`tsu_carreras_id carrera` ASC) VISIBLE,
  INDEX `fk_TSU_comentarios1_idx` (`comentarios_idcomentarios` ASC) VISIBLE,
  CONSTRAINT `fk_TSU_profesores1`
    FOREIGN KEY (`profesores_id profesor` , `profesores_sesiones_idsesion`)
    REFERENCES `wiki_tsu`.`profesores` (`id profesor` , `sesiones_idsesion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TSU_alumnos1`
    FOREIGN KEY (`alumnos_id alumno` , `alumnos_wiki_tsu usuarios_id usuario` , `alumnos_wiki_tsu usuarios_acls_pagina_etiqueta` , `alumnos_sesiones_idsesion`)
    REFERENCES `wiki_tsu`.`alumnos` (`id alumno` , `wiki_tsu usuarios_id usuario` , `wiki_tsu usuarios_acls_pagina_etiqueta` , `sesiones_idsesion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TSU_tsu_carreras1`
    FOREIGN KEY (`tsu_carreras_id carrera`)
    REFERENCES `wiki_tsu`.`tsu_carreras` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TSU_comentarios1`
    FOREIGN KEY (`comentarios_idcomentarios`)
    REFERENCES `wiki_tsu`.`comentarios` (`idcomentarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`departamento` (
  `id departamento` INT NOT NULL AUTO_INCREMENT,
  `nombre departamento` VARCHAR(100) NOT NULL,
  `programa` VARCHAR(45) NOT NULL,
  `carrera` VARCHAR(45) NOT NULL,
  `tipo de programa` VARCHAR(45) NOT NULL,
  `TSU_id tsu` INT NOT NULL,
  `TSU_tsu_carreras_id carrera` INT NOT NULL,
  PRIMARY KEY (`id departamento`, `TSU_id tsu`, `TSU_tsu_carreras_id carrera`),
  INDEX `fk_departamento_TSU1_idx` (`TSU_id tsu` ASC, `TSU_tsu_carreras_id carrera` ASC) VISIBLE,
  CONSTRAINT `fk_departamento_TSU1`
    FOREIGN KEY (`TSU_id tsu` , `TSU_tsu_carreras_id carrera`)
    REFERENCES `wiki_tsu`.`TSU` (`id tsu` , `tsu_carreras_id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`tsu_carreras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`tsu_carreras` (
  `id carrera` INT NOT NULL AUTO_INCREMENT,
  `nombre carrera` VARCHAR(100) NOT NULL,
  `departamento` VARCHAR(100) NOT NULL,
  `tipo de carrera` VARCHAR(100) NOT NULL,
  `carreras_produccion grafica_id carrera` INT NOT NULL,
  `carreras_software_id carrera` INT NOT NULL,
  `carreras_Hoteles y restaurantes_id carrera` INT NOT NULL,
  `carreras_ gestion de proyectos sociales_id carrera` INT NOT NULL,
  `carreras_Hoteles y restaurantes_id carrera1` INT NOT NULL,
  `carreras_sistemas administrativos y contables_id carrera` INT NOT NULL,
  `carreras-diseño mecanico y manufactura_id carrera` INT NOT NULL,
  `departamento_id departamento` INT NOT NULL,
  PRIMARY KEY (`id carrera`, `carreras_produccion grafica_id carrera`, `carreras_software_id carrera`, `carreras_Hoteles y restaurantes_id carrera`, `carreras_ gestion de proyectos sociales_id carrera`, `carreras_Hoteles y restaurantes_id carrera1`, `carreras_sistemas administrativos y contables_id carrera`, `carreras-diseño mecanico y manufactura_id carrera`, `departamento_id departamento`),
  INDEX `fk_tsu_carreras_carreras_produccion grafica1_idx` (`carreras_produccion grafica_id carrera` ASC) VISIBLE,
  INDEX `fk_tsu_carreras_carreras_software1_idx` (`carreras_software_id carrera` ASC) VISIBLE,
  INDEX `fk_tsu_carreras_carreras_Hoteles y restaurantes1_idx` (`carreras_Hoteles y restaurantes_id carrera` ASC) VISIBLE,
  INDEX `fk_tsu_carreras_carreras_ gestion de proyectos sociales1_idx` (`carreras_ gestion de proyectos sociales_id carrera` ASC) VISIBLE,
  INDEX `fk_tsu_carreras_carreras_Hoteles y restaurantes2_idx` (`carreras_Hoteles y restaurantes_id carrera1` ASC) VISIBLE,
  INDEX `fk_tsu_carreras_carreras_sistemas administrativos y contabl_idx` (`carreras_sistemas administrativos y contables_id carrera` ASC) VISIBLE,
  INDEX `fk_tsu_carreras_carreras-diseño mecanico y manufactura1_idx` (`carreras-diseño mecanico y manufactura_id carrera` ASC) VISIBLE,
  INDEX `fk_tsu_carreras_departamento1_idx` (`departamento_id departamento` ASC) VISIBLE,
  CONSTRAINT `fk_tsu_carreras_carreras_produccion grafica1`
    FOREIGN KEY (`carreras_produccion grafica_id carrera`)
    REFERENCES `wiki_tsu`.`carreras_produccion grafica` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tsu_carreras_carreras_software1`
    FOREIGN KEY (`carreras_software_id carrera`)
    REFERENCES `wiki_tsu`.`carreras_software` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tsu_carreras_carreras_Hoteles y restaurantes1`
    FOREIGN KEY (`carreras_Hoteles y restaurantes_id carrera`)
    REFERENCES `wiki_tsu`.`carreras_Hoteles y restaurantes` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tsu_carreras_carreras_ gestion de proyectos sociales1`
    FOREIGN KEY (`carreras_ gestion de proyectos sociales_id carrera`)
    REFERENCES `wiki_tsu`.`carreras_ gestion de proyectos sociales` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tsu_carreras_carreras_Hoteles y restaurantes2`
    FOREIGN KEY (`carreras_Hoteles y restaurantes_id carrera1`)
    REFERENCES `wiki_tsu`.`carreras_Hoteles y restaurantes` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tsu_carreras_carreras_sistemas administrativos y contables1`
    FOREIGN KEY (`carreras_sistemas administrativos y contables_id carrera`)
    REFERENCES `wiki_tsu`.`carreras_sistemas administrativos y contables` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tsu_carreras_carreras-diseño mecanico y manufactura1`
    FOREIGN KEY (`carreras-diseño mecanico y manufactura_id carrera`)
    REFERENCES `wiki_tsu`.`carreras-diseño mecanico y manufactura` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tsu_carreras_departamento1`
    FOREIGN KEY (`departamento_id departamento`)
    REFERENCES `wiki_tsu`.`departamento` (`id departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`alumnos` (
  `id alumno` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `id carrera` INT NOT NULL,
  `wiki_tsu usuarios_id usuario` INT NOT NULL,
  `wiki_tsu usuarios_acls_pagina_etiqueta` VARCHAR(100) NOT NULL,
  `sesiones_idsesion` INT NOT NULL,
  `carreras_produccion grafica_id carrera` INT NOT NULL,
  `carreras_software_id carrera` INT NOT NULL,
  `carreras_Hoteles y restaurantes_id carrera` INT NOT NULL,
  `carreras_ gestion de proyectos sociales_id carrera` INT NOT NULL,
  `carreras-diseño mecanico y manufactura_id carrera` INT NOT NULL,
  `carreras_sistemas administrativos y contables_id carrera` INT NOT NULL,
  PRIMARY KEY (`id alumno`, `wiki_tsu usuarios_id usuario`, `wiki_tsu usuarios_acls_pagina_etiqueta`, `sesiones_idsesion`, `carreras_produccion grafica_id carrera`, `carreras_software_id carrera`, `carreras_Hoteles y restaurantes_id carrera`, `carreras_ gestion de proyectos sociales_id carrera`, `carreras-diseño mecanico y manufactura_id carrera`, `carreras_sistemas administrativos y contables_id carrera`),
  INDEX `id carrera_idx` (`id carrera` ASC) VISIBLE,
  INDEX `fk_alumnos_wiki_tsu usuarios1_idx` (`wiki_tsu usuarios_id usuario` ASC, `wiki_tsu usuarios_acls_pagina_etiqueta` ASC) VISIBLE,
  INDEX `fk_alumnos_sesiones1_idx` (`sesiones_idsesion` ASC) VISIBLE,
  INDEX `fk_alumnos_carreras_produccion grafica1_idx` (`carreras_produccion grafica_id carrera` ASC) VISIBLE,
  INDEX `fk_alumnos_carreras_software1_idx` (`carreras_software_id carrera` ASC) VISIBLE,
  INDEX `fk_alumnos_carreras_Hoteles y restaurantes1_idx` (`carreras_Hoteles y restaurantes_id carrera` ASC) VISIBLE,
  INDEX `fk_alumnos_carreras_ gestion de proyectos sociales1_idx` (`carreras_ gestion de proyectos sociales_id carrera` ASC) VISIBLE,
  INDEX `fk_alumnos_carreras-diseño mecanico y manufactura1_idx` (`carreras-diseño mecanico y manufactura_id carrera` ASC) VISIBLE,
  INDEX `fk_alumnos_carreras_sistemas administrativos y contables1_idx` (`carreras_sistemas administrativos y contables_id carrera` ASC) VISIBLE,
  CONSTRAINT `id carrera`
    FOREIGN KEY (`id carrera`)
    REFERENCES `wiki_tsu`.`tsu_carreras` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_alumnos_wiki_tsu usuarios1`
    FOREIGN KEY (`wiki_tsu usuarios_id usuario` , `wiki_tsu usuarios_acls_pagina_etiqueta`)
    REFERENCES `wiki_tsu`.`wiki_tsu usuarios` (`id usuario` , `acls_pagina_etiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_sesiones1`
    FOREIGN KEY (`sesiones_idsesion`)
    REFERENCES `wiki_tsu`.`sesiones` (`idsesion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_carreras_produccion grafica1`
    FOREIGN KEY (`carreras_produccion grafica_id carrera`)
    REFERENCES `wiki_tsu`.`carreras_produccion grafica` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_carreras_software1`
    FOREIGN KEY (`carreras_software_id carrera`)
    REFERENCES `wiki_tsu`.`carreras_software` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_carreras_Hoteles y restaurantes1`
    FOREIGN KEY (`carreras_Hoteles y restaurantes_id carrera`)
    REFERENCES `wiki_tsu`.`carreras_Hoteles y restaurantes` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_carreras_ gestion de proyectos sociales1`
    FOREIGN KEY (`carreras_ gestion de proyectos sociales_id carrera`)
    REFERENCES `wiki_tsu`.`carreras_ gestion de proyectos sociales` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_carreras-diseño mecanico y manufactura1`
    FOREIGN KEY (`carreras-diseño mecanico y manufactura_id carrera`)
    REFERENCES `wiki_tsu`.`carreras-diseño mecanico y manufactura` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumnos_carreras_sistemas administrativos y contables1`
    FOREIGN KEY (`carreras_sistemas administrativos y contables_id carrera`)
    REFERENCES `wiki_tsu`.`carreras_sistemas administrativos y contables` (`id carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wiki_tsu`.`miembros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wiki_tsu`.`miembros` (
  `id miembro` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `no_miembro` INT NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `edad` INT NOT NULL,
  `status` VARCHAR(100) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(50) NOT NULL,
  `matricula` VARCHAR(100) NOT NULL,
  `id usuario` INT NOT NULL,
  `id alumno` INT NOT NULL,
  `id profesor` INT NOT NULL,
  `alumnos_id alumno` INT NOT NULL,
  `profesores_id profesor` INT NOT NULL,
  `sesiones_idsesion` INT NOT NULL,
  PRIMARY KEY (`id miembro`, `alumnos_id alumno`, `profesores_id profesor`, `sesiones_idsesion`),
  INDEX `id usuario_idx` (`id usuario` ASC, `id miembro` ASC) VISIBLE,
  INDEX `fk_miembros_alumnos1_idx` (`alumnos_id alumno` ASC) VISIBLE,
  INDEX `fk_miembros_profesores1_idx` (`profesores_id profesor` ASC) VISIBLE,
  INDEX `fk_miembros_sesiones1_idx` (`sesiones_idsesion` ASC) VISIBLE,
  CONSTRAINT `id usuario`
    FOREIGN KEY (`id usuario` , `id miembro`)
    REFERENCES `wiki_tsu`.`wiki_tsu usuarios` (`id usuario` , `id usuario`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_miembros_alumnos1`
    FOREIGN KEY (`alumnos_id alumno`)
    REFERENCES `wiki_tsu`.`alumnos` (`id alumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_miembros_profesores1`
    FOREIGN KEY (`profesores_id profesor`)
    REFERENCES `wiki_tsu`.`profesores` (`id profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_miembros_sesiones1`
    FOREIGN KEY (`sesiones_idsesion`)
    REFERENCES `wiki_tsu`.`sesiones` (`idsesion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

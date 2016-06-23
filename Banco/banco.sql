
CREATE TABLE IF NOT EXISTS `energiapura`.`fornecedores` (
  `idfornecedor` INT(10) NOT NULL COMMENT '',
  `nome` VARCHAR(50) NOT NULL COMMENT '',
  `preco_luz_Kwh` FLOAT NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idfornecedor`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `energiapura`.`relatorio_acesso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `energiapura`.`relatorio_acesso` (
  `idrelatorio_acesso` INT(11) NOT NULL COMMENT '',
  `idUsuario` INT(11) NULL DEFAULT NULL COMMENT '',
  `nome` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `curso` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `nivel` INT(1) NULL DEFAULT NULL COMMENT '',
  `data_hora` VARCHAR(30) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idrelatorio_acesso`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `energiapura`.`relatorio_consumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `energiapura`.`relatorio_consumo` (
  `id_consumo` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `formulario` FLOAT NULL DEFAULT NULL COMMENT '',
  `kwh` FLOAT NULL DEFAULT NULL COMMENT '',
  `reais` FLOAT NULL DEFAULT NULL COMMENT '',
  `data_hora` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`id_consumo`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `energiapura`.`relatorio_lampadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `energiapura`.`relatorio_lampadas` (
  `idRelatorio_lampadas` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `bloco` VARCHAR(2) NULL DEFAULT 'B' COMMENT '',
  `numSala` INT(11) NULL DEFAULT NULL COMMENT '',
  `numLampada` VARCHAR(4) NULL DEFAULT NULL COMMENT '',
  `quem` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `on_off` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `data_hora` VARCHAR(30) NULL DEFAULT NULL COMMENT '',
  `situacao` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idRelatorio_lampadas`)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `energiapura`.`tipo_de_lampada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `energiapura`.`tipo_de_lampada` (
  `idtipo_de_lampada` INT(11) NOT NULL COMMENT '',
  `tipo_de_lampada` VARCHAR(100) NULL DEFAULT NULL COMMENT '',
  `consumo_w` FLOAT NULL DEFAULT NULL COMMENT '',
  `consumo_KhW` FLOAT NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idtipo_de_lampada`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `energiapura`.`salas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `energiapura`.`salas` (
  `numSala` INT(11) NOT NULL COMMENT '',
  `andar` INT(11) NOT NULL COMMENT '',
  `bloco` VARCHAR(2) NULL DEFAULT 'B' COMMENT '',
  `tipo_de_lampada` INT(11) NULL DEFAULT NULL COMMENT '',
  `numLampada` VARCHAR(4) NULL DEFAULT NULL COMMENT '',
  `on_off_Servidor` INT(1) NULL DEFAULT '0' COMMENT '',
  `on_off_Fisico` INT(1) NULL DEFAULT '0' COMMENT '',
  `on_off_Sistema` INT(1) NULL DEFAULT '0' COMMENT '',
  INDEX `fk_salas_tipo_de_lampada_idx` (`tipo_de_lampada` ASC)  COMMENT '',
  PRIMARY KEY (`numSala`)  COMMENT '',
  CONSTRAINT `fk_salas_tipo_de_lampada`
    FOREIGN KEY (`tipo_de_lampada`)
    REFERENCES `energiapura`.`tipo_de_lampada` (`idtipo_de_lampada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `energiapura`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `energiapura`.`usuario` (
  `idUsuario` INT(11) NOT NULL COMMENT '',
  `nome` VARCHAR(45) NOT NULL COMMENT '',
  `idade` INT(11) NULL DEFAULT NULL COMMENT '',
  `email` VARCHAR(60) NOT NULL COMMENT '',
  `curso` VARCHAR(45) NOT NULL COMMENT '',
  `senha` VARCHAR(45) NOT NULL COMMENT '',
  `nivel` INT(11) NOT NULL COMMENT '',
  PRIMARY KEY (`idUsuario`, `email`)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `energiapura`.`grade_de_aulas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `energiapura`.`grade_de_aulas` (
  `salas_numSala` INT(11) NOT NULL COMMENT '',
  `dia_da_semana` VARCHAR(20) NOT NULL COMMENT '',
  `aula1` VARCHAR(45) NULL COMMENT '',
  `aula2` VARCHAR(45) NULL COMMENT '',
  `aula3` VARCHAR(45) NULL COMMENT '',
  `aula4` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`salas_numSala`)  COMMENT '',
  CONSTRAINT `fk_grade_de_aulas_salas1`
    FOREIGN KEY (`salas_numSala`)
    REFERENCES `energiapura`.`salas` (`numSala`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `energiapura` ;

-- -----------------------------------------------------
-- procedure SP_calcula_energia
-- -----------------------------------------------------

DELIMITER $$
USE `energiapura`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_calcula_energia`(escolha int)
begin
    
    declare geral_KwH,geral_preco,preco_KwH float;
    declare peso int;
    declare sala1,sala2,sala3,sala4,sala5,sala6,sala7,sala8,sala9,sala10,wes float;
	
    select preco_luz_Kwh from fornecedores where idfornecedor = 1 into preco_KwH;
	
    case escolha
    when 00 then
	
    select sum(on_off_Fisico) from salas where numSala = 1 into sala1;
    
    set wes = sala1;
    
    select sum(on_off_Servidor) from salas where numSala = 1 into sala1;
    
    set wes = wes + sala1;
    
    select sum(on_off_Sistema) from salas where numSala = 1 into sala1;
    
    set wes = wes + sala1;
    set geral_KwH = wes;
	set sala1 = round(wes * preco_KwH,2);
    set wes = 0;
    select sum(on_off_Fisico) from salas where numSala = 2 into sala2;
    
    set wes = sala2;
    
    select sum(on_off_Servidor) from salas where numSala = 2 into sala2;
    
    set wes = wes + sala2;
    
    select sum(on_off_Sistema) from salas where numSala = 2 into sala2;
    
    set wes = wes + sala2;
    set geral_KwH = geral_KwH + wes;
	set sala2 = round(wes * preco_KwH,2);
    set wes = 0;
    
    select sum(on_off_Fisico) from salas where numSala = 3 into sala3;
    
    set wes = sala3;
    
    select sum(on_off_Servidor) from salas where numSala = 3 into sala3;
    
    set wes = wes + sala3;
    
    select sum(on_off_Sistema) from salas where numSala = 3 into sala3;
    
    set wes = wes + sala3;
    set geral_KwH = geral_KwH + wes;
	set sala3 = round(wes * preco_KwH,2);
    set wes = 0;
    select sum(on_off_Fisico) from salas where numSala = 4 into sala4;
    
    set wes = sala4;
    
    select sum(on_off_Servidor) from salas where numSala = 4 into sala4;
    
    set wes = wes + sala4;
    
    select sum(on_off_Sistema) from salas where numSala = 4 into sala4;
    
    set wes = wes + sala4;
    set geral_KwH = geral_KwH + wes;
	set sala4 = round(wes * preco_KwH,2);
    set wes = 0;
    
    select sum(on_off_Fisico) from salas where numSala = 5 into sala5;
    
    set wes = sala5;
    
    select sum(on_off_Servidor) from salas where numSala = 5 into sala5;
    
    set wes = wes + sala5;
    
    select sum(on_off_Sistema) from salas where numSala = 5 into sala5;
    
	set wes = wes + sala5;
    set geral_KwH = geral_KwH + wes;
	set sala5 = round(wes * preco_KwH,2);
    set wes = 0;
    
    select sum(on_off_Fisico) from salas where numSala = 6 into sala6;
    
    set wes = sala6;
    
    select sum(on_off_Servidor) from salas where numSala = 6 into sala6;
    
    set wes = wes + sala6;
    
    select sum(on_off_Sistema) from salas where numSala = 6 into sala6;
    
    set wes = wes + sala6;
    set geral_KwH = geral_KwH + wes;
	set sala6 = round(wes * preco_KwH,2);
    set wes = 0;
    
    select sum(on_off_Fisico) from salas where numSala = 7 into sala7;
    
    set wes = sala7;
    
    select sum(on_off_Servidor) from salas where numSala = 7 into sala7;
    
    set wes = wes + sala7;
    
    select sum(on_off_Sistema) from salas where numSala = 7 into sala7;
    
    set wes = wes + sala7;
    set geral_KwH = geral_KwH + wes;
	set sala7 = round(wes * preco_KwH,2);
    set wes = 0;
    
    select sum(on_off_Fisico) from salas where numSala = 8 into sala8;
    
    set wes = sala8;
    
    select sum(on_off_Servidor) from salas where numSala = 8 into sala8;
    
    set wes = wes + sala8;
    
    select sum(on_off_Sistema) from salas where numSala = 8 into sala8;
    
    set wes = wes + sala8;
    set geral_KwH = geral_KwH + wes;
	set sala8 = round(wes * preco_KwH,2);
    set wes = 0;
    
    select sum(on_off_Fisico) from salas where numSala = 9 into sala9;
    
    set wes = sala9;
    
    select sum(on_off_Servidor) from salas where numSala = 9 into sala9;
    
    set wes = wes + sala9;
    
    select sum(on_off_Sistema) from salas where numSala = 9 into sala9;
    
    set wes = wes + sala9;
    set geral_KwH = geral_KwH + wes;
	set sala9 = round(wes * preco_KwH,2);
    set wes = 0;
	select sum(on_off_Fisico) from salas where numSala =10 into sala10;
    
    set wes = sala10;
    
    select sum(on_off_Servidor) from salas where numSala = 10 into sala10;
    
    set wes = wes + sala10;
    
    select sum(on_off_Sistema) from salas where numSala = 10 into sala10;
    
    set wes = wes + sala10;
    set geral_KwH = geral_KwH + wes;
	set sala10 = round(wes * preco_KwH,2);
    set wes = 0;
    
    
    set geral_preco = sala1 +sala2 +sala3 +sala4 +sala5 +sala6 +sala7 +sala8 +sala9 + sala10;
    
    
    insert into relatorio_consumo(formulario,kwh,reais,data_hora) values(00,geral_KwH,geral_preco,now());
	
    when 1 then
    -- calculo sala 1
	select sum(on_off_Fisico) from salas where numSala = 1 into sala1;
    
    set wes = sala1;
    
    select sum(on_off_Servidor) from salas where numSala = 1 into sala1;
    
    set wes = wes + sala1;
    
    select sum(on_off_Sistema) from salas where numSala = 1 into sala1;
    
    set wes = wes + sala1;
	set sala1 = round(wes * preco_KwH,2);
    insert into relatorio_consumo(formulario,kwh,reais,data_hora) values(1,wes,sala1,now());
    set wes = 0;
    
    
    
    when 2 then
    -- calculo sala 2
	select sum(on_off_Fisico) from salas where numSala = 2 into sala2;
    
    set wes = sala2;
    
    select sum(on_off_Servidor) from salas where numSala = 2 into sala2;
    
    set wes = wes + sala2;
    
    select sum(on_off_Sistema) from salas where numSala = 2 into sala2;
    
    set wes = wes + sala2;
	set sala2 = round(wes * preco_KwH,2);
    insert into relatorio_consumo(formulario,kwh,reais,data_hora)values(2,wes,sala2,now());
    set wes = 0;
    
    when 3 then
    -- calculo sala 3
	select sum(on_off_Fisico) from salas where numSala = 3 into sala3;
    
    set wes = sala3;
    
    select sum(on_off_Servidor) from salas where numSala = 3 into sala3;
    
    set wes = wes + sala3;
    
    select sum(on_off_Sistema) from salas where numSala = 3 into sala3;
    
    set wes = wes + sala3;
	set sala3 = round(wes * preco_KwH,2);
    insert into relatorio_consumo(formulario,kwh,reais,data_hora) values(3,wes,sala3,now());
    set wes = 0;
    
    when 4 then
    -- calculo sala 4
	select sum(on_off_Fisico) from salas where numSala = 4 into sala4;
    
    set wes = sala4;
    
    select sum(on_off_Servidor) from salas where numSala = 4 into sala4;
    
    set wes = wes + sala4;
    
    select sum(on_off_Sistema) from salas where numSala = 4 into sala4;
    
    set wes = wes + sala4;
	set sala4 = round(wes * preco_KwH,2);
    insert into relatorio_consumo(formulario,kwh,reais,data_hora) values(4,wes,sala4,now());
    set wes = 0;
    
    when 5 then
    -- calculo sala 5
	select sum(on_off_Fisico) from salas where numSala = 5 into sala5;
    
    set wes = sala5;
    
    select sum(on_off_Servidor) from salas where numSala = 5 into sala5;
    
    set wes = wes + sala5;
    
    select sum(on_off_Sistema) from salas where numSala = 5 into sala5;
    
	set wes = wes + sala5;
	set sala5 = round(wes * preco_KwH,2);
    insert into relatorio_consumo(formulario,kwh,reais,data_hora) values(5,wes,sala5,now());
    set wes = 0;
    
    when 6 then
    -- calculo sala 6
	select sum(on_off_Fisico) from salas where numSala = 6 into sala6;
    
    set wes = sala6;
    
    select sum(on_off_Servidor) from salas where numSala = 6 into sala6;
    
    set wes = wes + sala6;
    
    select sum(on_off_Sistema) from salas where numSala = 6 into sala6;
    
    set wes = wes + sala6;
	set sala6 = round(wes * preco_KwH,2);
    insert into relatorio_consumo(formulario,kwh,reais,data_hora) values(6,wes,sala6,now());
    set wes = 0;
    
    when 7 then
    -- calculo sala 7
	select sum(on_off_Fisico) from salas where numSala = 7 into sala7;
    
    set wes = sala7;
    
    select sum(on_off_Servidor) from salas where numSala = 7 into sala7;
    
    set wes = wes + sala7;
    
    select sum(on_off_Sistema) from salas where numSala = 7 into sala7;
    
    set wes = wes + sala7;
	set sala7 = round(wes * preco_KwH,2);
    insert into relatorio_consumo(formulario,kwh,reais,data_hora) values(7,wes,sala7,now());
    set wes = 0;
    
    when 8 then
    -- calculo sala 8
	select sum(on_off_Fisico) from salas where numSala = 8 into sala8;
    
    set wes = sala8;
    
    select sum(on_off_Servidor) from salas where numSala = 8 into sala8;
    
    set wes = wes + sala8;
    
    select sum(on_off_Sistema) from salas where numSala = 8 into sala8;
    
    set wes = wes + sala8;
	set sala8 = round(wes * preco_KwH,2);
    insert into relatorio_consumo(formulario,kwh,reais,data_hora) values(8,wes,sala8,now());
    set wes = 0;
    
    when 9 then
    -- calculo sala 9
	select sum(on_off_Fisico) from salas where numSala = 9 into sala9;
    
    set wes = sala9;
    
    select sum(on_off_Servidor) from salas where numSala = 9 into sala9;
    
    set wes = wes + sala9;
    
    select sum(on_off_Sistema) from salas where numSala = 9 into sala9;
    
    set wes = wes + sala9;
	set sala9 = round(wes * preco_KwH,2);
    insert into relatorio_consumo(formulario,kwh,reais,data_hora) values(9,wes,sala9,now());
    set wes = 0;
    
    when 10 then
    -- calculo sala 10
	select sum(on_off_Fisico) from salas where numSala =10 into sala10;
    
    set wes = sala10;
    
    select sum(on_off_Servidor) from salas where numSala = 10 into sala10;
    
    set wes = wes + sala10;
    
    select sum(on_off_Sistema) from salas where numSala = 10 into sala10;
    
    set wes = wes + sala10;
	set sala10 = round(wes * preco_KwH,2);
    insert into relatorio_consumo(formulario,kwh,reais,data_hora) values(10,wes,sala10,now());
    set wes = 0;
    end case;
    
    
	END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_relatorio_acesso
-- -----------------------------------------------------

DELIMITER $$
USE `energiapura`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_relatorio_acesso`(email varchar(60))
begin
    declare usuario int(11);
    declare nome varchar(45);
    declare curso varchar(45);
    declare nivel int(1);
    
    select idUsuario into usuario from usuario where email = email ;

	select nome into nome from usuario where email = email ;
    
    select curso into curso from usuario where email = email ;
    
    select nivel into nivel from usuario where email = email ;
    
    
    insert into relatorio_acesso(idUsuario,nome,curso,nivel,data_hora)values(usuario,nome,curso,nivel,data_hora,now());
	END$$

DELIMITER ;
USE `energiapura`;

DELIMITER $$
USE `energiapura`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `energiapura`.`salas_BEFORE_UPDATE_servidor`
BEFORE UPDATE ON `energiapura`.`salas`
FOR EACH ROW
BEGIN
	declare aa int;
    declare contagem int;
    DECLARE situacao varchar(10);
    
		IF OLD.on_off_sistema = 0 and NEW.on_off_sistema = 1 THEN
		
				set new.on_off_Servidor = 0;
				set new.on_off_Fisico = 0;
				set situacao = 'Ligado';
			
				insert into relatorio_lampadas (idRelatorio_lampadas,numSala,numLampada,quem,on_off,data_hora,situacao)
				values (contagem,OLD.numSala,OLD.numLampada,'Sistema',NEW.on_off_Sistema,now(),situacao);
	
				elseif OLD.on_off_sistema = 1 and NEW.on_off_sistema = 0 then
					
						set new.on_off_Servidor = 0;
						set new.on_off_Fisico = 0;
						set situacao = 'Desligado';
					
						insert into relatorio_lampadas (idRelatorio_lampadas,numSala,numLampada,quem,on_off,data_hora,situacao)
						values (contagem,OLD.numSala,OLD.numLampada,'Sistema',NEW.on_off_Sistema,now(),situacao);
				
        ELSE
				IF OLD.on_off_Servidor = 1 and NEW.on_off_Fisico = 1  then
			
						set situacao = "Desligado";
						set NEW.on_off_Servidor = 0; 
    
						insert into relatorio_lampadas (idRelatorio_lampadas,numSala,numLampada,quem,on_off,data_hora,situacao)
						values (contagem,OLD.numSala,OLD.numLampada,'Fisico - Desligou a lampada acessa pelo o Servidor ',NEW.on_off_Fisico,now(),situacao);
			
				else
						IF NEW.on_off_Servidor <> OLD.on_off_Servidor THEN			
			
								set contagem = 0; 
            
								If NEW.on_off_Servidor =0 THEN
									
										set situacao = "Desligado";
								else	
									set situacao = "Ligado";
								end if;
                                
						insert into relatorio_lampadas (idRelatorio_lampadas,numSala,numLampada,quem,on_off,data_hora,situacao)
						values (contagem,OLD.numSala,OLD.numLampada,'Servidor',NEW.on_off_Servidor,now(),situacao);
			
							ELSE IF NEW.on_off_Servidor = OLD.on_off_Servidor then
			
								set aa =0;
							END IF;
					END IF;
        
        
        IF NEW.on_off_Fisico <> OLD.on_off_Fisico THEN			
			
				set contagem = 0; 
				set new.on_off_Servidor =0;
                set new.on_off_Sistema =0;
				If NEW.on_off_Fisico =0 THEN
						
					set situacao = "Desligado";
				else	
					set situacao = "Ligado";
				end if;
            
            insert into relatorio_lampadas (idRelatorio_lampadas,numSala,numLampada,quem,on_off,data_hora,situacao)
            values (contagem,OLD.numSala,OLD.numLampada,'Fisico',NEW.on_off_Fisico,now(),situacao);
			
		ELSE IF NEW.on_off_Fisico = OLD.on_off_Fisico then
			
			set aa =0;
			
            END IF;
		END IF;
     END IF;   
END IF;   
        
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

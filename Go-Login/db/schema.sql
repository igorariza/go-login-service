CREATE SCHEMA `backendsmartdepago` DEFAULT CHARACTER SET utf8 ;
CREATE TABLE `ubication` ( 	
	`idUbication`	INT	AUTO_INCREMENT,
	`ref_id`		VARCHAR(100),	
	`name`			VARCHAR(80),	
	`description`	VARCHAR(80),		
PRIMARY KEY (`idUbication`) ) ENGINE=InnoDB;
-- INSERT
INSERT INTO ubication (`ref_id`,	`name`, `description`)
VALUES ('jamundi01', 'Vive Verde SmartDepa', 'Proyecto de departamentos verdes y smart');

INSERT INTO ubication (`ref_id`,	`name`, `description`)
VALUES ('panama01', 'Vive Verde SmartDepa', 'Proyecto de apartamentos verdes y smart');

INSERT INTO ubication (`ref_id`,	`name`, `description`)
VALUES ('medellin01', 'Vive Verde SmartDepa', 'Proyecto de apartamentos verdes y smart');

INSERT INTO ubication (`ref_id`,	`name`, `description`)
VALUES ('bogota01', 'Vive Verde SmartDepa', 'Proyecto de apartamentos verdes y smart');
-----
CREATE TABLE `unidad` ( 				
	`idUnidad`		INT	AUTO_INCREMENT,
  	`idUbication`	INT	, -- relationship ubicacion
	`code`			VARCHAR(100),	
	`name`			VARCHAR(80),
	`description`	VARCHAR(100),
	`photo`			VARCHAR(1000),
	`ubication`		VARCHAR(1000),
PRIMARY KEY (`idUnidad`),
FOREIGN KEY (`idUbication`) REFERENCES ubication(`idUbication`)) ENGINE=InnoDB;
---INSERT
INSERT INTO unidad (`idUbication`, `code`, `name`, `description`, `photo`, `ubication`)
VALUES (1,'17636400001501','SmarteDepaJamundi', 'Proyecto de 20 aptos', '', 'Calle 8 2 -77 Acacias');

INSERT INTO unidad (`idUbication`, `code`, `name`, `description`, `photo`, `ubication`)
VALUES(1,'17636400001502','SmarteDepaJamundi', 'Proyecto de entrepinos', '', 'Entre Pinos');

INSERT INTO unidad	(`idUbication`, `code`, `name`, `description`, `photo`, `ubication`)
VALUES (2,'17636400001503','SmarteDepaPanama', 'Proyecto de 10 aptos', '', 'toqumen');

INSERT INTO unidad (`idUbication`, `code`, `name`, `description`, `photo`, `ubication`)
VALUES (2,'17636400001504','SmarteDepaPanama', 'Proyecto de playa', '', 'toqumen');

INSERT INTO unidad (`idUbication`, `code`, `name`, `description`, `photo`, `ubication`)
VALUES (3,'17636400001505','SmarteDepaMedellin', 'Proyecto de poblado pH', '', 'poblado');

INSERT INTO unidad (`idUbication`, `code`, `name`, `description`, `photo`, `ubication`)
VALUES (3,'17636400001506','SmarteDepaMedellin', 'Proyecto de 20 aptos', '', 'mercedes');

INSERT INTO unidad (`idUbication`, `code`, `name`, `description`, `photo`, `ubication`)
VALUES (3,'17636400001507','SmarteDepaMedellin', 'Proyecto de 20 aptos', '', 'las flores');

INSERT INTO unidad (`idUbication`, `code`, `name`, `description`, `photo`, `ubication`)
VALUES (4,'17636400001508','SmarteDepaBogota', 'Proyecto de 20 aptos', '', 'suba');

INSERT INTO unidad (`idUbication`, `code`, `name`, `description`, `photo`, `ubication`)
VALUES (4,'17636400001509','SmarteDepaBogota', 'Proyecto de 15 aptos', '', 'usme');

INSERT INTO unidad (`idUbication`, `code`, `name`, `description`, `photo`, `ubication`)
VALUES (4,'17636400001510','SmarteDepaBogota', 'Proyecto de 4 aptos', '', 'usme');

-----
CREATE TABLE `services` ( 				
	`idService`		INT	AUTO_INCREMENT,
	`name`			VARCHAR(100),	
	`price` 		VARCHAR(300),
	`description`	VARCHAR(100),
PRIMARY KEY (`idService`)) ENGINE=InnoDB;
---- INSERT
INSERT INTO `services` (`name`, `price`, `description`)
VALUES ('wifi', '10000', 'wifi 5 mb de velocidad');

INSERT INTO `services`(`name`, `price`, `description`)
VALUES ('lavado', '20000', '2 lavados a la semana, no incluye detergente/secado');

INSERT INTO `services` (`name`, `price`, `description`)
VALUES ('Energia Solar', 'FREE', 'Conexión de iluminación con consumo renovable');

---------
CREATE TABLE `depa` ( 				
	`idDepa`		INT	AUTO_INCREMENT,
  	`idUnidad`		INT	, -- relationship unidad
	`flat`			VARCHAR(10),	
	`number` 		VARCHAR(10),
	`description`	VARCHAR(100),
	`photo`			VARCHAR(200),
	`area`			VARCHAR(100),
	`qr_code`		VARCHAR(200),
	`canon`			INT,
	`currency`		VARCHAR(10),
	`is_avaliable`	BOOLEAN,
PRIMARY KEY (`idDepa`),
FOREIGN KEY (`idUnidad`) REFERENCES unidad(`idUnidad`)) ENGINE=InnoDB;
--- INSERT
INSERT INTO `depa` (`idUnidad`, `flat`, `number`, `description`, `photo`, `area`, `qr_code`, `canon`, `currency`, `is_avaliable`)
VALUES ('1', '1', '101', 'Primer Piso N° 1', 'url_photo', '42 m2', 'qr_code', 450000, 'COP',TRUE);

INSERT INTO `depa` (`idUnidad`, `flat`, `number`, `description`, `photo`, `area`, `qr_code`, `canon`, `currency`, `is_avaliable`) 
VALUES ('1', '1', '102', 'Primer Piso N° 1', 'url_photo', '40 m2', 'qr_code', 450000, 'COP', TRUE);

INSERT INTO `depa` (`idUnidad`, `flat`, `number`, `description`, `photo`, `area`, `qr_code`, `canon`, `currency`, `is_avaliable`) 
VALUES ('1', '1', '103', 'Primer Piso N° 1', 'url_photo', '45 m2', 'qr_code', 500000, 'COP', TRUE);

INSERT INTO `depa` (`idUnidad`, `flat`, `number`, `description`, `photo`, `area`, `qr_code`, `canon`, `currency`, `is_avaliable`) 
VALUES ('4', '1', '101', 'Casa Campestre', 'url_photo', '300 m2', 'qr_code', 2000000, 'COP', TRUE);

INSERT INTO `depa` (`idUnidad`, `flat`, `number`, `description`, `photo`, `area`, `qr_code`, `canon`, `currency`, `is_avaliable`) 
VALUES ('5', '1', '101', 'Primer piso N° 1', 'url_photo', '50 m2', 'qr_code', 500, 'USD', TRUE);
-----
----- QUERY'S

SELECT `idDepa`, `idUnidad`, `flat`, `number`, `description`, `photo`, `area`, `qr_code`, `canon`, `currency`, `is_avaliable` FROM  depa;

CREATE TABLE `services_depa` ( 				
	`idServiceDp`	INT	AUTO_INCREMENT,
	`idDepa`		INT,	
	`idService` 	INT,
	`description`	VARCHAR(100),
PRIMARY KEY (`idServiceDp`),
FOREIGN KEY (`idDepa`) REFERENCES depa(`idDepa`),
FOREIGN KEY (`idService`) REFERENCES services(`idService`)) ENGINE=InnoDB;
---- INSERT
INSERT INTO `services_depa` (`idDepa`, `idService`, `description`)  
VALUES (1, 1, 'OK');

INSERT INTO `services_depa` (`idDepa`, `idService`, `description`)
VALUES (1, 2, 'OK');

INSERT INTO `services_depa` (`idDepa`, `idService`, `description`)
VALUES (1, 3, 'OK');

INSERT INTO `services_depa` (`idDepa`, `idService`, `description`)  
VALUES (2, 1, 'OK');

INSERT INTO `services_depa` (`idDepa`, `idService`, `description`)
VALUES (2, 2, 'OK');

INSERT INTO `services_depa` (`idDepa`, `idService`, `description`)
VALUES (2, 3, 'OK');

INSERT INTO `services_depa` (`idDepa`, `idService`, `description`)  
VALUES (3, 1, 'OK');

INSERT INTO `services_depa` (`idDepa`, `idService`, `description`)
VALUES (3, 2, 'OK');

INSERT INTO `services_depa` (`idDepa`, `idService`, `description`)
VALUES (3, 3, 'OK');

-----
CREATE TABLE `type_id` ( 				
	`idType`	INT	AUTO_INCREMENT,
	`type`		VARCHAR(10),	
	`name`		VARCHAR(100),
PRIMARY KEY (`idType`)) ENGINE=InnoDB;

INSERT INTO `type_id` (`type`, `name`)
VALUES ('CC', 'Cédula Ciudadania');

INSERT INTO `type_id` (`type`, `name`)
VALUES ('NIT', 'Número Identificación Tributaria');
-------

CREATE TABLE `smart_depa` ( 				
	`idSmartDp`		INT	AUTO_INCREMENT,
	`idDepa` 		INT,  ------ <--- Relationship
	`document_id`	VARCHAR(50),	
	`start_date`	VARCHAR(50),
	`final_date`	VARCHAR(50),
	`score`			INT,
	`description`	VARCHAR(100),
PRIMARY KEY (`idSmartDp`),
FOREIGN KEY (`idDepa`) REFERENCES depa(`idDepa`),
FOREIGN KEY (`document_id`) REFERENCES users(`document_id`)) ENGINE=InnoDB;

---- INSERT --
INSERT INTO  `smart_depa` (`idDepa`, `document_id`, `start_date`, `final_date`, `score`, `description` )
VALUES ('1', '112233445', '', '', 10, '');

----
CREATE TABLE `users` ( 	
	`idUser`		INT	AUTO_INCREMENT,
	`document_id`	VARCHAR(50),	
	`first_name`	VARCHAR(80),	
	`last_name`		VARCHAR(80),	
	`email`			VARCHAR(200),	
	`password`		VARCHAR(1000),	
	`phone`			VARCHAR(20),		
	`address`		VARCHAR(20),		
	`photo`			VARCHAR(1000),		
	`created_at`	VARCHAR(300),		
	`idType`		INT,		
	`date_birth`	VARCHAR(100),		
	`last_access`	VARCHAR(100),		
	`rh`			VARCHAR(10),			
	`is_active`		BOOLEAN,		
PRIMARY KEY (`idUser`),
FOREIGN KEY (`idType`) REFERENCES type_id(`idType`)) ENGINE=InnoDB AUTO_INCREMENT=3;
---- INSERT
INSERT INTO `users` (`document_id`, `first_name`, `last_name`, `email`, `password`, `phone`, `address`, `photo`, `created_at`, `type_id`, `date_birth`,  `last_access`, `rh`, `is_active`)
VALUES ('112233445', 'Admin', 'Depa', 'admindepa@gmail.com' , '11223344', '3148965516', 'Calle 8 2 - 77', 'url_photo', '', 1, '10-11-1987', `last_access`, '', TRUE);

{
    "document_id":"112233445",
    "first_name": "Admin",
    "last_name": "Depa",
    "email": "admindepa@gmail.com",
    "password": "11223344",
    "phone": "3148965516",
    "address": "Calle 8 2 - 77",
    "photo": "url_photo",
    "created_at": "",
    "type_id": "1",
    "date_birth": "10-11-1987",
    "last_access": "",
    "rh": "",    
    "idDepa": "1",
    "is_active": "1"
}	
-- SELECT * from Users WHERE email ='adminsige@gmail.com'
-- QUERY
SELECT Users.idUser, Users.document_id, Users.first_name, Users.last_name, Users.email, Users.password, Users.phone, Users.address, Users.photo, Users.created_at, Users.type_id, Users.date_birth, Users.rh, Users.idSede, Users.is_active, Sede.name_sede 
FROM Users
INNER JOIN Sede ON Sede.idSede = Users.idSede
WHERE Users.email = "adminsige@gmail.com"
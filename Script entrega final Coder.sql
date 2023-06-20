/*creacion de db da3s*/
CREATE SCHEMA DGL;

/*Seleccionar la base de datos en la cual quiero trabajar*/
USE DGL;

/*Creacion de las tablas*/

/*Tabla Clientes*/
CREATE TABLE CUSTOMERS
(
	CUSTOMER_ID VARCHAR(50) NOT NULL UNIQUE PRIMARY KEY,
    FULL_NAME VARCHAR(100) NOT NULL,
    ADDRESS VARCHAR(100) NOT NULL,
    PHONE VARCHAR(20),
    CITY VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(80) NOT NULL
);


/*tabla que contiene los tipos de medio de pago*/
CREATE TABLE PAYMENTS (
    PAYMENT_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    PAYMENT_TYPE VARCHAR(50) NOT NULL
);


/*Tabla que contiene el tipo de documento se emite (Boleta/Factura)*/
CREATE TABLE document_type (
  document_id INT NOT NULL AUTO_INCREMENT,
  document_type VARCHAR(50) NOT NULL,
  PRIMARY KEY (document_id)
  );
  
/*Tabla con registro de los vendedores*/
CREATE TABLE Employees (
    Employee_ID INT NOT NULL UNIQUE PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    Phone VARCHAR(30) NOT NULL,
    Email VARCHAR(80) NOT NULL,
    Hire_Date DATE NOT NULL
);

/*Tabla de ordenes emitidas*/
CREATE TABLE ORDERS
(
	ORDER_ID INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    CUSTOMER_ID VARCHAR(50) NOT NULL,
    ORDER_DATE DATE NOT NULL,
    ORDER_VALUE INT NOT NULL,
    SHIPPING_ADDRESS VARCHAR(100) NOT NULL,
    ORDER_INFO VARCHAR(40) NOT NULL,
    PAYMENT_ID INT NOT NULL,
    DOCUMENT_ID INT NOT NULL,
    Employee_ID INT NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID),
	FOREIGN KEY (PAYMENT_ID) REFERENCES PAYMENTS(PAYMENT_ID),
    FOREIGN KEY (DOCUMENT_ID) REFERENCES DOCUMENT_TYPE(DOCUMENT_ID),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID)
    );


/*Tabla con detalle de la orden emitida*/
CREATE TABLE ORDER_DETAIL
    (
    ORDER_ID INT NOT NULL UNIQUE PRIMARY KEY,
    ITEM_ID INT NOT NULL,
    PRICE INT NOT NULL,
    QUANTITY INT NOT NULL,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
    );


/*Tabla que contiene los productos disponibles*/
CREATE TABLE ITEM
	(
    ITEM_ID INT NOT NULL UNIQUE PRIMARY KEY,
    CATEGORY INT NOT NULL,
    ITEM_PRICE INT NOT NULL,
    FULL_DESCRIPTION VARCHAR(200),
    ITEM_NAME VARCHAR(100) NOT NULL,
    STOCK INT NOT NULL
);


/*Tabla en la que se organizan segun categorias los distintos items disponibles*/
CREATE TABLE ITEM_CATEGORY
	(
    CATEGORY_ID INT NOT NULL PRIMARY KEY,
    NAME_CAT CHAR(30) NOT NULL,
    DESCRIPTION_CAT CHAR(200)
);


/*Log de cambios de precio*/
CREATE TABLE ITEM_PRICE_LOG
(
	ITEM_ID INT NOT NULL,
    ITEM_NAME VARCHAR(200),
    OLD_PRICE INT NOT NULL,
    NEW_PRICE INT NOT NULL,
    UPDATED_DATE DATE,
    UPDATED_TIME TIME,
    UPDATED_BY VARCHAR (100)
);


/*Log para registrar cuando se elimina, modifica o actualiza algun item*/
CREATE TABLE ITEM_LOG (
    LOG_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    LOG_MESSAGE VARCHAR(200) NOT NULL,
    LOG_DATE DATE,
    LOG_TIME TIME,
    LOG_USER VARCHAR(100)
);


ALTER TABLE ORDER_DETAIL
ADD CONSTRAINT FOREIGN KEY(ITEM_ID)
REFERENCES ITEM(ITEM_ID);

ALTER TABLE ITEM
ADD CONSTRAINT FOREIGN KEY(CATEGORY)
REFERENCES ITEM_CATEGORY(CATEGORY_ID);

select * from dgl.customers;
select * from dgl.payments;
select * from dgl.document_type;
select * from dgl.employees;
select * from dgl.orders;
select * from dgl.item_category;
select * from dgl.item;
select * from dgl.order_detail;
select * from item_log;
select * from item_price_log;


/*Insercion de datos*/

/*Insercion en tabla Customers*/
DELIMITER //
START TRANSACTION;
INSERT INTO CUSTOMERS VALUES
('21.304.686-1','Daniela Aylett Muñoz','Costanera 1410','5698524452','San Felipe','zobroukufaubru-2392@yopmail.com'),
('19.855.589-4','Javiera Andrea Perez','Gertrudis Echeñique 165','5698524457','Santiago','peudagremouque-5614@yopmail.com'),
('8.365.986-6','Cristian Jesus Maldonado','Vi Galilea 15 1/2 Pte 0 234','5698524462','Pudahuel','cedupeillaneu-5844@yopmail.com'),
('5.704.158-7','Miguel Antonio Silva','Lo Martinez 816 ','5698524467','Talca','tramayaumisse-2841@yopmail.com'),
('4.733.992-8','Juan Alberto San Martin','El Maitenal S/n','5698524472','San Felipe','nanneufregraxe-2098@yopmail.com'),
('9.824.225-2','Miriam Fernanda Castillo','Lago Ralun 540','5698524477','San Fabian','hesedillomo-3458@yopmail.com'),
('12.005.085-0','Carola Beatriz Fernandez','Haydn 4995','5698524482','Paine','hiyijatritu-3513@yopmail.com'),
('11.610.044-4','Miguel Mauricio Fernandez','Haydn 4995','5698524487','San Joaquin','grefidaumerou-9037@yopmail.com'),
('18.955.125-8','Alicia Carolina Vandenegro','Tomas Guevara 2963','5698524492','San Joaquin','secesassahe-5464@yopmail.com'),
('5.181.704-4','Margarita del Carmen Fierro','Seminario 390','5698524497','Providencia','froicanommugi-7608@yopmail.com'),
('11.583.860-1','Adriana Teresa Toro','Pj San Expedito 1763','5698524502','Puerto Montt','paullaceheidei-2240@yopmail.com'),
('5.625.957-0','Maximiliano Alfonso Perez','Jahuelito S/n','5698524507','Maule','jiprunnaumare-9844@yopmail.com'),
('20.759.844-5','Eleonora del Carmen Silva','Eleuterio Ramirez 56','5698524512','Santa Maria','hedeittuxubro-6892@yopmail.com'),
('7.592.386-4','Estela Carmen Jorquera','Pob. Esperanza 41','5698524517','Linares','lebroyexouppei-3344@yopmail.com'),
('19.796.018-3','Catalina Raquel Muñoz','Balmaceda 703','5698524522','Parral','boigrabobriwoi-8030@yopmail.com'),
('15.449.577-0','Esteban Jesus Riquelme','Calle Jaspe 1373','5698524527','Coihueco','cafraqueuyeihi-5356@yopmail.com'),
('19.147.315-9','Allison Sofia Moreno','Miguel Esquella 729','5698524532','Maipu','seneirallougei-6333@yopmail.com'),
('19.195.252-9','Sofia Javiera Muñoz','Imperia 2142','5698524537','Arica','trattifofiproi-2820@yopmail.com'),
('21.041.454-1','Jesus Carlos Riveros','Pje 27 De Abril 3050','5698524542','Temuco','leudeunneulleuze-2203@yopmail.com'),
('12.469.919-3','Alvaro Eduardo Ramirez','Psaje China 74230','5698524547','Quinta Normal','retemagille-8928@yopmail.com');
// DELIMITER ; 


/*Insercion de datos a tabla payments*/
START TRANSACTION;
INSERT INTO PAYMENTS VALUES
(NULL,'CHEQUE'),
(NULL,'EFECTIVO'),
(NULL,'TRANSFERENCIA'),
(NULL,'TARJETA CREDITO'),
(NULL,'TARJETA DEBITO');
// DELIMITER ; 


/*INSERCION DE DATOS PARA TABLA DOCUMENT_TYPE*/
START TRANSACTION;
INSERT INTO document_type VALUES
(NULL,'BOLETA'),
(NULL,'FACTURA'),
(NULL,'NOTA DE CREDITO'),
(NULL,'NOTA DE DEBITO');
// DELIMITER ; 

/*INSERCION DE DATOS PARA TABLA EMPLOYEES*/
START TRANSACTION;
INSERT INTO EMPLOYEES VALUES
('2220','Alberto Javier Fuenzalida Benavides','Orrego Luco 324','56992532451','AFuenzalida@da3s.cl','2022-10-05'),
('2225','Daniel Esteban Moreno Muñoz','Salvador Dali 493','56992532423','DMoreno@da3s.cl','2022-10-05'),
('2230','Alejandra Veronica Opazo Farias','Los pintores 765','56992532482','AOpazo@da3s.cl','2022-10-05'),
('2235','Pablo Reinaldo Moreno Bustamante','Pajaritos 5575','56992532951','PMoreno@da3s.cl','2022-10-05'),
('2240','Lilian Beatriz Muñoz Carvajal','Longitudinal 2330','56992532151','LCarvajal@da3s.cl','2022-10-05'),
('2245','Felipe Alejandro Rojas Perez','Av El Descanso 154','56992532761','FRojas@da3s.cl','2022-10-05'),
('2250','Carolina Andrea Freire Andes','Los Mares 224','56992532447','CFreire@da3s.cl','2022-10-05');
// DELIMITER ; 

/*INSERCION DE DATOS TABLA ORDERS*/
DELIMITER //
START TRANSACTION;
INSERT INTO ORDERS VALUES
(NULL,'21.304.686-1','2021/12/12','1000000','Costanera 1410','PENDIENTE','1','1','2220'),
(NULL,'19.855.589-4','2021/08/09','300000','Gertrudis Echeñique 165','ENTREGADO','5','1','2230'),
(NULL,'8.365.986-6','2021/08/09','580000','Vi Galilea 15 1/2 Pte 0 234','PENDIENTE','4','2','2240'),
(NULL,'5.704.158-7','2021/08/09','1300000','Lo Martinez 816 ','ENTREGADO','1','2','2225'),
(NULL,'4.733.992-8','2022/10/01','1350000','El Maitenal S/n','PENDIENTE','2','2','2235'),
(NULL,'9.824.225-2','2022/10/01','850000','Lago Ralun 540','PENDIENTE','5','1','2245'),
(NULL,'11.583.860-1','2022/12/01','560000','Pj San Expedito 1763','ENTREGADO','3','2','2250'),
(NULL,'5.625.957-0','2022/10/01','1350000','Jahuelito S/n','ENTREGADO','4','1','2235'),
(NULL,'20.759.844-5','2022/12/01','900000','Eleuterio Ramirez 56','PENDIENTE','3','2','2220'),
(NULL,'7.592.386-4','2022/04/01','850000','Pob. Esperanza 41','ENTREGADO','1','3','2225'),
(NULL,'5.704.158-7','2022/10/01','300000','Lo Martinez 816 ','PENDIENTE','3','3','2235'),
(NULL,'4.733.992-8','2022/10/01','1400000','El Maitenal S/n','ENTREGADO','2','4','2235'),
(NULL,'9.824.225-2','2022/10/01','1350000','Lago Ralun 540','ENTREGADO','5','1','2220'),
(NULL,'12.005.085-0','2022/10/01','290000','Haydn 4995','PENDIENTE','4','3','2225'),
(NULL,'11.610.044-4','2022/08/09','290000','Haydn 4995','ENTREGADO','2','3','2240'),
(NULL,'15.449.577-0','2021/08/09','1350000','Calle Jaspe 1373','ENTREGADO','4','2','2250'),
(NULL,'19.147.315-9','2022/10/01','1350000','Miguel Esquella 729','ENTREGADO','4','1','2225'),
(NULL,'19.195.252-9','2022/12/02','750000','Imperia 2142','ENTREGADO','3','1','2230'),
(NULL,'21.041.454-1','2022/10/01','580000','Pje 27 De Abril 3050','PENDIENTE','1','1','2245'),
(NULL,'21.304.686-1','2021/08/09','550000','Costanera 1410','PENDIENTE','4','1','2240');
// DELIMITER ; 


/*INSERCION DE DATOS TABLA ITEM_CATEGORY*/
START TRANSACTION;
INSERT INTO ITEM_CATEGORY VALUES
('1','Laptop Gamer','Equipos para juegos exigentes y desarrollo'),
('2','Consola','Consolas Sony, Microsoft, Nintendo, Steam, entre otras '),
('3','Desktop','Equipos Desktop distintos formatos'),
('4','Monitor','Monitores tradicionales, gamer y diseño'),
('5','Laptop','Laptops tradicionales');
// DELIMITER ; 


/*INSERCION DE DATOS TABLA ITEM*/
START TRANSACTION;
INSERT INTO ITEM VALUES
('335268','1','1000000','AMD Ryzen 7 5800H / 16 GB DDR4 (3200 MHz) / LED 15.6" (1920x1080) / 144 Hz / SSD 512GB / NVIDIA GeForce RTX 3060 (6 GB)','Asus FA506QM-HN023T','50'),
('335295','2','300000','NINTENDO SWITCH NEON','Nintendo Switch','60'),
('335322','1','1300000','AMD Ryzen 9 5900HX / 16 GB DDR4 (3200 MHz) / LED 15.6" (1920x1080) / 300 Hz / SSD 512GB / NVIDIA GeForce RTX 3060 (6 GB)','Asus G513QM-HF276T','35'),
('335349','1','900000','Intel Core i5-10300H / 16 GB RAM / NVIDIA GeForce RTX 2060 (6 GB)','Lenovo Legion 5i','84'),
('335376','1','850000','Intel Core i7-11370H / 8 GB RAM / NVIDIA GeForce RTX 3050 (4 GB)','Asus FX516PC-HN021T','29'),
('335403','1','750000','Intel Core i5-10300H / 8 GB RAM / NVIDIA GeForce GTX 1650 Ti (4 GB)','Asus G512LI-HN061T','48'),
('335430','1','750000','Intel Core i5-11400H / 8 GB RAM / NVIDIA GeForce RTX 3050 (4 GB)','Asus FX506HC-HN042T','69'),
('335457','3','580000','Desktop','Desk i5 10400','45'),
('335484','3','550000','Desktop','Desk Ryzen 5','49'),
('335511','4','200000','Display · Tamaño Pantalla: 31,5" · Máxima Resolución: 1920 x 1080','Monitor Gear 32p','27'),
('335538','5','390000','Intel Core i3-1115G4 / 4 GB RAM.','Asus X413EA-EB667T','85'),
('335565','2','270000','Microsoft Xbox One S 1 TB; Capacidad: 1000 GB; Formato: Sobremesa; Controles incluidos: 1','Xbox One S','28'),
('335592','2','650000','Sony PlayStation 5 / Capacidad 825 GB / Formato Sobremesa / Controles incluidos 1','PS5','41'),
('335619','2','350000','NINTENDO SWITCH OLED','Switch Oled','66'),
('335646','1','1350000','AMD Ryzen 9 5900HS / 16 GB DDR4 (3200 MHz) / LED 14.0" (2560x1440) / 120 Hz / SSD 1TB / NVIDIA GeForce RTX 3060 (6 GB)','Asus GA401QM-K2120T','93'),
('335673','1','850000','Intel Core i5-10300H / 16 GB RAM / NVIDIA GeForce RTX 3060 (6 GB)','Lenovo Legion 5i','80'),
('335700','5','450000','AMD Ryzen 5 3500U / 12 GB DDR4 (2400 MHz) / LED 14.0" (1920x1080) / 60 Hz / SSD 512GB','Acer A314-22-R1L4-2','50'),
('335727','3','400000','Desktop','Desk i7 10700','82'),
('335754','3','650000','Desktop','Desktop i5 1660','38'),
('335781','5','300000','Intel Core i3-1115G4 / 4 GB RAM / SSD 256GB','HP 14-DQ2026LA','51'),
('335808','5','200000','Intel Celeron N4020 / 4 GB DDR4 (2400 MHz) / LED 14.0" (1920x1080) / 60 Hz / HDD 500GB (5400rpm)','Asus X409MA-EK173T','38');
// DELIMITER ; 


/*INSERCION DE DATOS TABLA ORDER_DETAIL*/
START TRANSACTION;
INSERT INTO ORDER_DETAIL VALUES
('1','335268','1000000','3'),
('2','335295','300000','2'),
('3','335322','1300000','1'),
('4','335349','900000','8'),
('5','335376','850000','1'),
('6','335403','750000','4'),
('7','335430','750000','6'),
('8','335403','750000','5'),
('9','335430','750000','3'),
('10','335457','580000','6'),
('11','335484','550000','8'),
('12','335511','200000','11'),
('13','335700','450000','4'),
('14','335727','400000','2'),
('15','335754','650000','4'),
('16','335781','300000','6'),
('17','335808','200000','6'),
('18','335430','750000','8'),
('19','335403','750000','8'),
('20','335430','750000','8');
// DELIMITER ; 


/*Vista para ver productos disponibles ordenados por alfabeto, precio y stock */

CREATE OR REPLACE VIEW prod AS
	(SELECT item_name, item_price, stock
    FROM item
    ORDER BY item_name ASC);
    
SELECT * FROM prod;


/*Vista para ver envios pendientes o en proceso con datos de identificacion y nombre */

CREATE OR REPLACE VIEW pends AS
	(SELECT o.customer_id, c.full_name, o.order_info
    FROM orders o JOIN customers c ON (o.customer_id = c.customer_id)
    WHERE order_info LIKE '%P%');
    
SELECT * FROM pends;


/*Vista para ver productos con stock bajo 10 unidades */

CREATE OR REPLACE VIEW stockmin AS
	(SELECT item_id, item_name, stock
    FROM item 
    WHERE stock < 50);
    
SELECT * FROM stockmin;


/*Vista para buscar ventas por fecha */

CREATE OR REPLACE VIEW ventaf AS
			(SELECT order_id, customer_id, order_date
            FROM orders
            where order_date = '2022-10-01');
            
SELECT * FROM ventaf;


/*Vista para ver ventas totales por id de producto */

CREATE OR REPLACE VIEW totales AS
	(SELECT o.item_id, i.item_name, SUM(o.price*o.quantity) as Venta_total
    FROM order_detail o JOIN item i ON (o.item_id = i.item_id)
    GROUP BY item_id ORDER BY i.item_name DESC);
    
SELECT * FROM totales;

/*Funcion que permite con el id de producto consultar nombre y stock*/

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `Nombre_producto`(ID_Producto INT) RETURNS varchar(100) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
DECLARE nombre_stock VARCHAR(100);
SELECT CONCAT(item_name, ' (stock: ', stock, ')') INTO nombre_stock
FROM item
WHERE ID_Producto = item_id;
RETURN nombre_stock;
END
$$

/* Funcion que permite ver cuantas compras a realizado determinado rut o id de cliente */

DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `COMPRAS_RUT`(RUT VARCHAR(20)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE COMPRAS_TOTALES INT;
    SELECT COUNT(*) INTO COMPRAS_TOTALES
    FROM orders
    WHERE CUSTOMER_ID = RUT;
    RETURN COMPRAS_TOTALES;
END
$$


/*Store Procedure que permite Obtener nombre de cliente y direccion para reparto de compra*/

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Direccion_envio`(IN RUT VARCHAR(20))
BEGIN
	SELECT FULL_NAME, ADDRESS
    FROM customers
    WHERE CUSTOMER_ID = RUT;
END
//


/*Store Procedure que permite estado de orden*/

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Verificar_orden`(IN N_Orden INT)
BEGIN
	SELECT d.item_id, d.price, d.quantity, o.order_info
    FROM order_detail d JOIN orders o ON (d.order_id = o.order_id)
    where d.order_id = N_orden;
END
//

/*Actualiza precios segun id de producto*/
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualiza_precios`(IN ID_producto INT, IN Nuevo_precio INT)
BEGIN
	UPDATE item
    SET item_price = Nuevo_precio    
    WHERE item_id = id_producto;
END
//


 /* TRIGGER 1.- Descuenta Stock al ingresar un nuevo registro en ORDER y Luego en ORDER_DETAIL*/
DELIMITER //
CREATE TRIGGER item_after_insert_order_detail_trigger
BEFORE INSERT ON ORDER_DETAIL
FOR EACH ROW
BEGIN
    UPDATE ITEM
    SET STOCK = STOCK - NEW.QUANTITY
    WHERE ITEM_ID = NEW.ITEM_ID;
END;
//

/*Insercion de orden, la cual gatilla el trigger para descontar stock*/

INSERT INTO ORDERS (ORDER_ID, CUSTOMER_ID, ORDER_DATE, ORDER_VALUE, Shipping_address, order_info, payment_id, document_id)
VALUES (21, '21.304.686-1', CURDATE(), 600000, 'Orrego Luco 324', 'PENDIENTE', '5', '2');

INSERT INTO ORDER_DETAIL (ORDER_ID, ITEM_ID, PRICE, QUANTITY)
VALUES (21, 335295, 600000, 2);

/*Selecciono la tabla item para verificar que se desconto el stock*/
select * from dgl.item;

/*Fin del Trigger 1*/

/***************************************************************/

/*Trigger 2.- Registra quien actualizo el precio del producto con detalle de fecha*/

/*Selecciono la tabla item para ver los datos y asi poder actualizar*/
select * from dgl.item;

/*Luego utilizo el Stored Procedure Actualiza_precios para modificar y activar el trigger*/

DELIMITER //
CREATE TRIGGER item_after_update_price_trigger
AFTER UPDATE ON ITEM
FOR EACH ROW
BEGIN
    IF NEW.ITEM_PRICE <> OLD.ITEM_PRICE THEN
        INSERT INTO ITEM_PRICE_LOG (ITEM_ID, ITEM_NAME, OLD_PRICE, NEW_PRICE, UPDATED_DATE, UPDATED_TIME, UPDATED_BY)
        VALUES (NEW.ITEM_ID, OLD.ITEM_NAME, OLD.ITEM_PRICE, NEW.ITEM_PRICE, CURDATE(), CURTIME(), user());
    END IF;
END;
//

/*Llamo a la tabla para verificar que registro el cambio*/
SELECT * FROM ITEM_PRICE_LOG;

/*Fin Trigger 2*/

/***************************************************************/

/*Trigger 3.- Registra en el log, los ingresos de nuevos productos, junto con fecha de ingreso */

DELIMITER $$
CREATE TRIGGER trigger_ingreso_item
AFTER INSERT ON ITEM
FOR EACH ROW
BEGIN
    DECLARE item_id INT;
    DECLARE item_name VARCHAR(100);
    DECLARE stock_change INT;
    DECLARE log_message VARCHAR(200);
    DECLARE LOG_DATE DATE;
    DECLARE LOG_TIME TIME;
    DECLARE LOG_USER VARCHAR(100);
    
    SET item_id = NEW.ITEM_ID;
    SET item_name = NEW.ITEM_NAME;
    SET stock_change = NEW.STOCK;
	SET log_message = CONCAT('Se ingresó ', stock_change, ' unidades del producto ', item_name, ' (ID: ', item_id, ').');
    SET LOG_DATE = CURDATE();
    SET LOG_TIME = CURTIME();
    SET LOG_USER = USER();
    INSERT INTO ITEM_LOG (LOG_MESSAGE, LOG_DATE, LOG_TIME, LOG_USER) VALUES (log_message, log_date, log_time, log_user);
END;
$$

/*Para insertar nuevo producto*/
INSERT INTO ITEM (ITEM_ID, CATEGORY, ITEM_PRICE, FULL_DESCRIPTION, ITEM_NAME, STOCK)
VALUES (335985, 4, 199990, 'Monitor Gamer', 'MSI G297', 50);

/*Llamamos a la tabla item log para verificar que registro correctamente*/
select * from item_log;

/*Fin Trigger 3*/

/***************************************************************/

/*Trigger 4. Para registrar en el log cuando se elimina un producto descontinuado*/
DELIMITER $$
CREATE TRIGGER trigger_eliminar_item
BEFORE DELETE ON ITEM
FOR EACH ROW
BEGIN
    DECLARE item_id INT;
    DECLARE item_name VARCHAR(100);
    DECLARE log_message VARCHAR(200);
    DECLARE log_date DATE;
    DECLARE log_time TIME;
    DECLARE log_user VARCHAR(100);
    
    SET item_id = OLD.ITEM_ID;
    SET item_name = OLD.ITEM_NAME;
    SET log_message = CONCAT('Se eliminó el producto ', item_name, ' (ID: ', item_id, ').');
    SET log_date = CURDATE();
    SET log_time = CURTIME();
    SET log_user = USER();
    
    INSERT INTO ITEM_LOG (LOG_MESSAGE, LOG_DATE, LOG_TIME, LOG_USER) VALUES (log_message, log_date, log_time, log_user);
END$$
DELIMITER $$

/*ejecutar la eliminacion del producto*/
DELETE FROM ITEM WHERE ITEM_ID = 335985;

/*Se llama a la tabla ya creada item_log para verificar el registro de la eliminacion*/
select * from item_log;

/*Fin Trigger 4*/

/***************************************************************/


use mysql;
select * from user;

/*Creacion de usuario Da3s y usuario vendedor*/

CREATE USER Da3s@localhost IDENTIFIED BY 'clave'; //local
CREATE USER vendedor@localhost IDENTIFIED BY 'clave1'; //local


/*Script para poder seleccionar los usuarios en la tabla USER*/

SELECT * FROM mysql.user WHERE user LIKE 'Da3s';
SELECT * FROM mysql.user WHERE user LIKE 'vendedor';


/* Script para revisar los permisos que tiene cada usuario*/

SHOW GRANTS FOR Da3s@localhost;
SHOW GRANTS FOR vendedor@localhost;


/*Script para dar permisos al usuario vendedor para poder leer la informacion de la base de datos*/

GRANT SELECT ON dgl.customers TO vendedor@localhost;
GRANT SELECT ON dgl.item TO vendedor@localhost;
GRANT SELECT ON dgl.item_category TO vendedor@localhost;
GRANT SELECT ON dgl.order_detail TO vendedor@localhost;
GRANT SELECT ON dgl.orders TO vendedor@localhost;


/*Script que permite al usuario Da3s el poder leer, modificar e insertar informacion en la base de datos*/

GRANT SELECT, INSERT, UPDATE ON dgl.customers TO Da3s@localhost; 
GRANT SELECT, INSERT, UPDATE ON dgl.item TO Da3s@localhost; 
GRANT SELECT, INSERT, UPDATE ON dgl.item_category TO Da3s@localhost; 
GRANT SELECT, INSERT, UPDATE ON dgl.order_detail TO Da3s@localhost; 
GRANT SELECT, INSERT, UPDATE ON dgl.orders TO Da3s@localhost; 


/*Servira para eliminar en su momento los logs mas antiguos que ya no se desee tener respaldados tanto al añadir como eliminar items*/

START TRANSACTION;
DELETE FROM dgl.item_log
WHERE log_date < '2022-05-23';

select * from item_log;

/*
COMMIT;
ROLLBACK;
*/

/*Como la tabla no tiene log guardados, se cargaran con la siguiente transaccion */

START TRANSACTION;

INSERT INTO item_log (log_id, log_message, log_date, log_time, log_user) VALUES (1,'Se añadio producto MSI GE62 6QD','2022-04-02','13:50:11', 'root@localhost');
INSERT INTO item_log (log_id, log_message, log_date, log_time, log_user) VALUES (2, 'Se añadio silla games Pegasus gx22', '2022-12-12', '11:02:00', 'root@localhost');
INSERT INTO item_log (log_id, log_message, log_date, log_time, log_user) VALUES (3,'Se elimino producto MSI GF63 6QF', '2021-05-11', '09:00:00', 'root@localhost');
INSERT INTO item_log (log_id, log_message, log_date, log_time, log_user) VALUES (4, 'Se añadio silla games Pegasus gx20', '2021-06-06', '14:23:58', 'root@localhost');
INSERT INTO item_log (log_id, log_message, log_date, log_time, log_user) VALUES (5, 'Se añadio silla games Pegasus gx50', '2020-04-01', '18:30:59', 'root@localhost');
INSERT INTO item_log (log_id, log_message, log_date, log_time, log_user) VALUES (7, 'Se elimino producto cable usb c to hdmi', '2023-12-05', '11:23:23', 'root@localhost');

select * from item_log;

/*Transaccion para ingreso de datos en un tabla con 2 savepoint*/

START TRANSACTION;
INSERT INTO item_category (category_id, name_cat, description_cat) VALUES (6, 'Sillas Gamer', 'Sillas comodas + luces');
INSERT INTO item_category (category_id, name_cat, description_cat) VALUES (7, 'accesorios Laptops', 'Hub usb, cables y mas');
INSERT INTO item_category (category_id, name_cat, description_cat) VALUES (8, 'Macbook', 'Laptops de la empresa Apple');
INSERT INTO item_category (category_id, name_cat, description_cat) VALUES (9, 'Celulares basicos', 'Celulares de gama baja');

SAVEPOINT agrega_cat1;

INSERT INTO item_category (category_id, name_cat, description_cat) VALUES (10, 'Celulares Intermedios', 'Celulares para usuario promedio');
INSERT INTO item_category (category_id, name_cat, description_cat) VALUES (11, 'Celulares avanzados', 'Equipos gama alt para usuarios exigentes');
INSERT INTO item_category (category_id, name_cat, description_cat) VALUES (12, 'Graficas low profile', 'Graficas gama baja');
INSERT INTO item_category (category_id, name_cat, description_cat) VALUES (13, 'Graficas gama alta', 'Graficas par usuario exigentes');

SAVEPOINT agrega_cat2;

/*
COMMIT;
RELEASE SAVEPOINT agrega_cat1;
ROLLBACK;
*/



/*Para diseñar esta base de datos, he considerado las siguientes entidades:

Departamento: información de los departamentos en los que trabajan los empleados.
Empleados: información de los empleados de la empresa.
Género: información de los géneros de las personas.
Cliente: información de los clientes de la empresa.
Vendedor: información de los vendedores de la empresa.
Supervisor: información de los supervisores de la empresa.
Ventas_Hechos: información de las ventas realizadas por los vendedores.
Vehiculo: información de los vehiculos vendidos por los vendedores.
Condicion_vehiculo: información de las condiciones de los vehiculos.
Región: información de las regiones geográficas de la empresa.
Sucursal: información de las sucursales de la empresa.
Ciudad: información de las ciudades donde están ubicadas las sucursales.
Condición_Factura: información de las condiciones de pago de las facturas.
Días_Factura: información de los días de pago de las facturas.
Metas_Ventas_Anual: información de las metas de ventas anuales de los vendedores.
Estatus_Facturas: información del estatus de las facturas.


EL MODELO DE BASE DE DATOS:

La tabla "Departamento" tiene una relación de uno a muchos con la tabla "Empleados", ya que un departamento puede tener varios empleados, pero un empleado solo puede pertenecer a un departamento.
La tabla "Empleado" tiene una relación de muchos a uno con la tabla "Departamento", ya que un empleado trabaja en un solo departamento, pero un departamento puede tener varios empleados.
La tabla "Género" tiene una relación de uno a muchos con la tabla "Cliente", ya que un género puede tener varios clientes, pero un cliente solo puede tener un género.
La tabla "Vendedor" tiene una relación de uno a muchos con la tabla "Supervisor", ya que un supervisor puede tener varios vendedores, pero un vendedor solo puede tener un supervisor.
La tabla "Supervisor" tiene una relación de muchos a uno con la tabla "Empleado", ya que un supervisor es un tipo de empleado, pero un empleado puede ser de varios tipos.
La tabla "Ventas_Hechos" tiene una relación de muchos a uno con la tabla "Vehiculo", ya que una venta puede tener varios vehiculos, pero un vehiculo solo puede pertenecer a una venta.
La tabla "Vehiculo" tiene una relación de uno a muchos con la tabla "Condicion_vehiculo", ya que una condicion puede tener varios vehiculos, pero un vehiculo solo puede pertenecer a una condicion.
La tabla "Region" tiene una relación de uno a muchos con la tabla "Ciudad", ya que una región puede tener varias ciudades, pero una ciudad pertenece a una sola región.
La tabla "Ciudad" tiene una relación de uno a muchos con la tabla "Sucursal", ya que una ciudad puede tener varias sucursales, pero una sucursal está ubicada en una sola ciudad.
La tabla "Sucursal" tiene una relación de uno a muchos con la tabla "Ciudad", ya que una ciudad puede tener varias sucursales, pero una sucursal solo puede estar en una ciudad.
La tabla "Ventas_Hechos" tiene una relación de muchos a uno con la tabla "Vendedor", ya que una venta puede ser realizada por un vendedor, pero un vendedor puede tener varias ventas.
La tabla "Ventas_Hechos" tiene una relación de muchos a uno con la tabla "Cliente", ya que una venta puede ser realizada a un cliente, pero un cliente puede tener varias ventas.
La tabla "Ventas_Hechos" tiene una relación de muchos a uno con la tabla "Condición_Factura", ya que una venta puede tener una condición de pago, pero una condición de pago puede estar en varias ventas.
La tabla "Ventas_Hechos" tiene una relación de muchos a uno con la tabla "Días_Factura", ya que una venta puede tener un día de pago, pero un día de pago puede estar en varias ventas.
La tabla "Ventas_Hechos" tiene una relación de muchos a uno con la tabla "Supervisor", ya que una venta puede ser supervisada por un solo supervisor, pero un supervisor puede supervisar varias ventas.
La tabla "Ventas_Hechos" tiene una relación de muchos a uno con la tabla "Metas_Ventas_Anual", ya que una venta contribuye a cumplir una meta de ventas anual, pero una meta de ventas anual puede ser alcanzada por varias ventas.
La tabla "Estatus_Facturas" tiene una relación de muchos a uno con la tabla "Condición_Factura", ya que un estado de factura puede corresponder a una sola condición de factura, pero una condición de factura puede tener varios estados de factura.


*/




--CREAR UNA BASE DE DATOS:
CREATE DATABASE CONCESIONARIO_DE_VEHICULOS;

--USAMOS LA BASE DE DATOS:
use  CONCESIONARIO_DE_VEHICULOS;
go

--Creamos la Tabla departamento
 CREATE TABLE departamento(
 id_departamento int Primary key,
 nombre_departamento VARCHAR(40)
);

--seleccionamos la tabla para ver como ha quedado:

select * from departamento

--Creamos la Tabla Genero

CREATE TABLE genero(
	 id_genero int Primary key,
	 genero varchar(15)
	);

--seleccionamos la tabla para ver como ha quedado:

select * from genero


--Creamos la Tabla sucursal

create table sucursal(
	id_sucursal int primary key not null,
	surcusal varchar(50) not null,
	);
GO

--seleccionamos la tabla para ver como ha quedado:

select * from sucursal


--Creamos la Tabla region
create table region(
	id_region int primary key not null,
	nombre varchar(50) not null,
	);
GO

--ver como ha quedado la tabla:

select * from region

--Creamos la Tabla cuidades
create table ciudad(
	id_ciudad int primary key not null,
	nombre_ciudad varchar(50) not null,
	latitud float NULL,
	longitud float NULL,
	id_region int references region(id_region)
	);
go

--seleccionamos la tabla para ver como ha quedado:

select * from ciudad


--Creamos la Tabla region

create table status_empleado(
	id_status_empleado int primary key not null,
	tipo_contrato varchar(50) not null,
	Status_empleado varchar(30) not null,
	);
GO

--seleccionamos la tabla 

select * from status_empleado


--Creamos la Tabla empleados

CREATE TABLE empleados(
	 id_empleados int Primary key,
	 nombre varchar(30),
	 cedula varchar(15),
	 fecha_nacimiento date not null,
	 estado_civil varchar(10) not null,
	 nivel_academico varchar(20) not null,
	 sueldo int not null,
	 posicion varchar(50) not null,
	 fecha_entrada date not null,
	 id_genero int,
	 id_region int,
	 id_ciudad int,
	 id_sucursal int,
	 id_departamento int,
	 id_status_empleado int
	FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento),
	FOREIGN KEY (id_genero) REFERENCES genero (id_genero),
	FOREIGN KEY (id_region) REFERENCES region (id_region),
	FOREIGN KEY (id_ciudad) REFERENCES ciudad (id_ciudad),
	FOREIGN KEY (id_sucursal) REFERENCES sucursal (id_sucursal),
	FOREIGN KEY (id_status_empleado) REFERENCES status_empleado (id_status_empleado),
	  );
go

--seleccionamos la tabla para ver como ha quedado:

select * from empleados


--Creamos la Tabla supervisores

create table supervisor(
	id_supervisor int primary key not null,
	supervisor varchar(50) not null,
	id_sucursal int not null,
	id_region int not null,
	id_genero int not null,
	FOREIGN KEY (id_sucursal) REFERENCES sucursal (id_sucursal),
	FOREIGN KEY (id_region) REFERENCES region (id_region),
	FOREIGN KEY (id_genero) REFERENCES genero (id_genero),
	);
GO

	select * from supervisor


 --CREAR TABLA FOTOS DE SUPERVISOR:

create table Fotos_supervisor (
	id_Foto_supervisor int primary key not null,
	foto_Supervisor_url varchar (255) not null,
	id_region int not null,
	id_genero int not null,
	id_supervisor int null,
	FOREIGN KEY (id_region) REFERENCES region (id_region),
	FOREIGN KEY (id_genero) REFERENCES genero (id_genero),
	FOREIGN KEY (id_supervisor) REFERENCES supervisor (id_supervisor),
	);
go

--seleccionamos la tabla para ver como ha quedado:

SELECT * FROM Fotos_supervisor


--CREAREMOS UNA TABLA LLAMADA CONDICION DE FACTURA

create table condicion_factura (
	id_condicion int primary key not null,
	condicion varchar(25) not null,
	);
GO

--seleccionamos la tabla para ver como ha quedado:

select * from condicion_factura

--CREAREMOS UNA TABLA LLAMADA DIAS DE FActuracion

create table dias_factura (
	id_dias_factura int primary key not null,
	dias_creditos int not null,
	);
GO

--seleccionamos la tabla para ver como ha quedado:

select * from dias_factura

--Creamos la Tabla Cliente

create table cliente(
	id_cliente int primary key not null,
	nombre_Cliente varchar(50) not null,
	apellido_Cliente varchar(50)not null,
	nombre_Negocio varchar (100) not null,
	direccion varchar(100) not null,
	telefono varchar(100) not null,
	RNC varchar (15) not null,
	id_region int not null,
	FOREIGN KEY (id_region) REFERENCES region (id_region),
	);
go

--seleccionamos la tabla para ver como ha quedado:

select * from cliente



--Creamos la Tabla condicion vehiculo

create table condicion_vehiculo (
	id_condicion int primary key not null,
	descripcion varchar(100) not null
	);
go

select * from condicion_vehiculo


--CREAMOS LA TABLA FOTO CONDICION VEHICULO:
create table Foto_condicion_vehiculo (
	id_Foto_condicion int primary key not null,
	url_Foto varchar(200) not null,
	id_condicion int not null,
	FOREIGN KEY (id_condicion) REFERENCES condicion_vehiculo (id_condicion),
);
go

select * from Foto_condicion_vehiculo


--Creamos la Tabla
CREATE TABLE Vehiculos (
    id_vehiculo INT PRIMARY KEY NOT NULL,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Anio INT NOT NULL,
    Color VARCHAR(50) NOT NULL,
    Kilometraje FLOAT NOT NULL,
    VIN VARCHAR(17) NOT NULL,
	existencia int not null,
	precio_compra int not null,
    precio_ventas int not null,
    fecha_entrada DATE NOT NULL,
	id_condicion int not null,
	FOREIGN KEY (id_condicion) REFERENCES condicion_vehiculo (id_condicion),
);

go

--seleccionamos la tabla para ver como ha quedado:

select * from Vehiculos
	   	 
--CREAR TABLA FOTOS DE VEHICULOS:

create table Fotos_vehiculos (
	id_foto_vehiculo int primary key not null,
	foto_vehiculos_url varchar (255) not null,
	id_vehiculo int not null,
	id_condicion int not null,
	FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos (id_vehiculo),
	FOREIGN KEY (id_condicion) REFERENCES condicion_vehiculo (id_condicion),
	);
go


--Creamos la Tabla vendedor

create table vendedor(
	id_vendedor int primary key not null,
	nombre_vendedor varchar(50) not null,
	id_ciudad int not null,
	id_region int not null,
	id_empleados int not null,
	id_cliente int not null,
	id_supervisor int not null,
	id_genero int not null,
	FOREIGN KEY (id_empleados) REFERENCES empleados (id_empleados),
	FOREIGN KEY (id_region) REFERENCES region (id_region),
	FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
	FOREIGN KEY (id_supervisor) REFERENCES supervisor (id_supervisor),
	FOREIGN KEY (id_ciudad) REFERENCES ciudad (id_ciudad),
	FOREIGN KEY (id_genero) REFERENCES genero (id_genero),
	);
go

--seleccionamos la tabla para ver como ha quedado:

select * from vendedor


--CREAR TABLA FOTOS DE VENDEDOR:

create table Fotos_vendedor (
	id_vendedor int primary key not null,
	foto_Vendedor_url varchar (255) not null,
	id_genero int not null,
	id_region int not null,
	id_supervisor INT NOT NULL,
	FOREIGN KEY (id_region) REFERENCES region (id_region),
	FOREIGN KEY (id_supervisor) REFERENCES supervisor (id_supervisor),
	FOREIGN KEY (id_vendedor) REFERENCES vendedor (id_vendedor),
);
go

--seleccionamos la tabla para ver como ha quedado:

select * from Fotos_vendedor


--PROCEDEREMOS A CREAR LA TABLA BASICA VENTAS HECHOS:

create table Ventas_Hechos(
	id_ventas int primary key not null,
	No_facturas int not null,
	fecha_venta date,
	id_condicion int not null,
	id_dias_factura int not null,
	id_vendedor int not null,
	id_cliente int not null,
	id_vehiculo int not null,
	cantidad int not null,
	precio_ventas int not null,
	monto as (cantidad * precio_ventas) PERSISTED,--Campo Calculado, Multiplica Datos.
	id_region  int not null,
	id_ciudad  int not null,
	FOREIGN KEY (id_condicion) REFERENCES condicion_factura (id_condicion),
	FOREIGN KEY (id_dias_factura) REFERENCES dias_factura (id_dias_factura),
	FOREIGN KEY (id_vendedor) REFERENCES vendedor (id_vendedor),
	FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
	FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos (id_vehiculo),
	FOREIGN KEY (id_region) REFERENCES region (id_region),
	FOREIGN KEY (id_ciudad) REFERENCES ciudad (id_ciudad),
	);
go

--seleccionamos la tabla para ver como ha quedado:

select * from Ventas_Hechos


--CREAR TABLA ESTATUS DE FACTURACION:

create table Estatus_Facturas(
	id_status int primary key not null,
	fecha_pago date,
	id_ventas int not null,
	No_facturas int not null,
	id_cliente int not null,
	monto_pagado int not null,
	Dias_credito int not null,
	estatus_Cobrado varchar(20) not null,
	FOREIGN KEY (id_ventas) REFERENCES ventas_hechos (id_ventas),
	FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
	);
go

--SELECCIONAMOS LA TABLA PARA LA ESTRUCTURA

select * from Estatus_Facturas


--crearemos la tabla Metas
create table Metas_Ventas_Anual(
	id_meta int primary key not null,
	id_sucursal int not null,
	id_region int null,
	fecha_inicio date,
	fecha_corte date,
	monto int not null,
	FOREIGN KEY (id_sucursal) REFERENCES sucursal (id_sucursal),
	FOREIGN KEY (id_region) REFERENCES region (id_region),
	);
go

select * from Metas_Ventas_Anual



--Insertamos algunos registros a la departamento:
select * from departamento

INSERT INTO departamento (id_departamento, nombre_departamento) VALUES(111, 'Seguridad');
INSERT INTO departamento (id_departamento, nombre_departamento) VALUES(110, 'Administracion');
INSERT INTO departamento (id_departamento, nombre_departamento) VALUES(112, 'Contabilidad');
INSERT INTO departamento (id_departamento, nombre_departamento) VALUES(113, 'Ventas');
INSERT INTO departamento (id_departamento, nombre_departamento) VALUES(114, 'Tecnologia');
INSERT INTO departamento (id_departamento, nombre_departamento) VALUES(115, 'Marketing');
INSERT INTO departamento (id_departamento, nombre_departamento) VALUES(116, 'Inventario');

--Insertamos algunos registros a la departamento DIRECTIVOS:

INSERT INTO departamento (id_departamento, nombre_departamento) VALUES(117, 'CTO (Chief Technology Officer)');
INSERT INTO departamento (id_departamento, nombre_departamento) VALUES(118, 'COO (Chief Operating Officer)');
INSERT INTO departamento (id_departamento, nombre_departamento) VALUES(119, 'CMO (Chief Marketing Officer)');
INSERT INTO departamento (id_departamento, nombre_departamento) VALUES(120, 'CFO (Chief Financial Officer)');
INSERT INTO departamento (id_departamento, nombre_departamento) VALUES(121, 'CCO (Chief Communications Officer)');
INSERT INTO departamento (id_departamento, nombre_departamento) VALUES(122, 'CEO (Chief Executive Officer)');


--HACEMOS UN SELECT PARA LOS DEPARTAMENTOS:

SELECT * FROM departamento

--insertateremos datos en la tabla genero

insert into genero (id_genero, genero) values (1,'Femenino');
insert into genero (id_genero, genero) values (2,'Masculino');
insert into genero (id_genero, genero) values (3,'Otros');


--HACEMOS UN SELECT PARA LOS GENEROS:

SELECT * FROM GENERO

--Insertamos algunos registros a la tabla sucursal:

INSERT INTO sucursal(id_sucursal, surcusal)VALUES(1,'Santo Domingo');--Toda la Parte Sureste del Pais Incluyendo y Santo Domingo
INSERT INTO sucursal(id_sucursal, surcusal)VALUES(2,'Santiago');--Todo el Cibao y el Norte del Pais

--Insertamos algunos registros a la tabla region:

INSERT INTO region(id_region, nombre)VALUES(1,'Region Este');--Toda la Parte Sureste del Pais Incluyendo y Santo Domingo
INSERT INTO region(id_region, nombre)VALUES(2,'Region Cibao');--Todo el Cibao y el Norte del Pais


--Insertamos algunos registros a la tabla supervisor:

INSERT INTO supervisor(id_supervisor, supervisor, id_sucursal,id_region, id_genero)VALUES(1,'JUANCITO PEÑA VIZCAINO',1,1,2);--Toda la Parte Sureste del Pais Incluyendo y Santo Domingo
INSERT INTO supervisor(id_supervisor, supervisor, id_sucursal,id_region, id_genero)VALUES(2,'ANTONIO SEGURA',2,2,2);--Todo el Ciebao y el Norte del Pais

--Insertamos algunos registros a la tabla CUIDAD:

--REGION DEL ESTE:
 SELECT * FROM ciudad

INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(1,'Santo Domingo DN',18.502007355386127, -69.9379561871873,1);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(2,'Santo Domingo Oeste',18.5104964364861,-69.8572232487354,1);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(3,'Santo Domingo Este',18.4884701,-69.8570709,1);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(4,'Santo Domingo Norte',18.55,-69.9,1);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(5,'San Pedro de Macorós',18.4538994,-69.3086395,1);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(6,'La Romana',18.4273300,-68.9728470,1);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(7,'Salvaleón de Higuey',18.6150093,-68.7079773,1);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(8,'Punta Cana',18.5818195,-68.4043121,1);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(9,'El Seibo',18.76559,-69.03886,1);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(10,'Hato Mayor',18.76278,-69.25681,1);


--REGION DEL CIBAO:

INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(11,'Concepción de La Vega',19.2220707,-70.5295563,2);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(12,'Moca',19.3935204,-70.5259781,2);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(13,'San Felipe de Puerto Plata',19.7934399,-70.6884003,2);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(14,'San Francisco de Macorós',19.3009892,-70.2525864,2);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(15,'Santiago de los Caballeros', 19.4517002,-70.6970291,2);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(16,'Bonao',18.9368706,-70.4092331,2);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(17,'Valverde',19.566667,-71.083333,2);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(18,'Monte Cristi',19.85,-71.65,2);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(19,'Samaná',19.205278, -69.336389,2);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(20,'Puerto Plata',19.795833, -70.694444,2);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(21,'Dajabón',19.54878, -71.70829,2);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(22,'Salcedo',19.37762,-70.41762,2);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(23,'Nagua',19.3832,-69.8474,2);
INSERT INTO ciudad (id_ciudad, nombre_ciudad, latitud, longitud,id_region)VALUES(24,'Cotuí',19.55186,-71.07813,2);


--insertar status_empleado

insert into status_empleado (id_status_empleado, tipo_contrato,Status_empleado) values(1,'Tiempo Completo', 'Activo')
insert into status_empleado (id_status_empleado, tipo_contrato,Status_empleado) values(2,'Tiempo Completo', 'Renuncia')
insert into status_empleado (id_status_empleado, tipo_contrato,Status_empleado) values(3,'Tiempo Completo', 'Cancelado')
insert into status_empleado (id_status_empleado, tipo_contrato,Status_empleado) values(4,'Tiempo Completo', 'Suspendido')

insert into status_empleado (id_status_empleado, tipo_contrato,Status_empleado) values(5,'Tiempo Parcial', 'Activo')
insert into status_empleado (id_status_empleado, tipo_contrato,Status_empleado) values(6,'Tiempo Parcial', 'Renuncia')
insert into status_empleado (id_status_empleado, tipo_contrato,Status_empleado) values(7,'Tiempo Parcial', 'Cancelado')
insert into status_empleado (id_status_empleado, tipo_contrato,Status_empleado) values(8,'Tiempo Parcial', 'Suspendido')

insert into status_empleado (id_status_empleado, tipo_contrato,Status_empleado) values(9,'Remoto al 100%', 'Activo')
insert into status_empleado (id_status_empleado, tipo_contrato,Status_empleado) values(10,'Remoto al 100%', 'Cancelado')
insert into status_empleado (id_status_empleado, tipo_contrato,Status_empleado) values(11,'Mixto', 'Activo')
insert into status_empleado (id_status_empleado, tipo_contrato,Status_empleado) values(12,'Mixto', 'Cancelado')


SELECT * FROM status_empleado

--INSERTAMOS DATOS EN LA TABLA - ORDEN TODOS LOS DE LA REGION 1 

INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(1,'ROBERT REYNOSO SOTO','244-0000256-1','1973-03-20', 'Soltero','Bachillerato',18600,'vendedor','2014-01-01',2,1,1,1,113,'1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(2,'YEREMY ROSADO ARIAS','142-2568921-1','1971-12-13', 'Soltero','Diplomado/a',18600,'vendedor','2014-01-01',2,1,2,1,113,'1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(3,'JEIFRY DE JESUS CASTRO','201-7800123-0','1969-07-20','Soltero/a','Diplomado/a',18600,'vendedor','2014-01-01',	2,1,3,1,113, '1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(4,'JOSE PINALES RAMIREZ','007-0072310-3','1973-07-23','Separado/a','Bachillerato',18600,'vendedor','2014-01-01',2,1,4,1,113,'1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(5,'PABLO SOLORIN LUCIANO','142-7654321-1','1969-10-16','Soltero/a','Bachillerato',18600,'vendedor','2014-01-01',2,1,5,1,113, '1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(6,'LEONARDO PEÑA LAPAIX','123-4567891-0','1978-11-05','Casado/a','Diplomado/a',18600,'vendedor','2014-01-01',2,1,6,1,113,'1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(7,'YANELIS LOPEZ APOLINAR','325-1234567-1','1966-06-10','Casado/a','Bachillerato',	18600,	'vendedor',	'2014-01-01',1,1,7,1,113, '1');

--INSERTAMOS DATOS EN LA TABLA - ORDEN TODOS LOS DE LA REGION 2 

INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(8,'MARIA MORALES','220-0088004-1','1966-06-10','Casado/a','Bachillerato',55200,	'vendedor',	'2014-01-01',1,2,15,2,113, '1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(9,'ALONZO DE LOS SANTOS','007-0072310-4','1964-03-11','Casado/a','Bachillerato',35600,'vendedor','2014-01-01',2,2,16,2,113, '1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(10,'ALEXANDER FERRERAS','142-7654321-2','1969-12-13','Soltero/a','Diplomado/a',25000,'vendedor','2014-01-01',2,2,17,2,113,  '1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(11,'FRANK NUÑEZ VIDAL','123-4567891-1','1979-12-13','Soltero/a','Diplomado/a',25000,'vendedor','2014-01-01',2,2,18,2,113,  '1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(12,'ALEXANDER REYES','325-1234567-2','1970-11-13','Soltero/a','Bachillerato',30000,'vendedor','2014-01-01',2,2,19,2,113,  '1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(13,'JOSE ANTONIO MENDEZ','220-0088004-2','1970-10-13','Soltero/a','Bachillerato',25000,'vendedor','2014-01-01',2,2,16,2,113 ,'1');

--INSERTAMOS DATOS A LOS PUESTOS DIRECTIVOS

INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(14,'KELVIN SANCHEZ DE LA CRUZ','224-0000000-1','1985-06-10','Casado/a','Maestria Sistemas',75000,'CTO (Chief Technology Officer)','2014-03-01',2,1,2,1,117, '1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(15,'ADRIAN FERMIN','007-0072310-6','1980-07-20', 'Separado/a','LIC. ADMINISTRACION',120000,'CEO (Chief Executive Officer)','2014-06-04',2,2,12,2,122,'1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(16,'ELINER SANTOS GUZMAN','142-7654321-4','1977-03-28', 'Soltero','LIC. ADMINISTRACION',130000,'COO (Chief Operating Officer)','2017-08-11',1,1,7,1,118,'1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(17,'NICELY REYES VALENZUELA','123-4567891-3','1990-10-16', 'Separado/a','LIC. ADMINISTRACION',150000,'CMO (Chief Marketing Officer)','2014-10-01',1,1,4,1,119, '1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(18,'MARYSOL  BRITO LEONIDAS','325-1234567-4','1986-11-16', 'Soltero','LIC. ADMINISTRACION',145000,'CFO (Chief Financial Officer)','2016-03-30',1,1,2, 1,120,'1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(19,'SINARA OLIVA BELTRE DE LA CRUZ','225-5555444-5','1989-03-20','Casado/a','ING. INDUSTRIAL',145000,'CCO (Chief Communications Officer)','2021-11-25',1,1,7,1,121, '1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(20,'MARCOS ISABEL SEGURA','225-5555444-6','1980-03-20','Casado/a','LIC. ADMINISTRACION',75000,'CEO (Chief Executive Officer)','2015-01-01',2,1,6,1,122,'1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(21,'JEAN CARLOS PASCUAL DE LEON','445-5824890-1','1983-09-17','Soltero/a','LIC.CONTABILIDAD',65000,'Enc. Inventario','2014-01-01',2,1,6,1,116,'1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(22,'LUIS MIGUEL TAMAREZ PEREZ','225-5555444-6','1989-03-06','Soltero/a','LIC. ADMINISTRACION',50000,'Enc. Inventario','2014-03-03',2,2,17,2,116,'1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(23,'MELISSA PEREZ LOPEZ','445-5824890-2','1989-03-06','Soltero/a','LIC. Marketing',35000,'Enc. Marketing','2016-05-30',1,1,7,1,115,'1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(24,'HAIDER ROSARIO  BERIGUETE','225-5555444-7','1984-07-23','Separado/a','ING. EN SISTEMAS',22000,'Enc. Seguridad','2015-02-09',2,1,3,1,110,'1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(25,'YEIKOL SOTO CASADO','445-5824890-3','1984-07-23','Separado/a','ADMINISTRACION',38000,'Enc. Seguridad','2014-01-01',2,2,13,2,110,'1');
INSERT INTO empleados (id_empleados, nombre, cedula, fecha_nacimiento, estado_civil, nivel_academico, sueldo, posicion, fecha_entrada, id_genero,id_region, id_ciudad, id_sucursal, id_departamento,id_status_empleado)
VALUES(26,'IVARLYN SOTO TEJEDA','225-5555444-8','1989-10-16','Separado/a','ADMINISTRACION',36000,'Enc. Auditoria','2016-12-22',2,1,2,1,111,'1');

SELECT * FROM empleados

--Insertamos algunos registros a la tabla clientes:

--CLIENTES REGION ESTE
insert into cliente values (100001,'MARIA','RODRIGUEZ','La Esquina Del Sabor','C/SAN JUAN # 777','809-767-9290','101-1001-001',1);--ESTE
insert into cliente values (100002,'DARIEL','VASQUEZ','JUEGOS_RD','C/JUEGANDO SIEMPRE','809-664-0043','158-512-991',1); --ESTE
insert into cliente values (100003,'LEONEL','GUZMAN','TECNOLO-GUIA','C/NO SE DONDE ES','809-988-8888','211-151-001',1);--ESTE
insert into cliente values (100004,'DANILO','MENTIRA','NOTICIAS-DANILO','C/JUAN Y QUE','809-789-4300','088-852-111',1);--ESTE
insert into cliente values (100005,'ALEXANDER','ARIAS','MOVILES-AA-','C/JOSE AGUSTIN','849-507-1010','101-1001-001',1);--ESTE
insert into cliente values (100006,'ALVARO','ABAD','CVC-TEC','AV.IZABEL AGUIAR','829-444-3494','208-121-191',1);--ESTE
insert into cliente values (100007,'HECTOR','LIRIANO','EMPANADA-BUENAS','C/44 # 56S','809-888-8777','001-001-009',1);--ESTE

--CLIENTES REGION ESTE
insert into cliente values (100008,'RAQUEL','GARCIA RAMIREZ','CONSTRUCCIONES RD.','AV. ESPAÑA # 55',	'809-888-8780','208-121-194',1);--ESTE
insert into cliente values (100009,'GLORIA','BENEGAS','HELADOS SABROSOS RD','AV. SIEMPRE VIDA','829-444-3497','202-2002-013',1);--ESTE
insert into cliente values (100010,'MILDRED','BATISTA GUERRA','COMEDOR BUEN PROVECHO','AV. SIEMPRE DE NOCHE','809-888-8781','208-121-195',1);--ESTE
insert into cliente values (100011,'FRANCIA','ITALIA BENECIA','PAPELRIA CORPOTIVA.S.A.','AV. FEDERICO BASILIS',	'809-888-8780','208-121-194',1);--ESTE

--CLIENTES REGION CIBAO
insert into cliente values (100012,'MARCOS','SOTO JIMENEZ','DISTRIBUIDORA CALYPSO', 'AV. MONUMENTAL # 52','809-888-8779','202-2002-011',2);--CIBAO
insert into cliente values (100013,'JOSEP','AGUILERA VILLA','INVERSIONES Y NEGOCIOS S.A.','CARRETRA PRINCIPAL CIBAO','809-977-3302','208-121-193',2);--CIBAO
insert into cliente values (100014,'ESTHER','PASCUAL ALOY','LINHAMDAN ARBOLEDA & COMPANIA S.A','AV. JUAN PABLO DUARTE','809-707-2022','222-552-558',2);--CIBAO
insert into cliente values (100015,'LAURA','VALLEJO GUTIERRES','INVERSIONES VIENA S.A.','AV. JOSE MARTI','829-444-3496','202-2002-012',2);--CIBAO
insert into cliente values (100016,'RAQUEL','RAMIREZ GARCIA','PAPELRIA CORPOTIVA.S.A.','AV. FEDERICO BASILIS',	'809-888-8780','208-121-194',2);--CIBAO
insert into cliente values (100017,'LOURDES','MENDEZ','ZAPATOS Y MAS CALIDAD','AV. SIEMPRE VIDA','829-444-3497','202-2002-013',2);--CIBAO
insert into cliente values (100018,'SOFIA','GUARDIA BELEN','LENCERIA TODO SEXY','AV. SIEMPRE DE NOCHE','809-888-8781','208-121-195',2);--CIBAO

--CLIENTES REGION CIBAO
insert into cliente values (100019,'BAYDEN','AMILCAR GUERRA','SOLUCIONES WEB.','AV. FRANCISCO PEÑA','809-111-2565','108-444-222',2);--CIBAO
insert into cliente values (100020,'JUANITA','MARTINEZ','NOTICAS MUNDIALES','AV. NOTICIAS PARA TI # 52','809-444-4444','222-211-222',2);--CIBAO
insert into cliente values (100021,'YENNIFER','LOMBARDER','MODELOS MUNDIALES','AV. MEJOR BESTIDO','809-777-8988','002-333-2222',2);--CIBAO




--Insertamos algunos registros a la tabla condicion vehiculo:

insert into condicion_vehiculo values (1101,'NUEVO');
insert into condicion_vehiculo values (1102,'USADO');


--seleccionamos la tabla para ver como ha quedado:

select * from condicion_vehiculo


--INSERTAMOS ALGUNOS VEHICULOS 1-NUEVOS:

insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (1,'Nissan','X-Trail','2023','Blanco Perla','0','JM1BL1TG7D1838654','20','400000','458560','01-11-2015','1101');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (2,'Nissan','Altima','2023','Gris Oxford','0','1ED1S292XN4045354','15','200000','212805','11-05-2015','1101');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (3,'JAC','Sei7 Pro','2023','Blanco','0','JTHBA30GX45052912','10','600000','621000','11-06-2015','1101');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (4,'Toyota','Raize','2023','Gris','0','3FAFP07156R166288','10','300000','364000','11-01-2015','1101');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (5,'Suzuki','Jimny','2023','Verde Manzana','0','3FAHP07Z17R164831','10','400000','445990','11-03-2015','1101');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (6,'Ford','Ranger Raptor','2023','Azul','0','1FTPW14514KA99785','10','1300000','1339000','11-01-2015','1101');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (7,'Ford','Explorer','2023','Rojo','0','5J6TF1H59BL003587','10','1300000','1374000','11-02-2015','1101');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (8,'Nissan','Kicks','2023','Negro','0','1GYS4KEF0BR347391','10','200000','208956','11-04-2015','1101');

select * from Vehiculos

--INSERTAMOS ALGUNOS VEHICULOS 2-USADOS:

insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (9,'Chevrolet','Sonic','2017','Gris','89546','2C3HD46R2YH135710','10','200000','239000','11-01-2015','1102');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (10,'Suzuki','Ignis','2018','Blanco','62494 ','WBABJ8321WEM20604','10','40000','46600','03-06-2015','1102');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (11,'Mazda','CX-3','2019','Blanco','22694','1B7HF16Y2VJ532551','30','65000','70800','10-04-2015','1102');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (12,'Toyota','Corolla','2019','Gris Oscuro','36390','1FUBA3BD51LJ23261','30','55000','60800','05-24-2015','1102');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (13,'Mazda','3 Sedán','2020','Rojo','39764 ','5XXGN4A7XFG350326','10','50000','58000','05-19-2015','1102');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (14,'Volkswagen','Jetta','2016','Rojo','88300','JH4DC53012C042162','10','75000','83900','19-05-2015','1102');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (15,'Nissan','Sentra','2020','Naranja Solar','43468','4T1BF1FK7CU096210','10','95000','104112','05-05-2015','1102');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (16,'Toyota','Prius','2018','Azul','60000 ','1C6RD7NT6CS146684','10','65000','72000','19-10-2015','1102');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (17,'Mercedes','Clase GLA','2017','Negro','90000','SALTY1543YA266280','25','120000','134970','10-05-2015','1102');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (18,'Mazda','3 Hatchback','2020','Gris Titanio','44000','5J6RM3H35EL004735','10','130000','143700','29-05-2020','1102');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (19,'Chevrolet','Trax','2019','Blanco','39384 ','5XYZK4AG2BG002611','10','50000','61800','17-05-2015','1102');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (20,'Jeep','Compass','2019','Gris','42685 ','1G8ZS57N38F160148','10','90000','98200','10-04-2015','1102');
insert into Vehiculos (id_vehiculo, Marca, Modelo, Anio, Color, Kilometraje, VIN, existencia, precio_compra, precio_ventas,fecha_entrada, id_condicion) values (21,'Toyota','Prius C','2021','Blanco','42410','4T1BF3EK0AU064144','10','68000','80000','29-05-2015','1102');


--VER IDIOMA DE MI SQL SERVER:
SELECT @@LANGUAGE AS IDIOMA
--CAMBIAMOS IDIOMA DEPENDIENDO:
SET LANGUAGE SPANISH
SET LANGUAGE ENGLISH

--VENDEDORES DEL ESTE:
INSERT INTO vendedor (id_vendedor, nombre_vendedor, id_ciudad,id_region,id_empleados, id_cliente, id_supervisor, id_genero)
VALUES(1,'ROBERT REYNOSO SOTO',1,1,1,100006,1,2);--Región Sureste
INSERT INTO vendedor (id_vendedor, nombre_vendedor, id_ciudad,id_region,id_empleados,id_cliente, id_supervisor, id_genero)
VALUES(2,'YEREMY ROSADO ARIAS',2,1,2,100008,1,2);--Región Sureste
INSERT INTO vendedor (id_vendedor, nombre_vendedor, id_ciudad,id_region,id_empleados, id_cliente,id_supervisor, id_genero)
VALUES(3,'JEIFRY DE JESUS CASTRO',3,1,3,100002,1,2);--Región Sureste
INSERT INTO vendedor (id_vendedor, nombre_vendedor, id_ciudad,id_region,id_empleados,id_cliente, id_supervisor, id_genero)
VALUES(4,'JOSE PINALES RAMIREZ',4,1,4,100010,1,2);--Región Sureste
INSERT INTO vendedor (id_vendedor, nombre_vendedor, id_ciudad,id_region,id_empleados, id_cliente,id_supervisor, id_genero)
VALUES(5,'PABLO SOLORIN LUCIANO',5,1,5,100007,1,2);--Región Sureste
INSERT INTO vendedor (id_vendedor, nombre_vendedor, id_ciudad,id_region,id_empleados,id_cliente, id_supervisor, id_genero)
VALUES(6,'LEONARDO PEÑA LAPAIX',6,1,6,100005,1,2);--Región Sureste
INSERT INTO vendedor (id_vendedor, nombre_vendedor, id_ciudad,id_region,id_empleados, id_cliente,id_supervisor, id_genero)
VALUES(7,'YANELIS LOPEZ APOLINAR',7,1,7,100003,1,1);--Región Sureste	

--VENDEDORES DEL CIBAO:
INSERT INTO vendedor (id_vendedor, nombre_vendedor, id_ciudad,id_region,id_empleados,id_cliente, id_supervisor, id_genero)
VALUES(8,'MARIA MORALES',1,2,8,100015,2,1);--Región Norte o Cibao
INSERT INTO vendedor (id_vendedor, nombre_vendedor, id_ciudad,id_region,id_empleados, id_cliente, id_supervisor, id_genero)
VALUES(9,'ALONZO DE LOS SANTOS',1,2,9,100012,2,2);--Región Norte o Cibao
INSERT INTO vendedor (id_vendedor, nombre_vendedor, id_ciudad,id_region,id_empleados,id_cliente, id_supervisor, id_genero)
VALUES(10,'ALEXANDER FERRERAS',2,2,10,100018,2,2);--Región Norte o Cibao
INSERT INTO vendedor (id_vendedor, nombre_vendedor, id_ciudad,id_region,id_empleados, id_cliente,id_supervisor, id_genero)
VALUES(11,'FRANK NUÑEZ VIDAL',3,2,11,100016,2,2);--Región Norte o Cibao
INSERT INTO vendedor (id_vendedor, nombre_vendedor, id_ciudad,id_region,id_empleados,id_cliente, id_supervisor, id_genero)
VALUES(12,'ALEXANDER REYES',4,2,12,100013,2,2);--Región Norte o Cibao
INSERT INTO vendedor (id_vendedor, nombre_vendedor, id_ciudad,id_region,id_empleados, id_cliente,id_supervisor, id_genero)
VALUES(13,'JOSE ANTONIO MENDEZ',5,2,13,100014,2,2);--Región Norte o Cibao


--INSERTAMOS LOS DATOS EN LA TABLA:

 insert into Fotos_supervisor values ('1','https://lms.oymas.edu.do/assets/avatar/assets/files/J8r29dLkMxq4OYh224-0000833-4-avatar.png','1','2','1');
 insert into Fotos_supervisor values ('2','https://lms2.oymas.edu.do/assets/avatar/assets/files/ToQdSQH7U486PHQ20-eism-1-127-avatar.jpg','2','2','2');


 --VENDEDORES DE LA REGION 1 Y VENDEDOR 1:

insert into Fotos_vendedor values ('1','https://pps.whatsapp.net/v/t61.24694-24/75500802_1056133038074602_2470958770030370423_n.jpg?ccb=11-4&oh=01_AdQv7-46ZUYQIjynAqcEYbbE4vFjlVIi32c-F0Oodim_fw&oe=64532044','2','1','1');
insert into Fotos_vendedor values ('2','https://lms2.oymas.edu.do/assets/avatar/assets/files/0qrexD6rKqeOlcU20-EISM-1-030-avatar.jpg','2','1','1');
insert into Fotos_vendedor values ('3','https://dl.dropbox.com/s/0jkab8w6ie0h91z/A42.png','2','1','1');
insert into Fotos_vendedor values ('4','https://dl.dropbox.com/s/o6rn2hd5t9878fy/A6.png','2','1','1');
insert into Fotos_vendedor values ('5','https://dl.dropbox.com/s/zgx7g0h0mxubhao/A21.png','2','1','1');
insert into Fotos_vendedor values ('6','https://dl.dropbox.com/s/em8slkr3sf6nu9e/A9.png','2','1','1');
insert into Fotos_vendedor values ('7','https://dl.dropbox.com/s/1f9hzgblcmuen4a/A10.png','1','1','1');

--VENDEDORES DE LA REGION 2 Y VENDEDOR 2:
insert into Fotos_vendedor values ('8','https://dl.dropbox.com/s/jveyj0btov87izo/A38.png','1','2','2');
insert into Fotos_vendedor values ('9','https://dl.dropbox.com/s/27oq7ocj4q8a0z8/A46.png','2','2','2');
insert into Fotos_vendedor values ('10','https://dl.dropbox.com/s/z4geyw1u2psmm47/A16.png','2','2','2');
insert into Fotos_vendedor values ('11','https://dl.dropbox.com/s/t9ghnd2zm5a3ecw/A18.png','2','2','2');
insert into Fotos_vendedor values ('12','https://dl.dropbox.com/s/yxe96df3xrzoc4y/A44.png','2','2','2');
insert into Fotos_vendedor values ('13','https://dl.dropbox.com/s/aufyj7zngfnd2yo/A20.png','2','2','2');


--INSERTAMOS FOTOS DE ALGUNOS VEHICULOS 1-NUEVOS

insert into Fotos_vehiculos values ('1','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/nissan/x-trail/mx/RT_PU_05d7a1087b7b45caa12726aa398be27c.webp','1','1101')
insert into Fotos_vehiculos values ('2','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/nissan/altima/mx/RT_PU_283760ec49be4a53bc54047a13aebfa4.webp','2','1101')
insert into Fotos_vehiculos values ('3','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/jac/sei7-pro/mx/RT_PU_08e78cfafd48428fb216ca599a0bedd6.webp','3','1101')
insert into Fotos_vehiculos values ('4','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/toyota/raize/mx/RT_PU_2098e5a645914b8da12da9c1b1b76574.webp','4','1101')
insert into Fotos_vehiculos values ('5','https://acroadtrip.blob.core.windows.net/catalogo-imagenes/s/RT_V_250fd7eb529e4bf7a1c3fec541b1899b.jpg','5','1101')
insert into Fotos_vehiculos values ('6','https://acroadtrip.blob.core.windows.net/catalogo-imagenes/s/RT_V_f82b3b0638584f02bd1bcd29b58a02a6.webp','6','1101')
insert into Fotos_vehiculos values ('7','https://acroadtrip.blob.core.windows.net/catalogo-imagenes/m/RT_V_c5dfc80f33dd48aaaa6c052851b6705f.jpg','7','1101')
insert into Fotos_vehiculos values ('8','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/nissan/kicks/mx/RT_PU_95cc11fa498a44cc92f1c95f47a32f8f.webp','8','1101')

--INSERTAMOS FOTOS DE ALGUNOS VEHICULOS 2-USADOS
insert into Fotos_vehiculos values ('9','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/chevrolet/sonic/mx/RT_PU_2b4fe930f1db4d719a9eb3d66c3e3005.webp','9','1102')
insert into Fotos_vehiculos values ('10','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/suzuki/ignis/mx/RT_PU_89015244ddff437e885e0667846d705a.webp','10','1102')
insert into Fotos_vehiculos values ('11','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/mazda/cx-3/mx/RT_PU_73a6ffabd709475290e1ac05ed26decd.webp','11','1102')
insert into Fotos_vehiculos values ('12','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/toyota/corolla/mx/RT_PU_60b39f9dc3304c42bc514419230800f3.webp','12','1102')
insert into Fotos_vehiculos values ('13','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/mazda/3-sedan/mx/RT_PU_d989e5bd233542a59de0de175aa7922e.webp','13','1102')
insert into Fotos_vehiculos values ('14','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/volkswagen/jetta/mx/RT_PU_2e56be0eb5104772859fc54eca796084.webp','14','1102')
insert into Fotos_vehiculos values ('15','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/nissan/sentra/mx/RT_PU_30634559383c4dadacb45cfeb4fad319.webp','15','1102')
insert into Fotos_vehiculos values ('16','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/toyota/prius/mx/RT_PU_4580044452724839b3c8335c1fa56d38.webp','16','1102')
insert into Fotos_vehiculos values ('17','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/mercedes/clase-gla/mx/RT_PU_ac6bf839f6cc46758dfe60f5a708098f.webp','17','1102')
insert into Fotos_vehiculos values ('18','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/mazda/3-hatchback/mx/RT_PU_5b068279939047808c68f06b23c4d629.webp','18','1102')
insert into Fotos_vehiculos values ('19','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/chevrolet/trax/mx/RT_PU_22b44bfc00204d11b0deaad42d6fabbc.webp','19','1102')
insert into Fotos_vehiculos values ('20','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/jeep/compass/mx/RT_PU_11767a4b02e64153a81f47339f06b524.webp','20','1102')
insert into Fotos_vehiculos values ('21','https://acroadtrip.blob.core.windows.net/publicaciones-imagenes/Small/toyota/prius-c/mx/RT_PU_314bb375766444c99080958b50bbd450.webp','21','1102')

select * from Fotos_vehiculos

--IMAGENES DE FOTO CATEGORIA:

insert into Foto_condicion_vehiculo values ('1','https://previews.123rf.com/images/andrewrybalko/andrewrybalko1712/andrewrybalko171200024/91023834-hombre-comprando-un-auto-nuevo-con-dos-llaves-en-el-fondo-ilustraci%C3%B3n-vectorial.jpg','1101')
insert into Foto_condicion_vehiculo values ('2','https://cdn.pixabay.com/photo/2018/03/01/05/19/car-3189771_1280.jpg','1102')


--INSERTAMOS ALGUNAS CONDICIONES DE FACTURA
insert into condicion_factura values (1,'Efectivo');
insert into condicion_factura values (2,'Cheque');
insert into condicion_factura values (3,'Transferencia');
insert into condicion_factura values (4,'Deposito');
insert into condicion_factura values (5,'Credito');

--INSERTAMOS ALGUNAS DIAS FACTURA
insert into dias_factura values (1,1);
insert into dias_factura values (2,15);
insert into dias_factura values (3,30);
insert into dias_factura values (4,60);
insert into dias_factura values (5,90);
insert into dias_factura values (6,120);


--INSERTAMOS DATOS DENTRO DE LA TABLA VENTAS_HECHOS CON LOS REGISTROS SIGUIENTES:
	
--VENTAS 2016

insert into Ventas_Hechos values (1,25001,'01-01-2016',1,1,3,'100006','1',1,'458560',1,3);
insert into Ventas_Hechos values (2,25002,'04-01-2016',2,2,8,'100008','2',3,'212805',2,13);
insert into Ventas_Hechos values (3,25003,'05-01-2016',1,1,4,'100002','3',1,'621000',1,5);
insert into Ventas_Hechos values (4,25004,'06-01-2016',1,1,11,'100010','4',1,'364000',2,23);
insert into Ventas_Hechos values (5,25005,'05-02-2016',1,1,3,'100007','5',1,'445990',1,3);
insert into Ventas_Hechos values (6,25006,'17-02-2016',2,2,8,'100015','6',1,'1339000',2,18);
insert into Ventas_Hechos values (7,25007,'08-03-2016',1,1,8,'100012','7',2,'1374000',2,23);
insert into Ventas_Hechos values (8,25008,'29-03-2016',2,3,10,'100018','8',1,'208956',2,17);
insert into Ventas_Hechos values (9,25009,'11-04-2016',2,2,13,'100016','9',1,'239000',2,15);

--VENTAS 2017
insert into Ventas_Hechos values (10,25010,'08-01-2017',1,1,1,'100005','10',1,'46600',1,1);
insert into Ventas_Hechos values (11,25011,'28-01-2017',1,1,4,'100003','11',1,'70800',1,5);
insert into Ventas_Hechos values (12,25012,'18-02-2017',2,2,5,'100001','12',5,'60800',1,8);
insert into Ventas_Hechos values (13,25013,'28-02-2017',2,1,12,'100013','13',4,'58000',2,18);
insert into Ventas_Hechos values (14,25014,'13-03-2017',2,1,8,'100014','14',1,'83900',2,11);
insert into Ventas_Hechos values (15,25015,'14-03-2017',2,1,8,'100017','15',1,'104112',2,15);


--VENTAS 2018
insert into Ventas_Hechos values (16,25016,'01-01-2018',1,1,7,'100004','16',1,'72000',1,7);
insert into Ventas_Hechos values (17,25017,'01-02-2018',1,1,6,'100009','17',1,'134970',1,6);
insert into Ventas_Hechos values (18,25018,'02-03-2018',2,2,7,'100011','18',1,'143700',1,7);
insert into Ventas_Hechos values (19,25019,'02-04-2018',2,2,7,'100019','19',1,'61800',2,17);
insert into Ventas_Hechos values (20,25020,'03-05-2018',1,1,5,'100020','20',1,'98200',2,15);
insert into Ventas_Hechos values (21,25021,'04-06-2018',1,1,4,'100021','21',1,'80000',2,14);
insert into Ventas_Hechos values (22,25022,'05-07-2018',2,1,1,'100014','9',1,'239000',2,11);


--VENTAS 2019
insert into Ventas_Hechos values (23,25023,'05-01-2019',2,1,4,'100008','1',1,'458560',1,1);
insert into Ventas_Hechos values (24,25024,'28-02-2019',1,1,3,'100008','1',1,'458560',1,1);
insert into Ventas_Hechos values (25,25025,'03-03-2019',1,1,2,'100009','6',1,'1339000',1,6);
insert into Ventas_Hechos values (26,25026,'04-03-2019',2,1,2,'100009','6',1,'1339000',1,6);
insert into Ventas_Hechos values (27,25027,'05-04-2019',1,1,6,'100010','3',1,'621000',1,3);

SELECT * FROM Ventas_Hechos
--VENTAS 2020 
insert into Ventas_Hechos values (28,25028,'01-01-2020',1,1,2,'100001','1',1,'458560',1,8);
insert into Ventas_Hechos values (29,25029,'04-01-2020',2,1,1,'100002','2',1,'212805',1,5);
insert into Ventas_Hechos values (30,25030,'05-01-2020',1,1,6,'100003','6',1,'1339000',1,5);
insert into Ventas_Hechos values (31,25031,'30-01-2020',1,1,7,'100004','4',1,'364000',1,7);


--VENTAS 2021
insert into Ventas_Hechos values (32,25032,'02-01-2021',1,1,4,'100001','8',1,'208956',1,8);
insert into Ventas_Hechos values (33,25033,'05-01-2021',2,1,1,'100002','6',1,'1339000',1,5);
insert into Ventas_Hechos values (34,25034,'15-01-2021',2,1,6,'100003','1',1,'458560',1,5);
insert into Ventas_Hechos values (35,25035,'20-01-2021',1,1,1,'100004','5',1,'445990',1,7);
insert into Ventas_Hechos values (36,25036,'31-01-2021',2,1,1,'100005','3',1,'621000',1,1);
insert into Ventas_Hechos values (37,25037,'01-02-2021',1,1,4,'100001','10',1,'46600',1,8);
insert into Ventas_Hechos values (38,25038,'28-02-2021',1,1,5,'100002','11',1,'70800',1,2);


--VENTAS 2022
insert into Ventas_Hechos values (39,25039,'04-01-2022',2,1,4,'100008','16',1,'72000',1,1);
insert into Ventas_Hechos values (40,25040,'21-02-2022',1,1,3,'100008','17',1,'134970',1,1);
insert into Ventas_Hechos values (41,25041,'07-03-2022',1,1,3,'100009','12',1,'60800',1,6);
insert into Ventas_Hechos values (42,25042,'02-03-2022',2,1,1,'100009','16',1,'72000',1,6);
insert into Ventas_Hechos values (43,25043,'06-04-2022',1,1,4,'100010','12',1,'60800',1,3);
insert into Ventas_Hechos values (44,25044,'07-05-2022',2,2,2,'100007','13',1,'58000',1,3);
insert into Ventas_Hechos values (45,25045,'14-06-2022',1,1,5,'100007','11',1,'70800',1,3);
insert into Ventas_Hechos values (46,25046,'02-07-2022',1,1,5,'100008','10',1,'46600',1,1);



--INSERTAMOS LOS DATOS CON FECHA EN ESPAÑOL AÑO 2016:

insert into Estatus_Facturas values (1,'1/3/2016',1,25001,'100006','458560',1,'si');
insert into Estatus_Facturas values (2,'15/1/2016',2,25002,'100008','638415',15,'si');
insert into Estatus_Facturas values(3,'26/1/2016',3,25003,'100002','621000',1,'si');
insert into Estatus_Facturas values(4,'19/2/2016',4,25004,'100010','364000',1,'si');
insert into Estatus_Facturas values(5,'17/4/2016',5,25005,'100007','445990',15,'no');
insert into Estatus_Facturas values(6,'8/5/2016',6,25006,'100015','1339000',1,'si');
insert into Estatus_Facturas values(7,'10/5/2016',7,25007,'100012','2748000',30,'si');
insert into Estatus_Facturas values(8,'11/5/2016',8,25008,'100018','208956',15,'si');
insert into Estatus_Facturas values(9,'05/5/2016',9,25009,'100016','239000',1,'si');

select * from Estatus_Facturas


--INSERTAMOS LOS DATOS CON FECHA EN ESPAÑOL AÑO 2017:

insert into Estatus_Facturas values(10,'08/01/2017',10,25010,'100005','46600',1,'si');
insert into Estatus_Facturas values(11,'28/01/2017',11,25011,'100003','70800',1,'si');
insert into Estatus_Facturas values(12,'18/02/2017',12,25012,'100001','304000',15,'si');
insert into Estatus_Facturas values(13,'28/02/2017',13,25013,'100013','232000',1,'si');
insert into Estatus_Facturas values(14,'13/03/2017',14,25014,'100014','83900',1,'si');
insert into Estatus_Facturas values(15,'14/03/2017',15,25015,'100017','104112',1,'si');

--INSERTAMOS LOS DATOS CON FECHA EN ESPAÑOL AÑO 2018:

insert into Estatus_Facturas values(16,'02/01/2018',16,25016,'100004','72000',1,'si');
insert into Estatus_Facturas values(17,'14/02/2018',17,25017,'100009','134970',1,'si');
insert into Estatus_Facturas values(18,'17/03/2018',18,25018,'100011','143700',15,'si');
insert into Estatus_Facturas values(19,'17/04/2018',19,25019,'100019','61800',15,'no');
insert into Estatus_Facturas values(20,'04/05/2018',20,25020,'100020','98200',1,'si');
insert into Estatus_Facturas values(21,'05/06/2018',21,25021,'100021','80000',1,'si');
insert into Estatus_Facturas values(22,'06/07/2018',22,25022,'100014','239000',1,'si');


--INSERTAMOS LOS DATOS CON FECHA EN ESPAÑOL AÑO 2019:

insert into Estatus_Facturas values(23,'16/01/2019',23,25023,'100008','458560',1,'si');
insert into Estatus_Facturas values(24,'28/02/2019',24,25024,'100008','458560',1,'si');
insert into Estatus_Facturas values(25,'30/03/2019',25,25025,'100009','1339000',1,'si');
insert into Estatus_Facturas values(26,'30/04/2019',26,25026,'100009','1339000',1,'si');
insert into Estatus_Facturas values(27,'25/05/2019',27,25027,'100010','621000',1,'si');

--INSERTAMOS LOS DATOS CON FECHA EN ESPAÑOL AÑO 2020:

insert into Estatus_Facturas values(28,'16/01/2020',28,25028,'100001','458560',1,'si');
insert into Estatus_Facturas values(29,'29/01/2020',29,25029,'100002','212805',1,'si');
insert into Estatus_Facturas values(30,'27/02/2020',30,25030,'100003','1339000',1,'si');
insert into Estatus_Facturas values(31,'28/02/2020',31,25031,'100004','364000',1,'si');

--INSERTAMOS LOS DATOS CON FECHA EN ESPAÑOL AÑO 2021:

insert into Estatus_Facturas values(32,'05/01/2021',32,25032,'100001','208956',1,'si');
insert into Estatus_Facturas values(33,'09/01/2021',33,25033,'100002','1339000',1,'si');
insert into Estatus_Facturas values(34,'16/01/2021',34,25034,'100003','458560',1,'si');
insert into Estatus_Facturas values(35,'20/01/2021',35,25035,'100004','445990',1,'si');
insert into Estatus_Facturas values(36,'02/02/2021',36,25036,'100005','621000',1,'si');
insert into Estatus_Facturas values(37,'03/02/2021',37,25037,'100001','46600',1,'si');
insert into Estatus_Facturas values(38,'01/03/2021',38,25038,'100002','70800',1,'si');

--ESTATUS DE COBROS AÑO 2022

insert into Estatus_Facturas values (39,'04-01-2022',39,25039,'100008','72000',2,'si');
insert into Estatus_Facturas values (40,'21-02-2022',40,25040,'100008','134970',2,'si');
insert into Estatus_Facturas values (41,'07-03-2022',41,25041,'100009','60800',2,'si');
insert into Estatus_Facturas values (42,'02-03-2022',42,25042,'100009','72000',2,'si');
insert into Estatus_Facturas values (43,'06-04-2022',43,25043,'100010','60800',2,'si');
insert into Estatus_Facturas values (44,'07-05-2022',44,25044,'100007','58000',3,'si');
insert into Estatus_Facturas values (45,'14-06-2022',45,25045,'100007','70800',3,'si');
insert into Estatus_Facturas values (46,'02-07-2022',46,25046,'100008','46600',2,'no');


--INSERTAMOS DATOS EN LA TABLA Metas_Ventas_Anual

insert into Metas_Ventas_Anual (id_meta, id_sucursal,id_region,fecha_inicio,fecha_corte, monto) values (1,1,1,'2016-01-01','2016-12-31',8000000); 
insert into Metas_Ventas_Anual (id_meta, id_sucursal,id_region,fecha_inicio,fecha_corte, monto) values (2,2,2,'2016-01-01','2016-12-31',3500000); 

insert into Metas_Ventas_Anual (id_meta, id_sucursal,id_region,fecha_inicio,fecha_corte, monto) values (3,1,1,'2017-01-01','2017-12-31',2500000); 
insert into Metas_Ventas_Anual (id_meta, id_sucursal,id_region,fecha_inicio,fecha_corte, monto) values (4,2,2,'2017-01-01','2017-12-31',3500000); 

insert into Metas_Ventas_Anual (id_meta, id_sucursal,id_region,fecha_inicio,fecha_corte, monto) values (5,1,1,'2018-01-01','2018-12-31',4000000); 
insert into Metas_Ventas_Anual (id_meta, id_sucursal,id_region,fecha_inicio,fecha_corte, monto) values (6,2,2,'2018-01-01','2018-12-31',3000000); 

insert into Metas_Ventas_Anual (id_meta, id_sucursal,id_region,fecha_inicio,fecha_corte, monto) values (7,1,1,'2019-01-01','2019-12-31',3500000); 
insert into Metas_Ventas_Anual (id_meta, id_sucursal,id_region,fecha_inicio,fecha_corte, monto) values (8,2,2,'2019-01-01','2019-12-31',3500000); 

insert into Metas_Ventas_Anual (id_meta, id_sucursal,id_region,fecha_inicio,fecha_corte, monto) values (9,1,1,'2020-01-01','2020-12-31',2000000); 
insert into Metas_Ventas_Anual (id_meta, id_sucursal,id_region,fecha_inicio,fecha_corte, monto) values (10,2,2,'2020-01-01','2020-12-31',3500000); 

insert into Metas_Ventas_Anual (id_meta, id_sucursal,id_region,fecha_inicio,fecha_corte, monto) values (11,1,1,'2021-01-01','2021-12-31',3000000); 
insert into Metas_Ventas_Anual (id_meta, id_sucursal,id_region,fecha_inicio,fecha_corte, monto) values (12,2,2,'2021-01-01','2021-12-31',5000000); 

insert into Metas_Ventas_Anual (id_meta, id_sucursal,id_region,fecha_inicio,fecha_corte, monto) values (13,1,1,'2022-01-01','2022-12-31',8000000); 
insert into Metas_Ventas_Anual (id_meta, id_sucursal,id_region,fecha_inicio,fecha_corte, monto) values (14,2,2,'2022-01-01','2022-12-31',3500000); 


select * from Metas_Ventas_Anual



--CONSULTAS PARA REALIZAR

--¿Cuantos Empleados existen en la Empresa?
SELECT COUNT(*) as num_empleados
FROM empleados;


--¿Cuantos Años tienen tus empleados?
SELECT DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) AS Edad
FROM empleados


--¿Cuantos empleados son mujeres, a que departamento pertenecen y cuales son sus sueldos?
SELECT departamento.nombre_departamento AS Departamento, empleados.nombre as Mujeres , empleados.sueldo
FROM empleados
JOIN departamento ON empleados.id_departamento = departamento.id_departamento
WHERE empleados.id_genero = '1' 

select * from empleados

--¿Cuales son los Top 10 vendedores?
SELECT TOP 10 nombre_vendedor, SUM(precio_ventas) AS TotalVentas
FROM vendedor
INNER JOIN Ventas_Hechos ON vendedor.id_vendedor = Ventas_Hechos.id_vendedor
GROUP BY nombre_vendedor
ORDER BY TotalVentas DESC;


--¿Cuales son los Top 10 Vehiculos?
SELECT TOP 10 Vehiculos.Marca, Vehiculos.Modelo, Vehiculos.Anio, COUNT(*) as TotalVentas
FROM Ventas_Hechos
INNER JOIN Vehiculos ON Ventas_Hechos.id_vehiculo = Vehiculos.id_vehiculo
GROUP BY Vehiculos.Marca, Vehiculos.Modelo, Vehiculos.Anio
ORDER BY TotalVentas DESC;


--¿Cuales son las regiones?
SELECT Nombre FROM region;


--¿Cual es el Top 3 de vendedor que mas vendió?
SELECT TOP 3 vendedor.nombre_vendedor, SUM(Ventas_Hechos.monto) AS TotalVentas
FROM vendedor
INNER JOIN Ventas_Hechos ON vendedor.id_vendedor = Ventas_Hechos.id_vendedor
GROUP BY vendedor.nombre_vendedor
ORDER BY TotalVentas DESC;

select * from vendedor

--¿Cuales es el Top 3 de Vehiculos mas vendido?
SELECT TOP 3 Vehiculos.Marca, Vehiculos.Modelo, COUNT(*) AS NumeroVentas
FROM Vehiculos
JOIN Ventas_Hechos ON Ventas_Hechos.id_vehiculo = Vehiculos.id_vehiculo
GROUP BY Vehiculos.Marca, Vehiculos.Modelo
ORDER BY NumeroVentas DESC;


--TIENE ERROR
--¿Cual es la Venta Total por Region?
SELECT r.Nombre AS Region, SUM(v.precio_ventas) AS VentaTotal
FROM Ventas_Hechos ve
JOIN Vehiculos v ON ve.id_vehiculo = v.id_vehiculo
JOIN cliente c ON ve.id_cliente = c.id_cliente
JOIN ciudad ci ON c.id_ciudad = ci.nombre_ciudad
JOIN region r ON ci.id_region = r.id_region
GROUP BY r.Nombre
ORDER BY VentaTotal DESC;

select * from Ventas_Hechos


--Cual es la venta Total General.
SELECT SUM(monto) AS VentaTotalGeneral
FROM Ventas_Hechos;


--Cual es la Utilidad Total, y el Margen %?
SELECT SUM((precio_ventas - precio_compra) * Cantidad) AS UtilidadTotal,
       (SUM(precio_ventas * Cantidad) - SUM(precio_compra * Cantidad)) / SUM(precio_ventas * Cantidad) * 100 AS MargenPorcentaje
FROM (
    SELECT v.precio_ventas, v.precio_compra, COUNT(*) AS Cantidad
    FROM Vehiculos v
    JOIN vendedor ve ON v.id_vehiculo = ve.id_vendedor
    GROUP BY v.precio_ventas, v.precio_compra
) AS t;


--TIENE ERROR
--Cual es el Costo Total y el Margen %?
SELECT SUM(precio_compra) AS costo_total, 
       (SUM(monto) - SUM(precio_compra)) / SUM(monto) * 100 AS margen_porcentual
FROM Vehiculos;

select * from Vehiculos
select * from Ventas_Hechos


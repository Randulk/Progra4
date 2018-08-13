--Integrantes:
--Randall Suárez Marchena
--Daniela Isabel Ortiz Medrano
--Kevin Umaña Villalobos
use[master]
go
if exists(select name from sysdatabases where name = 'AutoVentas')
drop database [AutoVentas]
go
create database [AutoVentas]
go
use [AutoVentas]
go
if exists(select name from dbo.sysobjects where name = 'Clientes')
drop table [Clientes]
go
create table[Clientes](
cedula int not null primary key,
nombre varchar(100) not null,
telefono int not null,
direccion varchar(150) not null)
go
insert into [Clientes](cedula,nombre,telefono,direccion)
values(5413653,'Randall Suarez',87096001,'Bebedero de Cañas')
go
create procedure [Sp_Ins_Clientes](
@cedula int,
@nombre varchar(100))
as
insert into Clientes(cedula,nombre)
values(@cedula,@nombre)
go
---------------------------------------------------
create table [Motocicletas](
codigo int not null primary key,
Marca varchar(100) not null,
precio decimal(12,2) not null)
go
--procedimiento almacenado para insercion de datos
create procedure [Sp_Ins_Tipo](
@codigo int,
@marca varchar(100),
@precio decimal(12,2))
as
insert into Motocicletas(codigo,Marca,precio)
values(@codigo,@marca,@precio)
go
--Clasificaciones
exec [Sp_Ins_Tipo]01,'Skuter',675000
go
exec [Sp_Ins_Tipo]02,'Montañera',15000000
go
exec [Sp_Ins_Tipo]03,'Cuadraciclo',1750000
go
exec [Sp_Ins_Tipo]04,'Pandillera',2000000
go

select codigo,marca,precio from Motocicletas order by codigo
go
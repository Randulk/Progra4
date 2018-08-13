-------------usuario de la Aplicacion
create table [Usuarios](
id int identity,
login varchar(30) not null primary key,
fechaRegistro datetime not null default getdate(),
password varchar(max) not null)
go
---------------encriptar contrase�as
create function fn_EncryptarContrase�a(
@password varchar(max)) returns varchar(max)
as
begin
declare @valorEncryptado varchar(max);
set @valorEncryptado = ENCRYPTBYPASSPHRASE('4856',@password);
return @valorEncryptado;
end
-----------prueba de encriptacion por medio de la funcion
select dbo.fn_EncryptarContrase�a('Randall') as Encryptado
go
------------------------Insertar usuarios
create procedure [Sp_Ins_Usuarios](
@login varchar(30),
@password varchar(max))
as
insert into Usuarios(login,password)
values(@login,dbo.fn_EncryptarContrase�a(@password));
go
------------Usuarios por porcedimientos almacenados
exec [Sp_Ins_Usuarios] 'randall','123456';
exec [Sp_Ins_Usuarios] 'daniela','123456';
exec [Sp_Ins_Usuarios] 'kevin','123456';
go
-------------Mostrar informacion de usuarios
select * from Usuarios
order by id
go
-------------------funcion para desencriptar un contrase�a
create function fn_DesencryptarContrase�a(
@valor varchar(max))returns varchar(max)
as
begin
declare @password varchar(max);
set @password = DECRYPTBYPASSPHRASE('4856',@valor);
return @password;
end
go
select login, dbo.fn_DesencryptarContrase�a(password) as Descifrado,password
from Usuarios
go

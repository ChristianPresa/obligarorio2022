create database Mensajes
on (
name= Mensajes,
filename ='D:\Bios\Segundo Año\BD\Mensajes.mdp'
)
go

use Mensajes
go


-----------------------------------------------------------
-----------------------------------------------------------
----------       TABLAS     -------------------------------
-----------------------------------------------------------
-----------------------------------------------------------

create table Usuario (
NombreUsuario varchar (8) primary key check(LEN (NombreUsuario)>=8),
Pass varchar(6) not null check(Pass like '[A-Z][A-Z][A-Z][A-Z][A-Z][0-9]'),
NombreCompleto varchar(30) not null,
Activo bit not null default(1),
Mail varchar(20) not null --check (Mail like '[A-Za-z0-9][@][a-z][.][a-z]')
)
go


Create table Mensaje(
Codigo int  primary key identity,
FechaHora datetime default GetDate(),
Asunto varchar(30) not null,
Texto varchar(max)not null,
NombreUsuario varchar (8) not null check(LEN (NombreUsuario)>=8),
foreign key (NombreUsuario) references Usuario (NombreUsuario)
)
go

create table Tipo (
CodigoTipo varchar(3) primary key check(CodigoTipo like '[A-Z][A-Z][A-Z]') ,
NombreTipo varchar(15)
)
go

create table MensajePrivado(
Codigo int primary key,
FechaCaduca datetime not null,
foreign key (Codigo)references Mensaje(Codigo)
)
go

create table Mensajecomun(
Codigo int primary key,
CodigoTipo varchar(3) check(CodigoTipo like '[A-Z][A-Z][A-Z]'),
foreign key (Codigo) references Mensaje(Codigo),
foreign key (CodigoTipo)references Tipo (CodigoTipo)
)
go

Create table Recibe(
NombreUsuario varchar (8) check(LEN (NombreUsuario)>=8),
Codigo int,
primary key (NombreUsuario,Codigo)
)
go

-----------------------------------------------------------
-----------------------------------------------------------
----------         SP       -------------------------------
-----------------------------------------------------------
-----------------------------------------------------------

create proc Logueo 
@NombreUsuario varchar(8),
@Pass varchar(6)
as 
begin
if not exists (select * from Usuario where NombreUsuario = @NombreUsuario and Pass = @Pass and Activo= 1)
return -1 
else
select * from Usuario where NombreUsuario = @NombreUsuario and Pass = @Pass
end
go

create proc BuscarUsuarioActivo
@NombreUsuario varchar(8)
as
begin
select * from Usuario where NombreUsuario = @NombreUsuario and Activo =1
end
go

create proc BuscarUsuariosTodos
@NombreUsuario varchar(8)
as
begin
select * from Usuario where NombreUsuario = @NombreUsuario
end
go

create proc AltaUsuario
@NombreLogueo varchar(8),
@Pass varchar(6),
@NombreCompleto varchar(30),
@Mail varchar(20)
as
begin
if exists(Select * from Usuario where NombreUsuario = @NombreLogueo and Activo = 1)
return -1
if exists(select * from Usuario where Mail = @Mail)
return -2
if exists(Select * from Usuario where NombreUsuario = @NombreLogueo and Activo = 0)
begin
update usuario set NombreCompleto = @NombreCompleto, Pass = @Pass, Mail = @Mail, activo = 1
return 1
end
else
insert into Usuario(NombreUsuario,Pass,NombreCompleto,Mail)values(@NombreLogueo,@Pass,@NombreCompleto,@Mail)
return 1
end
go

--select * from Usuario
--exec AltaUsuario 'mathias1','asdas6','Mathias Rodriguez','mathz@hotmail.es'

create proc BajaUsuario
@NombreLogueo varchar(8)
as
begin
if not exists(Select * from Usuario where NombreUsuario = @NombreLogueo and Activo = 1)
begin
return -1
end
else
update Usuario set Activo = 0 where NombreUsuario = @Nombrelogueo
return 1
end 
go

create proc ModificarUsuario
@NombreLogueo varchar(8),
@Pass varchar(6),
@NombreCompleto varchar(30),
@Mail varchar(20)
as
begin
if not exists(Select * from Usuario where NombreUsuario = @NombreLogueo and Activo = 1)
return -1
end
if exists(Select * from Usuario where NombreUsuario = @NombreLogueo and Activo = 0)
begin
update Usuario set Activo = 1, Pass = @Pass , NombreCompleto = @NombreCompleto,Mail = @Mail where NombreUsuario = @NombreLogueo
return 1
end
else
begin
update Usuario set  Pass = @Pass , NombreCompleto = @NombreCompleto,Mail = @Mail where NombreUsuario = @NombreLogueo
return 1
end
go

-----------------------------------------------------------
-----------------------------------------------------------
----------      MENSAJES    -------------------------------
-----------------------------------------------------------
-----------------------------------------------------------

create proc AltaMensajeComun
@Asunto varchar(30),
@Texto varchar(max),
@NombreUsuario varchar(8),
@CodigoTipo varchar(3)
as
	begin
		if not exists (select * from Usuario where NombreUsuario = @NombreUsuario and Activo =1)
			return -1
		if not exists ( select * from Tipo where CodigoTipo = @CodigoTipo)
			return -2
		declare @Codigo int
		Insert Mensaje(Asunto,Texto,NombreUsuario) Values (@Asunto,@Texto,@NombreUsuario)
		set @Codigo = @@IDENTITY
		If @@ERROR <> 0
		begin
			return -3
		end
		insert Mensajecomun(Codigo,CodigoTipo )values (@Codigo,@CodigoTipo)
		If @@ERROR <> 0
		begin
			return -4
		end
		else
			return @Codigo 
	end		
go			

--select * from usuario
--------------------------------------------------------------------------		

alter proc AltaMensajePrivado
@Asunto varchar(30),
@Texto varchar(max),
@NombreUsuario varchar(8),
@FechaCaduca datetime
as
	begin
		if not exists (select * from Usuario where NombreUsuario = @NombreUsuario and Activo =1)
			return -1
		declare @Codigo int
		insert into Mensaje(Asunto,Texto,NombreUsuario)values(@Asunto,@Texto,@NombreUsuario)
		set @Codigo = @@IDENTITY
		if @@ERROR <> 0
		begin
			return -1
		end
		insert into MensajePrivado(Codigo,FechaCaduca)values (@Codigo,@FechaCaduca)
		if @@ERROR <>0
		begin 	
			return -2
		end	
		return @Codigo
	end
go

--select * from MensajeComun
--select * from MensajePrivado
--select * from recibe

create proc BuscarTipoMensaje
@CodigoTipo varchar (3)
as
begin
if not exists (select * from Tipo where CodigoTipo = @CodigoTipo)
return -1
else 
select * from Tipo where CodigoTipo = @CodigoTipo
end 
go


create proc BuscarMailComunRecibidoUsuario
@NombreUsuRecibido varchar(8)
as 
begin
if not exists (select * from Recibe where NombreUsuario = @NombreUsuRecibido)
return -1
else
select *from Mensaje as M inner join Mensajecomun as MC inner join Recibe as R on R.Codigo = MC.Codigo on MC.Codigo= M.Codigo where R.NombreUsuario = @NombreUsuRecibido
order by FechaHora desc
end
go 


create proc BuscarMailPrivadoRecibidoUsuario
@NombreUsuRecibido varchar(8)
as
begin
if not exists (select * from Recibe where NombreUsuario = @NombreUsuRecibido)
return -1
else
select *from Mensaje as M inner join MensajePrivado as MP inner join Recibe as R on R.Codigo = MP.Codigo on MP.Codigo= M.Codigo where R.NombreUsuario = @NombreUsuRecibido
order by FechaHora desc
end
go 


alter proc BuscarMailComunEnviadoUsuario
@Nombreusuario varchar (8)
as
begin
if not exists (select * from Mensaje where NombreUsuario = @Nombreusuario)
return -1
else
select * from Mensaje as M inner join Mensajecomun as MC inner join Recibe as R 
						on R.Codigo = MC.Codigo 
						on MC.Codigo= M.Codigo 
						where M.Codigo in (select Codigo from Mensaje 
										where NombreUsuario = @Nombreusuario)
end
go

create proc BuscarMailPrivadoEnviadoUsuario
@Nombreusuario varchar (8)
as
begin
if not exists (select * from Mensaje where NombreUsuario = @Nombreusuario)
return -1
else
select * from Mensaje as M inner join MensajePrivado as MP inner join Recibe as R 
					on R.Codigo = MP.Codigo	
					on MP.Codigo= M.Codigo 
					where M.Codigo in (select Codigo from Mensaje 
										where NombreUsuario = @Nombreusuario)
end
go

create proc MailComunRecibidosPorUsuario
@Nombreusuario varchar (8)
as
begin
if not exists (select * from Mensaje where NombreUsuario = @Nombreusuario)
return -1
else
select * from Mensaje inner join Mensajecomun 
		on Mensajecomun.Codigo = Mensaje.Codigo 
		where Mensaje.Codigo in(select Codigo from Recibe 
								where NombreUsuario = @Nombreusuario)
end
go

create proc MailPrivadoRecibidosPorUsuario
@Nombreusuario varchar (8)
as
begin
if not exists (select * from Mensaje where NombreUsuario = @Nombreusuario)
return -1
else
select * from Mensaje inner join MensajePrivado 
		on MensajePrivado.Codigo = Mensaje.Codigo 
		where Mensaje.Codigo in(select Codigo from Recibe 
								where NombreUsuario = @Nombreusuario)
end
go

--select * from Mensaje
			
create proc AltaDestinatario
@NombreUsuRecibe varchar (8),
@Codigo int
as
begin
if not exists(select * from Usuario where NombreUsuario = @NombreUsuRecibe and Activo =1)
return -1
if exists (select * from Recibe where NombreUsuario = @NombreUsuRecibe and Codigo = @Codigo)
return -2

insert into Recibe (Codigo,NombreUsuario)values(@Codigo,@NombreUsuRecibe)
		If @@ERROR = 0
			return 1
		else
			return 0 			
end	
go


-----------------------------------------------------------
-----------------------------------------------------------
----------       LISTAR     -------------------------------
-----------------------------------------------------------
-----------------------------------------------------------

create proc ListarDestinatario
@Codigo int
as
begin
select *from Recibe where Codigo = @Codigo
end
go

create proc ListarTipo
as
begin
	select * from Tipo
end
go

--select*from Usuario

-----------------------------------------------------------
-----------------------------------------------------------
----------       OUTPUTS    -------------------------------
-----------------------------------------------------------
-----------------------------------------------------------


alter proc Estadisticas
@CantUsuariosActivos int output,
@CantMensajesComunes int output,
@CantMensajesPrivados int output
as
begin
	Select @CantUsuariosActivos = COUNT (*) from Usuario where Usuario.Activo = 1

	Select @CantMensajesComunes =  COUNT (*) from MensajeComun

	select @CantMensajesPrivados = COUNT(*) from MensajePrivado
end
go




declare @cant int, @cant2 int, @cant3 int
exec Estadisticas @CantUsuariosActivos = @cant output, 
@CantMensajesComunes = @cant2 output, @CantMensajesPrivados = @cant3 output

select @cant as 'Cantidad Usuarios', @cant2 as 'Cantidad Mensajes Comunes',
@cant3 as 'Cantidad Mensajes Privados'

select T.CodigoTipo, COUNT(*) from Tipo as T inner join Mensajecomun as MC on MC.CodigoTipo = T.CodigoTipo group by T.CodigoTipo
go

--------------------------------------------- PRUEBAS --------------------------------------------------------

alter proc Estadisticas2
as
begin
	select T.CodigoTipo, COUNT(*) from Tipo as T inner join Mensajecomun as MC on MC.CodigoTipo = T.CodigoTipo group by T.CodigoTipo
end
go

exec Estadisticas2 


select T.CodigoTipo, COUNT(*) from Tipo as T inner join Mensajecomun as MC on MC.CodigoTipo = T.CodigoTipo group by T.CodigoTipo 


--Comun por tipo
select * from Recibe as R inner join Mensaje as M inner join Mensajecomun as MC
			on MC.Codigo = M.Codigo 
			on MC.Codigo = R.Codigo 
			where MC.CodigoTipo = 'PRV' and R.NombreUsuario = 'mathi123'

			select * from Usuario
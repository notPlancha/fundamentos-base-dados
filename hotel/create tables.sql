create schema if not exists aluno_105289_hotelDB;
use aluno_105289_hotelDB;
drop table if exists Reserva_Quartos ;
drop table if exists Hotel ;
drop table if exists Quarto ;
drop table if exists Reserva ;
drop table if exists Cliente ;
drop table if exists Individual ;
drop table if exists Organizacao ;
drop table if exists Factura ;

create table Reserva_Quartos
(
   Sigla_Hotel   varchar(10)   not null,
   Numero_Quarto   Integer   not null,
   Numero_Reserva   Integer   not null,
   Cama_Extra   Integer   null,
   Numero_Pessoas   Integer   null,

   constraint PK_Reserva_Quartos primary key (Sigla_Hotel, Numero_Quarto, Numero_Reserva)
);

create table Hotel
(
   Sigla_Hotel   varchar(10)   not null,
   Designacao   varchar(100)   null,

   constraint PK_Hotel primary key (Sigla_Hotel)
);

create table Quarto
(
   Sigla_Hotel   varchar(10)   not null,
   Numero_Quarto   Integer   not null,
   Numero_Camas   Integer   null,
   Preco   decimal(5,2)   null,

   constraint PK_Quarto primary key (Sigla_Hotel, Numero_Quarto)
);

create table Reserva
(
   Numero_Cliente   Integer   not null,
   Numero_Reserva   Integer   not null,
   Dia_Entrada   datetime   null,
   Dia_Saida   datetime   null,

   constraint PK_Reserva primary key (Numero_Reserva)
);

create table Cliente
(
   Numero_Cliente   Integer   not null,
   Nome_Cliente   varchar(100)   null,

   constraint PK_Cliente primary key (Numero_Cliente)
);

create table Individual
(
   Numero_Cliente   Integer   not null,
   BI   Integer   null,

   constraint PK_Individual primary key (Numero_Cliente)
);

create table Organizacao
(
   Numero_Cliente   Integer   not null,
   Ramo_Actividade   varchar(100)   null,
   Nome_Contacto   varchar(100)   null,

   constraint PK_Organizacao primary key (Numero_Cliente)
);

create table Factura
(
   Numero_Reserva   Integer   not null,
   Numero_Factura   Integer   not null,
   Data_Factura   datetime   null,
   Valor_Factura   decimal(8,2)   null,

   constraint PK_Factura primary key (Numero_Factura)
);

alter table Reserva_Quartos
   add constraint FK_Quarto_Reserva_Quartos_Reserva foreign key (Sigla_Hotel, Numero_Quarto)
   references Quarto(Sigla_Hotel, Numero_Quarto)
   on delete cascade
   on update cascade
;
alter table Reserva_Quartos
   add constraint FK_Reserva_Reserva_Quartos_Quarto foreign key (Numero_Reserva)
   references Reserva(Numero_Reserva)
   on delete cascade
   on update cascade
;


alter table Quarto
   add constraint FK_Quarto_HotelQuarto_Hotel foreign key (Sigla_Hotel)
   references Hotel(Sigla_Hotel)
   on delete cascade
   on update cascade
;

alter table Reserva
   add constraint FK_Reserva_ClienteReserva_Cliente foreign key (Numero_Cliente)
   references Cliente(Numero_Cliente)
   on delete restrict
   on update cascade
;


alter table Individual
   add constraint FK_Individual_Cliente foreign key (Numero_Cliente)
   references Cliente(Numero_Cliente)
   on delete cascade
   on update cascade
;

alter table Organizacao
   add constraint FK_Organizacao_Cliente foreign key (Numero_Cliente)
   references Cliente(Numero_Cliente)
   on delete cascade
   on update cascade
;

alter table Factura
   add constraint FK_Factura_FacturaReserva_Reserva foreign key (Numero_Reserva)
   references Reserva(Numero_Reserva)
   on delete restrict
   on update cascade
;


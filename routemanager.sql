drop database if exists routemanager;
create database routemanager;
use routemanager;

create table osoba(
id int not null primary key auto_increment,
ime varchar(50) not null,
prezime varchar(50) not null,
telefon int,
mobitel int not null,
email varchar (50) not null
);

create table vozac (
id int not null primary key auto_increment,
osobaid int not null,
brvozacke varchar (50)

);

create table klijent (
id int not null primary key auto_increment,
osobaid int not null,
turnus int not null,
adresaid int not null,
rutaid int not null

);

create table plan (
id int not null primary key auto_increment,
adresapolaskaid int not null,
adresadolaskaid int not null,
voziloid int not null,
vozacid int not null,
datum datetime,
rutaid int not null
);

create table ruta(
id int not null primary key auto_increment,
naziv varchar (50) not null,
opis text

);


create table plan_klijent(
id int not null primary key auto_increment,
planid int not null,
klijentid int not null,
cijena decimal (18,2),
km int,
rb int not null

);


create table adresa(
id int not null primary key auto_increment,
naziv varchar (100) not null,
opis text,
lokacija varchar (100),
mjestoid int not null

);


create table mjesto(
id int not null primary key auto_increment,
naziv varchar (100) not null,
drzavaid int not null
);

create table drzava (
id int not null primary key auto_increment,
naziv varchar (50) not null

);


create table plan_trosak(
id int not null primary key auto_increment,
planid int not null,
trosakid int not null,
datum datetime,
cijena decimal (18,2),
opis text,
km int not null

);

create table trosak(
id int not null primary key auto_increment,
naziv varchar (100) not null,
opis text
);


create table vozilo(
id int not null primary key auto_increment,
modelid int not null,
regoznaka varchar (50),
km int,
brsasije varchar (50)

);


create table model(
id int not null primary key auto_increment,
marka varchar (50) not null,
model varchar (50) not null,
tip varchar (50) not null,
brojosoba int not null,
servisniinterval int,
potrosnja int
);

create table vozilo_servis(
id int not null primary key auto_increment,
voziloid int not null,
servisid int not null,
datum datetime,
napomena text,
cijena decimal (18,2)
);

create table servis(
id int not null primary key auto_increment,
naziv varchar (100),
opis text
);

alter table vozac add foreign key (osobaid) references osoba(id);

alter table klijent add foreign key (osobaid) references osoba(id);
alter table klijent add foreign key (rutaid) references ruta(id);
alter table klijent add foreign key (adresaid) references adresa(id);


alter table plan add foreign key (adresapolaskaid) references adresa(id);	
alter table plan add foreign key (adresadolaskaid) references adresa(id);	
alter table plan add foreign key (voziloid) references vozilo(id);	
alter table plan add foreign key (vozacid) references vozac(id);	
alter table plan add foreign key (rutaid) references ruta(id);	

alter table plan_klijent add foreign key (planid) references plan(id);	
alter table plan_klijent add foreign key (klijentid) references klijent(id);	

alter table mjesto add foreign key (drzavaid) references drzava(id);	
alter table adresa add foreign key (mjestoid) references mjesto(id);	

alter table plan_trosak add foreign key (planid) references plan(id);	
alter table plan_trosak add foreign key (trosakid) references trosak(id);	

alter table vozilo add foreign key (modelid) references model(id);	
alter table vozilo_servis add foreign key (voziloid) references vozilo(id);	
alter table vozilo_servis add foreign key (servisid) references servis(id);	


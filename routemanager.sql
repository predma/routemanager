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
adresaid int not null

);




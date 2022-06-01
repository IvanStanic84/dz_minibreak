# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Korisnik\Documents\GitHub\dz_minibreak\vjezba7.sql

drop database if exists vjezba7;
create database vjezba7;
use vjezba7;

create table mladic(
    sifra int not null primary key auto_increment,
    prstena int,
    lipa decimal(14,5)not null,
    narukvica int null,
    drugiputa datetime not null
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    vesta varchar(34),
    asocijalno bit not null,
    modelnaocala varchar(43),
    narukvica int not null,
    novcica decimal(15,5) not null
);

create table zarucnik_mladic(
    sifra int not null primary key auto_increment,
    zarucnik int not null,
    mladic int not null
);

create table ostavljen(
    sifra int not null primary key auto_increment,
    lipa decimal(14,6),
    introvertno bit not null,
    kratkamajica varchar(38) not null,
    prsten int not null,
    zarucnik int 
);

create table prijateljica(
    sifra int not null primary key auto_increment,
    haljina varchar(45),
    gustoca decimal(15,10) not null,
    ogrlica int,
    novcica decimal(12,5),
    ostavljen int
);

create table sestra(
    sifra int not null primary key auto_increment,
    bojakose varchar(34) not null,
    hlace varchar(36) not null,
    lipa decimal(15,6),
    stilfrizura varchar(40) not null,
    maraka decimal(12,8) not null,
    prijateljica int
);

create table cura(
    sifra int not null primary key auto_increment,
    lipa decimal(12,9) not null,
    introvertno bit,
    modelnaocala varchar(40),
    narukvica int,
    treciputa datetime,
    kuna decimal(14,8)
);

create table punica(
    sifra int not null primary key auto_increment,
    majica varchar(40),
    eura decimal(12,6) not null,
    prsten int,
    cura int not null
);

alter table ostavljen add foreign key (zarucnik) references zarucnik(sifra);
alter table prijateljica add foreign key (ostavljen) references ostavljen(sifra);
alter table punica add foreign key (cura) references cura(sifra);
alter table sestra add foreign key (prijateljica) references prijateljica(sifra);
alter table zarucnik_mladic add foreign key (mladic) references mladic(sifra);
alter table zarucnik_mladic add foreign key (zarucnik) references zarucnik(sifra);

# 1. zadatak

insert into mladic(lipa, narukvica, drugiputa) 
values
(12.15, 11, 2020-06-28),
(19.15, 22, 2021-07-09),
(13.15, 33, 2002-09-30);

insert into zarucnik(asocijalno, narukvica, novcica) 
values
(true, 12, 13.13),
(false, 25, 17.17),
(false, 22, 19.19);

insert into zarucnik_mladic(zarucnik, mladic) 
values
(1, 1), 
(2, 2), 
(3, 3);

insert into ostavljen(introvertno, kratkamajica, prsten) 
values
(true, 'plava', 22),
(false, 'crna', 33),
(false, 'zelena', 44);

insert into prijateljica(gustoca) 
values
(35.25),
(35.99),
(28.58);

insert into sestra(bojakose, hlace, stilfrizura, maraka) 
values
('plava', 'kratke', 'kratka', 15.15),
('crna', 'duge', 'duga', 25.25),
('crvena', 'caprice', 'kovrčava', 35.35);

insert into cura(lipa) 
values
(18.65),
(15.63),
(25.38);

insert into punica(eura, cura) 
values
(25.25, 1),
(35.35, 2),
(80.88, 3);

# 2. zadatak

update punica set eura=15.77;

# 3. zadatak 

delete from sestra where hlace<'ab';

# 4. zadatak

select kratkamajica from ostavljen where introvertno=null;
# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Korisnik\Documents\GitHub\dz_minibreak\vjezba8.sql

drop database if exists vjezba8;
create database vjezba8;
use vjezba8;

create table prijateljica(
    sifra int not null primary key auto_increment,
    vesta varchar(50),
    nausnica int not null,
    introvertno bit not null
);

create table cura(
    sifra int not null primary key auto_increment,
    nausnica int not null,
    indiferentno bit,
    ogrlica int not null,
    gustoca decimal(12,6),
    drugiputa datetime,
    vesta varchar(33),
    prijateljica int

);

create table muskarac(
    sifra int not null primary key auto_increment,
    haljina varchar(47),
    drugiputa datetime not null,
    treciputa datetime
);

create table decko(
    sifra int not null primary key auto_increment,
    kuna decimal(12,10),
    lipa decimal(17,10),
    bojakose varchar(44),
    treciputa datetime not null,
    ogrlica int not null,
    ekstroventno bit not null

);

create table muskarac_decko(
    sifra int not null primary key auto_increment,
    muskarac int not null,
    decko int not null
);

create table becar(
    sifra int not null primary key auto_increment,
    eura decimal(15,10) not null,
    treciputa datetime,
    prviputa datetime,
    muskarac int not null
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(44),
    introvertno bit,
    indiferentno bit,
    ogrlica int not null,
    becar int not null
);



create table brat(
    sifra int not null primary key auto_increment,
    introvertno bit,
    novcica decimal(14,7) not null,
    treciputa datetime,
    neprijatelj int

);

alter table cura add foreign key (prijateljica) references prijateljica(sifra);
alter table muskarac_decko add foreign key (muskarac) references muskarac(sifra);
alter table muskarac_decko add foreign key (decko) references decko(sifra);
alter table becar add foreign key (muskarac) references muskarac(sifra);
alter table neprijatelj add foreign key ( becar) references becar(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

# 1. zadatak

insert into decko(treciputa, ogrlica, ekstroventno)
values
('2022-09-23', 15, false),
('2021-01-22', 19, true),
('2020-02-34', 29, true);

insert into muskarac (drugiputa)
values
('2022-01-12'),
('2020-12-21'),
('2021-03-30');

insert into muskarac_decko(muskarac, decko)
values
(1,1),
(2,2),
(3,3);

insert into becar (eura, muskarac)
values
(13.32, 1),
(17.23, 2),
(24.32, 3);

insert into neprijatelj(ogrlica, becar)
values
(12, 1),
(17, 2),
(18, 3); 

# 2. zadatak

update cura set indiferentno=false;

# 3. zadatak

delete from brat where novcica!=12.75;

# 4. zadatak

select prviputa from becar where treciputa is not null;


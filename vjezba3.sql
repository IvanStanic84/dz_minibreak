# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Korisnik\Documents\GitHub\dz_minibreak\vjezba3.sql

drop database if exists vjezba3;
create database vjezba3;
use vjezba3;

create table svekar(
    sifra int not null primary key auto_increment,
    novcica decimal(16,8)  not null,
    suknja varchar(44) not null,
    bojakose varchar(36),
    prsten int,
    narukvica int not null,
    cura int not null
);

create table cura(
    sifra int not null primary key auto_increment,
    dukserica varchar(49),
    maraka decimal(13,7),
    drugiput datetime,
    majica varchar(49),
    novcica decimal(15,8),
    ogrlica int not null
);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno bit,
    kuna decimal(15,6) not null,
    eura decimal(12,9) not null,
    treciput datetime,
    ostavljena int not null
);

create table punica(
    sifra int not null primary key auto_increment,
    asocijlno bit,
    kratkamajica varchar(44) not null,
    kuna decimal(13,8) not null,
    vesta varchar(32)not null,
    snasa int
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    kuna decimal(17,5),
    lipa decimal(15,6) not null,
    majica varchar(36) not null,
    modelnaocala varchar(31) not null,
    prijatelj int
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    kuna decimal(16,10),
    haljina varchar(37),
    lipa decimal(13,10),
    dukserica varchar(31),
    indiferentno bit not null
);

create table prijatelj_brat(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    brat int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int not null,
    ekstroventno bit not null
);


alter table svekar add foreign key (cura) references cura(sifra);
alter table punica add foreign key (snasa) references snasa(sifra);
alter table snasa add foreign key (ostavljena) references ostavljena(sifra);
alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (brat) references brat(sifra);

# 1. zadatak

insert into ostavljena(modelnaocala) 
values
('suncane'),
('dioptrijske'),
('plave');

insert into snasa(kuna, eura, ostavljena) 
values
(254.22, 22.22, 1),
(545.54, 11.66, 2),
(541.25, 35.24, 3);

insert into prijatelj (indiferentno) 
values
(true),
(false),
(false);

insert into brat (ogrlica,ekstroventno) values
(15, true),
(22, false),
(35, false);

insert into prijatelj_brat(prijatelj,brat) values 
(1, 1),
(2, 2),
(3, 3);

# 2. zadatak

insert into cura (ogrlica) 
values
(11),
(22),
(33);

insert into svekar(novcica,suknja,narukvica,cura) 
values
(22.22, 'plava', 1, 1),
(13.56, 'zelena', 2, 2),
(7.568, 'ljubičasta', 3, 3);

update svekar set suknja='Osijek';

# 3. zadatak

delete from punica where kratkamajica='AB';

# 4. zadatak

select majica from ostavljena where lipa!=9 or lipa!=10 or lipa!=20 or lipa!=30 or lipa!=35;
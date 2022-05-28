# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Korisnik\Documents\GitHub\dz_minibreak\vjezba4.sql

drop database if exists vjezba4;
create database vjezba4;
use vjezba4;

create table punac(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    majica varchar(46),
    jmbag char(11) not null,
    novcica decimal(18,7) not null,
    maraka decimal(12,6) not null,
    ostavljen int not null
);
 
create table ostavljen(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(43),
    introventno bit,
    kuna decimal(14,10)
    );

create table prijatelj(
    sifra int not null primary key auto_increment,
    eura decimal(16,9),
    prstena int not null,
    gustoca decimal(16,5),
    jmbag char(11) not null,
    suknja varchar(47) not null,
    becar int not null
);

create table becar(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8),
    kratkamajica varchar(48) not null,
    bojaociju varchar(36) not null,
    snasa int not null
);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno bit,
    treciputa datetime,
    haljina varchar(44) not null,
    zena int not null
);

create table zena(
    sifra int not null primary key auto_increment,
    suknja varchar(39) not null,
    lipa decimal(18,7),
    prsten int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    kuna decimal(15,9),
    lipa decimal(18,5),
    nausnica int,
    stilfrizura varchar(49),
    vesta varchar(34) not null
);

create table zena_mladic(
    sifra int not null primary key auto_increment,
    zena int not null,
    mladic int not null
);


alter table punac add foreign key (ostavljen) references ostavljen(sifra);
alter table prijatelj add foreign key (becar) references becar(sifra);
alter table becar add foreign key (snasa) references snasa(sifra);
alter table snasa add foreign key (zena) references zena(sifra);
alter table zena_mladic add foreign key (zena) references zena(sifra);
alter table zena_mladic add foreign key (mladic) references mladic(sifra);

#1. zadatak

insert into zena (suknja, prsten) 
values
('plava', 11),
('kratka', 22),
('žuta', 33);

insert into snasa (haljina, zena) 
values
('plava', 1),
('zelena', 2),
('žuta', 3);

insert into becar (kratkamajica, bojaociju, snasa) 
values
('plava', 'zelena', 1),
('zelena', 'plava', 2),
('žuta', 'smeda', 3);

insert into mladic (vesta) 
values
('plava'),
('zelena'),
('debela');

insert into zena_mladic(zena, mladic) 
values
(1, 1),
(2, 2),
(3, 3);

# 2. zadatak

update punac set majica='Osijek';

# 3. zadatak

delete from prijatelj where prstena>17;

# 4. zadatak

select haljina from snasa where treciputa is not null;

# 5. zadatak


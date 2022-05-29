# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Korisnik\Documents\GitHub\dz_minibreak\vjezba5.sql

drop database if exists vjezba5;
create database vjezba5;
use vjezba5;

create table mladic(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(48) not null,
    haljina varchar(30) not null,
    asocijalno bit,
    zarucnik int 
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    lipa decimal(12,8),
    indiferentno bit not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    majica varchar(33),
    ogrlica int not null,
    carape varchar(44),
    stilfrizura varchar(42),
    punica int not null
);

create table punica(
    sifra int not null primary key auto_increment,
    hlace varchar(43) not null,
    nausnica int not null,
    ogrlica int,
    vesta varchar(49) not null,
    modelnaocala varchar(31) not null,
    treciputa datetime not null,
    punac int not null
);

create table punac(
    sifra int not null primary key auto_increment,
    dukserica varchar(33),
    prviputa datetime not null,
    majica varchar(36),
    svekar int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojakose varchar(33),
    majica varchar(31),
    carape varchar(31) not null,
    haljina varchar(43),
    narukvica int,
    eura decimal(14,5) not null
);

create table cura(
    sifra int not null primary key auto_increment,
    carape varchar(41) not null,
    maraka decimal(17,10) not null,
    asocijalno bit,
    vesta varchar(47) not null
);

create table svekar_cura(
    sifra int not null primary key auto_increment,
    svekar int not null,
    cura int not null
);


alter table mladic add foreign key (zarucnik) references zarucnik(sifra);
alter table ostavljena add foreign key (punica) references punica(sifra);
alter table punica add foreign key (punac) references punac(sifra);
alter table punac add foreign key (svekar) references svekar(sifra);
alter table svekar_cura add foreign key (svekar) references svekar(sifra);
alter table svekar_cura add foreign key (cura) references cura(sifra);

# 1. zadatak

insert into mladic (kratkamajica, haljina) 
values
('plava', 'ljubičasta'),
('zelena', 'žuta'),
('bijela', 'crna');

insert into svekar (carape, eura) 
values
('crne', 1.11),
('šarene', 2.22),
('bijele', 3.32);

insert into cura (carape, maraka) 
values
('bijele', 2.22),
('crne', 4.44),
('šarene', 6.69);

insert into svekar_cura (svekar, cura) 
values
(1, 1),
(2, 2),
(3, 3);

insert into punac (prviputa, svekar) 
values
(2022-05-28, 1),
(2020-06-28, 2),
(2000-01-01, 3);

insert into punica(hlace, nausnica, vesta, modelnaocala, treciputa, punac)
values 
('plave', 12, 'debela', 'suncane', 2022-05-28, 1),
('bijele', 24, 'tanka', 'dioptrijske', 2020-06-28, 2),
('zelene', 18, 'zimska', 'crne', 2000-01-01, 3);

insert into ostavljena (ogrlica, punica) 
values
(28, 1),
(23, 2),
(19, 3);

# 2. zadatak

update mladic set haljina='Osijek';

# 3. zadatak

delete from ostavljena where ogrlica=17;

# 4. zadatak

select majica from punac where prviputa=null;

# 5. zadatak

select a.asocijalno, f.stilfrizura, e.nausnica
    from cura a
    inner join svekar_cura b on b.cura = a.sifra 
    inner join svekar c on c.sifra = b.svekar
    inner join punac d on d.svekar = c.sifra 
    inner join punica e on e.punac = d.sifra 
    inner join ostavljena f on f.punica = e.sifra 
    where c.majica like '%ba%' and d.prviputa is null
    order by e.nausnica desc;

# 6. zadatak

select a.majica, a.carape
    from svekar a
    left join svekar_cura b on b.svekar = a.sifra
    where b.sifra is null;

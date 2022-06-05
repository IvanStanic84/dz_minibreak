# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Korisnik\Documents\GitHub\dz_minibreak\vjezba6.sql

drop database if exists vjezba6;
create database vjezba6;
use vjezba6;


create table punac(
    sifra int not null primary key auto_increment,
    ekstroventno bit not null,
    suknja varchar(30) not null,
    majica varchar(44) not null,
    prviputa datetime not null
);

create table svekrva(
    sifra int not null primary key auto_increment,
    hlace varchar(48)not null,
    suknja varchar(42) not null,
    ogrlica int not null,
    treciputa datetime not null,
    dukserica varchar(32) not null,
    narukvica int not null,
    punac int 
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    haljina varchar(35),
    prstena int not null,
    introvertno bit,
    stilfrizura varchar(36)
);

create table prijatelj_ostavljena(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    ostavljena int not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    prviputa datetime not null,
    kratkamajica varchar(39) not null,
    drugiputa datetime,
    maraka decimal(14,10)
);

create table brat(
    sifra int not null primary key auto_increment,
    nausnica int not null,
    treciputa datetime not null,
    narukvica int not null,
    hlace varchar(31),
    prijatelj int
);

create table decko(
    sifra int not null primary key auto_increment,
    prviputa datetime,
    modelnaocala varchar(41),
    nausnica int,
    zena int not null
);

create table zena(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8) not null,
    narukvica int not null,
    dukserica varchar(40) not null,
    haljina varchar(30),
    hlace varchar(32),
    brat int not null
);

alter table svekrva add foreign key (punac) references punac(sifra);
alter table brat add foreign key (prijatelj) references prijatelj(sifra);
alter table decko add foreign key (zena) references zena(sifra);
alter table zena add foreign key (brat) references brat(sifra);
alter table prijatelj_ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_ostavljena add foreign key (ostavljena) references ostavljena(sifra);

# 1. zadatak

insert into prijatelj(prstena, stilfrizura) 
values
(18, 'kovrcava'),
(20, 'celav'),
(22, 'kratko');

insert into brat(nausnica, treciputa, narukvica) 
values
(22, 2022-05-22, 23),
(33, 2021-06-28, 24),
(44, 2020-07-13, 25);

insert into zena (novcica, narukvica, dukserica, brat) 
values
(23.23, 25, 'plava', 1),
(33.33, 77, 'zelena', 2),
(77.77, 88, 'žuta', 3);

insert into decko(zena) 
values
(1),
(2),
(3);

insert into ostavljena(prviputa, kratkamajica)
values 
(2022-05-13, 'zelena'),
(2012-05-28, 'crna'),
(2020-06-22, 'bijela');

insert into prijatelj_ostavljena(prijatelj, ostavljena)
values
(1, 1),
(2, 2),
(3, 3);

# 2. zadatak

update svekrva set suknja='Osijek';

# 3. zadatak

delete from decko where modelnaocala<'AB';

# 4. zadatak

select narukvica from brat where treciputa is null;

# 5. zadatak

select a.drugiputa, f.zena, e.narukvica
from ostavljena a
    inner join prijatelj_ostavljena b on b.ostavljena = a.sifra 
    inner join prijatelj c on c.sifra = b.prijatelj
    inner join brat d on d.prijatelj = c.sifra 
    inner join zena e on e.brat = d.sifra 
    inner join decko f on f.zena = e.sifra 
    where d.treciputa is not null and c.prstena=219
    order by e.narukvica desc;

# 6. zadatak

select a.prstena, a.introvertno
    from prijatelj a
    left join prijatelj_ostavljena b on b.prijatelj = a.sifra
    where b.sifra is null;

# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Korisnik\Documents\GitHub\dz_minibreak\vjezba2.sql

drop database if exists vjezba2;
create database vjezba2;
use vjezba2;

create table svekar(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno bit not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(37),
    treciputa datetime not null,
    ekstroventno boolean not null,
    prviputa datetime,
    svekar int not null
);

create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakose varchar(37) not null,
    novcica decimal(15,9),
    lipa decimal(15,8) not null,
    indiferentno bit not null
);

create table decko(
    sifra int not null primary key auto_increment,
    indiferentno bit,
    vesta varchar(34),
    asocijalno bit not null
);

create table decko_zarucnica(
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null
);

create table cura(
    sifra int not null primary key auto_increment,
    haljina varchar(33) not null,
    drugiputa datetime not null,
    suknja varchar(38),
    narukvica int,
    introvertno bit,
    majica varchar(40) not null,
    decko int
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(32),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char(11),
    cura int
);

create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno boolean not null,
    neprijatelj int not null
);

alter table prijatelj add foreign key (svekar) references svekar(sifra);

alter table decko_zarucnica add foreign key (decko) references decko(sifra);

alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);

alter table cura add foreign key (decko) references decko(sifra);

alter table neprijatelj add foreign key (cura) references cura(sifra);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

# 1. zadatak 

insert into neprijatelj (haljina, modelnaocala, kuna)
values
('plava', 'sunčane', 564.25),
('zelena', 'dioptrijske', 854.69),
('crvena', 'crne', 44.44);

insert into cura (haljina, drugiputa, majica)
values 
('plava', '2022-08-27', 'bijela'),
('bijela', '2011-08-22', 'ljubičasta'),
('zelena', '2020-06-28', 'žuta');

insert into decko (asocijalno)
values 
(true),
(false),
(false);

insert into zarucnica (bojakose, lipa, indiferentno)
values 
('crvena', 0.99, true),
('crna', 0.10, false),
('plava', 0.55, false);

insert into decko_zarucnica (decko, zarucnica)
values 
(1, 1),
(2, 2),
(3, 3);

# 2. zadatak

insert into svekar (ogrlica, asocijalno)
values 
(1, true),
(2, false),
(3, false);

insert into prijatelj (treciputa, ekstroventno, svekar)
values 
('2022-05-27', true, 1),
('2010-09-22', false, 2),
('2000-05-14', false, 3);

update prijatelj set treciputa=2020-04-30;

# 3. zadatak

insert into brat (ogrlica, asocijalno, neprijatelj)
values 
(1, true, 1),
(2, false, 1),
(3, false, 2);

delete from brat where ogrlica!=14;

# 4. zadatak

select suknja from cura where drugiputa=null;

# 5. zadatak

select a.novcica,f.neprijatelj,e.haljina 
    from zarucnica a
    inner join decko_zarucnica b on b.zarucnica = a.sifra 
    inner join decko c on c.sifra = b.decko 
    inner join cura d on d.decko = c.sifra 
    inner join neprijatelj e on e.cura =d.sifra 
    inner join brat f on f.neprijatelj = e.sifra 
    where d.drugiputa like'%%' and c.vesta like '%ba%'
    order by e.haljina desc;

# 6. zadatak

    select a.vesta, a.asocijalno
    from decko a inner join decko_zarucnica ss 
    on a.sifra=ss.decko where a.sifra not in (select decko from decko_zarucnica);
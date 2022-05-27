# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Korisnik\Documents\GitHub\dz_minibreak\vjezba1.sql

drop database if exists vjezba1;
create database vjezba1;
use vjezba1;

create table sestra(
    sifra int not null primary key auto_increment,
    introvertno bit,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46) not null,
    narukvica int not null
    );

    create table zena(
        sifra int not null primary key auto_increment,
        treciput datetime,
        hlace varchar(46),
        kratkamajica varchar(32) not null,
        jmbag char(11) not null,
        bojaociju varchar(31) not null,
        haljina varchar(44),
        sestra int not null
    );

    create table muskarac(
        sifra int not null primary key auto_increment,
        bojaociju varchar(50) not null,
        hlace varchar(30),
        modelnaocala varchar(43),
        maraka decimal(14,5) not null,
        zena int not null  
    );

    create table mladic(
        sifra int not null primary key auto_increment,
        suknja varchar(50) not null,
        kuna decimal(16,8) not null,
        drugiputa datetime,
        asocijalno bit,
        ekstroventno bit not null,
        dukserica varchar(48) not null,
        muskarac int
    );

    create table svekar(
        sifra int not null primary key auto_increment,
        bojaociju varchar(40) not null,
        prstena int,
        dukserica varchar(41),
        lipa decimal(13,8),
        eura decimal(12,7),
        majica varchar(35)
    );

    create table sestra_svekar(
        sifra int not null primary key auto_increment,
        sestra int not null,
        svekar int not null
    );

    create table punac(
        sifra int not null primary key auto_increment,
        ogrlica int,
        gustoca decimal(14,9),
        hlace varchar(41) not null
    );

    create table cura(
        sifra int not null primary key auto_increment,
        novcica decimal(16,5) not null,
        gustoca decimal(18,6) not null,
        lipa decimal(13,10),
        ogrlica int not null,
        bojakose varchar(38),
        suknja varchar(36),
        punac int
    );

    alter table cura add foreign key (punac) references punac(sifra);
    alter table zena add foreign key (sestra) references sestra(sifra);
    alter table muskarac add foreign key (zena) references zena(sifra);
    alter table mladic add foreign key (muskarac) references muskarac(sifra);
    alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
    alter table sestra_svekar add foreign key (svekar) references svekar(sifra);

    
    # 1.zadatak

    insert into sestra(haljina, hlace, narukvica)
    values
    ('zelena', 'rifle', 22),
    ('plava', 'kratke', 55),
    ('ljubičasta', 'žute', 23);
    
    insert into zena(kratkamajica, jmbag, bojaociju, sestra)
    values
    ('zuta', '12345678910', 'plava', 1),
    ('bijela', '12345678911', 'zelena', 1),
    ('crvena', '12345678912', 'crna', 1);
    
    insert into muskarac(bojaociju, maraka, zena)
    values
    ('zelena', 16.25, 1),
    ('plava', 15.55, 2),
    ('crvaena', 89.55, 3);

    insert into svekar(bojaociju)
    values
    ('plava'),
    ('zelena'),
    ('crna');

    insert into sestra_svekar (sestra, svekar)
    values
    (1,1),
    (2,2),
    (2,3);

    # 2.zadatak

    insert into cura(novcica, gustoca, ogrlica)
    values 
    (13.5, 15.88, 6),
    (17.56, 256.55, 7),
    (37.89, 98.58, 9);

    update cura set gustoca=15.77;

    # 3.zadatak

    insert into mladic(suknja, kuna, ekstroventno, dukserica)
    values
    ('plava', 85.25, 1, 'žuta'),
    ('zelena', 2.3, 0, 'plava'),
    ('ljubičasta', 854.5, 0, 'zeleno');

    delete from mladic where kuna >15.78;

    # 4. zadatak

    select kratkamajica from zena where hlace like '%ana%';

    # 5. zadatak

    select a.dukserica,f.asocijalno,e.hlace 
    from svekar a
    inner join sestra_svekar b on b.svekar = a.sifra 
    inner join sestra c on c.sifra = b.sestra 
    inner join zena d on d.sestra = c.sifra 
    inner join muskarac e on e.zena =d.sifra 
    inner join mladic f on f.muskarac = e.sifra 
    where d.hlace like 'a%' and c.haljina like '%ba%'
    order by e.hlace desc;

    # 6. zadatak

    select a.haljina, a.maraka
    from sestra a inner join sestra_svekar ss 
    on a.sifra=ss.sestra where a.sifra not in (select sestra from sestra_svekar);
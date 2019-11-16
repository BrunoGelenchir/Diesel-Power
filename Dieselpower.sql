drop database if exists DieselPower;
create database DieselPower;
use DieselPower;

create table klijent(
    IDklijent int not null primary key auto_increment,
    ime varchar (10) not null,
    prezime varchar (10) not null,
    kontakt varchar(10),
    oib int    
);

create table radnik (
    IDradnik int not null primary key auto_increment,
    ime varchar (10) not null,
    prezime varchar (10) not null,
    kontakt varchar (10),
    oib int   
);

create table novi_proizvod (
    IDnovi_proizvod int not null primary key auto_increment,
    kataloski_broj varchar(15) not null,
    naziv_proizvoda varchar (10) not null,
    kolicina int,
    cijena decimal not null
);

create table zamjenski_dio (
    IDzamjenski_dio int not null primary key auto_increment,
    kataloski_broj varchar (15) not null,
    naziv_zamjenskog_djela varchar (10) not null,
    kolicina int,
    cijena decimal (7,2)not null

);

create table skladiste (
    IDskladiste int not null primary key auto_increment,
    kolicina int not null,
    zamjenski_dio int ,
    novi_proizvod int
    
);

create table usluga(
    IDusluga int not null primary key auto_increment,
    naziv_usluge varchar (10) not null,
    cijena decimal (7,2)
);

create table ponuda (
    IDponuda int not null primary key auto_increment,
    usluga int not null,
    zamjenski_dio int,
    novi_proizvod int

);

create table nacin_placanja(
    IDnacin_placanja int not null primary key auto_increment,
    naziv_placanja varchar (10) not null
);

create table radni_nalog (
    IDradni_nalog int not null primary key auto_increment,
    klijent int not null,
    radnik int not null,
    nacin_placanja int not null,
    ponuda int not null,
    napomena varchar (20) 

); 

ALTER table skladiste ADD FOREIGN key (zamjenski_dio) REFERENCES zamjenski_dio (IDzamjenski_dio);
ALTER table skladiste ADD FOREIGN key (novi_proizvod) REFERENCES novi_proizvod (IDnovi_proizvod);

ALTER table ponuda ADD FOREIGN key (zamjenski_dio) REFERENCES zamjenski_dio (IDzamjenski_dio);
ALTER table ponuda ADD FOREIGN key (novi_proizvod) REFERENCES novi_proizvod (IDnovi_proizvod);
ALTER table ponuda add FOREIGN key (usluga) REFERENCES usluga (IDusluga);

ALTER table radni_nalog add FOREIGN key (klijent) REFERENCES klijent (IDklijent);
ALTER table radni_nalog add FOREIGN key (radnik) REFERENCES radnik (IDradnik);
ALTER table radni_nalog add FOREIGN key (nacin_placanja) REFERENCES nacin_placanja (IDnacin_placanja);
ALTER table radni_nalog add FOREIGN key (ponuda) REFERENCES ponuda (IDponuda);

use dieselpower;

insert into klijent 
(IDklijent,ime,prezime,kontakt)
values
(null,'Mario','Maric','091686992'),
(null,'Ivan','Ivic','0988896535'),
(null,'Korlat','Koric','0996869595'),
(null,'Ivana','Ivancic','0916235461'),
(null,'Tonka','Tonic','091686595');


insert into nacin_placanja
(IDnacin_placanja,naziv_placanja)
values
(null,'Gotovina');

insert into nacin_placanja
(IDnacin_placanja,naziv_placanja)
values
(null,'Kartica'),
(null,'Virman');


insert into novi_proizvod
(IDnovi_proizvod,kataloski_broj,naziv_proizvoda,kolicina,cijena)
values
(null, '0445110320','Bosch Inj.',2,2250.54);

insert into novi_proizvod
(IDnovi_proizvod,kataloski_broj,naziv_proizvoda,kolicina,cijena)
values
(null, '0445110180','Bosch Inj.',2,400.50),
(null, 'EJBR01801Z','Denso Inj.',2,900.00);


insert into usluga (IDusluga,naziv_usluge,cijena)
values
(null,'Diagnostic',150),
(null,'Rep.pumpe',900),
(null,'Rep.inj',300),
(null,'RadNaVoz',200);

update usluga set IDusluga=1 where IDusluga=5;

update usluga set IDusluga=2 where IDusluga=6;

update usluga set IDusluga=3 where IDusluga=7;
update usluga set IDusluga=4 where IDusluga=8;



insert into zamjenski_dio 
(IDzamjenski_dio,kataloski_broj,naziv_zamjenskog_djela,kolicina,cijena)
values
(null, 'B0220230','O-ring',100,5.00),
(null, 'B04331719','Ulozak.d',4,440.40);


insert into radnik
(IDradnik,ime,prezime,kontakt)
values
(null,'Marin','Alatko','091653421'),
(null,'Igor','Kljucic','099543425'),
(null,'Damira','Gedora','09875421');







CREATE TABLE UslugaLokata (
  nazwa VARCHAR(50)   NOT NULL,
  okres INTERVAL YEAR(1) TO MONTH,
  oprocentowanie DOUBLE PRECISION,
  opis VARCHAR(255),
PRIMARY KEY(nazwa));



CREATE TABLE Pracownik (
  ident INTEGER   NOT NULL,
  przelozony INTEGER ,
  imie VARCHAR(50),
  nazwisko VARCHAR(50),
  stanowisko VARCHAR(50),
  passw VARCHAR(20),
  pensja NUMBER(10,2),
PRIMARY KEY(ident),
  FOREIGN KEY(przelozony)
    REFERENCES Pracownik(ident));


CREATE INDEX Pracownik_FKIndex1 ON Pracownik (przelozony);



CREATE TABLE UslugaKredyt (
  ident INTEGER   NOT NULL,
  nazwa VARCHAR(50),
  oprocentowanie DOUBLE PRECISION,
  okres INTERVAL YEAR(1) TO MONTH,
  opis VARCHAR(255),
PRIMARY KEY(ident));



CREATE TABLE UslugaRachunek (
  nazwa VARCHAR(50)   NOT NULL,
  oplataMsc NUMBER(4,2),
  oprocentowanie DOUBLE PRECISION,
  oplataPrzelewZew NUMBER(4,2),
  oplataPrzelewWew NUMBER(4,2),
  opis VARCHAR(255),
PRIMARY KEY(nazwa));



CREATE TABLE Inwestycja (
  nazwa VARCHAR(50)   NOT NULL,
  prognoza DOUBLE PRECISION,
  poczatek DATE,
  koniec DATE,
  opis VARCHAR(255),
PRIMARY KEY(nazwa));



CREATE TABLE Klient (
  ident INTEGER   NOT NULL,
  nazwa VARCHAR(50)   NOT NULL,
  miejscowosc VARCHAR(50),
  kodPoczt VARCHAR(50),
  adres VARCHAR(50),
  typ VARCHAR(20),
  info VARCHAR(255),
  passw VARCHAR(20),
PRIMARY KEY(ident),
CONSTRAINT dziedzina_typu_klienta CHECK (typ IN ('indywidualny',
'biznesowy')) );



CREATE TABLE Lokata (
  ident INTEGER   NOT NULL,
  Klient_ident INTEGER   NOT NULL,
  UslugaLokata_nazwa VARCHAR(50)   NOT NULL,
  otwarta DATE,
  wplata NUMBER(10,2),
PRIMARY KEY(ident),
  FOREIGN KEY(UslugaLokata_nazwa)
    REFERENCES UslugaLokata(nazwa),
  FOREIGN KEY(Klient_ident)
    REFERENCES Klient(ident) ON DELETE CASCADE);


CREATE INDEX Lokata_FKIndex1 ON Lokata (UslugaLokata_nazwa);
CREATE INDEX Lokata_FKIndex2 ON Lokata (Klient_ident);


CREATE TABLE Fundusz (
  ident INTEGER   NOT NULL,
  Inwestycja_nazwa VARCHAR(50)   NOT NULL,
  Klient_ident INTEGER   NOT NULL,
  wplata NUMBER(10,2),
  zalozona DATE,
PRIMARY KEY(ident),
  FOREIGN KEY(Klient_ident)
    REFERENCES Klient(ident) ON DELETE CASCADE,
  FOREIGN KEY(Inwestycja_nazwa)
    REFERENCES Inwestycja(nazwa));


CREATE INDEX Fundusz_FKIndex1 ON Fundusz (Klient_ident);
CREATE INDEX Fundusz_FKIndex2 ON Fundusz (Inwestycja_nazwa);


CREATE TABLE Rachunek (
  numer VARCHAR(26)   NOT NULL,
  UslugaRachunek_nazwa VARCHAR(50)   NOT NULL,
  Klient_ident INTEGER   NOT NULL,
  srodki NUMBER(10,2),
  otwarty DATE,
PRIMARY KEY(numer),
  FOREIGN KEY(Klient_ident)
    REFERENCES Klient(ident) ON DELETE CASCADE,
  FOREIGN KEY(UslugaRachunek_nazwa)
    REFERENCES UslugaRachunek(nazwa));


CREATE INDEX Rachunek_FKIndex1 ON Rachunek (Klient_ident);
CREATE INDEX Rachunek_FKIndex2 ON Rachunek (UslugaRachunek_nazwa);


CREATE TABLE ProjektInwest (
  Inwestycja_nazwa VARCHAR(50)   NOT NULL,
  Pracownik_ident INTEGER   NOT NULL,
  FOREIGN KEY(Pracownik_ident)
    REFERENCES Pracownik(ident),
  FOREIGN KEY(Inwestycja_nazwa)
    REFERENCES Inwestycja(nazwa));


CREATE INDEX ProjektInwest_FKIndex1 ON ProjektInwest 
(Pracownik_ident);
CREATE INDEX ProjektInwest_FKIndex2 ON ProjektInwest 
(Inwestycja_nazwa);


CREATE TABLE Kredyt (
  ident INTEGER   NOT NULL,
  Pracownik_ident INTEGER   NOT NULL,
  UslugaKredyt_ident INTEGER   NOT NULL,
  Klient_ident INTEGER   NOT NULL,
  suma NUMBER(10,2),
  udzielony DATE,
  splacone NUMBER(10,2),
PRIMARY KEY(ident),
  FOREIGN KEY(Klient_ident)
    REFERENCES Klient(ident) ON DELETE CASCADE,
  FOREIGN KEY(UslugaKredyt_ident)
    REFERENCES UslugaKredyt(ident),
  FOREIGN KEY(Pracownik_ident)
    REFERENCES Pracownik(ident));


CREATE INDEX Kredyt_FKIndex1 ON Kredyt (Klient_ident);
CREATE INDEX Kredyt_FKIndex2 ON Kredyt (UslugaKredyt_ident);
CREATE INDEX Kredyt_FKIndex3 ON Kredyt (Pracownik_ident);


CREATE TABLE Transakcja (
  ident INTEGER   NOT NULL,
  Rachunek_numer VARCHAR(26)   NOT NULL,
  wartosc NUMBER(10,2),
  kierunek VARCHAR(3),
  tytul VARCHAR(50),
  RachunekPrzeciwst VARCHAR(50),
  nazwa VARCHAR(50),
  adres VARCHAR(50),
  miejscowosc VARCHAR(50),
  wykonana DATE,
PRIMARY KEY(ident),
  FOREIGN KEY(Rachunek_numer)
    REFERENCES Rachunek(numer),
CONSTRAINT poprawny_kierunek_operacji CHECK (kierunek IN('in',
'out')) );


CREATE INDEX Transakcja_FKIndex1 ON Transakcja (Rachunek_numer);



CREATE TABLE ZlecenieStale (
  ident INTEGER   NOT NULL,
  Rachunek_numer VARCHAR(26)   NOT NULL,
  wartosc NUMBER(10,2),
  Rachunek VARCHAR(50),
  tytul VARCHAR(50),
  nazwa VARCHAR(50),
  adres VARCHAR(50),
  miejscowosc VARCHAR(50),
  poczatek DATE,
  koniec DATE,
  czestotliwosc DOUBLE PRECISION,
  okres VARCHAR(5),
PRIMARY KEY(ident),
  FOREIGN KEY(Rachunek_numer)
    REFERENCES Rachunek(numer),
CONSTRAINT poprawny_okres CHECK (okres IN ('day', 'week', 
'month')) );


CREATE INDEX ZlecenieStale_FKIndex1 ON ZlecenieStale 
(Rachunek_numer);

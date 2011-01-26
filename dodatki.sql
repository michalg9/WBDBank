Rem No table found to generate DDL.
CREATE OR REPLACE FUNCTION  "GET_USLUGALOKATA" RETURN LOKATA_PKG.ref_cursor 
  AS uslugaLokata_cursor  LOKATA_PKG.ref_cursor;
BEGIN
  OPEN uslugaLokata_cursor FOR
  SELECT nazwa, okres, oprocentowanie FROM USLUGALOKATA;
  RETURN uslugaLokata_cursor;
END GET_USLUGALOKATA;
/
 CREATE OR REPLACE FUNCTION  "GET_RACHUNKI" 
(ident in NUMBER)
return LOKATA_PKG.ref_cursor 
  AS rachunki_cursor  LOKATA_PKG.ref_cursor;
begin
OPEN rachunki_cursor FOR
  SELECT numer, UslugaRachunek_nazwa, srodki FROM Rachunek
  WHERE Klient_ident = ident;
RETURN rachunki_cursor;
end;
/
 
Rem No index found to generate DDL.
CREATE OR REPLACE PACKAGE  "LOKATA_PKG" AS 
  TYPE ref_cursor IS REF CURSOR;
END LOKATA_PKG;
/

 
Rem No procedure found to generate DDL.
 CREATE SEQUENCE   "TRANSAKCJA_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 55 CACHE 10 NOORDER  NOCYCLE
/
 CREATE SEQUENCE   "LOKATA_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 10 NOORDER  NOCYCLE
/
 CREATE SEQUENCE   "FUNDUSZ_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 10 NOORDER  NOCYCLE
/

CREATE SEQUENCE   "PRACOWNIK_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 14 CACHE 10 NOORDER  NOCYCLE
/



Rem No synonym found to generate DDL.
CREATE OR REPLACE TRIGGER  "TRANSAKCJATEMP_T1" 
AFTER
insert on "TRANSAKCJATEMP"
for each row
begin

INSERT INTO Transakcja
VALUES  (:new.ident, :new.RACHUNEKPRZECIWST, :new.WARTOSC, 'in', :new.TYTUL, :new.RACHUNEK_NUMER, :new.NAZWA, :new.ADRES, :new.MIEJSCOWOSC, CURRENT_DATE);

end;
/
ALTER TRIGGER  "TRANSAKCJATEMP_T1" ENABLE
/
CREATE OR REPLACE TRIGGER  "TRANSAKCJA_T1" 
AFTER
insert on "TRANSAKCJA"
for each row
begin

IF :new.KIERUNEK = 'out' THEN
  UPDATE Rachunek
  SET srodki = srodki - :new.wartosc
  WHERE numer = :new.rachunek_numer;
END IF;

IF :new.KIERUNEK = 'in' THEN
  UPDATE Rachunek
  SET srodki = srodki + :new.wartosc
  WHERE numer = :new.rachunek_numer;
END IF;

end;
/
ALTER TRIGGER  "TRANSAKCJA_T1" ENABLE
/

Rem No view found to generate DDL.

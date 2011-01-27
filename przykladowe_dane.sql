INSERT INTO UslugaLokata 
VALUES
('SuperLokata', '0-4', '4,45', 'To jest super lokata. Zaloz ja.');

INSERT INTO UslugaLokata 
VALUES
('EkstraLokata', '0-9', '10,00', 'To jest ekstra lokata. Zaloz ja.');

INSERT INTO Pracownik
VALUES
(1, NULL, 'Adam', 'Adamski', 'Manager', 'abc', 5000);

INSERT INTO Pracownik
VALUES
(2, 1, 'Mateusz', 'Markowski', 'Pracownik', 'bcd', 2000);

INSERT INTO Pracownik
VALUES
(3, 1, 'Ryszard', 'Ryszardzki', 'Pracownik', 'cdb', 3000);

INSERT INTO UslugaKredyt
VALUES
(1, 'KredytBogaty', '14,12', '3-3', 'Kredyt dla bogatych');

INSERT INTO UslugaKredyt
VALUES
(2, 'KredytBiedny', '4,15', '3-3', 'Kredyt dla mniej bogatych');

INSERT INTO UslugaRachunek
VALUES
('RachunekMAX', '1,50', '4,99', '0,50', '0,20', 'Maksymalny rachunek');

INSERT INTO UslugaRachunek
VALUES
('RachunekZwykly', '2,50', '1,99', '1,50', '1,20', 'Zwykly rachunek');

INSERT INTO Inwestycja
VALUES
('GoraZlota', '4,45', to_date('2011/01/25', 'yyyy/mm/dd'), to_date('2011/01/26', 'yyyy/mm/dd'), 'Z tej inwestycji bedziesz mial gory zlota');

INSERT INTO Klient
VALUES
(1, 'Waldemar Waldemarski', 'Warszawa', '02-222', 'ul. Lica 5/54', 'indywidualny', 'Dobry klient', '123');

INSERT INTO Klient
VALUES
(2, 'Bronislaw Lawski', 'Krakow', '02-234', 'ul. Kica 5/97', 'indywidualny', 'Bardzo dobry klient', '234');

INSERT INTO Lokata
VALUES
(1, 1, 'SuperLokata', to_date('2011/01/25', 'yyyy/mm/dd'), '1231,54');

INSERT INTO Fundusz
VALUES
(1, 'GoraZlota', 2,  '2123,32', to_date('2011/01/26', 'yyyy/mm/dd'));

INSERT INTO Rachunek
VALUES
('33334444555566660000000034', 'RachunekMAX', 1, '15000,54', to_date('2011/01/25', 'yyyy/mm/dd'));

INSERT INTO ProjektInwest
VALUES
('GoraZlota', 3);

INSERT INTO ProjektInwest
VALUES
('GoraZlota', 2);

INSERT INTO Kredyt
VALUES
(1, 2, 1, 1, '100,22', to_date('2011/01/25', 'yyyy/mm/dd'), '20,00');


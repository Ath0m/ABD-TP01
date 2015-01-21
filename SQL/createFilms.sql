---  TP1 ABD 

DROP TABLE Roles;
DROP TABLE Films;
DROP TABLE Artists;

CREATE TABLE Artists (
 aid INTEGER PRIMARY KEY ,
 anom VARCHAR(30) NOT NULL ,
 nationalite VARCHAR(30) NOT NULL 
);


CREATE TABLE Films (
 fid INTEGER PRIMARY KEY ,
 titre VARCHAR(30) NOT NULL ,
 realisateur INTEGER REFERENCES Artists, 
 an DATE NOT NULL,
 langue VARCHAR(30) NOT NULL
);

 
CREATE TABLE Roles (
 fid INTEGER NOT NULL ,
 aid INTEGER NOT NULL,
 personnage VARCHAR(45),
 cout INTEGER,
 PRIMARY KEY (fid,aid), 
 FOREIGN KEY (fid) 
 REFERENCES Films
 ON DELETE CASCADE 
 ON UPDATE CASCADE,
 FOREIGN KEY (aid) 
 REFERENCES Artists 
 ON DELETE CASCADE 
 ON UPDATE CASCADE
);



--- Insertion de tuples qui ne violent pas les contraintes

INSERT INTO Artists VALUES
(123,'JeanduJardin','francais');
INSERT INTO Artists VALUES
(415,'MarionCotillard','francais');
INSERT INTO Artists VALUES
(304,'ChiaraMuti','italien');
INSERT INTO Artists VALUES
(702,'LauraAntonelli','italien');
INSERT INTO Artists VALUES
(876,'MarcelloMastroianni','italien');
INSERT INTO Artists VALUES
(18457,'AnneSophieSaintOmer','francais');
INSERT INTO Artists VALUES
(666,'ThomasBernardo','italien');
INSERT INTO Artists VALUES
(999,'Artiste9','italien');


INSERT INTO Films
 VALUES (1,'De rouilles et des os',876,'2011-01-01','francais');
INSERT INTO Films
 VALUES (2,'Cyrano en vrai',876,'2010-02-02','francais');
INSERT INTO Films
 VALUES (3,'Matrix2',876,'2014-04-04','anglais');
INSERT INTO Films
 VALUES (4,'FilmTropBien',876,'2011-01-01','francais');
INSERT INTO Films
 VALUES (5,'Film 9', 876,'2012-04-01','anglais');


INSERT INTO Roles
 VALUES (2,123,'Cyrano',10500);
INSERT INTO Roles
 VALUES (3,123,'Cyrano',20000);
INSERT INTO Roles
 VALUES (2,702,'FJacques',45000);
 INSERT INTO Roles
 VALUES (1,304,'Cecile',9000); 
INSERT INTO Roles
 VALUES (2,18457,'Cyranette',1000000);
INSERT INTO Roles
 VALUES (1,666,'LeMec',1);
INSERT INTO Roles
 VALUES (4,123,'LeMecFrancais',10500);
 INSERT INTO Roles
 VALUES (4,702,'LaFemmeItalienne',10500);
 INSERT INTO Roles
 VALUES (5,999,'Cyrano',999);  


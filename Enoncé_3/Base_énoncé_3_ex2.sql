
CREATE TABLE Salles
(
    Salle VARCHAR(200) PRIMARY KEY,
    NombrePlaces INT(6)
);

CREATE TABLE Intervenants
(
    Titre VARCHAR(200),
    Intervenant VARCHAR(200),
    Typ VARCHAR(200)
);

CREATE TABLE Spectacles
(
    Titre VARCHAR(200),
    Semaine INT(6),
    Salle VARCHAR(200)
);

CREATE TABLE Places
(
    Semaine INT(6),
    Salle VARCHAR(200),
    Jour VARCHAR(200),
    Disponibilite INT(6)
);


INSERT INTO `Salles` (`Salle`, `NombrePlaces`) VALUES ('A', 150);
INSERT INTO `Salles` (`Salle`, `NombrePlaces`) VALUES ('B', 85);
INSERT INTO `Salles` (`Salle`, `NombrePlaces`) VALUES ('C', 320);

INSERT INTO `Intervenants` (`Titre`, `Intervenant`, `Typ`) VALUES ('L avare', 'Paul', 'Cleandre');
INSERT INTO `Intervenants` (`Titre`, `Intervenant`, `Typ`) VALUES ('L avare', 'Jacques', 'L avare');
INSERT INTO `Intervenants` (`Titre`, `Intervenant`, `Typ`) VALUES ('L avare', 'Jacqueline', 'Lucie');
INSERT INTO `Intervenants` (`Titre`, `Intervenant`, `Typ`) VALUES ('Le grand tour', 'Paul', 'M. Jolivet');
INSERT INTO `Intervenants` (`Titre`, `Intervenant`, `Typ`) VALUES ('Le grand tour', 'Pierre', 'Le notaire');
INSERT INTO `Intervenants` (`Titre`, `Intervenant`, `Typ`) VALUES ('L echec', 'Paul', 'Le philosophe');

INSERT INTO `Spectacles` (`Titre`, `Semaine`, `Salle`) VALUES ('L avare', 12, 'A');
INSERT INTO `Spectacles` (`Titre`, `Semaine`, `Salle`) VALUES ('L avare', 13, 'A');
INSERT INTO `Spectacles` (`Titre`, `Semaine`, `Salle`) VALUES ('L avare', 14, 'B');
INSERT INTO `Spectacles` (`Titre`, `Semaine`, `Salle`) VALUES ('Le grand tour', 12, 'B');
INSERT INTO `Spectacles` (`Titre`, `Semaine`, `Salle`) VALUES ('Le grand tour', 13, 'B');
INSERT INTO `Spectacles` (`Titre`, `Semaine`, `Salle`) VALUES ('L echec', 14, 'B');
INSERT INTO `Spectacles` (`Titre`, `Semaine`, `Salle`) VALUES ('L echec', 15, 'C');

INSERT INTO `Places` (`Semaine`, `Salle`, `Jour`, `Disponibilite`) VALUES (12, 'A', 'mardi', 45);
INSERT INTO `Places` (`Semaine`, `Salle`, `Jour`, `Disponibilite`) VALUES (12, 'A', 'mercredi', 52);
INSERT INTO `Places` (`Semaine`, `Salle`, `Jour`, `Disponibilite`) VALUES (12, 'A', 'vendredi', 12);
INSERT INTO `Places` (`Semaine`, `Salle`, `Jour`, `Disponibilite`) VALUES (13, 'A', 'mercredi', 68);
INSERT INTO `Places` (`Semaine`, `Salle`, `Jour`, `Disponibilite`) VALUES (13, 'A', 'vendredi', 23);
INSERT INTO `Places` (`Semaine`, `Salle`, `Jour`, `Disponibilite`) VALUES (14, 'B', 'mardi', 51);
INSERT INTO `Places` (`Semaine`, `Salle`, `Jour`, `Disponibilite`) VALUES (14, 'B', 'mercredi', 27);
INSERT INTO `Places` (`Semaine`, `Salle`, `Jour`, `Disponibilite`) VALUES (14, 'B', 'samedi', 8);
INSERT INTO `Places` (`Semaine`, `Salle`, `Jour`, `Disponibilite`) VALUES (12, 'B', 'mardi', 52);
INSERT INTO `Places` (`Semaine`, `Salle`, `Jour`, `Disponibilite`) VALUES (12, 'B', 'samedi', 16);
INSERT INTO `Places` (`Semaine`, `Salle`, `Jour`, `Disponibilite`) VALUES (13, 'B', 'mercredi', 39);
INSERT INTO `Places` (`Semaine`, `Salle`, `Jour`, `Disponibilite`) VALUES (13, 'B', 'vendredi', NULL);
INSERT INTO `Places` (`Semaine`, `Salle`, `Jour`, `Disponibilite`) VALUES (14, 'B', '', NULL);
INSERT INTO `Places` (`Semaine`, `Salle`, `Jour`, `Disponibilite`) VALUES (15, 'C', '', NULL);

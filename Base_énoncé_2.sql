/*
Pas de tiret dans les noms des variables : remplacer par des underscores


*/

CREATE TABLE Cinema 
( 
    Nom_c VARCHAR(200) PRIMARY KEY,
    Arrondissement INT(20)
);

/* Contrainte : clef étrangère : la référence doit avoir été définie avant (exemple : "Nom_c") */

CREATE TABLE Salle 
( 
    No_salle INT(6),
    Nom_c VARCHAR(200), 
    FOREIGN KEY (`Nom_c`) REFERENCES Cinema(`Nom_c`),
    Climatise VARCHAR(1),
    Capacite INT(200) 
); 

CREATE TABLE Artiste
(
    Nom VARCHAR(200) PRIMARY KEY,
    Annee_Naissance INT(6)
);

CREATE TABLE Film
(
    ID_Film INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Realisateur VARCHAR(200),
    FOREIGN KEY (`Realisateur`) REFERENCES Artiste(`Nom`),
    Titre VARCHAR(200),
    Annee INT(6)
);

CREATE TABLE Role
(
    Libelle VARCHAR(200),
    ID_Film INT(6) UNSIGNED,
    FOREIGN KEY (`ID_Film`) REFERENCES Film(`ID_Film`),
    Acteur VARCHAR(200),
    FOREIGN KEY (`Acteur`) REFERENCES Artiste(`Nom`)
);


CREATE TABLE Seance
(
    Nom_c VARCHAR(200),
    FOREIGN KEY (`Nom_c`) REFERENCES Cinema(`Nom_c`),
    No_salle INT(6),
    No_seance INT(6),
    Heure_debut INT(6),
    Heure_fin INT(6),
    ID_Film INT(6) UNSIGNED,
    FOREIGN KEY (`ID_Film`) REFERENCES Film(`ID_Film`)
);

/* Contrainte : clef étrangère : les INSERT dans "Cinema" doivent être faits avant ceux dans "Salle" */


INSERT INTO `Cinema` (`Nom_c`, `Arrondissement`) VALUES ('Grand Rex', '2');
INSERT INTO `Cinema` (`Nom_c`, `Arrondissement`) VALUES ('UGC Montparnasse', '6');
INSERT INTO `Cinema` (`Nom_c`, `Arrondissement`) VALUES ('Pathe Les Fauvettes', '13');
INSERT INTO `Cinema` (`Nom_c`, `Arrondissement`) VALUES ('Escurial', '13');


INSERT INTO `Salle` (`No_salle`, `Nom_c`, `Climatise`, `Capacite`) VALUES ('1', 'UGC Montparnasse', '1', '100');
INSERT INTO `Salle` (`No_salle`, `Nom_c`, `Climatise`, `Capacite`) VALUES ('2', 'UGC Montparnasse', '1', '300');
INSERT INTO `Salle` (`No_salle`, `Nom_c`, `Climatise`, `Capacite`) VALUES ('3', 'UGC Montparnasse', '0', '267');
INSERT INTO `Salle` (`No_salle`, `Nom_c`, `Climatise`, `Capacite`) VALUES ('1', 'Grand Rex', '1', '1500');
INSERT INTO `Salle` (`No_salle`, `Nom_c`, `Climatise`, `Capacite`) VALUES ('2', 'Grand Rex', '1', '1700');
INSERT INTO `Salle` (`No_salle`, `Nom_c`, `Climatise`, `Capacite`) VALUES ('1', 'Pathe Les Fauvettes', '0', '300');
INSERT INTO `Salle` (`No_salle`, `Nom_c`, `Climatise`, `Capacite`) VALUES ('2', 'Pathe Les Fauvettes', '1', '178');
INSERT INTO `Salle` (`No_salle`, `Nom_c`, `Climatise`, `Capacite`) VALUES ('1', 'Escurial', '0', '150');
INSERT INTO `Salle` (`No_salle`, `Nom_c`, `Climatise`, `Capacite`) VALUES ('2', 'Escurial', '1', '400');
INSERT INTO `Salle` (`No_salle`, `Nom_c`, `Climatise`, `Capacite`) VALUES ('3', 'Escurial', '0', '100');


INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('Hayden Christensen', '1981');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('Ewan McGregor', '1971');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('Heath Ledger', '1979');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('Christian Bale', '1974');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('Christopher Nolan', '1970');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('George Lucas', '1944');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('Brad Pitt', '1963');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('David Fincher', '1962');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('Woody Allen', '1935');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('Stanley Kubrick', '1928');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('Clint Eastwood', '1930');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('Ridley Scott', '1937');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('Samuel L Jackson', '1948');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('Bill Murray', '1950');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('Daniel Day-Lewis', '1957');
INSERT INTO `Artiste` (`Nom`, `Annee_Naissance`) VALUES ('Don Siegel', '1912');


INSERT INTO `Film` (`ID_Film`, `Realisateur`, `Titre`, `Annee`) VALUES ('1', 'Christopher Nolan', 'The Dark Knight', '2008');
INSERT INTO `Film` (`ID_Film`, `Realisateur`, `Titre`, `Annee`) VALUES ('2', 'George Lucas', 'The Revenge of the Sith', '2005');
INSERT INTO `Film` (`ID_Film`, `Realisateur`, `Titre`, `Annee`) VALUES ('3', 'David Fincher', 'Fight Club', '1999');
INSERT INTO `Film` (`ID_Film`, `Realisateur`, `Titre`, `Annee`) VALUES ('4', 'Woody Allen', 'Annie Hall', '1977');
INSERT INTO `Film` (`ID_Film`, `Realisateur`, `Titre`, `Annee`) VALUES ('5', 'Stanley Kubrick', 'Shining', '1980');
INSERT INTO `Film` (`ID_Film`, `Realisateur`, `Titre`, `Annee`) VALUES ('6', 'Clint Eastwood', 'Invictus', '2009');
INSERT INTO `Film` (`ID_Film`, `Realisateur`, `Titre`, `Annee`) VALUES ('7', 'Ridley Scott', 'Blade Runner', '1982');
INSERT INTO `Film` (`ID_Film`, `Realisateur`, `Titre`, `Annee`) VALUES ('8', 'Clint Eastwood', 'Gran Torino', '2008');
INSERT INTO `Film` (`ID_Film`, `Realisateur`, `Titre`, `Annee`) VALUES ('9', 'Don Siegel', 'Inspecteur Harry', '1971');


INSERT INTO `Role` (`Libelle`, `ID_Film`, `Acteur`) VALUES ('Batman', '1', 'Christian Bale');
INSERT INTO `Role` (`Libelle`, `ID_Film`, `Acteur`) VALUES ('Joker', '1', 'Heath Ledger');
INSERT INTO `Role` (`Libelle`, `ID_Film`, `Acteur`) VALUES ('Obi-Wan Kenobi', '2', 'Ewan McGregor');
INSERT INTO `Role` (`Libelle`, `ID_Film`, `Acteur`) VALUES ('Anakin Skywalker', '2', 'Hayden Christensen');
INSERT INTO `Role` (`Libelle`, `ID_Film`, `Acteur`) VALUES ('Mace Windu', '2', 'Samuel L Jackson');
INSERT INTO `Role` (`Libelle`, `ID_Film`, `Acteur`) VALUES ('Tyler Durden', '3', 'Brad Pitt');
INSERT INTO `Role` (`Libelle`, `ID_Film`, `Acteur`) VALUES ('Alvy Singer', '4', 'Woody Allen');
INSERT INTO `Role` (`Libelle`, `ID_Film`, `Acteur`) VALUES ('Walt Kowalski', '8', 'Clint Eastwood');



INSERT INTO `Seance` (`Nom_c`, `No_salle`, `No_seance`, `Heure_debut`, `Heure_fin`, `ID_Film`)  VALUES ('Grand Rex', '2', '23', '9', '12', '1');
INSERT INTO `Seance` (`Nom_c`, `No_salle`, `No_seance`, `Heure_debut`, `Heure_fin`, `ID_Film`)  VALUES ('Grand Rex', '1', '24', '11', '13', '3');
INSERT INTO `Seance` (`Nom_c`, `No_salle`, `No_seance`, `Heure_debut`, `Heure_fin`, `ID_Film`)  VALUES ('Grand Rex', '2', '65', '21', '23', '4');
INSERT INTO `Seance` (`Nom_c`, `No_salle`, `No_seance`, `Heure_debut`, `Heure_fin`, `ID_Film`)  VALUES ('Escurial', '1', '23', '10', '13', '2');
INSERT INTO `Seance` (`Nom_c`, `No_salle`, `No_seance`, `Heure_debut`, `Heure_fin`, `ID_Film`)  VALUES ('Escurial', '2', '27', '10', '13', '5');
INSERT INTO `Seance` (`Nom_c`, `No_salle`, `No_seance`, `Heure_debut`, `Heure_fin`, `ID_Film`)  VALUES ('Escurial', '3', '30', '10', '13', '6');
INSERT INTO `Seance` (`Nom_c`, `No_salle`, `No_seance`, `Heure_debut`, `Heure_fin`, `ID_Film`)  VALUES ('UGC Montparnasse', '1', '23', '20', '22', '9');
INSERT INTO `Seance` (`Nom_c`, `No_salle`, `No_seance`, `Heure_debut`, `Heure_fin`, `ID_Film`)  VALUES ('UGC Montparnasse', '2', '45', '21', '23', '8');
INSERT INTO `Seance` (`Nom_c`, `No_salle`, `No_seance`, `Heure_debut`, `Heure_fin`, `ID_Film`)  VALUES ('UGC Montparnasse', '3', '46', '21', '23', '7');





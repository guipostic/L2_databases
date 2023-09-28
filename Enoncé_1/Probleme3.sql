/*
Société (Ids, nom, adr)
Lecteur (numle, nom, adr, Ids, numTL)
Livre (numinv, auteur, editeur, edition, nbexemp, numCL)
Type-Lecteur (numTL, libelle)
Catégorie (numCL ,libelle)
*/

CREATE
    TABLE
        Societe (
            Ids NUMBER (5) NOT NULL,
            Nom VARCHAR (9) NOT NULL,
            Adr VARCHAR (10),
            PRIMARY KEY Ids
        )
;
CREATE
    TABLE
        TypeLecteur (
            numTL NUMBER (8) NOT NULL,
            libelle VARCHAR (6),
            PRIMARY KEY numTL
        )
;
CREATE
    TABLE
        Lecteur (
            numle NUMBER (8) NOT NULL,
            nom VARCHAR (15),
            adr VARCHAR (15),
            Ids NUMBER (5),
            numTL NUMBER (8) NOT NULL,
            PRIMARY KEY numle,
            FOREIGN KEY Ids REFERENCES Societe,
            FOREIGN KEY numTL REFERENCES TypeLecteur
        )
;
CREATE
    TABLE
        Categorie (
            numCL NUMBER (8) NOT NULL,
            libelle VARCHAR (6),
            PRIMARY KEY numCL
        )
;
CREATE
    TABLE
        livre (
            numinv NUMBER (7) NOT NULL,
            titre VARCHAR (20),
            auteur VARCHAR (5),
            editeur VARCHAR (5),
            Edition VARCHAR (8),
            Nbexemp INTEGER,
            categorie NUMBER (8) NOT NULL,
            PRIMARY KEY numinv,
            FOREIGN KEY categorie REFERENCES Categorie
        )
;

/*
Emprunt (date-retour, num-le, num-inv)
Acces (numTL, numCL, dure-prêt)
*/

CREATE
    TABLE
        Emprunt (
            numle NUMBER (8) NOT NULL,
            numinv NUMBER (7) NOT NULL,
            DATEretour DATE NOT NULL,
            PRIMARY KEY (
                numle,
                numinv
            ),
            FOREIGN KEY numle REFERENCES Lecteur,
            FOREIGN KEY numinv REFERENCES Livre
        )
;
CREATE
    TABLE
        Acces (
            numTL NUMBER (8) NOT NULL,
            numCL NUMBER (8) NOT NULL,
            Duree DATE NOT NULL,
            PRIMARY KEY (
                numTL,
                numCL
            ),
            FOREIGN KEY numTL REFERENCES TypeLecteur,
            FOREIGN KEY numCL REFERENCES Categorie
        )
;

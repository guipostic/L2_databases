/*1*/
SELECT * FROM Film;

/*2*/
SELECT Titre FROM Film;

/*3*/
SELECT Nom FROM Artiste WHERE Annee_Naissance > 1995;

/*4*/
SELECT Nom_c FROM Cinema WHERE Arrondissement = 13;

/*5*/
SELECT Libelle FROM Role WHERE Acteur = "Brad Pitt";

/*6*/
SELECT Libelle FROM Role WHERE Acteur IN (SELECT Nom FROM Artiste WHERE Annee_Naissance < 1970);

SELECT Libelle FROM Role r, Artiste a WHERE (r.Acteur = a.Nom AND a.Annee_Naissance < 1970);
SELECT Libelle FROM Role, Artiste WHERE (Acteur = Nom AND Annee_Naissance < 1970);

/*7*/
SELECT Nom FROM Artiste WHERE Nom LIKE "B%";

/*8*/
SELECT * FROM Artiste WHERE Nom LIKE "%-%";

/*9*/
SELECT * FROM Film WHERE Titre LIKE "% %";

/*10*/
SELECT Annee FROM Film WHERE Titre = "Shining";

/*11*/
SELECT Titre FROM Film WHERE Annee BETWEEN 1980 AND 1990;
SELECT Titre FROM Film WHERE Annee >= 1980 AND Annee <= 1990;

/*12*/
SELECT Titre FROM Film WHERE Realisateur = "Woody Allen";

/*13*/
/* Renvoie films où acteur ET/OU réal
   Pour un ou "exclusif", utiliser l'opérateur XOR */
SELECT Titre FROM Film f
		JOIN Role r
		ON f.ID_Film = r.ID_Film
		WHERE r.Acteur = "Clint Eastwood" OR f.Realisateur = "Clint Eastwood"; 

SELECT Titre FROM Film f, Role r WHERE f.ID_Film = r.ID_Film AND (r.Acteur = "Clint Eastwood" OR f.Realisateur = "Clint Eastwood");

/*14*/
SELECT * FROM Film ORDER BY Titre;

/*15*/
SELECT * FROM Seance s
	JOIN Cinema c ON s.Nom_c = c.Nom_c
	WHERE Heure_fin < 12 AND Arrondissement = 13;

/*16*/
SELECT r.Acteur FROM Film f JOIN Role r ON f.ID_Film = r.ID_Film AND f.Realisateur = r.Acteur;
SELECT f.Realisateur FROM Film f, Role r WHERE f.ID_Film = r.ID_Film AND f.Realisateur = r.Acteur;

/*17*/
SELECT Nom FROM Artiste WHERE Nom NOT IN (SELECT Realisateur FROM Film);
SELECT Nom FROM Artiste MINUS (SELECT Realisateur FROM Film); /* MINUS ne fonctionne pas avec tous les SGBD */

/*18*/
SELECT Realisateur
FROM Film
WHERE ID_Film NOT IN (
	SELECT ID_Film
	FROM Seance se
	JOIN Salle sa
	ON se.No_salle = sa.No_salle AND se.Nom_c = sa.Nom_c
	WHERE sa.Capacite > 200
);

/*19*/
SELECT COUNT(Nom_c) FROM Cinema WHERE Arrondissement = 13;


/*20*/
SELECT AVG(Capacite) FROM Salle WHERE Climatise = 1;

/*21*/
SELECT COUNT(*) FROM Salle WHERE Nom_c = "Escurial";



/*22*/
SELECT MAX(nombre_salles), AVG(nombre_salles)
FROM (
	SELECT Nom_c, SUM(compte) AS nombre_salles
	FROM (
		SELECT Nom_c, 1 AS compte
		FROM Salle
	) AS table1
	GROUP BY Nom_c
) AS table2;
/* même si l'alias "table2" n'est pas utilisé, il est obligatoire, car les "tables dérivées" */



	SELECT Nom_c, SUM(compte) AS nombre_salles
	FROM (
		SELECT Nom_c, 1 AS compte
		FROM Salle
	) AS table1
	GROUP BY Nom_c ORDER BY nombre_salles DESC




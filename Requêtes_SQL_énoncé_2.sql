/*1*/
SELECT * FROM Film;

/*2*/
SELECT Titre FROM Film;

/*3*/
SELECT Nom FROM Artiste WHERE Annee-Naissance > 1995;

/*4*/
SELECT Nom-c FROM Cinema WHERE Arrondissement = 13;

/*5*/
SELECT Libelle FROM Role WHERE Acteur = "Brad Pitt";

/*6*/
SELECT Libelle FROM Role WHERE Acteur IN (SELECT Nom FROM Artiste WHERE Annee-Naissance < 1970);

SELECT Libelle FROM Role r, Artiste a WHERE (r.Acteur = a.Nom AND a.Annee-Naissance < 1970);
SELECT Libelle FROM Role, Artiste WHERE (Acteur = Nom AND Annee-Naissance < 1970);

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
SELECT Titre FROM Film f
		JOIN Role r
		ON f.IDFilm = r.IDFilm
		WHERE r.Acteur = "Clint Eastwood" OR f.Realisateur = "Clint Eastwood";

SELECT Titre FROM Film f, Role r WHERE f.IDFilm = r.IDFilm AND (Acteur = "Clint Eastwood" OR Realisateur = "Clint Eastwood");

/*14*/
SELECT * FROM Film ORDER BY Titre;

/*15*/
SELECT * FROM Seance s
	JOIN Cinema c ON s.Nom-c = c.Nom-c
	WHERE Heure_fin < 12 AND Arrondissement = 13;

/*16*/
SELECT r.Acteur FROM Film f JOIN Role r ON f.IDFilm = r.IDFilm AND f.Realisateur = r.Acteur;
SELECT f.Realisateur FROM Film f, Role r WHERE f.IDFilm = r.IDFilm AND f.Realisateur = r.Acteur;

/*17*/
SELECT Nom FROM Artiste WHERE Nom NOT IN (SELECT Realisateur FROM Film);
SELECT Nom FROM Artiste MINUS (SELECT Realisateur FROM Film);

/*18*/
SELECT Realisateur
FROM Film
WHERE IDFilm NOT IN (
	SELECT IDFilm
	FROM Seance se
	JOIN Salle sa
	ON se.No_salle = sa.No_Salle AND se.Nom-c = sa.Nom-c
	WHERE sa.Capacite > 200
);

/*19*/
SELECT COUNT(Nom-c) FROM Cinema WHERE Arrondissement = 13;


/*20*/
SELECT AVG(Capacite) FROM Salle WHERE Climatise IS NOT NULL;

/*21*/
SELECT COUNT(*) FROM Salle WHERE Nom-c = "Escurial";



/*22*/
SELECT MAX(nombre_salles), AVG(nombre_salles)
FROM (
	SELECT Nom-c, SUM(compte) AS nombre_salles
	FROM (
		SELECT Nom-c, 1 AS compte
		FROM Salle
	) AS table1
	GROUP BY Nom-c
) AS table2;


/*23*/
SELECT Nom-c, SUM(compte) AS nombre_salles
FROM (
	SELECT Nom-c, 1 AS compte
	FROM Salle
)
GROUP BY Nom-c
WHERE nombre_salles
IN (
	SELECT MAX(nombre_salles)
	FROM (
		SELECT Nom-c, SUM(compte) AS nombre_salles
		FROM (
			SELECT Nom-c, 1 AS compte
			FROM Salle
		) AS table1
		GROUP BY Nom-c
	) AS table2
);


/*Cinema avec le plus de salles = Film avec le plus de roles*/


-- TD4 SQL
-- 2 tables : ville et departements
-- La jointure entre les 2 tables : departement.departement_code = ville.ville_departement
-- LEFT JOIN : jointure externe pour retourner tous les enregistrements de la table de gauche (LEFT = gauche) même si la condition n’est pas vérifiée dans l’autre table:
--  A savoir, s’il n’y a pas de correspondance les colonnes de table2 vaudront toutes NULL. Dans notre cas pas de valeur est obligatoirement renseignées ville.ville_departement donc pas besoin de jointure externe.
-- Pour un SGBD MySQL une notation avec apostrophe mais non obligatoire `ville`

--1.	Obtenir la liste des 10 ville les plus peuplées en 2012
SELECT `ville_nom`
FROM `ville` 
ORDER BY `ville_population_2012` DESC 
LIMIT 10;

--2.	Obtenir la liste des 50 ville ayant la plus faible superficie
SELECT `ville_nom`, `ville_surface`
FROM `ville` 
ORDER BY `ville_surface` ASC 
LIMIT 50;

--3.	Obtenir la liste des départements d’outre-mer, c’est-à-dire ceux dont le numéro de département commence par “97”
SELECT `departement_code`, `departement_nom`
FROM `departement` 
WHERE `departement_code` LIKE '97%';

--4.	Obtenir le nom des 10 ville les plus peuplées en 2012, ainsi que le nom du département associé
SELECT `ville_nom`,`departement_nom`, `ville_population_2012`
FROM `ville` 
LEFT JOIN departement ON departement_code = ville_departement
ORDER BY `ville_population_2012` DESC 
LIMIT 10;

--4 Autre solution, si le champ ville.ville_departement pourra être NULL = non renseigné (voir le script de création de la table) la jointure externe est primordiale pour rapatrier toutes les ville (table gauche), sinon une jointure naturelle suffira :
SELECT `ville_nom`,`departement_nom`, `ville_population_2012`
FROM `ville`, `departement` 
WHERE departement.departement_code = ville.ville_departement
ORDER BY `ville_population_2012` DESC 
LIMIT 10;

--5.	Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces départements, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes
SELECT departement_nom, ville_departement, COUNT(*) AS nb_commune
FROM `ville` 
LEFT JOIN departement ON departement_code = ville_departement
GROUP BY ville_departement
ORDER BY `nb_commune` DESC;

--6.	Obtenir la liste des 10 plus grands départements, en terme de superficie
SELECT departement_nom, ville_departement, SUM(`ville_surface`) AS dpt_surface 
FROM `ville` 
LEFT JOIN departement ON departement_code = ville_departement
GROUP BY ville_departement  
ORDER BY dpt_surface  DESC
LIMIT 10;

--7.	Compter le nombre de ville dont le nom commence par “Saint”
SELECT COUNT(*) AS nb_ville_Saint
FROM `ville` 
WHERE `ville_nom` LIKE 'saint%';

--8.	Obtenir la liste des ville qui ont un nom existants plusieurs fois, et trier afin d’obtenir en premier celles dont le nom est le plus souvent utilisé par plusieurs communes
SELECT ville_nom, COUNT(*) AS nb_ville_identiques 
FROM `ville` 
GROUP BY `ville_nom` 
ORDER BY nb_ville_identiques DESC;  

--8 Une autre solution pour afficher au moins les noms des ville affichés au moins 2 fois, utiliser HAVING :
SELECT ville_nom, COUNT(*) AS nb_ville_identiques 
FROM `ville` 
GROUP BY `ville_nom` 
HAVING nb_ville_identiques > 1
ORDER BY nb_ville_identiques DESC; 

--9.	Obtenir en une seule requête SQL la liste des ville dont la superficie est supérieure à la superficie moyenne
SELECT `ville_nom`, `ville_surface`
FROM `ville` 
WHERE `ville_surface` > (SELECT AVG(`ville_surface`) FROM `ville`);

--10.	Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants en 2012
SELECT ville_departement, SUM(`ville_population_2012`) AS population_2012
FROM `ville` 
GROUP BY `ville_departement`
HAVING population_2012 > 2000000
ORDER BY population_2012 DESC;

--11.	Remplacez les tirets par un espace vide, pour toutes les ville commençant par “SAINT-” (dans la colonne qui contient les noms en majuscule)
UPDATE `ville` 
SET ville_nom = REPLACE(ville_nom, '-', ' ') 
WHERE `ville_nom` LIKE 'SAINT-%';

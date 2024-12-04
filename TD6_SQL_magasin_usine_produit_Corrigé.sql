-- Drop tables
DROP TABLE IF EXISTS magasin;
DROP TABLE IF EXISTS usine;
DROP TABLE IF EXISTS produit;
DROP TABLE IF EXISTS provenance;

CREATE TABLE IF NOT EXISTS magasin(
   ref_mag INT,
   nom_mag VARCHAR(50) NOT NULL,
   ville CHAR(50) NOT NULL,
   PRIMARY KEY(ref_mag)
);

CREATE TABLE IF NOT EXISTS produit(
   ref_prod INT,
   nom_prod CHAR(150),
   couleur CHAR(50),
   poids INT,
   PRIMARY KEY(ref_prod)
);

CREATE TABLE IF NOT EXISTS usine(
   ref_usine INT,
   nom_usine CHAR(50),
   ville CHAR(50),
   PRIMARY KEY(ref_usine)
);

CREATE TABLE IF NOT EXISTS provenance(
   ref_mag INT,
   ref_prod INT,
   ref_usine INT,
   quantite INT,
   PRIMARY KEY(ref_mag, ref_prod, ref_usine),
   FOREIGN KEY(ref_mag) REFERENCES magasin(ref_mag),
   FOREIGN KEY(ref_prod) REFERENCES produit(ref_prod),
   FOREIGN KEY(ref_usine) REFERENCES usine(ref_usine)
);


-- Table : magasin
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (13, 'Stock10', 'Paris');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (14, 'Stock10', 'Paris');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (16, 'JaiTout', 'Marseille');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (18, 'EnGros', 'Bordeaux');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (20, 'PrixBas', 'Toulouse');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (22, 'BasPrix', 'Marseille');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (24, 'DuBon', 'Lyon');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (26, 'DuBeau', 'Toulouse');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (28, 'BasDeGamme', 'Dublin');
INSERT INTO magasin (ref_mag, nom_mag, ville) VALUES (30, 'PasCher', 'Lyon');

-- Table : produit
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (1, 'tabouret', 'rouge', 5);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (2, 'evier', 'bleu', 65);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (3, 'bureau', 'jaune', 45);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (4, 'lampe a petrole', 'vert', 5);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (5, 'ordinateur', 'rouge', 10);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (6, 'telephone', 'bleu', 8);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (7, 'tabouret', 'violet', 1);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (8, 'evier', 'bleu', 65);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (9, 'tabouret', 'orange', 3);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (10, 'lampe halogene', 'rose',11);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (11, 'lampe a souder', 'noir', 3);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (12, 'telephone', 'bleu', 2);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (13, 'casse-noix', 'vert', 1);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (14, 'casse-pied', 'marron', 55);
INSERT INTO produit (ref_prod, nom_prod, couleur, poids) VALUES (15, 'casse-oreille', 'violet',5);

-- Table: usine
INSERT INTO usine (ref_usine, nom_usine, ville) VALUES (109, 'martin', 'Nantes');
INSERT INTO usine (ref_usine, nom_usine, ville) VALUES (189, 'leroux', 'Marseille');
INSERT INTO usine (ref_usine, nom_usine, ville) VALUES (213, 'dupont', 'Bordeaux');
INSERT INTO usine (ref_usine, nom_usine, ville) VALUES (402, 'peugeot', 'Toulouse');
INSERT INTO usine (ref_usine, nom_usine, ville) VALUES (200, 'peugeot', 'Marseille');
INSERT INTO usine (ref_usine, nom_usine, ville) VALUES (302, 'rover', 'Londres');
INSERT INTO usine (ref_usine, nom_usine, ville) VALUES (303, 'range', NULL);

-- Table: provenance
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (1, 189, 14, 80);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (1, 109, 14, 80);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (1, 109, 16, 100);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (1, 302, 16, 213);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (2, 109, 30, 213);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (2, 109, 16, 90);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (2, 109, 14, 80);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (3, 109, 16, 99);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (3, 109, 14, 88);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (3, 402, 14, 315);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (3, 402, 16, 315);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (3, 402, 30, 315);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (4, 200, 18, 985);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (5, 302, 20, 858);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (6, 213, 16, 315);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (6, 109, 22, 458);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (7, 109, 16, 213);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (8, 302, 16, 2000);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (9, 189, 30, 175);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (10, 402, 14, 100);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (10, 189, 14, 200);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (11, 109, 16, 750);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (11, 302, 16, 100);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (12, 189, 30, 315);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (12, 200, 16, 589);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (12, 189, 22, 213);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (13, 402, 14, 499);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (14, 109, 18, 213);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (15, 189, 20, 1958);
INSERT INTO provenance (ref_prod, ref_usine, ref_mag, quantite) VALUES (15, 189, 16, 333);

-- 2.1 le contenu de la table magasin ; 
select * from magasin;

-- 2.2 les noms des magasins qui n’ont reçu aucune quantité 
select  magasin.ref_mag, magasin.nom_mag    
from magasin 
LEFT JOIN provenance ON magasin.ref_mag=provenance.ref_mag
WHERE provenance.ref_mag IS NULL;

-- 2.3 les noms de magasin sans doublon ;
select DISTINCT(magasin.nom_mag)    
from magasin; 

-- 2.4 le nom des villes dans lesquelles il y a une usine ; 
SELECT * FROM usine 
WHERE ville IS NOT NULL;

-- 2.5 les noms et les couleurs de chaque produit ;
select produit.nom_prod, produit.couleur 
from produit; 

-- 2.6 la référence produit et la quantité de chaque produit livré au magasin « BasPrix »
select produit.ref_prod, produit.nom_prod, magasin.nom_mag, provenance.quantite  
from produit, provenance, magasin
WHERE produit.ref_prod = provenance.ref_prod
AND magasin.ref_mag = provenance.ref_mag
AND magasin.nom_mag = 'BasPrix';

-- 2.7 la référence, le nom et la ville de tous les magasins approvisionnés des usines de Marseille;
select magasin.ref_mag, magasin.nom_mag, magasin.ville AS ville_magasin, provenance.quantite, usine.ville AS ville_usine
from magasin, provenance, usine
WHERE magasin.ref_mag = provenance.ref_mag
AND usine.ref_usine = provenance.ref_usine
AND usine.ville = 'Marseille';

-- 2.8 les noms des magasins qui sont approvisionnés par l’usine « martin » en produit évier bleu ;
select magasin.ref_mag, magasin.nom_mag, magasin.ville, provenance.quantite, produit.nom_prod, usine.nom_usine 
from magasin, provenance, usine, produit
WHERE magasin.ref_mag = provenance.ref_mag
AND usine.ref_usine = provenance.ref_usine
AND produit.ref_prod = provenance.ref_prod
AND usine.nom_usine = 'Martin'
AND produit.nom_prod = 'evier'
AND produit.couleur = 'bleu';

--   2.9 la référence et le nom de tous les produits dont le nom contient "se" ; 
select produit.ref_prod, produit.nom_prod  
from produit
WHERE produit.nom_prod LIKE '%se%';

--  2.10 la référence des magasins auxquels on livre quelque chose
select magasin.ref_mag, magasin.nom_mag, magasin.ville, provenance.quantite 
from magasin, provenance
WHERE magasin.ref_mag = provenance.ref_mag;

--   2.11 la somme des produits et leurs quantités par magasin ;
select magasin.ref_mag, magasin.nom_mag, nom_prod AS 'somme_produit', SUM(provenance.quantite) AS 'somme_quantite' 
from magasin, provenance, produit
WHERE magasin.ref_mag = provenance.ref_mag
AND produit.ref_prod = provenance.ref_prod
GROUP BY magasin.ref_mag, magasin.nom_mag, produit.nom_prod;

-- 2.12 les noms des produits qui sont jaunes ou bleus et qui pèsent moins que 20 ; 
select produit.ref_prod, produit.nom_prod, produit.poids  
from produit
WHERE produit.couleur IN ('jaune','bleu')
AND produit.poids <20;

--  2.13 compter par magasin les produits bleus qui pèsent moins que 20 et des produits jaunes ; 
select magasin.ref_mag, magasin.nom_mag, COUNT(produit.ref_prod) AS 'somme_produit' 
from magasin, provenance, produit
WHERE magasin.ref_mag = provenance.ref_mag
AND produit.ref_prod = provenance.ref_prod
AND  ((produit.couleur = 'bleu' AND produit.poids <20) OR produit.couleur = 'jaune')
GROUP BY magasin.ref_mag, magasin.nom_mag;
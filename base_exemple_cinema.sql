-- ============================================================
-- Base d'exemple des rappels SQL du TD3 : un cinéma et ses abonnés
-- À coller dans https://onecompiler.com/postgresql (ou tout autre
-- outil PostgreSQL), puis ajouter ses propres requêtes à la fin.
-- ============================================================

-- 1. On repart de zéro : les tables « enfants » d'abord
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS seance;
DROP TABLE IF EXISTS abonne;
DROP TABLE IF EXISTS film;

-- 2. Création : les tables « parents » d'abord
CREATE TABLE film (
    id_film INTEGER PRIMARY KEY,
    titre   VARCHAR(100) NOT NULL,
    annee   INTEGER,
    duree   INTEGER                 -- en minutes
);

CREATE TABLE abonne (
    id_abonne INTEGER PRIMARY KEY,
    nom       VARCHAR(50) NOT NULL,
    telephone VARCHAR(10) UNIQUE    -- un code, pas un nombre
);

CREATE TABLE seance (
    id_seance   INTEGER PRIMARY KEY,
    date_seance DATE NOT NULL,
    prix        NUMERIC(5,2) NOT NULL CHECK (prix >= 0),
    id_film     INTEGER NOT NULL REFERENCES film(id_film)
);

CREATE TABLE reservation (
    id_seance INTEGER REFERENCES seance(id_seance),
    id_abonne INTEGER REFERENCES abonne(id_abonne),
    nb_places INTEGER NOT NULL CHECK (nb_places > 0),
    PRIMARY KEY (id_seance, id_abonne)
);

-- 3. Insertion : les parents avant les enfants
INSERT INTO film (id_film, titre, annee, duree) VALUES
    (1, 'La Haine',         1995,  98),
    (2, 'Les Visiteurs',    1993, 107),
    (3, 'Le Dîner de cons', 1998,  80),
    (4, 'Les Choristes',    2004,  97),
    (5, 'Intouchables',     2011, 112),
    (6, 'Le Grand Bain',    2018, 122);

INSERT INTO abonne (id_abonne, nom, telephone) VALUES
    (1, 'Benali', '0639980101'),
    (2, 'Dupont', '0639980102'),
    (3, 'Nguyen', NULL),
    (4, 'Moreau', '0639980104');

INSERT INTO seance (id_seance, date_seance, prix, id_film) VALUES
    (1, '2026-11-02',  8.50, 1),
    (2, '2026-11-02',  6.00, 3),
    (3, '2026-11-04',  8.50, 5),
    (4, '2026-11-06',  8.50, 1),
    (5, '2026-11-07', 10.00, 5),
    (6, '2026-11-08',  6.00, 2),
    (7, '2026-11-09',  8.50, 4);

INSERT INTO reservation (id_seance, id_abonne, nb_places) VALUES
    (1, 1, 2), (1, 2, 1),
    (2, 1, 4), (2, 3, 2),
    (3, 2, 3), (3, 4, 2),
    (4, 3, 1),
    (5, 1, 2), (5, 4, 5),
    (6, 2, 2);

-- 4. Interrogation : vos requêtes ici
SELECT * FROM film;

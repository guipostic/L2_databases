
CREATE TABLE Fournisseurs
(
    NomF VARCHAR(200) PRIMARY KEY,
    AdresseF VARCHAR(200)
);

CREATE TABLE Prix
(
    NomF VARCHAR(200),
    NomP VARCHAR(200),
    Couts INT(6)
);

CREATE TABLE Commandes
(
    NumCom INT(6) PRIMARY KEY,
    NomC VARCHAR(200),
    NomP VARCHAR(200),
    Qte INT(6)
);

CREATE TABLE Clients
(
    NomC VARCHAR(200) PRIMARY KEY,
    AdresseC VARCHAR(200),
    Solde INT(6)
);


INSERT INTO `Fournisseurs` (`NomF`, `AdresseF`) VALUES ('Abounayan', '92190 Meudon');
INSERT INTO `Fournisseurs` (`NomF`, `AdresseF`) VALUES ('Cima', '75010 Paris');
INSERT INTO `Fournisseurs` (`NomF`, `AdresseF`) VALUES ('Preblocs', '92230 Gennevilliers');
INSERT INTO `Fournisseurs` (`NomF`, `AdresseF`) VALUES ('Samaco', '75116 Paris');

INSERT INTO `Prix` (`NomF`, `NomP`, `Couts`) VALUES ('Abounayan', 'sable', 300);
INSERT INTO `Prix` (`NomF`, `NomP`, `Couts`) VALUES ('Abounayan', 'briques', 1500);
INSERT INTO `Prix` (`NomF`, `NomP`, `Couts`) VALUES ('Abounayan', 'parpaing', 1150);
INSERT INTO `Prix` (`NomF`, `NomP`, `Couts`) VALUES ('Preblocs', 'tuiles', 1150);
INSERT INTO `Prix` (`NomF`, `NomP`, `Couts`) VALUES ('Preblocs', 'parpaing', 1200);
INSERT INTO `Prix` (`NomF`, `NomP`, `Couts`) VALUES ('Samaco', 'parpaing', 1150);
INSERT INTO `Prix` (`NomF`, `NomP`, `Couts`) VALUES ('Samaco', 'ciment', 125);
INSERT INTO `Prix` (`NomF`, `NomP`, `Couts`) VALUES ('Samaco', 'briques', 1200);

INSERT INTO `Commandes` (`NumCom`, `NomC`, `NomP`, `Qte`) VALUES (1, 'Jean', 'briques', 5);
INSERT INTO `Commandes` (`NumCom`, `NomC`, `NomP`, `Qte`) VALUES (2, 'Jean', 'ciment', 10);
INSERT INTO `Commandes` (`NumCom`, `NomC`, `NomP`, `Qte`) VALUES (3, 'Paul', 'briques', 3);
INSERT INTO `Commandes` (`NumCom`, `NomC`, `NomP`, `Qte`) VALUES (4, 'Paul', 'parpaing', 9);
INSERT INTO `Commandes` (`NumCom`, `NomC`, `NomP`, `Qte`) VALUES (5, 'Vincent', 'parpaing', 7);

INSERT INTO `Clients` (`NomC`, `AdresseC`, `Solde`) VALUES ('Jean', '75006 Paris', -12000);
INSERT INTO `Clients` (`NomC`, `AdresseC`, `Solde`) VALUES ('Paul', '75003 Paris', 0);
INSERT INTO `Clients` (`NomC`, `AdresseC`, `Solde`) VALUES ('Vincent', '94200 Ivry', 3000);
INSERT INTO `Clients` (`NomC`, `AdresseC`, `Solde`) VALUES ('Pierre', '92400 Courbevoie', 7000);


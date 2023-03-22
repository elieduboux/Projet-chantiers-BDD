CREATE TABLE IF NOT EXISTS NatureChantier(
   IdNatureChantier INT AUTO_INCREMENT,
   Nature VARCHAR(100),
   PRIMARY KEY(IdNatureChantier)
);

CREATE TABLE IF NOT EXISTS Entite(
   IdEntite INT AUTO_INCREMENT,
   NomEntite VARCHAR(50) NOT NULL,
   PRIMARY KEY(IdEntite)
);

CREATE TABLE IF NOT EXISTS Encombrement(
   IdEncombrement INT AUTO_INCREMENT,
   NomEncombrement VARCHAR(50),
   PRIMARY KEY(IdEncombrement)
);

CREATE TABLE IF NOT EXISTS ImpactStationnement(
   IdStationnementImpact INT AUTO_INCREMENT,
   TypeStationnement VARCHAR(50),
   PRIMARY KEY(IdStationnementImpact)
);

CREATE TABLE IF NOT EXISTS Localisation(
   IdLocalisation INT AUTO_INCREMENT,
   Longitude DECIMAL(17,15),
   Latitude DECIMAL(17,15),
   PRIMARY KEY(IdLocalisation)
);

CREATE TABLE IF NOT EXISTS Chantier(
   IdChantier VARCHAR(8),
   Surface DECIMAL(11,6),
   IdDate_fin DATE NOT NULL,
   IdDate_debut DATE NOT NULL,
   IdLocalisation INT NOT NULL,
   IdNatureChantier INT,
   IdEntite_MOE INT NOT NULL,
   PRIMARY KEY(IdChantier),
   FOREIGN KEY(IdLocalisation) REFERENCES Localisation(IdLocalisation) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY(IdNatureChantier) REFERENCES NatureChantier(IdNatureChantier) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY(IdEntite_MOE) REFERENCES Entite(IdEntite) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS MOA(
   IdChantier VARCHAR(8),
   IdEntite_MOA INT,
   PRIMARY KEY(IdChantier, IdEntite_MOA),
   FOREIGN KEY(IdChantier) REFERENCES Chantier(IdChantier) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY(IdEntite_MOA) REFERENCES Entite(IdEntite) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS TypeEncombrement (
   IdChantier VARCHAR(8),
   IdEncombrement INT, -- **************************** POSSIBLE SET POUR EXCEL MAIS CONSERVER POUR SCRIPT PYTHON ****************************
   PRIMARY KEY(IdChantier, IdEncombrement),
   FOREIGN KEY(IdChantier) REFERENCES Chantier(IdChantier) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY(IdEncombrement) REFERENCES Encombrement(IdEncombrement) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS TypeStationnementImpacte(
   IdChantier VARCHAR(8),
   IdStationnementImpact INT, -- **************************** POSSIBLE SET POUR EXCEL MAIS CONSERVER POUR SCRIPT PYTHON ****************************
   PRIMARY KEY(IdChantier, IdStationnementImpact),
   FOREIGN KEY(IdChantier) REFERENCES Chantier(IdChantier) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY(IdStationnementImpact) REFERENCES ImpactStationnement(IdStationnementImpact) ON UPDATE CASCADE ON DELETE CASCADE
);

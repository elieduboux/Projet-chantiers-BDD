-- Requetes pour vider les données de la base
DELETE FROM TypeEncombrement;
DELETE FROM TypeStationnementImpacte;
DELETE FROM MOA;
DELETE FROM Chantier;
DELETE FROM Localisation; 
DELETE FROM Encombrement;
DELETE FROM NatureChantier; 
DELETE FROM Entite;
DELETE FROM ImpactStationnement;

-- Selectionne tous les impacts sur stationnement possibles
SELECT TypeStationnement FROM ImpactStationnement;

-- Sélectionne tous les MOA
SELECT DISTINCT NomEntite FROM Entite e INNER JOIN MOA m ON e.IdEntite = m.IdEntite_MOA;

-- Selectionne tous les MOE
SELECT DISTINCT NomEntite FROM Entite e INNER JOIN Chantier c ON e.IdEntite = c.IdEntite_MOE;

-- Nombre de chantiers entrepris par l'entité "Ville de Paris"
SELECT DISTINCT NomEntite, COUNT(c.IdChantier) AS "Nombre de chantiers"
FROM Entite e INNER JOIN Chantier c ON e.IdEntite = c.IdEntite_MOE
WHERE UPPER(NomEntite) LIKE 'VILLE DE PARIS%';

-- Sélectionne le numéro de chantier + superficie + coordonnées + dates de tous les chantiers de +100m^2 et qui n'ont pas d'encombrements
-- Sélectionne le numéro de chantier + superficie + coordonnées + dates de tous les chantiers de +100m^2 et qui n'ont pas d'impact sur station
SELECT  c.idChantier AS "Num chantier", e.NomEntite, Surface, IdDate_debut AS "Date début", IdDate_fin AS "Date Fin", Latitude, Longitude
FROM Chantier c INNER JOIN Localisation l ON c.IdLocalisation = l.IdLocalisation
                LEFT JOIN TypeStationnementImpacte tsi ON c.IdChantier = tsi.IdChantier
                INNER JOIN MOA m ON c.IdChantier = m.IdChantier
                INNER JOIN Entite e ON m.IdEntite_MOA = e.IdEntite
WHERE tsi.IdChantier IS NULL AND Surface > 100 AND Longitude > 0 AND Latitude > 0
ORDER BY Surface
LIMIT 25;
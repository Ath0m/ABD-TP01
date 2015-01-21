
--- ABD - TP 01

--- Exercice 1 : Requêtes SQL

--- Question 1

SELECT anom, titre
FROM films f, artists a, roles r
WHERE f.fid = r.fid AND a.aid = r.aid;

--- Question 2

SELECT anom
FROM artists
WHERE nationalite LIKE 'francais' OR nationalite LIKE 'italien';

--- Question 3

SELECT titre
FROM films f, artists a, roles r
WHERE f.fid = r.fid AND a.aid = r.aid AND f.langue = a.nationalite;

--- Question 4

SELECT r.fid
FROM films f, artists a, roles r
WHERE f.fid = r.fid AND a.aid = r.aid
AND a.nationalite LIKE 'francais'
GROUP BY r.fid
HAVING COUNT(*) > 1;

SELECT DISTINCT r1.fid
FROM artists a, roles r1
WHERE a.aid = r1.aid
  AND a.nationalite LIKE 'francais'
  AND EXISTS (SELECT r2.aid
		 FROM roles r2, artists a
		 WHERE r2.aid = a.aid
                 AND r1.aid <> r2.aid
		 AND a.nationalite LIKE 'francais'
		 AND r1.fid = r2.fid);

-- Question 5

SELECT r.fid
FROM films f, artists a, roles r
WHERE f.fid = r.fid AND a.aid = r.aid
AND a.nationalite LIKE 'francais'
GROUP BY r.fid
HAVING COUNT(*) = 1;

SELECT DISTINCT r1.fid
FROM artists a, roles r1
WHERE a.aid = r1.aid
  AND a.nationalite LIKE 'francais'
  AND NOT EXISTS (SELECT r2.aid
		 FROM roles r2, artists a
		 WHERE r2.aid = a.aid
                 AND r1.aid <> r2.aid
		 AND a.nationalite LIKE 'francais'
		 AND r1.fid = r2.fid);

-- Question 6

SELECT DISTINCT r.fid
FROM films f, artists a, roles r
WHERE f.fid = r.fid AND a.aid = r.aid
AND NOT EXISTS (SELECT r2.aid
		FROM roles r2, artists a
		WHERE r2.aid = a.aid
		AND a.nationalite LIKE 'francais'
		AND r.fid = r2.fid);

-- Question 7

SELECT f.titre, f.realisateur, a.aid
FROM films f, artists a, roles r
WHERE f.fid = r.fid AND a.aid = r.aid
AND NOT EXISTS (SELECT r2.aid
		FROM roles r2, artists a2
		WHERE r2.aid = a2.aid
		AND a2.nationalite NOT LIKE 'francais'
		AND r.fid = r2.fid);

-- Question 8

SELECT DISTINCT r.aid
FROM roles r
WHERE EXISTS (SELECT r2.aid
		FROM roles r2
		WHERE r2.aid = r.aid
		AND r.fid <> r2.fid);


SELECT DISTINCT r1.aid
FROM roles r1, roles r2
WHERE r1.aid = r2.aid
AND r1.fid <> r2.fid;

-- Question 9

SELECT a.anom
FROM artists a, roles r
WHERE a.aid = r.aid
AND r.personnage LIKE '%Cyrano%'
AND NOT EXISTS (SELECT a2.anom
		FROM artists a2, roles r2
		WHERE a2.aid = a.aid AND r2.aid = a2.aid
		AND r2.personnage NOT LIKE 'Cyrano');

### Connexion à SQL Server depuis la ligne de commande :

sqlcmd -S <nom_du_serveur> -U <nom_utilisateur> -P <mot_de_passe>

#### Création d'une base de données :

CREATE DATABASE Nom_BaseDeDonnees
ON PRIMARY
  (NAME = Nom_BaseDeDonnees,
  FILENAME = 'C:\Chemin\vers\fichier\Nom_BaseDeDonnees.mdf',
  SIZE = 100MB,
  MAXSIZE = UNLIMITED,
  FILEGROWTH = 10%)
LOG ON
  (NAME = Nom_BaseDeDonnees_Log,
  FILENAME = 'C:\Chemin\vers\fichier\Nom_BaseDeDonnees_log.ldf',
  SIZE = 50MB,
  MAXSIZE = 200MB,
  FILEGROWTH = 5MB);

### Opérations sur les tables :

#### Création d'une table :

USE Nom_BaseDeDonnees;

CREATE TABLE Nom_Table (
    ID INT PRIMARY KEY,
    Nom VARCHAR(50),
    Age INT,
    Email VARCHAR(100)
) ON [PRIMARY];

-- Vous pouvez spécifier sur quel FILEGROUP (fichier) la table doit être créée


#### Ajout d'une contrainte UNIQUE :

ALTER TABLE Nom_Table
ADD CONSTRAINT UC_Email UNIQUE (Email);

#### Insertion de données dans une table :

INSERT INTO Nom_Table (ID, Nom, Age, Email)
VALUES (1, 'Jean', 30, 'jean@email.com');


#### Sélection de données depuis une table :
SELECT * FROM Nom_Table;

#### Mise à jour de données dans une table :

UPDATE Nom_Table
SET Age = 35
WHERE ID = 1;

#### Suppression de données d'une table :

DELETE FROM Nom_Table
WHERE ID = 1;

#### Suppression d'une table :
DROP TABLE Nom_Table;

### Déconnexion de SQL Server :

QUIT;
---

### SELECT statement

```sql
SELECT column1, column2
FROM table_name
WHERE condition;
```

---Le statement `SELECT` permet de récupérer des données depuis une base de données. Vous spécifiez les colonnes que vous souhaitez récupérer après le mot-clé `SELECT`, puis la table à partir de laquelle vous récupérez les données après le mot-clé `FROM`. Vous pouvez également filtrer les données en utilisant le mot-clé `WHERE`.

### INSERT statement

```sql
INSERT INTO table_name (column1, column2)
VALUES (value1, value2);
```

Le statement `INSERT INTO` est utilisé pour insérer de nouvelles lignes dans une table. Vous spécifiez les colonnes auxquelles vous souhaitez insérer des valeurs, puis les valeurs correspondantes.

### UPDATE statement

```sql
UPDATE table_name
SET column1 = value1, column2 = value2
WHERE condition;
```

Le statement `UPDATE` est utilisé pour modifier les données existantes dans une table. Vous spécifiez les colonnes que vous souhaitez mettre à jour avec de nouvelles valeurs, puis vous utilisez le mot-clé `WHERE` pour spécifier les lignes à mettre à jour.

### DELETE statement

```sql
DELETE FROM table_name
WHERE condition;
```

Le statement `DELETE FROM` est utilisé pour supprimer des lignes d'une table. Vous pouvez spécifier des conditions pour filtrer les lignes à supprimer à l'aide du mot-clé `WHERE`.

### CREATE TABLE statement

```sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
);
```

Le statement `CREATE TABLE` est utilisé pour créer une nouvelle table dans la base de données. Vous spécifiez le nom de la table, ainsi que les noms et types de données des colonnes.

### ALTER TABLE statement

```sql
ALTER TABLE table_name
ADD column_name datatype;
```

Le statement `ALTER TABLE` est utilisé pour modifier une table existante en ajoutant une nouvelle colonne.

### DROP TABLE statement

```sql
DROP TABLE table_name;
```

Le statement `DROP TABLE` est utilisé pour supprimer une table de la base de données.

### JOIN clause

```sql
  SELECT column_name(s)
  FROM table1
  JOIN table2 ON table1.column_name = table2.column_name;
```

-- La clause `JOIN` est utilisée pour combiner des lignes de deux tables en fonction d'une colonne commune entre elles.

--WHERE clause

```sql
SELECT column_name(s)
FROM table_name
WHERE condition;
```

La clause `WHERE` est utilisée pour filtrer les lignes récupérées en spécifiant une condition.

### ORDER BY clause

```sql
SELECT column_name(s)
FROM table_name
ORDER BY column_name ASC|DESC;
```

-- La clause `ORDER BY` est utilisée pour trier les résultats par ordre croissant (ASC) ou décroissant (DESC) d'une colonne spécifiée.

### GROUP BY clause

```sql
SELECT column_name(s), COUNT(*)
FROM table_name
GROUP BY column_name(s);
```

-- La clause `GROUP BY` est utilisée pour regrouper les lignes ayant les mêmes valeurs dans une ou plusieurs colonnes, puis appliquer une fonction d'agrégation telle que `COUNT`, `SUM`, `AVG`, etc.

### HAVING clause

```sql
SELECT column_name(s), COUNT(*)
FROM table_name
GROUP BY column_name(s)
HAVING condition;
```

La clause `HAVING` est utilisée pour filtrer les résultats regroupés après l'application de la clause `GROUP BY`.

---


Bien sûr, voici une extension de la feuille de triche SQL Server avec des notions supplémentaires, y compris Transact-SQL (T-SQL) et d'autres concepts avancés :

---

### Transactions

Les transactions garantissent que plusieurs opérations SQL sont traitées de manière atomique, c'est-à-dire que toutes les opérations sont exécutées avec succès ou aucune ne l'est.

```sql
BEGIN TRANSACTION;
-- Opérations SQL
COMMIT TRANSACTION; -- Valider les opérations
--ROLLBACK TRANSACTION; -- Annuler les opérations
```

### Stored Procedures

Les procédures stockées sont des blocs de code SQL nommés qui peuvent être appelés et exécutés plusieurs fois.

```sql
CREATE PROCEDURE procedure_name
AS
BEGIN
    -- Code SQL
END;
```

### Functions

Les fonctions sont similaires aux procédures stockées mais retournent une valeur.

```sql
  CREATE FUNCTION function_name
  (@parameter1 datatype, @parameter2 datatype)
  RETURNS datatype
  AS
  BEGIN
      -- Code SQL
      RETURN value;
  END;
```

### Views

-- Les vues sont des requêtes SQL stockées sous forme d'objets dans la base de données.

```sql
  CREATE VIEW view_name AS
  SELECT column1, column2
  FROM table_name
  WHERE condition;
```

### Indexes

Les indexes sont des structures de données qui améliorent les performances de recherche sur une table.

```sql
CREATE INDEX index_name
ON table_name (column_name);
```

### Triggers

Les déclencheurs sont des blocs de code SQL qui sont automatiquement exécutés en réponse à certaines actions sur une table.

```sql
  CREATE TRIGGER trigger_name
  ON table_name
  FOR INSERT, UPDATE, DELETE
  AS
  BEGIN
      -- Code SQL
  END;
```

### Cursors

Les curseurs sont des structures de données utilisées pour traiter les résultats ligne par ligne.

```sql
  DECLARE cursor_name CURSOR
  FOR SELECT column1, column2
  FROM table_name
  WHERE condition;

  OPEN cursor_name;
  FETCH NEXT FROM cursor_name INTO @variable1, @variable2;
  -- Traiter les données
  CLOSE cursor_name;
  DEALLOCATE cursor_name;
```

### Common Table Expressions (CTEs)

Les CTEs sont des requêtes temporaires qui peuvent être référencées dans une requête principale.

```sql
WITH cte_name AS (
    SELECT column1, column2
    FROM table_name
    WHERE condition
)

SELECT * FROM cte_name;

```

### Window Functions

-- Les fonctions de fenêtrage permettent d'effectuer des calculs sur un ensemble de lignes spécifié dans une fenêtre.

```sql
  SELECT column1, column2, SUM(column3) OVER (PARTITION BY column1 ORDER BY column2)
  FROM table_name;
```

---


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

```sql
USE Nom_BaseDeDonnees;

CREATE TABLE Nom_Table (
    ID INT PRIMARY KEY,
    Nom VARCHAR(50),
    Age INT,
    Email VARCHAR(100)
) ON [PRIMARY];

-- Vous pouvez spécifier sur quel FILEGROUP (fichier) la table doit être créée
```


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


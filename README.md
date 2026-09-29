# SQL - CRUD Operations

## Retour d'expérience — Première utilisation de Claude

Pour ce projet, j'ai utilisé **Claude pour la première fois** afin de découvrir son fonctionnement et de voir concrètement ce qu'un outil d'IA pouvait m'apporter dans mon travail de développement.

La première chose que j'ai remarquée est sa **rapidité**, notamment pour les opérations liées à Git et GitHub :

* préparation des commandes ;
* `git add` ;
* `git commit` ;
* `git push` ;
* organisation rapide des étapes du projet.

Cela m'a permis de découvrir une autre manière d'utiliser un assistant IA dans un environnement de développement et de voir comment il pouvait accélérer certaines tâches répétitives.

### Ce que cette expérience m'a apporté

Cette première utilisation m'a surtout permis de :

* découvrir le fonctionnement de Claude ;
* comparer son utilisation avec ma propre manière de travailler ;
* comprendre qu'une IA peut être très efficace pour certaines tâches répétitives ;
* gagner du temps sur certaines opérations Git ;
* réfléchir à la manière dont je souhaite utiliser l'IA dans mes projets.

Cette expérience était volontairement une **expérimentation**. Je voulais comprendre l'outil en pratique plutôt que simplement en entendre parler.

### Mon choix pour la suite

Après cette première expérience, **je n'ai plus utilisé Claude pour mes autres projets**.

L'objectif était de tester l'outil sur ce projet, d'observer ce qu'il pouvait apporter, puis de poursuivre les projets suivants avec ma propre méthode de travail et les outils que j'utilise habituellement.

Cette expérience m'a donc permis de mieux comprendre les possibilités et les limites pratiques d'un assistant IA dans un projet de développement.

---

# Introduction

Ce projet constitue une introduction à **SQL (Structured Query Language)** et au **modèle relationnel**.

Une base de données relationnelle organise les informations sous forme de **tables**.

Une table est composée de :

* **Lignes (`rows`)** → représentent les enregistrements.
* **Colonnes (`columns`)** → représentent les informations ou attributs de chaque enregistrement.

Exemple :

| id | title           | author                   | price |
| -: | --------------- | ------------------------ | ----: |
|  1 | Le Petit Prince | Antoine de Saint-Exupéry | 10.50 |
|  2 | 1984            | George Orwell            | 12.00 |

SQL permet de créer, consulter et modifier ces données.

---

# CRUD

CRUD représente les quatre opérations fondamentales sur les données :

| Lettre | Opération | SQL      | Rôle                  |
| ------ | --------- | -------- | --------------------- |
| **C**  | Create    | `INSERT` | Ajouter des données   |
| **R**  | Read      | `SELECT` | Lire des données      |
| **U**  | Update    | `UPDATE` | Modifier des données  |
| **D**  | Delete    | `DELETE` | Supprimer des données |

Le projet utilise également `CREATE TABLE` pour définir la structure d'une table.

---

# SQLite

Pour ce projet, le système de base de données utilisé est **SQLite**.

SQLite est une base de données :

* légère ;
* stockée dans un fichier ;
* fonctionnant localement ;
* ne nécessitant pas de serveur ;
* adaptée à l'apprentissage, aux tests et aux systèmes embarqués.

### Créer ou ouvrir une base de données

```bash
sqlite3 my_database.db
```

Si le fichier n'existe pas, SQLite le crée automatiquement.

### Exécuter un fichier SQL

```bash
sqlite3 my_database.db < 0-create_table.sql
```

---

# Modèle relationnel

Dans ce projet, on travaille avec une table appelée :

```text
books
```

### Structure de la table `books`

| Colonne          | Type      | Description                      |
| ---------------- | --------- | -------------------------------- |
| `id`             | `INTEGER` | Identifiant unique               |
| `title`          | `TEXT`    | Nom du livre                     |
| `author`         | `TEXT`    | Nom de l'auteur                  |
| `genre`          | `TEXT`    | Genre du livre                   |
| `price`          | `REAL`    | Prix du livre                    |
| `stock`          | `INTEGER` | Nombre d'exemplaires disponibles |
| `published_year` | `INTEGER` | Année de publication             |

---

# 1. CREATE TABLE

Avant de stocker des données, il faut définir la structure de la table.

La commande utilisée est :

```sql
CREATE TABLE
```

Une table définit :

* son nom ;
* ses colonnes ;
* le type de chaque colonne ;
* les contraintes ;
* la clé primaire permettant d'identifier les lignes.

### Types principaux

| Type      | Utilisation           |
| --------- | --------------------- |
| `INTEGER` | Nombre entier         |
| `REAL`    | Nombre avec décimales |
| `TEXT`    | Texte                 |

Exemple :

```text
id              → INTEGER
title           → TEXT
price           → REAL
stock           → INTEGER
published_year  → INTEGER
```

---

# 2. INSERT

`INSERT` permet **d'ajouter des données** dans une table.

C'est l'opération **Create** du CRUD.

```text
INSERT
   ↓
ajouter une nouvelle ligne
```

---

# 3. SELECT

`SELECT` permet de **récupérer des données**.

C'est l'opération **Read** du CRUD.

Avec `SELECT`, on peut :

* récupérer toutes les colonnes ;
* récupérer certaines colonnes ;
* filtrer les lignes ;
* trier les résultats ;
* limiter le nombre de résultats.

---

# 4. Sélectionner certaines colonnes

Il est possible de récupérer uniquement les colonnes nécessaires.

Le principe est :

```text
SELECT
   ↓
Quelles colonnes ?
   ↓
FROM
   ↓
Quelle table ?
```

---

# 5. WHERE

`WHERE` permet de **filtrer les lignes**.

Sans filtre :

```text
TABLE
  ↓
toutes les lignes
```

Avec `WHERE` :

```text
TABLE
  ↓
condition
  ↓
lignes correspondantes
```

Exemple :

```sql
WHERE price > 10
```

Cette condition permet de sélectionner les livres dont le prix est supérieur à 10.

---

# 6. UPDATE

`UPDATE` permet de **modifier des données existantes**.

C'est l'opération **Update** du CRUD.

Principe :

```text
UPDATE
   ↓
quelle table ?
   ↓
quelle valeur modifier ?
   ↓
WHERE
   ↓
quelle(s) ligne(s) ?
```

## ⚠️ Attention

Un `UPDATE` sans `WHERE` peut modifier **toutes les lignes** de la table.

---

# 7. DELETE

`DELETE` permet de **supprimer des données**.

C'est l'opération **Delete** du CRUD.

Principe :

```text
DELETE
   ↓
quelle table ?
   ↓
WHERE
   ↓
quelle(s) ligne(s) supprimer ?
```

## ⚠️ Attention

Un `DELETE` sans `WHERE` peut supprimer **toutes les lignes** de la table.

---

# 8. ORDER BY

`ORDER BY` permet de **trier les résultats**.

Un point important à retenir :

> L'ordre des résultats n'est pas garanti si `ORDER BY` n'est pas utilisé.

Lorsqu'un ordre précis est demandé, il faut donc utiliser `ORDER BY`.

---

# 9. LIMIT

`LIMIT` permet de **limiter le nombre de résultats retournés**.

Exemple conceptuel :

```text
100 livres
    ↓
  LIMIT
    ↓
5 résultats
```

---

# 10. Fonctions d'agrégation

SQL permet de réaliser des calculs sur plusieurs lignes.

Les principales fonctions étudiées sont :

| Fonction | Rôle                       |
| -------- | -------------------------- |
| `COUNT`  | Compter                    |
| `SUM`    | Additionner                |
| `AVG`    | Calculer une moyenne       |
| `MIN`    | Trouver la valeur minimale |
| `MAX`    | Trouver la valeur maximale |

### Exemple

Avec les prix :

```text
10
15
20
25
```

On obtient :

| Fonction | Résultat |
| -------- | -------: |
| `COUNT`  |        4 |
| `SUM`    |       70 |
| `AVG`    |     17.5 |
| `MIN`    |       10 |
| `MAX`    |       25 |

---

# 11. GROUP BY

`GROUP BY` permet de **regrouper les données** selon une colonne.

Exemple :

```text
Fantasy
Fantasy
Roman
Roman
Roman
Science-fiction
```

Après regroupement :

```text
Fantasy          → 2
Roman            → 3
Science-fiction  → 1
```

`GROUP BY` est particulièrement utile avec les fonctions d'agrégation.

---

# SQL fonctionne sur des ensembles

Une différence importante avec un langage comme Python est que SQL travaille sur des **ensembles de lignes**.

Il faut donc penser :

```text
TABLE
  ↓
ensemble de données
  ↓
REQUÊTE
  ↓
ensemble de résultats
```

SQL ne fonctionne donc pas nécessairement ligne par ligne comme une boucle classique.

---

# SQLite et les types

SQLite utilise un système de typage flexible.

Les types déclarés ne sont donc pas strictement appliqués de la même manière que dans certains systèmes de bases de données de production.

Il faut néanmoins choisir des types cohérents :

```text
INTEGER → nombres entiers
REAL    → nombres décimaux
TEXT    → texte
```

L'objectif du projet est d'apprendre un SQL aussi proche que possible du **SQL standard**.

---

# Ce qui n'est pas étudié

Ce projet se concentre volontairement sur les bases de SQL.

Les notions suivantes ne sont pas utilisées :

* `JOIN` ;
* sous-requêtes ;
* fonctions avancées ;
* optimisations spécifiques à une base de données.

---

# Commandes SQLite utiles

### Ouvrir une base

```bash
sqlite3 my_database.db
```

### Exécuter un fichier SQL

```bash
sqlite3 my_database.db < fichier.sql
```

### Obtenir de l'aide dans SQLite

```text
.help
```

---

# Les 11 tâches du projet

|     N° | Tâche                                 |
| -----: | ------------------------------------- |
|  **0** | Comprendre et créer une table         |
|  **1** | Insérer des données                   |
|  **2** | Récupérer toutes les données          |
|  **3** | Sélectionner certaines colonnes       |
|  **4** | Filtrer les lignes                    |
|  **5** | Modifier les lignes                   |
|  **6** | Supprimer des lignes                  |
|  **7** | Trier et limiter les résultats        |
|  **8** | Fonctions d'agrégation                |
|  **9** | Regrouper avec `GROUP BY`             |
| **10** | Requêtes intégratives et manipulation |
| **11** | Quiz final                            |

---

# Les commandes essentielles à retenir

```text
CREATE TABLE → créer une table
INSERT       → ajouter des données
SELECT       → lire des données
UPDATE       → modifier des données
DELETE       → supprimer des données
WHERE        → filtrer
ORDER BY     → trier
LIMIT        → limiter
COUNT        → compter
SUM          → additionner
AVG          → calculer une moyenne
MIN          → trouver le minimum
MAX          → trouver le maximum
GROUP BY     → regrouper
```

---

# Les 3 pièges principaux

### 1. `ORDER BY`

Sans `ORDER BY`, l'ordre des résultats n'est **pas garanti**.

### 2. `UPDATE`

```sql
UPDATE ...
```

sans `WHERE` peut modifier **toutes les lignes**.

### 3. `DELETE`

```sql
DELETE ...
```

sans `WHERE` peut supprimer **toutes les lignes**.

---

# Objectifs du chapitre

À la fin de ce projet, je dois être capable de :

* comprendre le fonctionnement d'une base relationnelle ;
* comprendre la différence entre une ligne et une colonne ;
* créer une table ;
* choisir des types SQL adaptés ;
* utiliser une clé primaire ;
* insérer des données ;
* récupérer des données ;
* sélectionner certaines colonnes ;
* filtrer avec `WHERE` ;
* modifier avec `UPDATE` ;
* supprimer avec `DELETE` ;
* trier avec `ORDER BY` ;
* limiter avec `LIMIT` ;
* utiliser `COUNT`, `SUM`, `AVG`, `MIN` et `MAX` ;
* regrouper les données avec `GROUP BY` ;
* comprendre les principaux risques liés à `UPDATE` et `DELETE`.

---

# Résumé visuel

```text
                         SQL
                          │
              ┌───────────┴───────────┐
              │                       │
          STRUCTURE                 DONNÉES
              │                       │
       CREATE TABLE                  CRUD
                                      │
              ┌───────────────────────┼───────────────────────┐
              │                       │                       │
           CREATE                   READ                  UPDATE / DELETE
           INSERT                  SELECT
                                      │
                            ┌─────────┼─────────┐
                            │         │         │
                          WHERE   ORDER BY    LIMIT
                                      │
                              AGRÉGATION
                                      │
                    ┌─────────┬───────┼───────┬───────┐
                    │         │       │       │       │
                  COUNT      SUM     AVG     MIN     MAX
                                      │
                                  GROUP BY
```

---

# Conclusion

Ce projet m'a permis de découvrir les bases de **SQL et des bases de données relationnelles** à travers SQLite.

J'ai notamment travaillé sur :

* la création d'une table ;
* l'insertion de données ;
* la lecture de données ;
* la modification et la suppression ;
* le filtrage ;
* le tri ;
* les fonctions d'agrégation ;
* le regroupement avec `GROUP BY`.

Il m'a également permis de faire une **première expérimentation avec Claude** dans un projet de développement, notamment pour observer son efficacité sur certaines tâches répétitives liées à Git et GitHub.

Après cette expérimentation, j'ai choisi de **ne plus utiliser Claude pour les projets suivants**, afin de poursuivre mon apprentissage et mon développement avec ma propre méthode de travail.

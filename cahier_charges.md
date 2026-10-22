
# Cahier des charges — I3lam V1

## 1. Présentation du projet

**Nom du projet : I3lam**

I3lam est une plateforme web islamique ayant pour objectif de mettre à disposition du public des **cours audio classés et organisés**, afin de faciliter l'accès à des contenus éducatifs islamiques.

La plateforme sera accessible à tous, notamment :

* aux musulmans souhaitant approfondir leurs connaissances ;
* aux personnes souhaitant découvrir l'islam ;
* aux personnes recherchant des contenus éducatifs islamiques en français.

La première version du projet sera volontairement simple : **pas de compte utilisateur, pas d'administration et pas de système d'authentification**.

---

# 2. Objectif principal

L'objectif d'I3lam est de permettre à un visiteur de :

```text
Découvrir
    ↓
Choisir une catégorie
    ↓
Choisir un cours
    ↓
Consulter les informations du cours
    ↓
Choisir un épisode
    ↓
Écouter l'audio
    ↓
Télécharger l'audio
```

Le site devra également permettre au visiteur de naviguer facilement entre les différents épisodes d'un même cours.

---

# 3. Organisation des contenus

Le contenu sera organisé selon trois niveaux principaux :

```text
CATÉGORIE
    ↓
COURS
    ↓
ÉPISODE
```

Exemple :

```text
Fiqh
│
├── Les bases de la prière
│   │
│   ├── 01 — Introduction
│   ├── 02 — Les conditions de la prière
│   ├── 03 — Les ablutions
│   └── 04 — Les piliers de la prière
│
└── Le jeûne
    │
    ├── 01 — Introduction
    ├── 02 — Les règles du jeûne
    └── ...
```

---

# 4. Catégories initiales

La V1 comportera six catégories :

|  # | Catégorie   |
| -: | ----------- |
|  1 | Fiqh        |
|  2 | Hadith      |
|  3 | Aqidah      |
|  4 | Tafsir      |
|  5 | Adab        |
|  6 | Réfutations |

Ces catégories seront **stockées dans MySQL**.

Elles ne seront donc pas codées directement dans PHP.

---

# 5. Le cours

Un cours représente une série organisée d'épisodes audio traitant d'un sujet.

### Exemple

**Les bases de la prière**

```text
Titre :
Les bases de la prière

Description :
Apprentissage des règles fondamentales de la prière.

Image :
[Image du cours]

Intervenant :
Cheikh X

Nombre d'épisodes :
12
```

### Données du cours

Nous prévoyons notamment :

```text
Cours
├── identifiant
├── titre
├── slug
├── description
├── image
├── catégorie
├── intervenant
└── date de création
```

Le **nombre d'épisodes** sera calculé à partir des épisodes associés au cours plutôt que stocké comme une valeur indépendante.

---

# 6. L'intervenant

Un cours possède **un seul intervenant**.

Un même intervenant pourra cependant être associé à plusieurs cours.

Exemple :

```text
Cheikh X
   │
   ├── Les bases de la prière
   ├── Introduction au Hadith
   └── Les fondements de l'Aqidah
```

Nous aurons donc une relation :

```text
INTERVENANT 1 ───────── N COURS
```

---

# 7. L'épisode

Un épisode représente une partie d'un cours.

Chaque épisode possède un **numéro permettant de déterminer son ordre**.

Exemple :

```text
Cours : Les bases de la prière

01 — Introduction
02 — Les conditions de la prière
03 — Les ablutions
04 — Les piliers de la prière
```

### Données d'un épisode

```text
Épisode
├── identifiant
├── titre
├── numéro
├── description
├── durée
├── URL audio
├── date de publication
└── cours
```

Nous pourrons ensuite utiliser :

```sql
ORDER BY numero ASC
```

pour garantir l'ordre des épisodes.

---

# 8. Audio

Les fichiers audio ne seront pas hébergés directement dans notre serveur PHP pour la V1.

Ils seront hébergés sur **Internet Archive**.

I3lam conservera les informations nécessaires pour accéder au fichier.

Conceptuellement :

```text
I3lam
   │
   ├── informations du cours
   ├── informations de l'épisode
   └── URL de l'audio
                │
                ▼
        Internet Archive
                │
          fichier audio
```

Cela présente plusieurs avantages pour notre projet d'apprentissage :

* notre serveur n'a pas besoin de stocker tous les fichiers audio ;
* nous évitons de gérer nous-mêmes de gros fichiers ;
* la base de données reste légère ;
* nous apprenons à travailler avec des ressources externes.

Nous devrons néanmoins vérifier les **conditions de licence et de redistribution** des contenus avant leur publication.

---

# 9. Lecture et téléchargement

Pour chaque épisode, l'utilisateur pourra :

```text
[▶ Écouter]

[Télécharger]
```

Le lecteur audio utilisera l'URL du fichier audio.

Le téléchargement devra également respecter les conditions de diffusion du contenu concerné.

---

# 10. Vidéo

La vidéo ne fait **pas partie de la V1**.

Cependant, nous ne voulons pas concevoir notre système de manière à rendre son ajout futur difficile.

Nous allons donc éviter une architecture excessivement spécifique à l'audio.

Aujourd'hui :

```text
Épisode
    ↓
Audio
```

À terme, nous pourrons évoluer vers :

```text
Épisode
    ├── Audio
    └── Vidéo
```

Nous déciderons précisément du modèle de données lorsque nous arriverons à la conception de la base.

---

# 11. Pages prévues

La V1 devrait comporter au minimum :

### Accueil

```text
/
```

Présentation d'I3lam et accès aux contenus.

### Liste des catégories

```text
/categories
```

### Une catégorie

```text
/categories/fiqh
```

Affiche les cours appartenant à la catégorie.

### Liste des cours

```text
/cours
```

### Un cours

```text
/cours/les-bases-de-la-priere
```

Affiche :

* titre ;
* description ;
* image ;
* intervenant ;
* nombre d'épisodes ;
* liste des épisodes.

### Un épisode

```text
/cours/les-bases-de-la-priere/episodes/1
```

Affiche :

* titre ;
* numéro ;
* description ;
* durée ;
* lecteur audio ;
* téléchargement ;
* épisode précédent ;
* épisode suivant.

---

# 12. Fonctionnalités V1

Nous pouvons donc établir cette première liste :

### Essentielles

* [x] afficher les catégories ;
* [x] afficher les cours ;
* [x] filtrer les cours par catégorie ;
* [x] afficher les informations d'un cours ;
* [x] afficher l'intervenant ;
* [x] afficher les épisodes ;
* [x] respecter l'ordre des épisodes ;
* [x] afficher la durée ;
* [x] écouter un épisode ;
* [x] télécharger un épisode ;
* [x] naviguer entre les épisodes.

### À envisager après les fondamentaux

* [ ] recherche ;
* [ ] filtres avancés ;
* [ ] pagination ;
* [ ] cours récemment ajoutés ;
* [ ] cours populaires ;
* [ ] système de favoris.

Nous ne les développerons pas immédiatement.

---

# 13. Fonctionnalités volontairement exclues de la V1

Pour éviter de transformer notre projet d'apprentissage en projet beaucoup trop complexe :

```text
❌ Inscription
❌ Connexion
❌ Profil utilisateur
❌ Administration
❌ Dashboard
❌ Gestion des rôles
❌ Commentaires
❌ Likes
❌ Système de notifications
❌ API publique
❌ Vidéo
```

Ces fonctionnalités pourront devenir des **versions futures**.

---

# 14. Règles métier initiales

Voici les règles que notre backend devra respecter.

### Règle 1

Une catégorie peut contenir plusieurs cours.

```text
Catégorie 1 ───── N Cours
```

### Règle 2

Un cours appartient à une seule catégorie.

### Règle 3

Un cours possède un seul intervenant.

### Règle 4

Un intervenant peut présenter plusieurs cours.

### Règle 5

Un cours possède plusieurs épisodes.

### Règle 6

Un épisode appartient à un seul cours.

### Règle 7

Chaque épisode possède un numéro.

### Règle 8

Le numéro détermine l'ordre des épisodes.

### Règle 9

Deux épisodes d'un même cours ne doivent pas avoir le même numéro.

Par exemple :

```text
Cours X

Épisode 1
Épisode 2
Épisode 2  ← INTERDIT
Épisode 3
```

### Règle 10

Un épisode doit disposer d'une référence audio valide pour pouvoir être écouté.

---

# 15. Sécurité dès la conception

Même si notre V1 est publique et ne possède pas encore d'administration, nous allons déjà appliquer les bonnes pratiques.

Par exemple, lorsqu'un utilisateur demande :

```text
/cours?id=12
```

nous ne devons jamais construire une requête SQL dangereuse comme :

```php
$sql = "SELECT * FROM courses WHERE id = " . $_GET['id'];
```

Cela pourrait ouvrir la porte à une **SQL Injection**.

Nous apprendrons à utiliser :

```text
PDO
+
requêtes préparées
+
validation des entrées
```

Même chose pour les données affichées.

Une description provenant de la base ne devra pas être affichée naïvement si elle contient du HTML potentiellement dangereux.

Nous verrons notamment :

```php
htmlspecialchars()
```

et les mécanismes de protection contre le **XSS**.

La sécurité sera donc intégrée au fur et à mesure de la construction.

---

# 16. Architecture générale du projet

Notre vision actuelle est :

```text
                         ILAM
                          │
              ┌───────────┴───────────┐
              │                       │
          FRONTEND                 BACKEND
              │                       │
              │                    PHP
              │                       │
              │                 ┌─────┴─────┐
              │                 │           │
              │              ROUTING     LOGIQUE
              │                             │
              │                          DATABASE
              │                             │
              │                           MySQL
              │
              └──────────────┬──────────────
                             │
                        UTILISATEUR
```

Puis :

```text
MySQL
 │
 ├── categories
 ├── courses
 ├── speakers
 └── episodes
```

**Attention : ceci est une première hypothèse.**

Nous ne créons pas encore ces tables.

---

# 17. Ce que nous allons apprendre avec I3lam

C'est là que le projet devient particulièrement intéressant.

Chaque partie du projet correspondra à des compétences.

| Partie             | Ce que tu apprendras     |
| ------------------ | ------------------------ |
| Cahier des charges | analyse                  |
| MCD                | modélisation             |
| MLD                | conception BDD           |
| MySQL              | SQL                      |
| PHP                | backend                  |
| Composer           | dépendances              |
| Autoloading        | organisation PHP         |
| Routing            | HTTP                     |
| Controllers        | architecture             |
| Repositories       | accès aux données        |
| Services           | logique métier           |
| PDO                | communication PHP/MySQL  |
| CRUD               | manipulation des données |
| Validation         | sécurité                 |
| HTML               | structure                |
| SCSS/CSS           | présentation             |
| JavaScript         | interactions             |
| Git                | gestion du code          |
| Déploiement        | mise en production       |

---

# 18. Notre prochaine étape : la base de données

Le cahier des charges commence à être suffisamment défini pour passer à la **conception des données**.

Mais nous n'allons toujours pas écrire :

```sql
CREATE TABLE ...
```

Notre prochaine étape sera :

## **Analyse des entités d'I3lam**

Nous allons prendre chaque objet métier :

```text
Catégorie
Cours
Intervenant
Épisode
```

et déterminer précisément :

* ses attributs ;
* son identifiant ;
* les attributs obligatoires ;
* les attributs facultatifs ;
* les contraintes ;
* les relations ;
* les cardinalités.

Puis nous construirons ensemble :

```text
Analyse
   ↓
MCD
   ↓
MLD
   ↓
MPD
   ↓
SQL MySQL
```


/*
============================================================
                    I3LAM DATABASE
                    SCHEMA — V1
============================================================

Architecture :

    categories
         │
         ▼
       cours ──────── intervenants
         │
         ▼
      episodes

    admins
         │
         └── gestion de la plateforme

IMPORTANT :
- Ce fichier définit la structure de la base de données.
- Aucun utilisateur MySQL n'est créé ici.
- Aucun mot de passe MySQL n'est stocké ici.
- Les comptes MySQL sont configurés séparément par l'administrateur
  du serveur.
============================================================
*/


/*
============================================================
                    BASE DE DONNÉES
============================================================
*/

CREATE DATABASE IF NOT EXISTS i3lam_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE i3lam_db;


/*
============================================================
                    TABLE : admins
============================================================

Comptes permettant d'administrer la plateforme.

Le mot de passe n'est JAMAIS stocké en clair.
Le champ password_hash contient uniquement le hash généré
par PHP avec password_hash().
============================================================
*/

CREATE TABLE admins (
    id_admin INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    nom_admin VARCHAR(150) NOT NULL,

    email_admin VARCHAR(255) NOT NULL UNIQUE,

    password_hash VARCHAR(255) NOT NULL,

    role_admin ENUM('admin', 'super_admin')
        NOT NULL DEFAULT 'admin',

    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);


/*
============================================================
                    TABLE : categories
============================================================
*/

CREATE TABLE categories (
    id_categorie INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    nom_categorie VARCHAR(100) NOT NULL UNIQUE,

    slug_categorie VARCHAR(150) NOT NULL UNIQUE,

    description_categorie TEXT NULL,

    image_categorie VARCHAR(255) NULL,

    is_published BOOLEAN NOT NULL DEFAULT TRUE,

    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);


/*
============================================================
                    TABLE : intervenants
============================================================
*/

CREATE TABLE intervenants (
    id_intervenant INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    nom_intervenant VARCHAR(150) NOT NULL,

    slug_intervenant VARCHAR(150) NOT NULL UNIQUE,

    description_intervenant TEXT NULL,

    image_intervenant VARCHAR(255) NULL,

    is_published BOOLEAN NOT NULL DEFAULT TRUE,

    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);


/*
============================================================
                    TABLE : cours
============================================================

Chaque cours appartient :

- à une catégorie ;
- à un intervenant.

Un cours peut posséder plusieurs épisodes.
============================================================
*/

CREATE TABLE cours (
    id_cours INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    titre_cours VARCHAR(200) NOT NULL,

    slug_cours VARCHAR(200) NOT NULL UNIQUE,

    description_cours TEXT NULL,

    image_cours VARCHAR(255) NULL,

    is_published BOOLEAN NOT NULL DEFAULT FALSE,

    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    id_categorie INT UNSIGNED NOT NULL,

    id_intervenant INT UNSIGNED NOT NULL,

    CONSTRAINT fk_cours_categorie
        FOREIGN KEY (id_categorie)
        REFERENCES categories(id_categorie)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_cours_intervenant
        FOREIGN KEY (id_intervenant)
        REFERENCES intervenants(id_intervenant)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


/*
============================================================
                    TABLE : episodes
============================================================

Chaque épisode appartient à un seul cours.

L'association :

    cours → épisodes

permet d'avoir plusieurs épisodes par cours.

Le numéro d'épisode est unique à l'intérieur d'un cours.
============================================================
*/

CREATE TABLE episodes (
    id_episode INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    title_episode VARCHAR(200) NOT NULL,

    numero_episode INT UNSIGNED NOT NULL,

    slug_episode VARCHAR(200) NOT NULL,

    description_episode TEXT NULL,

    duration TIME NULL,

    audio_url VARCHAR(2048) NOT NULL,

    is_published BOOLEAN NOT NULL DEFAULT FALSE,

    published_at DATETIME NULL,

    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    id_cours INT UNSIGNED NOT NULL,

    CONSTRAINT fk_episodes_cours
        FOREIGN KEY (id_cours)
        REFERENCES cours(id_cours)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT uq_episode_numero
        UNIQUE (id_cours, numero_episode),

    CONSTRAINT uq_episode_slug
        UNIQUE (id_cours, slug_episode)
);


/*
============================================================
                    INDEX
============================================================

Les clés étrangères possèdent déjà des index nécessaires
dans MySQL, mais ces index supplémentaires facilitent
certaines recherches fréquentes de l'application.
============================================================
*/

CREATE INDEX idx_cours_categorie
    ON cours(id_categorie);

CREATE INDEX idx_cours_intervenant
    ON cours(id_intervenant);

CREATE INDEX idx_cours_published
    ON cours(is_published);

CREATE INDEX idx_episodes_cours
    ON episodes(id_cours);

CREATE INDEX idx_episodes_published
    ON episodes(is_published);

CREATE INDEX idx_categories_published
    ON categories(is_published);

CREATE INDEX idx_intervenants_published
    ON intervenants(is_published);


/*
============================================================
                    FIN DU SCHEMA
============================================================
*/
# Notre MPD final proposé

CATEGORIES
────────────────────────────────
PK  id_categorie       INT UNSIGNED AUTO_INCREMENT
    nom_categorie      VARCHAR(100) NOT NULL UNIQUE
    slug_categorie     VARCHAR(150) NOT NULL UNIQUE
    description        TEXT NULL
    image_categorie    VARCHAR(255) NULL


INTERVENANTS
────────────────────────────────
PK  id_intervenant     INT UNSIGNED AUTO_INCREMENT
    nom_intervenant    VARCHAR(150) NOT NULL
    slug_intervenant   VARCHAR(150) NOT NULL UNIQUE


COURS
────────────────────────────────
PK  id_cours           INT UNSIGNED AUTO_INCREMENT
    titre_cours        VARCHAR(200) NOT NULL
    slug_cours         VARCHAR(200) NOT NULL UNIQUE
    description        TEXT NULL
    image_cours        VARCHAR(255) NULL
    created_at         DATETIME NOT NULL
    FK  id_categorie   INT UNSIGNED NOT NULL
    FK  id_intervenant INT UNSIGNED NOT NULL


EPISODES
────────────────────────────────
PK  id_episode        INT UNSIGNED AUTO_INCREMENT
    titre_episode     VARCHAR(200) NOT NULL
    numero_episode    INT UNSIGNED NOT NULL
    slug_episode      VARCHAR(200) NOT NULL
    description       TEXT NULL
    duration          TIME NULL
    audio_url         VARCHAR(2048) NOT NULL
    published_at      DATETIME NOT NULL
    FK  id_cours       INT UNSIGNED NOT NULL

    UNIQUE(id_cours, numero_episode)
    UNIQUE(id_cours, slug_episode)
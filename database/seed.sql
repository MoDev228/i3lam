/*
============================================
            SEED I3LAM DATABASE
          DONNÉES FICTIVES DE TEST
============================================
*/

USE i3lam_db;


-- ==========================================
-- CATEGORIES
-- ==========================================

INSERT INTO categories (
    nom_categorie,
    slug_categorie,
    description_categorie,
    image_categorie
)
VALUES
(
    'Aqidah',
    'aqidah',
    'Cours et enseignements fictifs sur la croyance islamique.',
    NULL
),
(
    'Hadith',
    'hadith',
    'Cours et enseignements fictifs autour des hadiths.',
    NULL
),
(
    'Tafsir',
    'tafsir',
    'Cours fictifs consacrés à l''exégèse du Coran.',
    NULL
),
(
    'Fiqh',
    'fiqh',
    'Cours fictifs consacrés à la jurisprudence islamique.',
    NULL
),
(
    'Adab',
    'adab',
    'Cours fictifs consacrés au comportement et aux bonnes manières.',
    NULL
),
(
    'Réfutations',
    'refutations',
    'Cours fictifs consacrés à l''étude et à la réfutation de certaines erreurs doctrinales.',
    NULL
);


-- ==========================================
-- INTERVENANTS
-- ==========================================

INSERT INTO intervenants (
    nom_intervenant,
    slug_intervenant
)
VALUES
(
    'Muhammad Wora',
    'muhammad-wora'
),
(
    'Abou Ubayd Abdussamad Ibn Nour',
    'abou-ubayd-abdussamad-ibn-nour'
),
(
    'Sūleymân Bébel',
    'suleyman-bebel'
),
(
    'Abdurahman Abu Imran',
    'abdurahman-abu-imran'
),
(
    'Abdoul-Aziz Abou Houdheyfah',
    'abdoul-aziz-abou-houdheyfah'
),
(
    'Abū Fāṭimah ʿAbdullāh As’Sokowī',
    'abu-fatimah-abdullah-as-sokowi'
),
(
    'ʿAbd El-Raḥmēn Colo',
    'abd-el-rahmen-colo'
),
(
    'Yanis Abou Imrân Al-Jazâiry',
    'yanis-abou-imran-al-jazairy'
),
(
    'Ibrahim Al-Kindi',
    'ibrahim-al-kindi'
),
(
    'Youssouf Al-Hakim',
    'youssouf-al-hakim'
),
(
    'Omar Ibn Salih',
    'omar-ibn-salih'
),
(
    'Abdallah Al-Madani',
    'abdallah-al-madani'
);


-- ==========================================
-- COURS
-- ==========================================

INSERT INTO cours (
    titre_cours,
    slug_cours,
    description_cours,
    image_cours,
    id_categorie,
    id_intervenant
)
VALUES

-- ------------------------------------------
-- AQIDAH
-- ------------------------------------------

(
    'Les fondements de la croyance',
    'les-fondements-de-la-croyance',
    'Cours fictif présentant les notions fondamentales de la croyance.',
    NULL,
    1,
    1
),
(
    'Introduction à l''Aqidah',
    'introduction-a-la-aqidah',
    'Cours fictif destiné à découvrir les principes fondamentaux de l''Aqidah.',
    NULL,
    1,
    2
),
(
    'Les six piliers de la foi',
    'les-six-piliers-de-la-foi',
    'Cours fictif consacré aux six piliers de la foi.',
    NULL,
    1,
    3
),

-- ------------------------------------------
-- HADITH
-- ------------------------------------------

(
    'Introduction à la science du Hadith',
    'introduction-a-la-science-du-hadith',
    'Cours fictif présentant les notions fondamentales de la science du Hadith.',
    NULL,
    2,
    4
),
(
    'Les 40 hadiths essentiels',
    'les-40-hadiths-essentiels',
    'Série fictive autour de quarante hadiths sélectionnés pour l''apprentissage.',
    NULL,
    2,
    5
),
(
    'Comprendre les chaînes de transmission',
    'comprendre-les-chaines-de-transmission',
    'Cours fictif consacré à la compréhension des chaînes de transmission.',
    NULL,
    2,
    6
),

-- ------------------------------------------
-- TAFSIR
-- ------------------------------------------

(
    'Introduction au Tafsir',
    'introduction-au-tafsir',
    'Cours fictif consacré aux bases de l''exégèse coranique.',
    NULL,
    3,
    7
),
(
    'Méditations sur la sourate Al-Fatiha',
    'meditations-sur-la-sourate-al-fatiha',
    'Cours fictif consacré à l''étude et aux enseignements de la sourate Al-Fatiha.',
    NULL,
    3,
    8
),
(
    'Étude de sourates courtes',
    'etude-de-sourates-courtes',
    'Cours fictif consacré à l''étude de plusieurs sourates courtes.',
    NULL,
    3,
    9
),

-- ------------------------------------------
-- FIQH
-- ------------------------------------------

(
    'Les bases de la purification',
    'les-bases-de-la-purification',
    'Cours fictif consacré aux règles générales de la purification.',
    NULL,
    4,
    10
),
(
    'Les règles de la prière',
    'les-regles-de-la-priere',
    'Cours fictif consacré aux principales règles relatives à la prière.',
    NULL,
    4,
    11
),
(
    'Introduction au Fiqh',
    'introduction-au-fiqh',
    'Cours fictif présentant les principales notions de jurisprudence islamique.',
    NULL,
    4,
    12
),

-- ------------------------------------------
-- ADAB
-- ------------------------------------------

(
    'Les bonnes manières du musulman',
    'les-bonnes-manieres-du-musulman',
    'Cours fictif consacré aux comportements recommandés dans la vie quotidienne.',
    NULL,
    5,
    1
),
(
    'Le comportement avec les autres',
    'le-comportement-avec-les-autres',
    'Cours fictif consacré aux bonnes relations avec son entourage.',
    NULL,
    5,
    4
),
(
    'La patience et la bienveillance',
    'la-patience-et-la-bienveillance',
    'Cours fictif consacré à la patience et à la bienveillance.',
    NULL,
    5,
    7
),

-- ------------------------------------------
-- REFUTATIONS
-- ------------------------------------------

(
    'Comprendre les erreurs doctrinales',
    'comprendre-les-erreurs-doctrinales',
    'Cours fictif présentant différentes notions liées à l''étude des erreurs doctrinales.',
    NULL,
    6,
    8
),
(
    'Principes de méthodologie',
    'principes-de-methodologie',
    'Cours fictif consacré aux principes généraux de méthodologie.',
    NULL,
    6,
    10
),
(
    'Réponses aux idées reçues',
    'reponses-aux-idees-recues',
    'Cours fictif consacré à l''analyse de différentes idées reçues.',
    NULL,
    6,
    12
);


-- ==========================================
-- EPISODES
-- ==========================================

INSERT INTO episodes (
    title_episode,
    numero_episode,
    slug_episode,
    description_episode,
    duration,
    audio_url,
    id_cours
)
VALUES

-- ------------------------------------------
-- COURS 1
-- Les fondements de la croyance
-- ------------------------------------------

(
    'Introduction',
    1,
    'introduction',
    'Présentation générale du cours.',
    '00:32:15',
    'https://example.com/audio/aqidah-01.mp3',
    1
),
(
    'Les principes fondamentaux',
    2,
    'les-principes-fondamentaux',
    'Présentation fictive des principaux fondements.',
    '00:41:20',
    'https://example.com/audio/aqidah-02.mp3',
    1
),
(
    'Conclusion',
    3,
    'conclusion',
    'Résumé des notions étudiées.',
    '00:28:45',
    'https://example.com/audio/aqidah-03.mp3',
    1
),

-- ------------------------------------------
-- COURS 2
-- Introduction à l'Aqidah
-- ------------------------------------------

(
    'Présentation du cours',
    1,
    'presentation-du-cours',
    NULL,
    '00:25:10',
    'https://example.com/audio/aqidah-intro-01.mp3',
    2
),
(
    'Les notions essentielles',
    2,
    'les-notions-essentielles',
    NULL,
    '00:38:30',
    'https://example.com/audio/aqidah-intro-02.mp3',
    2
),

-- ------------------------------------------
-- COURS 3
-- Les six piliers de la foi
-- ------------------------------------------

(
    'Introduction aux piliers de la foi',
    1,
    'introduction-aux-piliers-de-la-foi',
    NULL,
    '00:30:00',
    'https://example.com/audio/iman-01.mp3',
    3
),
(
    'La foi aux anges',
    2,
    'la-foi-aux-anges',
    NULL,
    '00:35:40',
    'https://example.com/audio/iman-02.mp3',
    3
),
(
    'La foi aux livres',
    3,
    'la-foi-aux-livres',
    NULL,
    '00:34:15',
    'https://example.com/audio/iman-03.mp3',
    3
),

-- ------------------------------------------
-- COURS 4
-- Science du Hadith
-- ------------------------------------------

(
    'Qu''est-ce qu''un Hadith ?',
    1,
    'quest-ce-qu-un-hadith',
    NULL,
    '00:29:30',
    'https://example.com/audio/hadith-01.mp3',
    4
),
(
    'Les différents types de Hadith',
    2,
    'les-differents-types-de-hadith',
    NULL,
    '00:42:00',
    'https://example.com/audio/hadith-02.mp3',
    4
),

-- ------------------------------------------
-- COURS 5
-- Les 40 hadiths essentiels
-- ------------------------------------------

(
    'Le premier Hadith',
    1,
    'le-premier-hadith',
    NULL,
    '00:27:30',
    'https://example.com/audio/hadith-40-01.mp3',
    5
),
(
    'Le deuxième Hadith',
    2,
    'le-deuxieme-hadith',
    NULL,
    '00:31:45',
    'https://example.com/audio/hadith-40-02.mp3',
    5
),
(
    'Le troisième Hadith',
    3,
    'le-troisieme-hadith',
    NULL,
    '00:29:15',
    'https://example.com/audio/hadith-40-03.mp3',
    5
),

-- ------------------------------------------
-- COURS 6
-- Chaînes de transmission
-- ------------------------------------------

(
    'Introduction aux chaînes de transmission',
    1,
    'introduction-aux-chaines-de-transmission',
    NULL,
    '00:36:20',
    'https://example.com/audio/hadith-isnad-01.mp3',
    6
),
(
    'Étude d''un exemple',
    2,
    'etude-d-un-exemple',
    NULL,
    '00:40:10',
    'https://example.com/audio/hadith-isnad-02.mp3',
    6
),

-- ------------------------------------------
-- COURS 7
-- Introduction au Tafsir
-- ------------------------------------------

(
    'Définition du Tafsir',
    1,
    'definition-du-tafsir',
    NULL,
    '00:33:25',
    'https://example.com/audio/tafsir-01.mp3',
    7
),
(
    'Les principales sources',
    2,
    'les-principales-sources',
    NULL,
    '00:39:50',
    'https://example.com/audio/tafsir-02.mp3',
    7
),

-- ------------------------------------------
-- COURS 8
-- Sourate Al-Fatiha
-- ------------------------------------------

(
    'Présentation de la sourate',
    1,
    'presentation-de-la-sourate',
    NULL,
    '00:28:30',
    'https://example.com/audio/fatiha-01.mp3',
    8
),
(
    'Étude des premiers versets',
    2,
    'etude-des-premiers-versets',
    NULL,
    '00:43:20',
    'https://example.com/audio/fatiha-02.mp3',
    8
),

-- ------------------------------------------
-- COURS 9
-- Sourates courtes
-- ------------------------------------------

(
    'Sourate Al-Ikhlas',
    1,
    'sourate-al-ikhlas',
    NULL,
    '00:31:10',
    'https://example.com/audio/sourates-01.mp3',
    9
),
(
    'Sourate Al-Falaq',
    2,
    'sourate-al-falaq',
    NULL,
    '00:30:40',
    'https://example.com/audio/sourates-02.mp3',
    9
),

-- ------------------------------------------
-- COURS 10
-- Purification
-- ------------------------------------------

(
    'Introduction à la purification',
    1,
    'introduction-a-la-purification',
    NULL,
    '00:35:15',
    'https://example.com/audio/fiqh-purification-01.mp3',
    10
),
(
    'Les règles générales',
    2,
    'les-regles-generales',
    NULL,
    '00:41:25',
    'https://example.com/audio/fiqh-purification-02.mp3',
    10
),

-- ------------------------------------------
-- COURS 11
-- Prière
-- ------------------------------------------

(
    'Les conditions de la prière',
    1,
    'les-conditions-de-la-priere',
    NULL,
    '00:38:10',
    'https://example.com/audio/fiqh-priere-01.mp3',
    11
),
(
    'Les obligations de la prière',
    2,
    'les-obligations-de-la-priere',
    NULL,
    '00:44:30',
    'https://example.com/audio/fiqh-priere-02.mp3',
    11
),
(
    'Les erreurs fréquentes',
    3,
    'les-erreurs-frequentes',
    NULL,
    '00:37:45',
    'https://example.com/audio/fiqh-priere-03.mp3',
    11
),

-- ------------------------------------------
-- COURS 12
-- Introduction au Fiqh
-- ------------------------------------------

(
    'Qu''est-ce que le Fiqh ?',
    1,
    'quest-ce-que-le-fiqh',
    NULL,
    '00:30:20',
    'https://example.com/audio/fiqh-intro-01.mp3',
    12
),
(
    'Les sources du Fiqh',
    2,
    'les-sources-du-fiqh',
    NULL,
    '00:42:10',
    'https://example.com/audio/fiqh-intro-02.mp3',
    12
),

-- ------------------------------------------
-- COURS 13
-- Bonnes manières
-- ------------------------------------------

(
    'L''importance du bon comportement',
    1,
    'importance-du-bon-comportement',
    NULL,
    '00:34:30',
    'https://example.com/audio/adab-01.mp3',
    13
),
(
    'Le comportement au quotidien',
    2,
    'le-comportement-au-quotidien',
    NULL,
    '00:39:15',
    'https://example.com/audio/adab-02.mp3',
    13
),

-- ------------------------------------------
-- COURS 14
-- Comportement avec les autres
-- ------------------------------------------

(
    'Respecter son entourage',
    1,
    'respecter-son-entourage',
    NULL,
    '00:32:40',
    'https://example.com/audio/adab-social-01.mp3',
    14
),
(
    'Préserver les relations',
    2,
    'preserver-les-relations',
    NULL,
    '00:36:50',
    'https://example.com/audio/adab-social-02.mp3',
    14
),

-- ------------------------------------------
-- COURS 15
-- Patience
-- ------------------------------------------

(
    'Comprendre la patience',
    1,
    'comprendre-la-patience',
    NULL,
    '00:29:45',
    'https://example.com/audio/adab-sabr-01.mp3',
    15
),
(
    'La bienveillance',
    2,
    'la-bienveillance',
    NULL,
    '00:33:30',
    'https://example.com/audio/adab-sabr-02.mp3',
    15
),

-- ------------------------------------------
-- COURS 16
-- Erreurs doctrinales
-- ------------------------------------------

(
    'Introduction',
    1,
    'introduction',
    NULL,
    '00:35:20',
    'https://example.com/audio/refutation-01.mp3',
    16
),
(
    'Méthode d''analyse',
    2,
    'methode-d-analyse',
    NULL,
    '00:41:30',
    'https://example.com/audio/refutation-02.mp3',
    16
),

-- ------------------------------------------
-- COURS 17
-- Méthodologie
-- ------------------------------------------

(
    'Les principes fondamentaux',
    1,
    'les-principes-fondamentaux',
    NULL,
    '00:37:20',
    'https://example.com/audio/methodologie-01.mp3',
    17
),
(
    'Application pratique',
    2,
    'application-pratique',
    NULL,
    '00:43:10',
    'https://example.com/audio/methodologie-02.mp3',
    17
),

-- ------------------------------------------
-- COURS 18
-- Idées reçues
-- ------------------------------------------

(
    'Première idée reçue',
    1,
    'premiere-idee-recue',
    NULL,
    '00:31:25',
    'https://example.com/audio/refutation-idee-01.mp3',
    18
),
(
    'Deuxième idée reçue',
    2,
    'deuxieme-idee-recue',
    NULL,
    '00:38:40',
    'https://example.com/audio/refutation-idee-02.mp3',
    18
);

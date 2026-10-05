<?php

namespace Modev\I3lam\Models;

use Modev\I3lam\Core\Database;

use PDO;

class Course
{
    private PDO $connection;

    public function __construct(Database $database)
    {
        $this->connection = $database->getConnection();
    }

    public function getAll(): array
    {
        $stmt = $this->connection->query(
            'SELECT
                cours.id_cours,
                cours.titre_cours,
                categories.nom_categorie AS categorie,
                intervenants.nom_intervenant AS intervenant
            FROM cours
            JOIN categories
                ON cours.id_categorie = categories.id_categorie
            JOIN intervenants
                ON cours.id_intervenant = intervenants.id_intervenant
            ORDER BY cours.id_cours ASC'
        );

        return $stmt->fetchAll();
    }
}
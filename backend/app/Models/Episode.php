<?php

namespace Modev\I3lam\Models;

use Modev\I3lam\Core\Database;

use PDO;

class Episode
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
                episodes.id_episode,
                episodes.title_episode,
                episodes.numero_episode,
                cours.titre_cours AS cours
            FROM episodes
            JOIN cours
                ON episodes.id_cours = cours.id_cours
            ORDER BY
                episodes.id_cours ASC,
                episodes.numero_episode ASC'
        );

        return $stmt->fetchAll();
    }
}
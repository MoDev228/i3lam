<?php

namespace Modev\I3lam\Models;

use Modev\I3lam\Core\Database;

use PDO;

class Category
{
    private PDO $connection;

    public function __construct(Database $database)
    {
        $this->connection = $database->getConnection();
    }

    public function getAll(): array
    {
        $stmt = $this->connection->query(
            'SELECT * FROM categories'
        );

        return $stmt->fetchAll();
    }
}
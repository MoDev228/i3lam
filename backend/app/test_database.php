<?php

require_once __DIR__ . '/bootstrap.php';

use Modev\I3lam\Core\Database;

$database = new Database();

$pdo = $database->getConnection();

$pdo->query("SELECT 1");

echo "Connexion à la base de données réussie.";
echo " Test SQL réussi.";
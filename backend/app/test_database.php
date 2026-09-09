<?php

require_once __DIR__ . '/bootstrap.php';

use Modev\I3lam\Core\Database;

$database = new Database();

$pdo = $database->getConnection();

$stmt = $pdo->query("SELECT 1");

$result = $stmt->fetch();

echo "Connexion créée avec succès.";

echo "Test SQL réussi.";
<?php

namespace Modev\I3lam\Controllers;

use Modev\I3lam\Core\Database;
use Modev\I3lam\Models\Category;

class CategoryController
{
    private Database $database;

    public function __construct(Database $database)
    {
        $this->database = $database;
    }

    public function index(): array
    {
        $categoryModel = new Category($this->database);

        $categories = $categoryModel->getAll();

        return $categories;
    }

    public function show(int $id): ?array
    {
        $categoryModel = new Category($this->database);

        $category = $categoryModel->getById($id);

        return $category;
    }
}

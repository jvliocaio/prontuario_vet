<?php

require_once __DIR__ . '/../../connection.php';

class AnimalController
{
    private $conexao;

    public function __construct()
    {
        $this->conexao = new Connection("localhost", "root", "root", "prontuario_vet"); 
    }

    function listarTudo(){
        $lista = [];

        try {
            $sql = "SELECT cd_animal, nm_animal, cd_especie FROM animal";
            $stmt = $this->conexao->Connected()->prepare($sql); 
            $stmt->execute();
            $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

            foreach ($resultados as $row) {
                $especie = new Especie('cd_especie');

                $animal = new Animal($row['cd_animal'], $row['nm_animal'], $especie); 
                $lista[] = $animal; 
            }

        } catch (PDOException $e) {
            echo "Erro ao listar animais: " . $e->getMessage();
        }

        return $lista;
    }
}
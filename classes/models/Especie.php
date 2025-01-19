<?php


class Especie
{
    public $codigo;
    public $nome;

    public function __construct($codigo = null, $nome = null) {
        $this->codigo = $codigo;
        $this->nome = $nome;
    }
}
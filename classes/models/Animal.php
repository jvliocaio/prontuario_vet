<?php


class Animal
{
    public $codigo;
    public $nome;
    public $especie;

    public function __construct($codigo = null, $nome = null, Especie $especie = null) {
        $this->codigo = $codigo;
        $this->nome = $nome;
        if ($especie != null) {
            $this->especie = $especie;
        }else{
            $this->especie = new Especie ();
        }
    }
}
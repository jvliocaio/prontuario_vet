DROP SCHEMA IF EXISTS prontuario_vet;
CREATE SCHEMA prontuario_vet;
USE prontuario_vet;

CREATE TABLE especie (
    cd_especie INT,
    nm_especie VARCHAR(50),
    CONSTRAINT pk_especie PRIMARY KEY (cd_especie)
);

CREATE TABLE animal (
    cd_animal INT,
    nm_animal VARCHAR(100),
    cd_especie INT,
    CONSTRAINT pk_animal PRIMARY KEY (cd_animal),
    CONSTRAINT fk_animal_especie FOREIGN KEY (cd_especie) REFERENCES especie(cd_especie)
);

CREATE TABLE tratamento (
    cd_tratamento INT,
    nm_tratamento VARCHAR(100),
    ds_tratamento TEXT,
    CONSTRAINT pk_tratamento PRIMARY KEY (cd_tratamento)
);

CREATE TABLE prontuario (
    cd_animal INT,
    cd_tratamento INT,
    dt_tratamento DATETIME,
    ds_observacao TEXT,
    CONSTRAINT pk_prontuario PRIMARY KEY (cd_animal, cd_tratamento, dt_tratamento),
    CONSTRAINT fk_prontuario_animal FOREIGN KEY (cd_animal) REFERENCES animal(cd_animal),
    CONSTRAINT fk_prontuario_tratamento FOREIGN KEY (cd_tratamento) REFERENCES tratamento(cd_tratamento)
);

-- Inserindo espécies
INSERT INTO especie (cd_especie, nm_especie) VALUES 
(1, 'Cachorro'),
(2, 'Gato'),
(3, 'Coelho');

-- Inserindo animais
INSERT INTO animal (cd_animal, nm_animal, cd_especie) VALUES 
(1, 'Meg', 1),
(2, 'Luna', 2),
(3, 'Bolinha', 3);

-- Inserindo tratamentos
INSERT INTO tratamento (cd_tratamento, nm_tratamento, ds_tratamento) VALUES 
(101, 'Vacina Antirrábica', 'Proteção contra raiva'),
(102, 'Vermifugação', 'Controle de vermes intestinais'),
(103, 'Castração', 'Esterilização');

-- Inserindo prontuários
INSERT INTO prontuario (cd_animal, cd_tratamento, dt_tratamento, ds_observacao) VALUES 
(1, 101, '2024-08-30 11:30:00', 'Renovar em 1 ano'),
(1, 102, '2024-08-30 11:35:00', 'Houve reação alérgica e foi administrado Apoquel 6g'),
(2, 101, '2024-08-30 11:30:00', NULL),
(2, 103, '2024-08-30 11:30:00', 'Demorou para voltar da anestesia mas nada preocupante'),
(3, 102, '2024-08-30 11:30:00', NULL);

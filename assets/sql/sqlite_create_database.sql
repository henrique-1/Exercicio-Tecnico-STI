-- ==============================================================================
-- EXERCÍCIO TÉCNICO STI - CADASTRO DE VEÍCULOS
-- Script DDL para SQLite
-- ==============================================================================

PRAGMA foreign_keys = ON;

-- 1. Criação da Tabela MARCAS
CREATE TABLE IF NOT EXISTS MARCAS (
    MAR_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    MAR_NOME VARCHAR(50) NOT NULL
);

-- 2. Criação da Tabela MODELOS
CREATE TABLE IF NOT EXISTS MODELOS (
    MOD_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    MOD_NOME VARCHAR(50) NOT NULL,
    FK_MARCAS_MAR_ID INTEGER NOT NULL,
    CONSTRAINT FK_MODELOS_MARCAS FOREIGN KEY (FK_MARCAS_MAR_ID)
        REFERENCES MARCAS (MAR_ID)
        ON DELETE CASCADE
);

-- 3. Criação da Tabela CARROS (VEÍCULOS)
CREATE TABLE IF NOT EXISTS CARROS (
    CAR_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    CAR_PLACA VARCHAR(10) NOT NULL,
    CAR_COR VARCHAR(30) NOT NULL,
    CAR_ANO INTEGER NOT NULL,
    CAR_PORTE VARCHAR(20) NOT NULL,
    CAR_TIPO_CARGA VARCHAR(30) NOT NULL,
    CAR_CHASSIS VARCHAR(17) NOT NULL,
    FK_MODELOS_MOD_ID INTEGER NOT NULL,
    CONSTRAINT UQ_CARROS_PLACA UNIQUE (CAR_PLACA),
    CONSTRAINT UQ_CARROS_CHASSIS UNIQUE (CAR_CHASSIS),
    CONSTRAINT FK_CARROS_MODELOS FOREIGN KEY (FK_MODELOS_MOD_ID)
        REFERENCES MODELOS (MOD_ID)
        ON DELETE CASCADE
);

-- 4. Criação de Índices
CREATE INDEX IF NOT EXISTS IX_CARROS_PLACA ON CARROS (CAR_PLACA);
CREATE INDEX IF NOT EXISTS IX_MODELOS_NOME ON MODELOS (MOD_NOME);

-- ==============================================================================
-- Dados Iniciais (Seed)
-- ==============================================================================
INSERT OR IGNORE INTO MARCAS (MAR_ID, MAR_NOME) VALUES
(1, 'Chevrolet'),
(2, 'Volkswagen'),
(3, 'Fiat'),
(4, 'Toyota'),
(5, 'Ford'),
(6, 'Hyundai'),
(7, 'Volvo');

INSERT OR IGNORE INTO MODELOS (MOD_ID, MOD_NOME, FK_MARCAS_MAR_ID) VALUES
(1, 'Onix', 1),
(2, 'Tracker', 1),
(3, 'S10', 1),
(4, 'Gol', 2),
(5, 'Polo', 2),
(6, 'T-Cross', 2),
(7, 'Strada', 3),
(8, 'Toro', 3),
(9, 'Argo', 3),
(10, 'Corolla', 4),
(11, 'Hilux', 4),
(12, 'Ranger', 5),
(13, 'HB20', 6),
(14, 'FH 540', 7);

INSERT OR IGNORE INTO CARROS (CAR_ID, CAR_PLACA, CAR_COR, CAR_ANO, CAR_PORTE, CAR_TIPO_CARGA, CAR_CHASSIS, FK_MODELOS_MOD_ID) VALUES
(1, 'BRA2E19', 'Prata', 2023, 'Médio', 'Passageiro', '9BRBL42E0P0123456', 10),
(2, 'RBD3A45', 'Branco', 2024, 'Pequeno', 'Carga Geral', '9BD2782A0P0654321', 7),
(3, 'ABC1234', 'Azul', 2022, 'Grande', 'Carga Geral', '9BV1234A0P0987654', 14);

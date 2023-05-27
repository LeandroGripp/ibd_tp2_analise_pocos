--
-- File generated with SQLiteStudio v3.4.4 on ter mai 9 15:31:45 2023
--
-- Text encoding used: System
--
PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

-- Table: Locais
CREATE TABLE IF NOT EXISTS Locais (id_local INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, estado TEXT (2), bacia TEXT (20), campo TEXT (20));

-- Table: Pocos
CREATE TABLE IF NOT EXISTS Pocos (nome_poco_anp TEXT (15) UNIQUE NOT NULL, id_local INTEGER, FOREIGN KEY (id_local) REFERENCES Locais (id_local));

-- Table: Contratos
CREATE TABLE IF NOT EXISTS Contratos (numero_contrato TEXT(25) PRIMARY KEY UNIQUE NOT NULL, operador TEXT (20), nome_poco_operador TEXT (30), nome_poco_anp TEXT(15), FOREIGN KEY (nome_poco_anp) REFERENCES Pocos (nome_poco_anp));

-- Table: Instalacoes
CREATE TABLE IF NOT EXISTS Instalacoes (id_instalacao INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, nome_instalacao TEXT (25) UNIQUE, tipo_instalacao TEXT (2));

-- Table: Producao
CREATE TABLE IF NOT EXISTS Producoes (
    id_producao INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL,
    periodo TEXT (7),
    oleo REAL,
    condensado REAL,
    petroleo REAL,
    gas_natural_associado REAL,
    gas_natural_nao_associado REAL,
    gas_natural_total REAL,
    volume_gas_royalties REAL,
    agua REAL,
    tempo_producao INTEGER,
    periodo_da_carga TEXT (7),
    corrente TEXT (30),
    grau_api REAL,
    fp_lc TEXT (10),
    fp_lv REAL,
    fp_mc TEXT (10),
    fp_mv REAL,
    fp_pc TEXT (10),
    fp_pv REAL,
    metano REAL,
    etano REAL,
    propano REAL,
    isobutano REAL,
    butano REAL,
    isopentano REAL,
    npentano REAL,
    hexanos REAL,
    heptanos REAL,
    octanos REAL,
    nonanos REAL,
    decanos REAL,
    undecanos REAL,
    oxigenio REAL,
    nitrogenio REAL,
    gas_carbonico REAL,
    densidade_glp_gas REAL,
    densidade_glp_liquido REAL
);

-- Table: Destinacoes
CREATE TABLE IF NOT EXISTS Destinacoes (id_destinacao INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, id_producao INTEGER, id_instalacao INTEGER, numero_contrato TEXT(25), FOREIGN KEY (id_producao) REFERENCES Producoes (id_producao), FOREIGN KEY (id_instalacao) REFERENCES Instalacoes (id_instalacao), FOREIGN KEY (numero_contrato) REFERENCES Contratos (numero_contrato));

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;

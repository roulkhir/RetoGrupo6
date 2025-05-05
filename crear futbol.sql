CREATE DATABASE Futbol;
USE Futbol;

CREATE TABLE CLUB (
    Id_club INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Ciudad VARCHAR(100),
    Año_fundación INT
);

CREATE TABLE REPRESENTANTE (
    Id_representante INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Agencia VARCHAR(100),
    Teléfono VARCHAR(20)
);

-- Tabla CONTRATO
CREATE TABLE CONTRATO (
    Id_contrato INT PRIMARY KEY,
    Fecha_inicio DATE,
    Fecha_fin DATE,
    Cláusula DECIMAL(15,2),
    Salario DECIMAL(15,2),
    Id_jugador INT,
    FOREIGN KEY (Id_jugador) REFERENCES JUGADOR(Id_jugador)
);

-- Tabla FICHA
CREATE TABLE FICHA (
    Id_club INT,
    Id_jugador INT,
    PRIMARY KEY (Id_club, Id_jugador),
    FOREIGN KEY (Id_club) REFERENCES CLUB(Id_club),
    FOREIGN KEY (Id_jugador) REFERENCES JUGADOR(Id_jugador)
);

CREATE TABLE JUGADOR (
    Id_jugador INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Nacionalidad VARCHAR(50),
    Fecha_nacimiento DATE,
    Posición VARCHAR(30),
    Id_representante INT,
    FOREIGN KEY (Id_representante) REFERENCES REPRESENTANTE(Id_representante)
);

-- Tabla PORTERO
CREATE TABLE PORTERO (
    Id_jugador INT PRIMARY KEY,
    Porterías_a_cero INT,
    Paradas INT,
    FOREIGN KEY (Id_jugador) REFERENCES JUGADOR(Id_jugador)
);

-- Tabla JUGADOR_CAMPO
CREATE TABLE JUGADOR_CAMPO (
    Id_jugador INT PRIMARY KEY,
    Goles INT,
    Asistencias INT,
    FOREIGN KEY (Id_jugador) REFERENCES JUGADOR(Id_jugador)
);

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS Futbol;
USE Futbol;

-- Tabla USUARIOS
CREATE TABLE USUARIOS (
    ID INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono BIGINT NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Contrasena VARCHAR(100) NOT NULL
);

-- Tabla CLUB
CREATE TABLE CLUB (
    Id_club INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Ciudad VARCHAR(100),
    Año_fundación INT
);

-- Tabla REPRESENTANTE
CREATE TABLE REPRESENTANTE (
    Id_representante INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(100),
    Agencia VARCHAR(100),
    Telefono BIGINT
);

-- Tabla JUGADOR
CREATE TABLE JUGADOR (
    Id_jugador INT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(100),
    Nacionalidad VARCHAR(50),
    Fecha_nacimiento DATE,
    Posicion VARCHAR(30),
    Id_representante INT NOT NULL,
    FOREIGN KEY (Id_representante) REFERENCES REPRESENTANTE(Id_representante)
);

-- Tabla CONTRATO
CREATE TABLE CONTRATO (
    Id_contrato INT NOT NULL PRIMARY KEY,
    Fecha_inicio DATE,
    Fecha_fin DATE,
    Clausula DECIMAL(15,2),
    Salario DECIMAL(15,2),
    Id_jugador INT NOT NULL,
    FOREIGN KEY (Id_jugador) REFERENCES JUGADOR(Id_jugador)
);

-- Tabla FICHA (relación jugador-club)
CREATE TABLE FICHA (
    Id_club INT NOT NULL,
    Id_jugador INT NOT NULL,
    PRIMARY KEY (Id_club, Id_jugador),
    FOREIGN KEY (Id_club) REFERENCES CLUB(Id_club),
    FOREIGN KEY (Id_jugador) REFERENCES JUGADOR(Id_jugador)
);

-- Tabla PORTERO
CREATE TABLE PORTERO (
    Id_jugador INT NOT NULL PRIMARY KEY,
    Porterias_a_cero INT,
    Paradas INT,
    FOREIGN KEY (Id_jugador) REFERENCES JUGADOR(Id_jugador)
);

-- Tabla JUGADOR_CAMPO
CREATE TABLE JUGADOR_CAMPO (
    Id_jugador INT NOT NULL PRIMARY KEY,
    Goles INT,
    Asistencias INT,
    FOREIGN KEY (Id_jugador) REFERENCES JUGADOR(Id_jugador)
);

-- Insertar clubes
INSERT INTO CLUB (Id_club, Nombre, Ciudad, Año_fundación) VALUES
(1, 'Real Madrid', 'Madrid', 1902),
(2, 'FC Barcelona', 'Barcelona', 1899),
(3, 'Real Zaragoza', 'Zaragoza', 1909),
(4, 'Athletic Bilbao', 'Bilbao', 1898),
(5, 'Atletico Madrid', 'Madrid', 1903);

-- Insertar representantes
INSERT INTO REPRESENTANTE (Id_representante, Nombre, Agencia, Telefono) VALUES
(1, 'Jorge', 'Elite Sports Management', 941849488),
(2, 'Oscar', 'Global Players Agency', 991114588),
(3, 'Juanan', 'Global Players Agency', 966483001),
(4, 'Eloy', 'Elite Sports Management', 963805839),
(5, 'Marcos', 'TopTalent Soccer Group', 913104159),
(6, 'Angel', 'Elite Sports Management', 993801489),
(7, 'Marcos', 'TopTalent Soccer Group', 998281664),
(8, 'Lorenzo', 'FutPro Agency', 977564774),
(9, 'Rafael', 'FutPro Agency', 981557951),
(10, 'David', 'Global Players Agency', 906970067),
(11, 'Oscar', 'Elite Sports Management', 962354310),
(12, 'David', 'Elite Sports Management', 950065983),
(13, 'Pablo', 'TopTalent Soccer Group', 918840430),
(14, 'Angel', 'FutPro Agency', 956591656),
(15, 'Pablo', 'Elite Sports Management', 938647915),
(16, 'Martin', 'Global Players Agency', 938213192),
(17, 'Jorge', 'Global Players Agency', 993816910),
(18, 'David', 'Legend Agents', 994759939),
(19, 'Manuel', 'TopTalent Soccer Group', 920911303),
(20, 'Nestor', 'Legend Agents', 919930523),
(21, 'Angel', 'Global Players Agency', 964435816),
(22, 'Jorge', 'Legend Agents', 963712802),
(23, 'Lorenzo', 'TopTalent Soccer Group', 958297683),
(24, 'Pepe', 'TopTalent Soccer Group', 921254468),
(25, 'Eloy', 'FutPro Agency', 972736235),
(26, 'Blas', 'FutPro Agency', 998346750),
(27, 'Miguel', 'Elite Sports Management', 991201785),
(28, 'Rafael', 'Global Players Agency', 934454077),
(29, 'Lorenzo', 'TopTalent Soccer Group', 935621540),
(30, 'Pedro', 'FutPro Agency', 994098212),
(31, 'Pepe', 'Elite Sports Management', 909811763),
(32, 'Pedro', 'FutPro Agency', 965177966),
(33, 'Jorge', 'TopTalent Soccer Group', 991693759),
(34, 'Miguel', 'TopTalent Soccer Group', 945548188),
(35, 'Lorenzo', 'FutPro Agency', 904032533),
(36, 'Nestor', 'Legend Agents', 928909851),
(37, 'Eloy', 'FutPro Agency', 952921460),
(38, 'Marcos', 'FutPro Agency', 909940441),
(39, 'Juanan', 'Legend Agents', 912455421),
(40, 'Rafael', 'Legend Agents', 924864034),
(41, 'David', 'Legend Agents', 933064823),
(42, 'Marcos', 'Legend Agents', 933476408),
(43, 'Roberto', 'Legend Agents', 937110611),
(44, 'Lorenzo', 'Legend Agents', 973126853),
(45, 'Blas', 'Legend Agents', 986126374),
(46, 'Alex', 'Legend Agents', 970793581),
(47, 'Miguel', 'FutPro Agency', 936193165),
(48, 'Pascual', 'FutPro Agency', 974125948),
(49, 'Alex', 'TopTalent Soccer Group', 903915547),
(50, 'Pedro', 'Global Players Agency', 995766188),
(51, 'Blas', 'FutPro Agency', 968021298),
(52, 'Martin', 'TopTalent Soccer Group', 946815653),
(53, 'Manuel', 'Global Players Agency', 965655521),
(54, 'Pepe', 'Elite Sports Management', 910894669),
(55, 'Oscar', 'Elite Sports Management', 931114648);


-- Insertar jugadores (solo una muestra para evitar referencias rotas)
INSERT INTO JUGADOR (Id_jugador, Nombre, Nacionalidad, Fecha_nacimiento, Posicion, Id_representante) VALUES
(1, 'Alicia Benavent Gras', 'Uruguay', '1993-01-02', 'Portero', 1),
(2, 'Nicolás Ferrera', 'Paraguay', '1991-10-05', 'Centrocampista', 9),
(3, 'Horacio Elpidio Real Palacios', 'Paraguay', '1990-12-06', 'Defensa', 7),
(4, 'Reinaldo Ojeda', 'Perú', '2000-10-13', 'Delantero', 2),
(5, 'Evangelina Gonzalez Molina', 'Ecuador', '1995-08-24', 'Defensa', 3),
(6, 'Ceferino Ayuso Rincón', 'Portugal', '2005-02-13', 'Defensa', 1),
(7, 'Anunciación Salcedo-Mateo', 'Brasil', '1999-07-13', 'Centrocampista', 6),
(8, 'María Manuela Domingo-Vives', 'Argentina', '2005-01-23', 'Defensa', 7),
(9, 'Jesusa Garcia Quintero', 'Colombia', '2005-01-08', 'Defensa', 5),
(10, 'Ángel Eliseo Miguel Arcos', 'Argentina', '1997-08-14', 'Delantero', 6),
(11, 'Luz Carreño Mayo', 'Venezuela', '1999-02-26', 'Delantero', 4),
(12, 'Felicidad de Gutiérrez', 'México', '1989-12-05', 'Portero', 7),
(13, 'José Ángel Pinto', 'Colombia', '2006-08-03', 'Delantero', 7),
(14, 'Faustino Nicolau Cuevas', 'España', '2000-09-30', 'Delantero', 9),
(15, 'Alonso Palomino Marcos', 'Chile', '1991-04-25', 'Centrocampista', 6),
(16, 'Loreto del Fiol', 'Argentina', '2000-09-14', 'Defensa', 5),
(17, 'Gaspar del Llopis', 'Perú', '2001-09-05', 'Centrocampista', 7),
(18, 'Juan Manuel Maestre Torralba', 'Chile', '1993-06-16', 'Defensa', 3),
(19, 'Maricela Suarez', 'España', '2006-08-16', 'Centrocampista', 7),
(20, 'Amílcar Marquez Mur', 'México', '1993-10-05', 'Delantero', 7),
(21, 'Nicodemo Martinez Alberola', 'Portugal', '1999-11-01', 'Centrocampista', 9),
(22, 'Emma de Jover', 'Portugal', '2002-04-30', 'Defensa', 1),
(23, 'Bernardita Escobar Sáez', 'Paraguay', '2006-10-11', 'Portero', 7),
(24, 'Juan José Villaverde Larrañaga', 'Paraguay', '1997-05-13', 'Centrocampista', 5),
(25, 'Luna Gallego Arrieta', 'Venezuela', '1994-08-04', 'Defensa', 2),
(26, 'Espiridión Llanos Ferreras', 'Perú', '1992-04-12', 'Defensa', 3),
(27, 'Susanita Herminia Tamarit Quintana', 'Paraguay', '1996-10-18', 'Centrocampista', 5),
(28, 'Baudelio de Sarmiento', 'Brasil', '2005-04-09', 'Centrocampista', 8),
(29, 'Elisa Larrañaga Seco', 'Perú', '1989-10-27', 'Delantero', 4),
(30, 'Cayetana Menéndez Gual', 'Argentina', '2002-05-11', 'Centrocampista', 1),
(31, 'Custodia Débora Sainz Escobar', 'Paraguay', '1993-02-02', 'Centrocampista', 3),
(32, 'Ulises Ildefonso Porta Mayo', 'México', '2001-06-14', 'Defensa', 5),
(33, 'Che Miguel-Borrás', 'Venezuela', '1992-08-21', 'Centrocampista', 9),
(34, 'Ibán Cantero Carrillo', 'Brasil', '2006-01-03', 'Portero', 4),
(35, 'René del Manso', 'Colombia', '1999-01-12', 'Centrocampista', 9),
(36, 'Berto Glauco Alcántara Velasco', 'Ecuador', '1998-05-15', 'Delantero', 6),
(37, 'Albino Saez', 'Chile', '1996-10-13', 'Defensa', 7),
(38, 'Gastón Company Ferrera', 'Colombia', '2001-12-25', 'Defensa', 7),
(39, 'Sancho Briones Badía', 'Paraguay', '1989-06-22', 'Defensa', 5),
(40, 'Flavia Vergara', 'Venezuela', '2004-04-07', 'Defensa', 8),
(41, 'Maxi Falcó-Arnau', 'Argentina', '1990-08-21', 'Centrocampista', 8),
(42, 'Édgar Amigó', 'Ecuador', '2003-05-29', 'Delantero', 3),
(43, 'Cipriano Osorio-Morán', 'Paraguay', '1990-11-01', 'Centrocampista', 4),
(44, 'Palmira del Arnau', 'Chile', '1996-04-05', 'Delantero', 1),
(45, 'Azahara Beltrán Cazorla', 'Colombia', '2005-01-23', 'Portero', 3),
(46, 'Juan Pablo Rosell Caparrós', 'España', '1990-09-23', 'Delantero', 1),
(47, 'Calixto Bejarano Piña', 'Portugal', '1993-10-25', 'Defensa', 4),
(48, 'Hernando Escribano', 'Uruguay', '1990-05-03', 'Defensa', 10),
(49, 'Édgar Marc Barrio Salgado', 'Chile', '1999-03-22', 'Delantero', 7),
(50, 'Clementina Amo', 'Uruguay', '2003-08-28', 'Centrocampista', 5),
(51, 'Mohamed Juan Antonio Higueras Solano', 'Brasil', '2002-07-16', 'Defensa', 9),
(52, 'Gaspar Jerez Alsina', 'Colombia', '1994-01-08', 'Delantero', 4),
(53, 'Evaristo Calvo Santana', 'España', '2001-07-24', 'Defensa', 10),
(54, 'Eugenio Rodríguez Río', 'Chile', '2000-12-23', 'Defensa', 7),
(55, 'Feliciana Amores Galán', 'Argentina', '1990-09-28', 'Delantero', 6);

-- Insertar contratos (coherentes con los jugadores incluidos)
INSERT INTO CONTRATO (Id_contrato, Fecha_inicio, Fecha_fin, Clausula, Salario, Id_jugador) VALUES
(1, '2019-07-01', '2023-07-01', 15400000.00, 1200000.00, 12),
(2, '2020-01-15', '2024-01-15', 9825000.00, 875000.00, 25),
(3, '2018-06-10', '2022-06-10', 28750000.00, 1500000.00, 8),
(4, '2022-03-20', '2026-03-20', 47200000.00, 2450000.00, 32),
(5, '2017-08-01', '2022-08-01', 60500000.00, 3800000.00, 45),
(6, '2021-01-01', '2025-01-01', 13250000.00, 975000.00, 18),
(7, '2016-12-15', '2021-12-15', 2750000.00, 250000.00, 5),
(8, '2023-06-01', '2026-06-01', 92000000.00, 1875000.00, 39),  -- 77 → 39
(9, '2015-09-10', '2020-09-10', 11000000.00, 1250000.00, 3),
(10, '2020-02-28', '2023-02-28', 3150000.00, 800000.00, 28),
(11, '2021-08-01', '2024-08-01', 19000000.00, 1400000.00, 14),
(12, '2022-11-30', '2025-11-30', 27000000.00, 1600000.00, 33),
(13, '2018-04-01', '2023-04-01', 45200000.00, 2950000.00, 40),  -- 60 → 40
(14, '2016-01-10', '2021-01-10', 15800000.00, 1100000.00, 21),
(15, '2023-03-15', '2027-03-15', 74500000.00, 2200000.00, 41),  -- 70 → 41
(16, '2017-07-01', '2020-07-01', 4200000.00, 350000.00, 11),
(17, '2021-10-01', '2025-10-01', 38000000.00, 2750000.00, 26),
(18, '2019-09-05', '2024-09-05', 31000000.00, 1850000.00, 44),
(19, '2015-05-01', '2020-05-01', 8250000.00, 950000.00, 6),
(20, '2020-11-20', '2023-11-20', 5500000.00, 680000.00, 36),
(21, '2018-02-15', '2022-02-15', 9000000.00, 1250000.00, 13),
(22, '2016-03-10', '2021-03-10', 20500000.00, 1700000.00, 7),
(23, '2023-01-01', '2026-01-01', 66500000.00, 3300000.00, 49),
(24, '2019-12-25', '2023-12-25', 19500000.00, 975000.00, 42),  -- 59 → 42
(25, '2017-10-31', '2020-10-31', 6100000.00, 550000.00, 4),
(26, '2021-05-10', '2026-05-10', 37500000.00, 2000000.00, 9),
(27, '2022-08-15', '2025-08-15', 13200000.00, 1400000.00, 43),  -- 67 → 43
(28, '2018-11-11', '2021-11-11', 2700000.00, 480000.00, 16),
(29, '2020-06-01', '2024-06-01', 47500000.00, 3500000.00, 35),
(30, '2015-07-01', '2020-07-01', 82500000.00, 4200000.00, 10),
(31, '2016-06-10', '2021-06-10', 1950000.00, 220000.00, 2),
(32, '2023-04-05', '2027-04-05', 50000000.00, 2750000.00, 47),  -- 66 → 47
(33, '2019-01-20', '2023-01-20', 2500000.00, 700000.00, 22),
(34, '2020-09-09', '2025-09-09', 60500000.00, 3600000.00, 48),  -- 74 → 48
(35, '2017-04-15', '2022-04-15', 16750000.00, 980000.00, 24),
(36, '2021-02-01', '2026-02-01', 72000000.00, 4150000.00, 31),
(37, '2018-03-01', '2023-03-01', 15500000.00, 950000.00, 38),
(38, '2022-10-10', '2025-10-10', 42000000.00, 3200000.00, 40),
(39, '2016-11-11', '2020-11-11', 10000000.00, 1150000.00, 17),
(40, '2020-04-20', '2023-04-20', 18200000.00, 980000.00, 41),
(41, '2023-02-28', '2027-02-28', 92000000.00, 4700000.00, 46),
(42, '2017-09-10', '2021-09-10', 6000000.00, 800000.00, 1),
(43, '2021-06-01', '2025-06-01', 26500000.00, 2100000.00, 15),
(44, '2019-03-15', '2023-03-15', 14250000.00, 1200000.00, 20),
(45, '2015-12-01', '2020-12-01', 2100000.00, 330000.00, 50),
(46, '2022-05-05', '2026-05-05', 50000000.00, 3050000.00, 51),  -- 58 → 51
(47, '2016-07-07', '2021-07-07', 3550000.00, 550000.00, 29),
(48, '2020-10-15', '2024-10-15', 74000000.00, 3870000.00, 30),
(49, '2018-01-01', '2023-01-01', 16000000.00, 980000.00, 19),
(50, '2021-03-10', '2025-03-10', 22500000.00, 1800000.00, 27),
(51, '2023-07-07', '2026-07-07', 64000000.00, 3150000.00, 52),  -- 53 → 52
(52, '2017-05-25', '2022-05-25', 3100000.00, 410000.00, 34),
(53, '2019-06-20', '2023-06-20', 3750000.00, 660000.00, 42),
(54, '2020-08-30', '2024-08-30', 29200000.00, 2650000.00, 37),
(55, '2015-01-10', '2020-01-10', 1000000.00, 200000.00, 23);

-- Insertar fichajes
INSERT INTO FICHA (Id_club, Id_jugador) VALUES
-- Club 1
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10), (1, 11),
-- Club 2
(2, 12), (2, 13), (2, 14), (2, 15), (2, 16), (2, 17), (2, 18), (2, 19), (2, 20), (2, 21), (2, 22),
-- Club 3
(3, 23), (3, 24), (3, 25), (3, 26), (3, 27), (3, 28), (3, 29), (3, 30), (3, 31), (3, 32), (3, 33),
-- Club 4
(4, 34), (4, 35), (4, 36), (4, 37), (4, 38), (4, 39), (4, 40), (4, 41), (4, 42), (4, 43), (4, 44),
-- Club 5
(5, 45), (5, 46), (5, 47), (5, 48), (5, 49), (5, 50), (5, 51), (5, 52), (5, 53), (5, 54), (5, 55);



-- Insertar porteros
INSERT INTO PORTERO (Id_jugador, Porterias_a_cero, Paradas) VALUES
(1, 12, 140),     -- portero club 1
(12, 10, 115),    -- portero club 2
(23, 15, 160),    -- portero club 3
(34, 8, 90),      -- portero club 4
(45, 18, 180);    -- portero club 5

-- Insertar jugadores de campo
INSERT INTO JUGADOR_CAMPO (Id_jugador, Goles, Asistencias) VALUES
(1, 12, 7),
(2, 8, 5),
(3, 15, 6),
(4, 5, 2),
(5, 20, 10),
(6, 11, 4),
(7, 6, 3),
(8, 9, 7),
(9, 4, 1),
(10, 17, 9),
(11, 13, 6),
(12, 7, 2),
(13, 10, 4),
(14, 3, 0),
(15, 19, 8),
(16, 21, 11),
(17, 2, 1),
(18, 18, 10),
(19, 6, 3),
(20, 14, 6),
(21, 22, 12),
(22, 1, 0),
(23, 16, 7),
(24, 12, 5),
(25, 9, 3),
(26, 8, 4),
(27, 5, 2),
(28, 20, 9),
(29, 7, 2),
(30, 11, 6),
(31, 13, 4),
(32, 10, 3),
(33, 3, 1),
(34, 17, 8),
(35, 6, 2),
(36, 15, 7),
(37, 14, 6),
(38, 4, 1),
(39, 18, 10),
(40, 2, 0),
(41, 19, 9),
(42, 1, 0),
(43, 16, 7),
(44, 12, 5),
(45, 9, 4),
(46, 11, 3),
(47, 8, 2),
(48, 13, 5),
(49, 10, 4),
(50, 7, 2),
(51, 5, 1),
(52, 21, 10),
(53, 15, 6),
(54, 3, 0),
(55, 22, 11);
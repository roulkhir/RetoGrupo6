USE futbol;
-- Crea la vista de los datos de los jugadores españoles con los datos de su contrato y 
-- con el nombre de su representante

CREATE VIEW Vista_Jugadores_Contratos AS
SELECT 
    JUGADOR.Id_jugador,
    JUGADOR.Nombre AS Nombre_Jugador,
    JUGADOR.Nacionalidad,
    JUGADOR.Posicion,
    REPRESENTANTE.Nombre AS Nombre_Representante,
    CONTRATO.Fecha_inicio,
    CONTRATO.Fecha_fin,
    CONTRATO.Clausula,
    CONTRATO.Salario
FROM JUGADOR JUGADOR
JOIN CONTRATO CONTRATO ON JUGADOR.Id_jugador = CONTRATO.Id_jugador
JOIN REPRESENTANTE REPRESENTANTE ON JUGADOR.Id_representante = REPRESENTANTE.Id_representante
WHERE JUGADOR.Nacionalidad like 'España';

SELECT * FROM Vista_Jugadores_Contratos;
DROP VIEW Vista_Jugadores_Contratos;

-- Crea la vista de los jugadores con club, que vivan en zaragoza
CREATE VIEW Vista_Clubes_Jugadores AS
SELECT 
    CLUB.Nombre AS Nombre_Club,
    CLUB.Ciudad,
    JUGADOR.Id_jugador,
    JUGADOR.Nombre AS Nombre_Jugador,
    JUGADOR.Posicion
FROM CLUB CLUB
JOIN FICHA FICHA ON CLUB.Id_club = FICHA.Id_club
JOIN JUGADOR JUGADOR ON FICHA.Id_jugador = JUGADOR.Id_jugador
WHERE Ciudad like 'Zaragoza';

SELECT * FROM Vista_Clubes_Jugadores;
DROP VIEW Vista_Clubes_Jugadores;

-- Crea la vista de las estadisticas de los porteros que tengan mas de 100 paradas y se les ordena de mas a menos
-- las porterias a cero que tengan
CREATE VIEW Vista_Estadisticas_Porteros AS
SELECT 
    JUGADOR.Id_jugador,
    JUGADOR.Nombre,
    PORTERO.Porterias_a_cero,
    PORTERO.Paradas
FROM JUGADOR JUGADOR
JOIN PORTERO PORTERO ON JUGADOR.Id_jugador = PORTERO.Id_jugador
WHERE PORTERO.Paradas > 100
ORDER BY PORTERO.Porterias_a_cero DESC;

SELECT * FROM Vista_Estadisticas_Porteros;
DROP VIEW Vista_Estadisticas_Porteros;

-- Crea la vista de las estadisticas de los jugadores de campo, que juegan de delanteros 
-- y que tengan unas asistencias entre 5 y 15
CREATE VIEW Vista_Estadisticas_Jugadores_Campo AS
SELECT 
    JUGADOR.Id_jugador,
    JUGADOR.Nombre,
    JUGADOR.Posicion,
    JUGADOR_CAMPO.Goles,
    JUGADOR_CAMPO.Asistencias
FROM JUGADOR JUGADOR
JOIN JUGADOR_CAMPO JUGADOR_CAMPO ON JUGADOR.Id_jugador = JUGADOR_CAMPO.Id_jugador
WHERE JUGADOR.Posicion like 'Delantero' AND JUGADOR_CAMPO.Asistencias BETWEEN 5 AND 15
ORDER BY JUGADOR_CAMPO.Goles DESC;

SELECT * FROM Vista_Estadisticas_Jugadores_Campo;
DROP VIEW Vista_Estadisticas_Jugadores_Campo;

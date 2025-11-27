--- Visualizar tablas
select table_name from user_tables;

--- Para visualizar numero de tablas
SELECT
    COUNT(*) AS NUMERO_DE_TABLAS
FROM
    USER_TABLES;

--- Agrupar los constraints para sacar el número
SELECT
    TABLE_NAME,
    CONSTRAINT_TYPE AS TIPO,
    COUNT(*) AS TOTAL_RESTRICCIONES
FROM
    USER_CONSTRAINTS
WHERE
    GENERATED = 'USER NAME'
GROUP BY
    TABLE_NAME, CONSTRAINT_TYPE
ORDER BY
    TABLE_NAME, TIPO;

-------

--- Relaciones entre tablas
SELECT
    uc.TABLE_NAME AS TABLA_HIJA,
    uc.CONSTRAINT_NAME AS NOMBRE_FK,
    r_uc.TABLE_NAME AS TABLA_PADRE,
    uc.DELETE_RULE AS REGLA_ELIMINACION
FROM
    USER_CONSTRAINTS uc
JOIN
    USER_CONSTRAINTS r_uc ON uc.R_CONSTRAINT_NAME = r_uc.CONSTRAINT_NAME
WHERE
    uc.CONSTRAINT_TYPE = 'R'
ORDER BY
    TABLA_HIJA, TABLA_PADRE;
    
--- Visualizar numero de los primary keys
SELECT
    COUNT(*) AS TOTAL_CLAVES_PRIMARIAS
FROM
    USER_CONSTRAINTS
WHERE
    CONSTRAINT_TYPE = 'P';
    
--- Visualizar numero de los foreigns keys
SELECT
    COUNT(*) AS TOTAL_CLAVES_FORANEAS
FROM
    USER_CONSTRAINTS
WHERE
    CONSTRAINT_TYPE = 'R';

---Tipo de restriccion
SELECT
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE AS TIPO_RESTRICCION
FROM
    USER_CONSTRAINTS
ORDER BY
    CONSTRAINT_NAME;
    
--- Verificar restricciones
SELECT
    uc.TABLE_NAME AS TABLA_HIJA,
    uc.CONSTRAINT_NAME AS NOMBRE_RESTRICCION,
    r_uc.TABLE_NAME AS TABLA_PADRE,
    uc.DELETE_RULE AS REGLA_APLICADA
FROM
    USER_CONSTRAINTS uc
JOIN
    USER_CONSTRAINTS r_uc ON uc.R_CONSTRAINT_NAME = r_uc.CONSTRAINT_NAME
WHERE
    uc.CONSTRAINT_TYPE = 'R'
ORDER BY
    TABLA_HIJA, REGLA_APLICADA DESC;
    
--- Tipos de constraint
SELECT CONSTRAINT_TYPE, COUNT(*) AS TOTAL
FROM USER_CONSTRAINTS
GROUP BY CONSTRAINT_TYPE;

--- Detalle de los uniques
SELECT 
    uc.TABLE_NAME AS TABLA,
    uc.CONSTRAINT_NAME AS NOMBRE_RESTRICCION,
    ucc.COLUMN_NAME AS COLUMNA_UNICA,
    uc.STATUS AS ESTADO
FROM user_constraints uc
JOIN user_cons_columns ucc ON uc.constraint_name = ucc.constraint_name
WHERE uc.constraint_type = 'U'
ORDER BY uc.table_name;

--- Para consultar si existen primary keys con mas de dos columnas
SELECT 
    cc.TABLE_NAME AS TABLA,
    c.CONSTRAINT_NAME AS NOMBRE_PK,
    COUNT(cc.COLUMN_NAME) AS CANTIDAD_COLUMNAS
FROM USER_CONSTRAINTS c
JOIN USER_CONS_COLUMNS cc ON c.CONSTRAINT_NAME = cc.CONSTRAINT_NAME
WHERE c.CONSTRAINT_TYPE = 'P'
GROUP BY cc.TABLE_NAME, c.CONSTRAINT_NAME
HAVING COUNT(cc.COLUMN_NAME) > 2
ORDER BY CANTIDAD_COLUMNAS DESC;

--- Toda la información relevante de las primary keys (todos tiene una sola columna)
SELECT * FROM user_cons_columns
WHERE constraint_name IN (SELECT constraint_name FROM user_constraints WHERE constraint_type = 'P');

--- Toda la información relevante de las foreigns keys (todos tienen una sola columna)
SELECT * FROM user_cons_columns
WHERE constraint_name IN (SELECT constraint_name FROM user_constraints WHERE constraint_type = 'R');

--- Verificar datos en las tablas
SELECT * FROM AULA;
SELECT COUNT(*) FROM ESTUDIANTE;
SELECT COUNT(*) FROM DOCENTE;
SELECT * FROM CARRERA;
SELECT * FROM CALIFICACION;
SELECT * FROM ASIGNATURA;
SELECT * FROM MATRICULA;
SELECT * FROM LIBRO;
SELECT * FROM TIPO_BECA;

SELECT * FROM PERIODO_ACADEMICO;
SELECT * FROM historial_academico;
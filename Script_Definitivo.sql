/* ==========================================================================
   ENTREGABLE 3: IMPLEMENTACION EN ORACLE
   PROYECTO: SISTEMA DE GESTION ACADEMICA UNIVERSITARIA
   INTEGRANTES: Aidan Carrasco, Mathew Verdezoto, Luz Salazar, Alex Pogo, Kenneth Gaona, Zenan Fernandez, Alejandro Guanocunga, Andres Merino
   FECHA: Noviembre 2025
   ========================================================================== */

/*
FASE CERO: Es necesario que se cree un usuario en Oracle diferente al usuario System. El usuario que se creara es el siguiente:
Usuario: sistema_universitario
Password: sistema_universitario
*/

-- Crear usuario
CREATE USER sistema_universitario IDENTIFIED BY sistema_universitario;

-- Conceder privilegios de administrador (DBA)
GRANT DBA TO sistema_universitario;

-- Permitir crear sesiones
GRANT CREATE SESSION TO sistema_universitario;

-- Dar cuota ilimitada en el tablespace USERS
ALTER USER sistema_universitario QUOTA UNLIMITED ON USERS;

-- Conectarse como el nuevo usuario
CONNECT sistema_universitario/sistema_universitario;

/*
PRIMERA FASE: Generacion del Script DDL a partir de los modelos diseniados en Power Designer. En esta parte se
encuentran la creacion de las tablas y de los indices. Ademas, adicionalmente se crean las secuencias y los uniques.
En las ultimas lineas de esta parte se encuentran la creacion de los constraints para las foreigns keys.
*/

ALTER TABLE ASIGNACION_BECA
   DROP CONSTRAINT FK_ASIGNACI_ES_TIPO_B_TIPO_BEC;

ALTER TABLE ASIGNACION_BECA
   DROP CONSTRAINT FK_ASIGNACI_RECIBE_BE_ESTUDIAN;

ALTER TABLE AUTORIA
   DROP CONSTRAINT FK_AUTORIA_ESCRIBE_A_DOCENTE;

ALTER TABLE AUTORIA
   DROP CONSTRAINT FK_AUTORIA_TIENE_AUT_PUBLICAC;

ALTER TABLE CALIFICACION
   DROP CONSTRAINT FK_CALIFICA_GENERA_CA_OFERTA_A;

ALTER TABLE CALIFICACION
   DROP CONSTRAINT FK_CALIFICA_TIENE_DET_MATRICUL;

ALTER TABLE CARRERA
   DROP CONSTRAINT FK_CARRERA_ADMINISTR_FACULTAD;

ALTER TABLE CARRERA
   DROP CONSTRAINT FK_CARRERA_TIENE_COO_DOCENTE;

ALTER TABLE COLABORAN_EN
   DROP CONSTRAINT FK_COLABORA_COLABORAN_PROYECTO;

ALTER TABLE COLABORAN_EN
   DROP CONSTRAINT FK_COLABORA_COLABORAN_DOCENTE;

ALTER TABLE CORREQUISITO
   DROP CONSTRAINT FK_CORREQ_ASIG_A;

ALTER TABLE CORREQUISITO
   DROP CONSTRAINT FK_CORREQ_ASIG_B;

ALTER TABLE DEPARTAMENTO
   DROP CONSTRAINT FK_DEPARTAM_TIENE_DEP_FACULTAD;

ALTER TABLE DETALLE_MALLA
   DROP CONSTRAINT FK_DETALLE__ES_PARTE__MALLA_CU;

ALTER TABLE DETALLE_MALLA
   DROP CONSTRAINT FK_DETALLE__SE_PRESEN_ASIGNATU;

ALTER TABLE DOCENTE
   DROP CONSTRAINT FK_DOCENTE_ENSENIAN__FACULTAD;

ALTER TABLE DOCENTE
   DROP CONSTRAINT FK_DOCENTE_TIENE_COO_CARRERA;

ALTER TABLE DOCENTE
   DROP CONSTRAINT FK_DOCENTE_TIENE_DEC_FACULTAD;

ALTER TABLE FACULTAD
   DROP CONSTRAINT FK_FACULTAD_TIENE_DEC_DOCENTE;

ALTER TABLE HISTORIAL_ACADEMICO
   DROP CONSTRAINT FK_HISTORIA_OBTUVO_RE_PERIODO_;

ALTER TABLE HISTORIAL_ACADEMICO
   DROP CONSTRAINT FK_HISTORIA_TIENE_HIS_ESTUDIAN;

ALTER TABLE HORARIO_CLASE
   DROP CONSTRAINT FK_HORARIO__SE_DICTA__OFERTA_A;

ALTER TABLE HORARIO_CLASE
   DROP CONSTRAINT FK_HORARIO__TIENE_HOR_AULA;

ALTER TABLE MALLA_CURRICULAR
   DROP CONSTRAINT FK_MALLA_CU_TIENE_CAR_CARRERA;

ALTER TABLE MATRICULA
   DROP CONSTRAINT FK_MATRICUL_HA_REALIZ_ESTUDIAN;

ALTER TABLE MATRICULA
   DROP CONSTRAINT FK_MATRICUL_SE_REALIZ_PERIODO_;

ALTER TABLE OFERTA_ASIGNATURA
   DROP CONSTRAINT FK_OFERTA_A_DESIGNADO_DOCENTE;

ALTER TABLE OFERTA_ASIGNATURA
   DROP CONSTRAINT FK_OFERTA_A_TIENE_ASI_ASIGNATU;

ALTER TABLE OFERTA_ASIGNATURA
   DROP CONSTRAINT FK_OFERTA_A_TIENE_PER_PERIODO_;

ALTER TABLE PRESTAMO
   DROP CONSTRAINT FK_PRESTAMO_ES_PRESTA_LIBRO;

ALTER TABLE PRESTAMO
   DROP CONSTRAINT FK_PRESTAMO_SOLICITA__ESTUDIAN;

ALTER TABLE PROCESO_TITULACION
   DROP CONSTRAINT FK_PROCESO__SOLICITA__ESTUDIAN;

ALTER TABLE PROCESO_TITULACION
   DROP CONSTRAINT FK_PROCESO__TUTORA_PR_DOCENTE;

ALTER TABLE PROYECTO_INVESTIGACION
   DROP CONSTRAINT FK_PROYECTO_DIRIGE_PR_DOCENTE;

ALTER TABLE PROYECTO_INVESTIGACION
   DROP CONSTRAINT FK_PROYECTO_GESTIONA__DEPARTAM;

ALTER TABLE PUBLICACION
   DROP CONSTRAINT FK_PUBLICAC_PRODUCE_P_PROYECTO;

ALTER TABLE TIENE_PRERREQUISITO
   DROP CONSTRAINT FK_PRERREQ_ASIG_HIJA;

ALTER TABLE TIENE_PRERREQUISITO
   DROP CONSTRAINT FK_PRERREQ_ASIG_PADRE;

ALTER TABLE TITULO_ACADEMICO
   DROP CONSTRAINT FK_TITULO_A_POSEE_TIT_DOCENTE;

ALTER TABLE TRIBUNAL_GRADO
   DROP CONSTRAINT FK_TRIBUNAL_TRIBUNAL__PROCESO_;

ALTER TABLE TRIBUNAL_GRADO
   DROP CONSTRAINT FK_TRIBUNAL_TRIBUNAL__DOCENTE;

DROP INDEX ES_TIPO_BECA_FK;

DROP INDEX RECIBE_BECA_FK;

DROP TABLE ASIGNACION_BECA CASCADE CONSTRAINTS;

DROP TABLE ASIGNATURA CASCADE CONSTRAINTS;

DROP TABLE AULA CASCADE CONSTRAINTS;

DROP INDEX TIENE_AUTORES_FK;

DROP INDEX ESCRIBE_ARTICULO_FK;

DROP TABLE AUTORIA CASCADE CONSTRAINTS;

DROP INDEX GENERA_CALIFICACIONES_FK;

DROP INDEX TIENE_DETALLE_NOTAS_FK;

DROP TABLE CALIFICACION CASCADE CONSTRAINTS;

DROP INDEX TIENE_COORDINADOR2_FK;

DROP INDEX ADMINISTRA_CARRERA_FK;

DROP TABLE CARRERA CASCADE CONSTRAINTS;

DROP INDEX COLABORAN_EN_FK;

DROP INDEX COLABORAN_EN2_FK;

DROP TABLE COLABORAN_EN CASCADE CONSTRAINTS;

DROP INDEX CORREQUISITO_FK;

DROP INDEX CORREQUISITO2_FK;

DROP TABLE CORREQUISITO CASCADE CONSTRAINTS;

DROP INDEX TIENE_DEPARTAMENTOS_FK;

DROP TABLE DEPARTAMENTO CASCADE CONSTRAINTS;

DROP INDEX SE_PRESENTA_EN_FK;

DROP INDEX ES_PARTE_DE_MALLA_FK;

DROP TABLE DETALLE_MALLA CASCADE CONSTRAINTS;

DROP INDEX TIENE_COORDINADOR_FK;

DROP INDEX ENSENIAN_EN_FK;

DROP INDEX TIENE_DECANO_FK;

DROP TABLE DOCENTE CASCADE CONSTRAINTS;

DROP TABLE ESTUDIANTE CASCADE CONSTRAINTS;

DROP INDEX TIENE_DECANO2_FK;

DROP TABLE FACULTAD CASCADE CONSTRAINTS;

DROP INDEX OBTUVO_RESULTADOS_EN_FK;

DROP INDEX TIENE_HISTORIALES_FK;

DROP TABLE HISTORIAL_ACADEMICO CASCADE CONSTRAINTS;

DROP INDEX SE_DICTA_EN_FK;

DROP INDEX TIENE_HORARIO_FK;

DROP TABLE HORARIO_CLASE CASCADE CONSTRAINTS;

DROP TABLE LIBRO CASCADE CONSTRAINTS;

DROP INDEX TIENE_CARRERA_FK;

DROP TABLE MALLA_CURRICULAR CASCADE CONSTRAINTS;

DROP INDEX SE_REALIZAN_PERIODO_FK;

DROP INDEX HA_REALIZADO_MATRICULA_FK;

DROP TABLE MATRICULA CASCADE CONSTRAINTS;

DROP INDEX DESIGNADO_OFERTA_FK;

DROP INDEX TIENE_ASIGNATURA_FK;

DROP INDEX TIENE_PERIODO_FK;

DROP TABLE OFERTA_ASIGNATURA CASCADE CONSTRAINTS;

DROP TABLE PERIODO_ACADEMICO CASCADE CONSTRAINTS;

DROP INDEX ES_PRESTADO_FK;

DROP INDEX SOLICITA_LIBRO_FK;

DROP TABLE PRESTAMO CASCADE CONSTRAINTS;

DROP INDEX TUTORA_PROCESO_FK;

DROP INDEX SOLICITA_TITULACION_FK;

DROP TABLE PROCESO_TITULACION CASCADE CONSTRAINTS;

DROP INDEX GESTIONA_INVESTIGACION_FK;

DROP INDEX DIRIGE_PROYECTO_FK;

DROP TABLE PROYECTO_INVESTIGACION CASCADE CONSTRAINTS;

DROP INDEX PRODUCE_PUBLICACION_FK;

DROP TABLE PUBLICACION CASCADE CONSTRAINTS;

DROP INDEX TIENE_PRERREQUISITO_FK;

DROP INDEX TIENE_PRERREQUISITO2_FK;

DROP TABLE TIENE_PRERREQUISITO CASCADE CONSTRAINTS;

DROP TABLE TIPO_BECA CASCADE CONSTRAINTS;

DROP INDEX POSEE_TITULO_FK;

DROP TABLE TITULO_ACADEMICO CASCADE CONSTRAINTS;

DROP INDEX TRIBUNAL_GRADO_FK;

DROP INDEX TRIBUNAL_GRADO2_FK;

DROP TABLE TRIBUNAL_GRADO CASCADE CONSTRAINTS;

/*==============================================================*/
/* Table: ASIGNACION_BECA                                       */
/*==============================================================*/
CREATE TABLE ASIGNACION_BECA 
(
   FECHA_ASIGNACION     DATE                 NOT NULL,
   ID_ESTUDIANTE        INTEGER,
   ID_BECA              INTEGER,
   PORCENTAJE_COBERTURA NUMBER(4,2)          NOT NULL,
   MONTO_ALIMENTACION   NUMBER(6,2),
   CONSTRAINT PK_ASIGNACION_BECA PRIMARY KEY (FECHA_ASIGNACION)
);

/*==============================================================*/
/* Index: RECIBE_BECA_FK                                        */
/*==============================================================*/
CREATE INDEX RECIBE_BECA_FK ON ASIGNACION_BECA (
   ID_ESTUDIANTE ASC
);

/*==============================================================*/
/* Index: ES_TIPO_BECA_FK                                       */
/*==============================================================*/
CREATE INDEX ES_TIPO_BECA_FK ON ASIGNACION_BECA (
   ID_BECA ASC
);

/*==============================================================*/
/* Table: ASIGNATURA                                            */
/*==============================================================*/
CREATE TABLE ASIGNATURA 
(
   ID_ASIGNATURA        INTEGER              NOT NULL,
   CODIGO_ASIGNATURA    VARCHAR2(15)         NOT NULL,
   NOMBRE_ASIGNATURA    VARCHAR2(100)        NOT NULL,
   NUMERO_CREDITOS      INTEGER              NOT NULL,
   TIPO_ASIGNATURA      VARCHAR2(50)         NOT NULL,
   AREA_CONOCIMIENTO    VARCHAR2(50)         NOT NULL,
   CONSTRAINT PK_ASIGNATURA PRIMARY KEY (ID_ASIGNATURA)
);

/*==============================================================*/
/* Table: AULA                                                  */
/*==============================================================*/
CREATE TABLE AULA 
(
   ID_AULA              INTEGER              NOT NULL,
   EDIFICIO_AULA        VARCHAR2(10)         NOT NULL,
   PISO_AULA            INTEGER              NOT NULL,
   NUMERO_AULA          VARCHAR2(10)         NOT NULL,
   CAPACIDAD_ESTUDIANTES INTEGER              NOT NULL,
   TIPO_AULA            VARCHAR2(30)         NOT NULL,
   TIENE_PROYECTOR      SMALLINT             NOT NULL,
   DETALLE_EQUIPAMIENTO VARCHAR2(500),
   CONSTRAINT PK_AULA PRIMARY KEY (ID_AULA)
);

/*==============================================================*/
/* Table: AUTORIA                                               */
/*==============================================================*/
CREATE TABLE AUTORIA 
(
   ID_PUBLICACION       INTEGER              NOT NULL,
   ID_DOCENTE           INTEGER              NOT NULL,
   ORDEN_AUTOR          INTEGER              NOT NULL,
   CONSTRAINT PK_AUTORIA PRIMARY KEY (ID_PUBLICACION, ID_DOCENTE)
);

/*==============================================================*/
/* Index: ESCRIBE_ARTICULO_FK                                   */
/*==============================================================*/
CREATE INDEX ESCRIBE_ARTICULO_FK ON AUTORIA (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Index: TIENE_AUTORES_FK                                      */
/*==============================================================*/
CREATE INDEX TIENE_AUTORES_FK ON AUTORIA (
   ID_PUBLICACION ASC
);

/*==============================================================*/
/* Table: CALIFICACION                                          */
/*==============================================================*/
CREATE TABLE CALIFICACION 
(
   ID_CALIFICACION      INTEGER              NOT NULL,
   ID_MATRICULA         INTEGER,
   ID_OFERTA            INTEGER,
   NOTA_PARCIAL_1       NUMBER(4,2)          NOT NULL,
   NOTA_PARCIAL_2       NUMBER(4,2),
   NOTA_FINAL           NUMBER(4,2),
   NOTA_SUPLETORIO      NUMBER(4,2),
   NOTA_MEJORAMIENTO    NUMBER(4,2),
   ESTADO_APROBACION    VARCHAR2(20),
   ASISTENCIA_PORCENTAJE NUMBER(5,2)          NOT NULL,
   CONSTRAINT PK_CALIFICACION PRIMARY KEY (ID_CALIFICACION)
);

/*==============================================================*/
/* Index: TIENE_DETALLE_NOTAS_FK                                */
/*==============================================================*/
CREATE INDEX TIENE_DETALLE_NOTAS_FK ON CALIFICACION (
   ID_MATRICULA ASC
);

/*==============================================================*/
/* Index: GENERA_CALIFICACIONES_FK                              */
/*==============================================================*/
CREATE INDEX GENERA_CALIFICACIONES_FK ON CALIFICACION (
   ID_OFERTA ASC
);

/*==============================================================*/
/* Table: CARRERA                                               */
/*==============================================================*/
CREATE TABLE CARRERA 
(
   ID_CARRERA           INTEGER              NOT NULL,
   ID_FACULTAD          INTEGER,
   ID_DOCENTE           INTEGER,
   NOMBRE_CARRERA       VARCHAR2(100)        NOT NULL,
   NIVEL_CARRERA        VARCHAR2(20)         NOT NULL,
   MODALIDAD_CARRERA    VARCHAR2(20)         NOT NULL,
   DURACION_SEMESTRES   INTEGER              NOT NULL,
   CONSTRAINT PK_CARRERA PRIMARY KEY (ID_CARRERA)
);

/*==============================================================*/
/* Index: ADMINISTRA_CARRERA_FK                                 */
/*==============================================================*/
CREATE INDEX ADMINISTRA_CARRERA_FK ON CARRERA (
   ID_FACULTAD ASC
);

/*==============================================================*/
/* Index: TIENE_COORDINADOR2_FK                                 */
/*==============================================================*/
CREATE INDEX TIENE_COORDINADOR2_FK ON CARRERA (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Table: COLABORAN_EN                                          */
/*==============================================================*/
CREATE TABLE COLABORAN_EN 
(
   ID_PROYECTO          INTEGER              NOT NULL,
   ID_DOCENTE           INTEGER              NOT NULL,
   CONSTRAINT PK_COLABORAN_EN PRIMARY KEY (ID_PROYECTO, ID_DOCENTE)
);

/*==============================================================*/
/* Index: COLABORAN_EN2_FK                                      */
/*==============================================================*/
CREATE INDEX COLABORAN_EN2_FK ON COLABORAN_EN (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Index: COLABORAN_EN_FK                                       */
/*==============================================================*/
CREATE INDEX COLABORAN_EN_FK ON COLABORAN_EN (
   ID_PROYECTO ASC
);

/*==============================================================*/
/* Table: CORREQUISITO                                          */
/*==============================================================*/
CREATE TABLE CORREQUISITO 
(
   ASI_ID_ASIGNATURA    INTEGER              NOT NULL,
   ID_ASIGNATURA        INTEGER              NOT NULL,
   CONSTRAINT PK_CORREQUISITO PRIMARY KEY (ASI_ID_ASIGNATURA, ID_ASIGNATURA)
);

/*==============================================================*/
/* Index: CORREQUISITO2_FK                                      */
/*==============================================================*/
CREATE INDEX CORREQUISITO2_FK ON CORREQUISITO (
   ID_ASIGNATURA ASC
);

/*==============================================================*/
/* Index: CORREQUISITO_FK                                       */
/*==============================================================*/
CREATE INDEX CORREQUISITO_FK ON CORREQUISITO (
   ASI_ID_ASIGNATURA ASC
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
CREATE TABLE DEPARTAMENTO 
(
   ID_DEPARTAMENTO      INTEGER              NOT NULL,
   ID_FACULTAD          INTEGER,
   NOMBRE_DEPARTAMENTO  VARCHAR2(100)        NOT NULL,
   CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (ID_DEPARTAMENTO)
);

/*==============================================================*/
/* Index: TIENE_DEPARTAMENTOS_FK                                */
/*==============================================================*/
CREATE INDEX TIENE_DEPARTAMENTOS_FK ON DEPARTAMENTO (
   ID_FACULTAD ASC
);

/*==============================================================*/
/* Table: DETALLE_MALLA                                         */
/*==============================================================*/
CREATE TABLE DETALLE_MALLA 
(
   ID_ASIGNATURA        INTEGER              NOT NULL,
   ID_MALLA             INTEGER              NOT NULL,
   SEMESTRE_SUGERIDO    INTEGER              NOT NULL,
   HORAS_TEORICAS       INTEGER              NOT NULL,
   HORAS_PRACTICAS      INTEGER              NOT NULL,
   CONSTRAINT PK_DETALLE_MALLA PRIMARY KEY (ID_ASIGNATURA, ID_MALLA)
);

/*==============================================================*/
/* Index: ES_PARTE_DE_MALLA_FK                                  */
/*==============================================================*/
CREATE INDEX ES_PARTE_DE_MALLA_FK ON DETALLE_MALLA (
   ID_MALLA ASC
);

/*==============================================================*/
/* Index: SE_PRESENTA_EN_FK                                     */
/*==============================================================*/
CREATE INDEX SE_PRESENTA_EN_FK ON DETALLE_MALLA (
   ID_ASIGNATURA ASC
);

/*==============================================================*/
/* Table: DOCENTE                                               */
/*==============================================================*/
CREATE TABLE DOCENTE 
(
   ID_DOCENTE           INTEGER              NOT NULL,
   ID_FACULTAD          INTEGER,
   FAC_ID_FACULTAD      INTEGER,
   ID_CARRERA           INTEGER,
   NUMERO_UNICO         VARCHAR2(9)          NOT NULL,
   CEDULA               VARCHAR2(10)         NOT NULL,
   NOMBRES_DOCENTE      VARCHAR2(100)        NOT NULL,
   APELLIDOS_DOCENTE    VARCHAR2(100)        NOT NULL,
   EMAIL_INSTITUCIONAL  VARCHAR2(100)        NOT NULL,
   TIPO_PROFESOR        VARCHAR2(50)         NOT NULL,
   CATEGORIA_DOCENTE    VARCHAR2(50)         NOT NULL,
   FECHA_INGRESO        DATE                 NOT NULL,
   CONSTRAINT PK_DOCENTE PRIMARY KEY (ID_DOCENTE)
);

/*==============================================================*/
/* Index: TIENE_DECANO_FK                                       */
/*==============================================================*/
CREATE INDEX TIENE_DECANO_FK ON DOCENTE (
   ID_FACULTAD ASC
);

/*==============================================================*/
/* Index: ENSENIAN_EN_FK                                        */
/*==============================================================*/
CREATE INDEX ENSENIAN_EN_FK ON DOCENTE (
   FAC_ID_FACULTAD ASC
);

/*==============================================================*/
/* Index: TIENE_COORDINADOR_FK                                  */
/*==============================================================*/
CREATE INDEX TIENE_COORDINADOR_FK ON DOCENTE (
   ID_CARRERA ASC
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
CREATE TABLE ESTUDIANTE 
(
   ID_ESTUDIANTE        INTEGER              NOT NULL,
   NUMERO_UNICO         VARCHAR2(9)          NOT NULL,
   CEDULA               VARCHAR2(10)         NOT NULL,
   NOMBRES_ESTUDIANTE   VARCHAR2(100)        NOT NULL,
   APELLIDOS_ESTUDIANTE VARCHAR2(100)        NOT NULL,
   EMAIL_INSTITUCIONAL  VARCHAR2(100)        NOT NULL,
   FECHA_INGRESO        DATE                 NOT NULL,
   ESTADO_ESTUDIANTE    VARCHAR2(20)         NOT NULL,
   IRA                  NUMBER(4,2),
   CONSTRAINT PK_ESTUDIANTE PRIMARY KEY (ID_ESTUDIANTE)
);

/*==============================================================*/
/* Table: FACULTAD                                              */
/*==============================================================*/
CREATE TABLE FACULTAD 
(
   ID_FACULTAD          INTEGER              NOT NULL,
   ID_DOCENTE           INTEGER,
   NOMBRE_FACULTAD      VARCHAR2(100)        NOT NULL,
   NUMERO_EDIFICIO      INTEGER              NOT NULL,
   CONSTRAINT PK_FACULTAD PRIMARY KEY (ID_FACULTAD)
);

/*==============================================================*/
/* Index: TIENE_DECANO2_FK                                      */
/*==============================================================*/
CREATE INDEX TIENE_DECANO2_FK ON FACULTAD (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Table: HISTORIAL_ACADEMICO                                   */
/*==============================================================*/
CREATE TABLE HISTORIAL_ACADEMICO 
(
   ID_HISTORIAL         INTEGER              NOT NULL,
   ID_ESTUDIANTE        INTEGER,
   ID_PERIODO           INTEGER,
   NOTA_DEFINITIVA      NUMBER(4,2)          NOT NULL,
   ESTADO_MATERIA       VARCHAR2(20)         NOT NULL,
   CONSTRAINT PK_HISTORIAL_ACADEMICO PRIMARY KEY (ID_HISTORIAL)
);

/*==============================================================*/
/* Index: TIENE_HISTORIALES_FK                                  */
/*==============================================================*/
CREATE INDEX TIENE_HISTORIALES_FK ON HISTORIAL_ACADEMICO (
   ID_ESTUDIANTE ASC
);

/*==============================================================*/
/* Index: OBTUVO_RESULTADOS_EN_FK                               */
/*==============================================================*/
CREATE INDEX OBTUVO_RESULTADOS_EN_FK ON HISTORIAL_ACADEMICO (
   ID_PERIODO ASC
);

/*==============================================================*/
/* Table: HORARIO_CLASE                                         */
/*==============================================================*/
CREATE TABLE HORARIO_CLASE 
(
   ID_HORARIO           INTEGER              NOT NULL,
   ID_AULA              INTEGER,
   ID_OFERTA            INTEGER,
   DIA_SEMANA           VARCHAR2(15)         NOT NULL,
   HORA_INICIO          DATE                 NOT NULL,
   HORA_FIN             DATE                 NOT NULL,
   CONSTRAINT PK_HORARIO_CLASE PRIMARY KEY (ID_HORARIO)
);

/*==============================================================*/
/* Index: TIENE_HORARIO_FK                                      */
/*==============================================================*/
CREATE INDEX TIENE_HORARIO_FK ON HORARIO_CLASE (
   ID_AULA ASC
);

/*==============================================================*/
/* Index: SE_DICTA_EN_FK                                        */
/*==============================================================*/
CREATE INDEX SE_DICTA_EN_FK ON HORARIO_CLASE (
   ID_OFERTA ASC
);

/*==============================================================*/
/* Table: LIBRO                                                 */
/*==============================================================*/
CREATE TABLE LIBRO 
(
   ID_LIBRO             INTEGER              NOT NULL,
   ISBN                 VARCHAR2(20)         NOT NULL,
   TITULO_LIBRO         VARCHAR2(200)        NOT NULL,
   AUTOR                VARCHAR2(100)        NOT NULL,
   EDITORIAL            VARCHAR2(100)        NOT NULL,
   STOCK_DISPONIBLE     INTEGER              NOT NULL,
   CONSTRAINT PK_LIBRO PRIMARY KEY (ID_LIBRO)
);

/*==============================================================*/
/* Table: MALLA_CURRICULAR                                      */
/*==============================================================*/
CREATE TABLE MALLA_CURRICULAR 
(
   ID_MALLA             INTEGER              NOT NULL,
   ID_CARRERA           INTEGER,
   CODIGO_COHORTE       VARCHAR2(10)         NOT NULL,
   FECHA_APROBACION     DATE                 NOT NULL,
   TOTAL_CREDITOS       INTEGER              NOT NULL,
   ESTADO_MALLA         VARCHAR2(20)         NOT NULL,
   CONSTRAINT PK_MALLA_CURRICULAR PRIMARY KEY (ID_MALLA)
);

/*==============================================================*/
/* Index: TIENE_CARRERA_FK                                      */
/*==============================================================*/
CREATE INDEX TIENE_CARRERA_FK ON MALLA_CURRICULAR (
   ID_CARRERA ASC
);

/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
CREATE TABLE MATRICULA 
(
   ID_MATRICULA         INTEGER              NOT NULL,
   ID_ESTUDIANTE        INTEGER,
   ID_PERIODO           INTEGER,
   FECHA_REGISTRO       DATE                 NOT NULL,
   FORMA_MATRICULA      VARCHAR2(20)         NOT NULL,
   CONSTRAINT PK_MATRICULA PRIMARY KEY (ID_MATRICULA)
);

/*==============================================================*/
/* Index: HA_REALIZADO_MATRICULA_FK                             */
/*==============================================================*/
CREATE INDEX HA_REALIZADO_MATRICULA_FK ON MATRICULA (
   ID_ESTUDIANTE ASC
);

/*==============================================================*/
/* Index: SE_REALIZAN_PERIODO_FK                                */
/*==============================================================*/
CREATE INDEX SE_REALIZAN_PERIODO_FK ON MATRICULA (
   ID_PERIODO ASC
);

/*==============================================================*/
/* Table: OFERTA_ASIGNATURA                                     */
/*==============================================================*/
CREATE TABLE OFERTA_ASIGNATURA 
(
   ID_OFERTA            INTEGER              NOT NULL,
   ID_PERIODO           INTEGER,
   ID_ASIGNATURA        INTEGER,
   ID_DOCENTE           INTEGER,
   CODIGO_PARALELO      VARCHAR2(10)         NOT NULL,
   CUPO_MAXIMO          INTEGER              NOT NULL,
   CUPO_DISPONIBLE      INTEGER              NOT NULL,
   CONSTRAINT PK_OFERTA_ASIGNATURA PRIMARY KEY (ID_OFERTA)
);

/*==============================================================*/
/* Index: TIENE_PERIODO_FK                                      */
/*==============================================================*/
CREATE INDEX TIENE_PERIODO_FK ON OFERTA_ASIGNATURA (
   ID_PERIODO ASC
);

/*==============================================================*/
/* Index: TIENE_ASIGNATURA_FK                                   */
/*==============================================================*/
CREATE INDEX TIENE_ASIGNATURA_FK ON OFERTA_ASIGNATURA (
   ID_ASIGNATURA ASC
);

/*==============================================================*/
/* Index: DESIGNADO_OFERTA_FK                                   */
/*==============================================================*/
CREATE INDEX DESIGNADO_OFERTA_FK ON OFERTA_ASIGNATURA (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Table: PERIODO_ACADEMICO                                     */
/*==============================================================*/
CREATE TABLE PERIODO_ACADEMICO 
(
   ID_PERIODO           INTEGER              NOT NULL,
   CODIGO_PERIODO       VARCHAR2(10)         NOT NULL,
   NOMBRE_PERIODO       VARCHAR2(10)         NOT NULL,
   FECHA_INICIO         DATE                 NOT NULL,
   FECHA_FIN            DATE                 NOT NULL,
   ESTADO_PERIODO       VARCHAR2(20)         NOT NULL,
   CONSTRAINT PK_PERIODO_ACADEMICO PRIMARY KEY (ID_PERIODO)
);

/*==============================================================*/
/* Table: PRESTAMO                                              */
/*==============================================================*/
CREATE TABLE PRESTAMO 
(
   FECHA_PRESTAMO       DATE                 NOT NULL,
   ID_ESTUDIANTE        INTEGER,
   ID_LIBRO             INTEGER,
   FECHA_DEVOLUCION_PREVISTA DATE                 NOT NULL,
   FECHA_DEVOLUCION_REAL DATE,
   CONSTRAINT PK_PRESTAMO PRIMARY KEY (FECHA_PRESTAMO)
);

/*==============================================================*/
/* Index: SOLICITA_LIBRO_FK                                     */
/*==============================================================*/
CREATE INDEX SOLICITA_LIBRO_FK ON PRESTAMO (
   ID_ESTUDIANTE ASC
);

/*==============================================================*/
/* Index: ES_PRESTADO_FK                                        */
/*==============================================================*/
CREATE INDEX ES_PRESTADO_FK ON PRESTAMO (
   ID_LIBRO ASC
);

/*==============================================================*/
/* Table: PROCESO_TITULACION                                    */
/*==============================================================*/
CREATE TABLE PROCESO_TITULACION 
(
   ID_PROCESO           INTEGER              NOT NULL,
   ID_ESTUDIANTE        INTEGER,
   ID_DOCENTE           INTEGER,
   MODALIDAD_PROCESO    VARCHAR2(30)         NOT NULL,
   TEMA_PROPUESTO       VARCHAR2(300)        NOT NULL,
   FECHA_DEFENSA        DATE,
   NOTA_FINAL_GRADO     NUMBER(4,2),
   ESTADO_PROCESO       VARCHAR2(20)         NOT NULL,
   CONSTRAINT PK_PROCESO_TITULACION PRIMARY KEY (ID_PROCESO)
);

/*==============================================================*/
/* Index: SOLICITA_TITULACION_FK                                */
/*==============================================================*/
CREATE INDEX SOLICITA_TITULACION_FK ON PROCESO_TITULACION (
   ID_ESTUDIANTE ASC
);

/*==============================================================*/
/* Index: TUTORA_PROCESO_FK                                     */
/*==============================================================*/
CREATE INDEX TUTORA_PROCESO_FK ON PROCESO_TITULACION (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Table: PROYECTO_INVESTIGACION                                */
/*==============================================================*/
CREATE TABLE PROYECTO_INVESTIGACION 
(
   ID_PROYECTO          INTEGER              NOT NULL,
   ID_DOCENTE           INTEGER,
   ID_DEPARTAMENTO      INTEGER,
   CODIGO_PROYECTO      VARCHAR2(20)         NOT NULL,
   TITULO_PROYECTO      VARCHAR2(200)        NOT NULL,
   LINEA_INVESTIGACION  VARCHAR2(100)        NOT NULL,
   PRESUPUESTO_ASIGNADO NUMBER(10,2)         NOT NULL,
   FECHA_INICIO         DATE                 NOT NULL,
   ESTADO_PROYECTO      VARCHAR2(20)         NOT NULL,
   CONSTRAINT PK_PROYECTO_INVESTIGACION PRIMARY KEY (ID_PROYECTO)
);

/*==============================================================*/
/* Index: DIRIGE_PROYECTO_FK                                    */
/*==============================================================*/
CREATE INDEX DIRIGE_PROYECTO_FK ON PROYECTO_INVESTIGACION (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Index: GESTIONA_INVESTIGACION_FK                             */
/*==============================================================*/
CREATE INDEX GESTIONA_INVESTIGACION_FK ON PROYECTO_INVESTIGACION (
   ID_DEPARTAMENTO ASC
);

/*==============================================================*/
/* Table: PUBLICACION                                           */
/*==============================================================*/
CREATE TABLE PUBLICACION 
(
   ID_PUBLICACION       INTEGER              NOT NULL,
   ID_PROYECTO          INTEGER,
   TITULO_PUBLICACION   VARCHAR2(100)        NOT NULL,
   DOI                  VARCHAR2(100)        NOT NULL,
   REVISTA              VARCHAR2(100)        NOT NULL,
   CONSTRAINT PK_PUBLICACION PRIMARY KEY (ID_PUBLICACION)
);

/*==============================================================*/
/* Index: PRODUCE_PUBLICACION_FK                                */
/*==============================================================*/
CREATE INDEX PRODUCE_PUBLICACION_FK ON PUBLICACION (
   ID_PROYECTO ASC
);

/*==============================================================*/
/* Table: TIENE_PRERREQUISITO                                   */
/*==============================================================*/
CREATE TABLE TIENE_PRERREQUISITO 
(
   ASI_ID_ASIGNATURA    INTEGER              NOT NULL,
   ID_ASIGNATURA        INTEGER              NOT NULL,
   CONSTRAINT PK_TIENE_PRERREQUISITO PRIMARY KEY (ASI_ID_ASIGNATURA, ID_ASIGNATURA)
);

/*==============================================================*/
/* Index: TIENE_PRERREQUISITO2_FK                               */
/*==============================================================*/
CREATE INDEX TIENE_PRERREQUISITO2_FK ON TIENE_PRERREQUISITO (
   ID_ASIGNATURA ASC
);

/*==============================================================*/
/* Index: TIENE_PRERREQUISITO_FK                                */
/*==============================================================*/
CREATE INDEX TIENE_PRERREQUISITO_FK ON TIENE_PRERREQUISITO (
   ASI_ID_ASIGNATURA ASC
);

/*==============================================================*/
/* Table: TIPO_BECA                                             */
/*==============================================================*/
CREATE TABLE TIPO_BECA 
(
   ID_BECA              INTEGER              NOT NULL,
   NOMBRE_BECA          VARCHAR2(100)        NOT NULL,
   CONSTRAINT PK_TIPO_BECA PRIMARY KEY (ID_BECA)
);

/*==============================================================*/
/* Table: TITULO_ACADEMICO                                      */
/*==============================================================*/
CREATE TABLE TITULO_ACADEMICO 
(
   ID_TITULO            INTEGER              NOT NULL,
   ID_DOCENTE           INTEGER,
   NOMBRE_TITULO        VARCHAR2(100)        NOT NULL,
   NIVEL_TITULO         VARCHAR2(50)         NOT NULL,
   UNIVERSIDAD          VARCHAR2(100)        NOT NULL,
   CONSTRAINT PK_TITULO_ACADEMICO PRIMARY KEY (ID_TITULO)
);

/*==============================================================*/
/* Index: POSEE_TITULO_FK                                       */
/*==============================================================*/
CREATE INDEX POSEE_TITULO_FK ON TITULO_ACADEMICO (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Table: TRIBUNAL_GRADO                                        */
/*==============================================================*/
CREATE TABLE TRIBUNAL_GRADO 
(
   ID_PROCESO           INTEGER              NOT NULL,
   ID_DOCENTE           INTEGER              NOT NULL,
   CONSTRAINT PK_TRIBUNAL_GRADO PRIMARY KEY (ID_PROCESO, ID_DOCENTE)
);

/*==============================================================*/
/* Index: TRIBUNAL_GRADO2_FK                                    */
/*==============================================================*/
CREATE INDEX TRIBUNAL_GRADO2_FK ON TRIBUNAL_GRADO (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Index: TRIBUNAL_GRADO_FK                                     */
/*==============================================================*/
CREATE INDEX TRIBUNAL_GRADO_FK ON TRIBUNAL_GRADO (
   ID_PROCESO ASC
);

PROMPT === APLICANDO RESTRICCIONES UNIQUE ===

-- 1. ESTUDIANTES (Identificación y Correo)
-- Regla: Cada estudiante tiene matrícula única, cédula única y email único.
ALTER TABLE ESTUDIANTE ADD CONSTRAINT UQ_EST_CEDULA UNIQUE (CEDULA);
ALTER TABLE ESTUDIANTE ADD CONSTRAINT UQ_EST_MATRICULA UNIQUE (NUMERO_UNICO);
ALTER TABLE ESTUDIANTE ADD CONSTRAINT UQ_EST_EMAIL UNIQUE (EMAIL_INSTITUCIONAL);

-- 2. DOCENTES (Identificación y Correo)
-- Regla: Cada docente tiene código único, cédula única y email único.
ALTER TABLE DOCENTE ADD CONSTRAINT UQ_DOC_CEDULA UNIQUE (CEDULA);
ALTER TABLE DOCENTE ADD CONSTRAINT UQ_DOC_CODIGO UNIQUE (NUMERO_UNICO);
ALTER TABLE DOCENTE ADD CONSTRAINT UQ_DOC_EMAIL UNIQUE (EMAIL_INSTITUCIONAL);

-- 3. ASIGNATURAS (Código Académico)
-- Regla: El código de la materia (ej: CS-101) no puede repetirse.
ALTER TABLE ASIGNATURA ADD CONSTRAINT UQ_ASIG_CODIGO UNIQUE (CODIGO_ASIGNATURA);

-- 4. PERIODOS ACADÉMICOS (Código de Semestre)
-- Regla: No pueden existir dos periodos con el mismo código (ej: 2024-A).
ALTER TABLE PERIODO_ACADEMICO ADD CONSTRAINT UQ_PERIODO_CODIGO UNIQUE (CODIGO_PERIODO);

-- 5. LIBROS (ISBN)
-- Regla: El ISBN es el identificador universal único del libro.
ALTER TABLE LIBRO ADD CONSTRAINT UQ_LIBRO_ISBN UNIQUE (ISBN);

-- 6. PROYECTOS DE INVESTIGACIÓN (Código)
-- Regla: Cada proyecto tiene un código interno único.
ALTER TABLE PROYECTO_INVESTIGACION ADD CONSTRAINT UQ_PROY_CODIGO UNIQUE (CODIGO_PROYECTO);

-- Creacion de secuencias
CREATE SEQUENCE SEQ_FACULTAD START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_CARRERA START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_DEPARTAMENTO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_DOCENTE START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ESTUDIANTE START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ASIGNATURA START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_MALLA START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_PERIODO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_OFERTA START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_MATRICULA START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_CALIFICACION START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_HISTORIAL START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_PROYECTO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_PUBLICACION START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_TITULO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_LIBRO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_PROCESO_TIT START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_AULA START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_HORARIO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_TIPO_BECA START WITH 1 INCREMENT BY 1; 

ALTER TABLE ASIGNACION_BECA
   ADD CONSTRAINT FK_ASIGNACI_ES_TIPO_B_TIPO_BEC FOREIGN KEY (ID_BECA)
      REFERENCES TIPO_BECA (ID_BECA);

ALTER TABLE ASIGNACION_BECA
   ADD CONSTRAINT FK_ASIGNACI_RECIBE_BE_ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE);

ALTER TABLE AUTORIA
   ADD CONSTRAINT FK_AUTORIA_ESCRIBE_A_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE AUTORIA
   ADD CONSTRAINT FK_AUTORIA_TIENE_AUT_PUBLICAC FOREIGN KEY (ID_PUBLICACION)
      REFERENCES PUBLICACION (ID_PUBLICACION);

ALTER TABLE CALIFICACION
   ADD CONSTRAINT FK_CALIFICA_GENERA_CA_OFERTA_A FOREIGN KEY (ID_OFERTA)
      REFERENCES OFERTA_ASIGNATURA (ID_OFERTA);

ALTER TABLE CALIFICACION
   ADD CONSTRAINT FK_CALIFICA_TIENE_DET_MATRICUL FOREIGN KEY (ID_MATRICULA)
      REFERENCES MATRICULA (ID_MATRICULA);

ALTER TABLE CARRERA
   ADD CONSTRAINT FK_CARRERA_ADMINISTR_FACULTAD FOREIGN KEY (ID_FACULTAD)
      REFERENCES FACULTAD (ID_FACULTAD);

ALTER TABLE CARRERA
   ADD CONSTRAINT FK_CARRERA_TIENE_COO_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE COLABORAN_EN
   ADD CONSTRAINT FK_COLABORA_COLABORAN_PROYECTO FOREIGN KEY (ID_PROYECTO)
      REFERENCES PROYECTO_INVESTIGACION (ID_PROYECTO);

ALTER TABLE COLABORAN_EN
   ADD CONSTRAINT FK_COLABORA_COLABORAN_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE CORREQUISITO
   ADD CONSTRAINT FK_CORREQ_ASIG_A FOREIGN KEY (ASI_ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA);

ALTER TABLE CORREQUISITO
   ADD CONSTRAINT FK_CORREQ_ASIG_B FOREIGN KEY (ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA);

ALTER TABLE DEPARTAMENTO
   ADD CONSTRAINT FK_DEPARTAM_TIENE_DEP_FACULTAD FOREIGN KEY (ID_FACULTAD)
      REFERENCES FACULTAD (ID_FACULTAD);

ALTER TABLE DETALLE_MALLA
   ADD CONSTRAINT FK_DETALLE__ES_PARTE__MALLA_CU FOREIGN KEY (ID_MALLA)
      REFERENCES MALLA_CURRICULAR (ID_MALLA);

ALTER TABLE DETALLE_MALLA
   ADD CONSTRAINT FK_DETALLE__SE_PRESEN_ASIGNATU FOREIGN KEY (ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA);

ALTER TABLE DOCENTE
   ADD CONSTRAINT FK_DOCENTE_ENSENIAN__FACULTAD FOREIGN KEY (FAC_ID_FACULTAD)
      REFERENCES FACULTAD (ID_FACULTAD);

ALTER TABLE DOCENTE
   ADD CONSTRAINT FK_DOCENTE_TIENE_COO_CARRERA FOREIGN KEY (ID_CARRERA)
      REFERENCES CARRERA (ID_CARRERA);

ALTER TABLE DOCENTE
   ADD CONSTRAINT FK_DOCENTE_TIENE_DEC_FACULTAD FOREIGN KEY (ID_FACULTAD)
      REFERENCES FACULTAD (ID_FACULTAD);

ALTER TABLE FACULTAD
   ADD CONSTRAINT FK_FACULTAD_TIENE_DEC_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE HISTORIAL_ACADEMICO
   ADD CONSTRAINT FK_HISTORIA_OBTUVO_RE_PERIODO_ FOREIGN KEY (ID_PERIODO)
      REFERENCES PERIODO_ACADEMICO (ID_PERIODO);

ALTER TABLE HISTORIAL_ACADEMICO
   ADD CONSTRAINT FK_HISTORIA_TIENE_HIS_ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE);

ALTER TABLE HORARIO_CLASE
   ADD CONSTRAINT FK_HORARIO__SE_DICTA__OFERTA_A FOREIGN KEY (ID_OFERTA)
      REFERENCES OFERTA_ASIGNATURA (ID_OFERTA);

ALTER TABLE HORARIO_CLASE
   ADD CONSTRAINT FK_HORARIO__TIENE_HOR_AULA FOREIGN KEY (ID_AULA)
      REFERENCES AULA (ID_AULA);

ALTER TABLE MALLA_CURRICULAR
   ADD CONSTRAINT FK_MALLA_CU_TIENE_CAR_CARRERA FOREIGN KEY (ID_CARRERA)
      REFERENCES CARRERA (ID_CARRERA);

ALTER TABLE MATRICULA
   ADD CONSTRAINT FK_MATRICUL_HA_REALIZ_ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE);

ALTER TABLE MATRICULA
   ADD CONSTRAINT FK_MATRICUL_SE_REALIZ_PERIODO_ FOREIGN KEY (ID_PERIODO)
      REFERENCES PERIODO_ACADEMICO (ID_PERIODO);

ALTER TABLE OFERTA_ASIGNATURA
   ADD CONSTRAINT FK_OFERTA_A_DESIGNADO_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE OFERTA_ASIGNATURA
   ADD CONSTRAINT FK_OFERTA_A_TIENE_ASI_ASIGNATU FOREIGN KEY (ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA);

ALTER TABLE OFERTA_ASIGNATURA
   ADD CONSTRAINT FK_OFERTA_A_TIENE_PER_PERIODO_ FOREIGN KEY (ID_PERIODO)
      REFERENCES PERIODO_ACADEMICO (ID_PERIODO);

ALTER TABLE PRESTAMO
   ADD CONSTRAINT FK_PRESTAMO_ES_PRESTA_LIBRO FOREIGN KEY (ID_LIBRO)
      REFERENCES LIBRO (ID_LIBRO);

ALTER TABLE PRESTAMO
   ADD CONSTRAINT FK_PRESTAMO_SOLICITA__ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE);

ALTER TABLE PROCESO_TITULACION
   ADD CONSTRAINT FK_PROCESO__SOLICITA__ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE);

ALTER TABLE PROCESO_TITULACION
   ADD CONSTRAINT FK_PROCESO__TUTORA_PR_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE PROYECTO_INVESTIGACION
   ADD CONSTRAINT FK_PROYECTO_DIRIGE_PR_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE PROYECTO_INVESTIGACION
   ADD CONSTRAINT FK_PROYECTO_GESTIONA__DEPARTAM FOREIGN KEY (ID_DEPARTAMENTO)
      REFERENCES DEPARTAMENTO (ID_DEPARTAMENTO);

ALTER TABLE PUBLICACION
   ADD CONSTRAINT FK_PUBLICAC_PRODUCE_P_PROYECTO FOREIGN KEY (ID_PROYECTO)
      REFERENCES PROYECTO_INVESTIGACION (ID_PROYECTO);

ALTER TABLE TIENE_PRERREQUISITO
   ADD CONSTRAINT FK_PRERREQ_ASIG_HIJA FOREIGN KEY (ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA);

ALTER TABLE TIENE_PRERREQUISITO
   ADD CONSTRAINT FK_PRERREQ_ASIG_PADRE FOREIGN KEY (ASI_ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA);

ALTER TABLE TITULO_ACADEMICO
   ADD CONSTRAINT FK_TITULO_A_POSEE_TIT_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE TRIBUNAL_GRADO
   ADD CONSTRAINT FK_TRIBUNAL_TRIBUNAL__PROCESO_ FOREIGN KEY (ID_PROCESO)
      REFERENCES PROCESO_TITULACION (ID_PROCESO);

ALTER TABLE TRIBUNAL_GRADO
   ADD CONSTRAINT FK_TRIBUNAL_TRIBUNAL__DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);



/*
SEGUNDA FASE: Disenio de reglas complejas, en donde se modela la logica dificil, tales como prerrequisitos exclusivos,
mallas versionadas y horarios/aulas. Se asegura que las foreign keys tengan la integridad correcta (CASCADE/RESTRICT).
Ademas, se crean los uniques y se especifican los constraints para cada tabla e indice.
*/

--------------------------------------------------------
--  DDL for Table ASIGNACION_BECA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" 
   (	"FECHA_ASIGNACION" DATE, 
	"ID_ESTUDIANTE" NUMBER(*,0), 
	"ID_BECA" NUMBER(*,0), 
	"PORCENTAJE_COBERTURA" NUMBER(4,2), 
	"MONTO_ALIMENTACION" NUMBER(6,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA"."FECHA_ASIGNACION" IS 'Fecha en la que el estudiante recibe la beca. Campo obligatorio.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA"."ID_ESTUDIANTE" IS 'Identificador del estudiante que recibe la beca. Clave foránea hacia estudiante(id_estudiante).';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA"."ID_BECA" IS 'Identificador de la beca asignada al estudiante. Clave foránea hacia beca(id_beca).';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA"."PORCENTAJE_COBERTURA" IS 'Porcentaje de cobertura financiera aplicada a la beca (0–100%). Campo obligatorio.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA"."MONTO_ALIMENTACION" IS 'Monto monetario asignado para la cobertura de alimentación del estudiante.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA"  IS 'Registra la relación entre estudiantes y becas asignadas. Cada registro representa una asignación específica, indicando la fecha y el porcentaje de cobertura. Referencia a estudiante(id_estudiante) y beca(id_beca). Los campos fecha_asignacion y porcentaje_cobertura son obligatorios.';
--------------------------------------------------------
--  DDL for Table ASIGNATURA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" 
   (	"ID_ASIGNATURA" NUMBER(*,0), 
	"CODIGO_ASIGNATURA" VARCHAR2(15 BYTE), 
	"NOMBRE_ASIGNATURA" VARCHAR2(100 BYTE), 
	"NUMERO_CREDITOS" NUMBER(*,0), 
	"TIPO_ASIGNATURA" VARCHAR2(50 BYTE), 
	"AREA_CONOCIMIENTO" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNATURA"."ID_ASIGNATURA" IS 'Clave primaria que identifica a cada asignatura registrada. Campo obligatorio.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNATURA"."CODIGO_ASIGNATURA" IS 'Código único asignado a cada asignatura. Campo obligatorio.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNATURA"."NOMBRE_ASIGNATURA" IS 'Nombre oficial de la asignatura. Campo obligatorio.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNATURA"."NUMERO_CREDITOS" IS 'Número de créditos académicos de la asignatura. Campo obligatorio.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNATURA"."TIPO_ASIGNATURA" IS 'Clasificación de la asignatura (por ejemplo, de carrera, formación básica, optativa, etc.). Campo obligatorio.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNATURA"."AREA_CONOCIMIENTO" IS 'Área de conocimiento o facultad a la que pertenece la asignatura. Campo obligatorio.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA"  IS 'Contiene el catálogo de asignaturas de la institución, incluyendo su código, nombre, área de conocimiento, créditos y clasificación académica. La clave primaria es id_asignatura.';
--------------------------------------------------------
--  DDL for Table AULA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."AULA" 
   (	"ID_AULA" NUMBER(*,0), 
	"EDIFICIO_AULA" VARCHAR2(10 BYTE), 
	"PISO_AULA" NUMBER(*,0), 
	"NUMERO_AULA" VARCHAR2(10 BYTE), 
	"CAPACIDAD_ESTUDIANTES" NUMBER(*,0), 
	"TIPO_AULA" VARCHAR2(30 BYTE), 
	"TIENE_PROYECTOR" NUMBER(*,0), 
	"DETALLE_EQUIPAMIENTO" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."ID_AULA" IS 'Clave primaria que identifica de manera única al aula. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."EDIFICIO_AULA" IS 'Edificio en el que se encuentra ubicada el aula. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."PISO_AULA" IS 'Piso del edificio donde está ubicada el aula. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."NUMERO_AULA" IS 'Número asignado al aula. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."CAPACIDAD_ESTUDIANTES" IS 'Cantidad máxima de estudiantes que puede albergar el aula. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."TIPO_AULA" IS 'Clasificación del aula (laboratorio, aula regular, etc.). Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."TIENE_PROYECTOR" IS 'Indica mediante valor booleano si el aula cuenta con proyector. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."DETALLE_EQUIPAMIENTO" IS 'Descripción detallada del equipamiento disponible en el aula.';
--------------------------------------------------------
--  DDL for Table AUTORIA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA" 
   (	"ID_PUBLICACION" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0), 
	"ORDEN_AUTOR" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AUTORIA"."ID_PUBLICACION" IS 'Identificador de la publicación asociada. Forma parte de la clave primaria compuesta y referencia a la tabla PUBLICACION. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AUTORIA"."ID_DOCENTE" IS 'Identificador del docente autor de la publicación. Forma parte de la clave primaria compuesta y referencia a la tabla DOCENTE. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AUTORIA"."ORDEN_AUTOR" IS 'Posición o prioridad del docente dentro de la autoría de la publicación (primer autor, segundo autor, etc.). Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA"  IS 'Tabla que relaciona publicaciones con docentes y define el orden de autoría en cada producción académica.';
--------------------------------------------------------
--  DDL for Table CALIFICACION
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."CALIFICACION" 
   (	"ID_CALIFICACION" NUMBER(*,0), 
	"ID_MATRICULA" NUMBER(*,0), 
	"ID_OFERTA" NUMBER(*,0), 
	"NOTA_PARCIAL_1" NUMBER(4,2), 
	"NOTA_PARCIAL_2" NUMBER(4,2), 
	"NOTA_FINAL" NUMBER(4,2), 
	"NOTA_SUPLETORIO" NUMBER(4,2), 
	"NOTA_MEJORAMIENTO" NUMBER(4,2), 
	"ESTADO_APROBACION" VARCHAR2(20 BYTE), 
	"ASISTENCIA_PORCENTAJE" NUMBER(5,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."ID_CALIFICACION" IS 'Identificador único de cada registro (PK). Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."ID_MATRICULA" IS 'Identificador de la matrícula del estudiante (FK hacia MATRICULA). Relaciona la calificación con un estudiante matriculado.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."ID_OFERTA" IS 'Identificador de la oferta académica (FK hacia OFERTA). Relaciona la calificación con la asignatura ofertada.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."NOTA_PARCIAL_1" IS 'Nota obtenida en el primer parcial. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."NOTA_PARCIAL_2" IS 'Nota obtenida en el segundo parcial. Puede estar vacía si no aplica.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."NOTA_FINAL" IS 'Nota final obtenida en la asignatura. Puede estar vacía si aún no se calcula.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."NOTA_SUPLETORIO" IS 'Nota obtenida en el examen supletorio. Puede estar vacía si no aplica.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."NOTA_MEJORAMIENTO" IS 'Nota obtenida en el examen de mejoramiento. Puede estar vacía si no aplica.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."ESTADO_APROBACION" IS 'Estado final del estudiante en la asignatura (Aprobado/Reprobado).';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."ASISTENCIA_PORCENTAJE" IS 'Porcentaje de asistencia registrado (0–100%). Campo obligatorio.';
--------------------------------------------------------
--  DDL for Table CARRERA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" 
   (	"ID_CARRERA" NUMBER(*,0), 
	"ID_FACULTAD" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0), 
	"NOMBRE_CARRERA" VARCHAR2(100 BYTE), 
	"NIVEL_CARRERA" VARCHAR2(20 BYTE), 
	"MODALIDAD_CARRERA" VARCHAR2(20 BYTE), 
	"DURACION_SEMESTRES" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CARRERA"."ID_CARRERA" IS 'Identificador único de la carrera (PK). Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CARRERA"."ID_FACULTAD" IS 'Identificador de la facultad a la que pertenece la carrera (FK hacia FACULTAD). Permite vincular la carrera con su facultad correspondiente.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CARRERA"."ID_DOCENTE" IS 'Identificador del docente encargado o coordinador de la carrera (FK hacia DOCENTE). Permite relacionar la carrera con su responsable académico.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CARRERA"."NOMBRE_CARRERA" IS 'Nombre oficial de la carrera ofertada. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CARRERA"."NIVEL_CARRERA" IS 'Nivel académico de la carrera (Tecnología, Ingeniería, Licenciatura, etc.). Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CARRERA"."MODALIDAD_CARRERA" IS 'Modalidad de estudio de la carrera (Presencial, Virtual, Híbrida). Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CARRERA"."DURACION_SEMESTRES" IS 'Duración total de la carrera expresada en semestres. Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."CARRERA"  IS 'Tabla donde se almacena la información principal de las carreras ofertadas por la institución. La PK es ID_CARRERA, mientras que ID_FACULTAD e ID_DOCENTE son FK usadas para asociar cada carrera con su facultad y con el docente responsable. Se registran datos como nombre, modalidad, nivel y duración en semestres.';
--------------------------------------------------------
--  DDL for Table COLABORAN_EN
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" 
   (	"ID_PROYECTO" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."COLABORAN_EN"."ID_PROYECTO" IS 'Identificador del proyecto en el que participa el docente (FK hacia PROYECTO). Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."COLABORAN_EN"."ID_DOCENTE" IS 'Identificador del docente que colabora en el proyecto (FK hacia DOCENTE). Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."COLABORAN_EN"  IS 'Tabla relacional donde se registran los docentes que colaboran en cada proyecto. Conformada únicamente por claves foráneas: ID_PROYECTO (FK hacia PROYECTO) e ID_DOCENTE (FK hacia DOCENTE). La combinación de ambas columnas funciona como PK compuesta.';
--------------------------------------------------------
--  DDL for Table CORREQUISITO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."CORREQUISITO" 
   (	"ASI_ID_ASIGNATURA" NUMBER(*,0), 
	"ID_ASIGNATURA" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CORREQUISITO"."ASI_ID_ASIGNATURA" IS 'Identificador de la asignatura que tiene el correquisito (FK hacia ASIGNATURA). Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CORREQUISITO"."ID_ASIGNATURA" IS 'Identificador de la asignatura requerida como correquisito (FK hacia ASIGNATURA). Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."CORREQUISITO"  IS 'Tabla relacional donde se registran las asignaturas que actúan como correquisitos de otras materias. Está compuesta únicamente por claves foráneas: ASI_ID_ASIGNATURA (FK hacia ASIGNATURA) e ID_ASIGNATURA (FK hacia ASIGNATURA). La combinación de ambos campos funciona como PK compuesta.';
--------------------------------------------------------
--  DDL for Table DEPARTAMENTO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" 
   (	"ID_DEPARTAMENTO" NUMBER(*,0), 
	"ID_FACULTAD" NUMBER(*,0), 
	"NOMBRE_DEPARTAMENTO" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO"."ID_DEPARTAMENTO" IS 'Clave primaria (PK) que identifica de manera única el departamento. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO"."ID_FACULTAD" IS 'Clave foránea (FK) que referencia la facultad a la cual pertenece el departamento. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO"."NOMBRE_DEPARTAMENTO" IS 'Nombre oficial del departamento académico. Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO"  IS 'Tabla que almacena los departamentos académicos asociados a una facultad dentro de la institución.';
--------------------------------------------------------
--  DDL for Table DETALLE_MALLA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" 
   (	"ID_ASIGNATURA" NUMBER(*,0), 
	"ID_MALLA" NUMBER(*,0), 
	"SEMESTRE_SUGERIDO" NUMBER(*,0), 
	"HORAS_TEORICAS" NUMBER(*,0), 
	"HORAS_PRACTICAS" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA"."ID_ASIGNATURA" IS 'Clave foránea (FK) que referencia la asignatura incluida dentro de la malla. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA"."ID_MALLA" IS 'Clave foránea (FK) que referencia la malla curricular a la que pertenece la asignatura. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA"."SEMESTRE_SUGERIDO" IS 'Semestre recomendado dentro del plan académico para cursar la asignatura. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA"."HORAS_TEORICAS" IS 'Número de horas teóricas asignadas a la materia dentro de la malla. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA"."HORAS_PRACTICAS" IS 'Número de horas prácticas asignadas a la materia dentro de la malla. Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA"  IS 'Tabla que relaciona cada asignatura con la malla curricular correspondiente. Permite especificar el semestre sugerido y la distribución de horas teóricas y prácticas.';
--------------------------------------------------------
--  DDL for Table DOCENTE
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" 
   (	"ID_DOCENTE" NUMBER(*,0), 
	"ID_FACULTAD" NUMBER(*,0), 
	"FAC_ID_FACULTAD" NUMBER(*,0), 
	"ID_CARRERA" NUMBER(*,0), 
	"NUMERO_UNICO" VARCHAR2(9 BYTE), 
	"CEDULA" VARCHAR2(10 BYTE), 
	"NOMBRES_DOCENTE" VARCHAR2(100 BYTE), 
	"APELLIDOS_DOCENTE" VARCHAR2(100 BYTE), 
	"EMAIL_INSTITUCIONAL" VARCHAR2(100 BYTE), 
	"TIPO_PROFESOR" VARCHAR2(50 BYTE), 
	"CATEGORIA_DOCENTE" VARCHAR2(50 BYTE), 
	"FECHA_INGRESO" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."ID_DOCENTE" IS 'Clave primaria (PK) que identifica de manera única a cada docente registrado. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."ID_FACULTAD" IS 'Clave foránea (FK) que referencia la facultad principal a la que pertenece el docente. Este campo puede estar vacío según la relación.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."FAC_ID_FACULTAD" IS 'Clave foránea (FK) alterna que puede representar la facultad de adscripción administrativa. Requiere validación del modelo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."ID_CARRERA" IS 'Clave foránea (FK) que referencia la carrera a la cual está adscrito el docente. Este campo puede estar vacío si el docente no pertenece a una carrera específica.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."NUMERO_UNICO" IS 'Código institucional único asignado al docente. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."CEDULA" IS 'Número de identificación legal del docente. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."NOMBRES_DOCENTE" IS 'Nombres del docente. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."APELLIDOS_DOCENTE" IS 'Apellidos del docente. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."EMAIL_INSTITUCIONAL" IS 'Correo institucional del docente. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."TIPO_PROFESOR" IS 'Tipo de nombramiento del docente (por ejemplo: titular, contrato, hora-cátedra). Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."CATEGORIA_DOCENTE" IS 'Categoría docente según escalafón académico. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."FECHA_INGRESO" IS 'Fecha en la que el docente ingresó a la institución. Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE"  IS 'Tabla que almacena la información personal, académica y administrativa de los docentes vinculados a la institución. Contiene relaciones hacia facultad y carrera.';
--------------------------------------------------------
--  DDL for Table ESTUDIANTE
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" 
   (	"ID_ESTUDIANTE" NUMBER(*,0), 
	"NUMERO_UNICO" VARCHAR2(9 BYTE), 
	"CEDULA" VARCHAR2(10 BYTE), 
	"NOMBRES_ESTUDIANTE" VARCHAR2(100 BYTE), 
	"APELLIDOS_ESTUDIANTE" VARCHAR2(100 BYTE), 
	"EMAIL_INSTITUCIONAL" VARCHAR2(100 BYTE), 
	"FECHA_INGRESO" DATE, 
	"ESTADO_ESTUDIANTE" VARCHAR2(20 BYTE), 
	"IRA" NUMBER(4,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."ID_ESTUDIANTE" IS 'Clave primaria (PK) que identifica de manera única a cada estudiante registrado. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."NUMERO_UNICO" IS 'Código institucional único asignado al estudiante. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."CEDULA" IS 'Número de identificación legal del estudiante. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."NOMBRES_ESTUDIANTE" IS 'Nombres completos del estudiante. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."APELLIDOS_ESTUDIANTE" IS 'Apellidos completos del estudiante. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."EMAIL_INSTITUCIONAL" IS 'Correo institucional del estudiante. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."FECHA_INGRESO" IS 'Fecha en la que el estudiante ingresó o se matriculó oficialmente en la institución. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."ESTADO_ESTUDIANTE" IS 'Estado académico actual del estudiante (activo, egresado, retirado, etc.). Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."IRA" IS 'Índice de Rendimiento Académico del estudiante. Puede ser nulo si el estudiante aún no posee historial académico.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"  IS 'Tabla que almacena la información personal, académica y administrativa de los estudiantes matriculados en la institución.';
--------------------------------------------------------
--  DDL for Table FACULTAD
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."FACULTAD" 
   (	"ID_FACULTAD" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0), 
	"NOMBRE_FACULTAD" VARCHAR2(100 BYTE), 
	"NUMERO_EDIFICIO" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."FACULTAD"."ID_FACULTAD" IS 'Clave primaria (PK) que identifica de manera única cada facultad registrada. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."FACULTAD"."ID_DOCENTE" IS 'Clave foránea (FK) que referencia al docente encargado o directivo asociado a la facultad. Puede ser nulo si no existe asignación.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."FACULTAD"."NOMBRE_FACULTAD" IS 'Nombre oficial de la facultad dentro de la institución. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."FACULTAD"."NUMERO_EDIFICIO" IS 'Número del edificio físico donde se ubica la facultad. Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."FACULTAD"  IS 'Tabla que almacena las facultades de la institución, incluyendo su identificación, nombre, edificio asignado y docente responsable.';
--------------------------------------------------------
--  DDL for Table HISTORIAL_ACADEMICO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" 
   (	"ID_HISTORIAL" NUMBER(*,0), 
	"ID_ESTUDIANTE" NUMBER(*,0), 
	"ID_PERIODO" NUMBER(*,0), 
	"NOTA_DEFINITIVA" NUMBER(4,2), 
	"ESTADO_MATERIA" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO"."ID_HISTORIAL" IS 'Clave primaria (PK) que identifica de manera única cada registro de historial académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO"."ID_ESTUDIANTE" IS 'Clave foránea (FK) que referencia al estudiante al que pertenece el registro académico. Puede ser nulo según el contexto de registro.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO"."ID_PERIODO" IS 'Clave foránea (FK) que referencia el periodo académico en el cual se cursó la materia. Puede estar vacío en registros no asociados a ciclos oficiales.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO"."NOTA_DEFINITIVA" IS 'Nota final obtenida en la materia cursada durante el periodo académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO"."ESTADO_MATERIA" IS 'Estado final de la materia (Aprobado, Reprobado, Retirado, en Curso, etc.). Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO"  IS 'Tabla que registra el historial académico de cada estudiante, almacenando las calificaciones finales y el estado de cada materia cursada por periodo académico.';
--------------------------------------------------------
--  DDL for Table HORARIO_CLASE
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" 
   (	"ID_HORARIO" NUMBER(*,0), 
	"ID_AULA" NUMBER(*,0), 
	"ID_OFERTA" NUMBER(*,0), 
	"DIA_SEMANA" VARCHAR2(15 BYTE), 
	"HORA_INICIO" DATE, 
	"HORA_FIN" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE"."ID_HORARIO" IS 'Clave primaria (PK) que identifica de manera única cada registro de horario asignado. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE"."ID_AULA" IS 'Clave foránea (FK) que referencia el aula donde se impartirá la clase. Puede ser nulo si aún no se asigna aula.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE"."ID_OFERTA" IS 'Clave foránea (FK) que referencia la oferta académica asociada al horario. Puede ser nulo si el horario aún no está vinculado.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE"."DIA_SEMANA" IS 'Día de la semana en el cual se dicta la clase (Lunes, Martes, etc.). Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE"."HORA_INICIO" IS 'Hora de inicio de la clase programada. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE"."HORA_FIN" IS 'Hora de finalización de la clase programada. Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE"  IS 'Tabla que registra los horarios asignados a una oferta académica específica, incluyendo el aula, día y rango de tiempo donde se impartirá la clase.';
--------------------------------------------------------
--  DDL for Table LIBRO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" 
   (	"ID_LIBRO" NUMBER(*,0), 
	"ISBN" VARCHAR2(20 BYTE), 
	"TITULO_LIBRO" VARCHAR2(200 BYTE), 
	"AUTOR" VARCHAR2(100 BYTE), 
	"EDITORIAL" VARCHAR2(100 BYTE), 
	"STOCK_DISPONIBLE" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."LIBRO"."ID_LIBRO" IS 'Clave primaria (PK) que identifica de manera única cada libro registrado en el sistema. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."LIBRO"."ISBN" IS 'Código ISBN del libro, utilizado como identificador bibliográfico estándar. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."LIBRO"."TITULO_LIBRO" IS 'Título oficial del libro registrado. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."LIBRO"."AUTOR" IS 'Nombre del autor o autores del libro. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."LIBRO"."EDITORIAL" IS 'Editorial responsable de la publicación del libro. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."LIBRO"."STOCK_DISPONIBLE" IS 'Cantidad de ejemplares disponibles en inventario para préstamo o uso institucional. Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."LIBRO"  IS 'Tabla que almacena el catálogo de libros disponibles en la institución, incluyendo su identificación, datos bibliográficos y cantidad en inventario.';
--------------------------------------------------------
--  DDL for Table MALLA_CURRICULAR
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" 
   (	"ID_MALLA" NUMBER(*,0), 
	"ID_CARRERA" NUMBER(*,0), 
	"CODIGO_COHORTE" VARCHAR2(10 BYTE), 
	"FECHA_APROBACION" DATE, 
	"TOTAL_CREDITOS" NUMBER(*,0), 
	"ESTADO_MALLA" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR"."ID_MALLA" IS 'Clave primaria (PK) que identifica de manera única cada malla curricular registrada. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR"."ID_CARRERA" IS 'Clave foránea (FK) que referencia la carrera a la cual pertenece la malla curricular. Puede estar vacío si aún no se asocia.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR"."CODIGO_COHORTE" IS 'Código asignado a la cohorte de la malla curricular. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR"."FECHA_APROBACION" IS 'Fecha oficial en la que la malla curricular fue aprobada institucionalmente. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR"."TOTAL_CREDITOS" IS 'Cantidad total de créditos definidos en la malla curricular. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR"."ESTADO_MALLA" IS 'Estado actual de la malla curricular (Activa, Obsoleta, en Revisión, etc.). Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR"  IS 'Tabla que registra las mallas curriculares de cada carrera, incluyendo cohorte, fecha de aprobación, estado y la carga total de créditos definida.';
--------------------------------------------------------
--  DDL for Table MATRICULA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA" 
   (	"ID_MATRICULA" NUMBER(*,0), 
	"ID_ESTUDIANTE" NUMBER(*,0), 
	"ID_PERIODO" NUMBER(*,0), 
	"FECHA_REGISTRO" DATE, 
	"FORMA_MATRICULA" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MATRICULA"."ID_MATRICULA" IS 'Clave primaria (PK) que identifica de manera única cada matrícula registrada. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MATRICULA"."ID_ESTUDIANTE" IS 'Clave foránea (FK) que referencia al estudiante asociado a la matrícula. Este campo puede estar vacío si aún no se asigna estudiante.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MATRICULA"."ID_PERIODO" IS 'Clave foránea (FK) que referencia el periodo académico correspondiente a la matrícula. Este campo puede estar vacío si aún no se asigna periodo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MATRICULA"."FECHA_REGISTRO" IS 'Fecha en la que se realizó la matrícula del estudiante. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MATRICULA"."FORMA_MATRICULA" IS 'Forma en la que se realizó la matrícula (presencial, virtual, etc.). Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA"  IS 'Tabla que registra las matrículas de los estudiantes en cada periodo académico, incluyendo la fecha de registro y la forma de matrícula.';
--------------------------------------------------------
--  DDL for Table OFERTA_ASIGNATURA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" 
   (	"ID_OFERTA" NUMBER(*,0), 
	"ID_PERIODO" NUMBER(*,0), 
	"ID_ASIGNATURA" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0), 
	"CODIGO_PARALELO" VARCHAR2(10 BYTE), 
	"CUPO_MAXIMO" NUMBER(*,0), 
	"CUPO_DISPONIBLE" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"."ID_OFERTA" IS 'Clave primaria (PK) que identifica de manera única cada oferta de asignatura. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"."ID_PERIODO" IS 'Clave foránea (FK) que referencia el periodo académico en el que se oferta la asignatura. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"."ID_ASIGNATURA" IS 'Clave foránea (FK) que referencia la asignatura incluida en la oferta. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"."ID_DOCENTE" IS 'Clave foránea (FK) que referencia al docente asignado a la oferta de la asignatura. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"."CODIGO_PARALELO" IS 'Código asignado al paralelo de la oferta de la asignatura. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"."CUPO_MAXIMO" IS 'Cantidad máxima de estudiantes permitidos en la oferta de asignatura. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"."CUPO_DISPONIBLE" IS 'Cantidad de cupos actualmente disponibles en la oferta de asignatura. Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"  IS 'Tabla que registra las ofertas de asignaturas por periodo académico, incluyendo docente asignado, código de paralelo y cupos disponibles.';
--------------------------------------------------------
--  DDL for Table PERIODO_ACADEMICO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" 
   (	"ID_PERIODO" NUMBER(*,0), 
	"CODIGO_PERIODO" VARCHAR2(10 BYTE), 
	"NOMBRE_PERIODO" VARCHAR2(10 BYTE), 
	"FECHA_INICIO" DATE, 
	"FECHA_FIN" DATE, 
	"ESTADO_PERIODO" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO"."ID_PERIODO" IS 'Clave primaria (PK) que identifica de manera única cada periodo académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO"."CODIGO_PERIODO" IS 'Código único asignado al periodo académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO"."NOMBRE_PERIODO" IS 'Nombre descriptivo del periodo académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO"."FECHA_INICIO" IS 'Fecha de inicio oficial del periodo académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO"."FECHA_FIN" IS 'Fecha de finalización oficial del periodo académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO"."ESTADO_PERIODO" IS 'Estado actual del periodo académico (Activo, Cerrado, Planificado, etc.). Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO"  IS 'Tabla que almacena los periodos académicos de la institución, incluyendo código, nombre, fechas de inicio y fin, y estado del periodo.';
--------------------------------------------------------
--  DDL for Table PRESTAMO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."PRESTAMO" 
   (	"FECHA_PRESTAMO" DATE, 
	"ID_ESTUDIANTE" NUMBER(*,0), 
	"ID_LIBRO" NUMBER(*,0), 
	"FECHA_DEVOLUCION_PREVISTA" DATE, 
	"FECHA_DEVOLUCION_REAL" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PRESTAMO"."FECHA_PRESTAMO" IS 'Clave primaria (PK) que identifica de manera única cada préstamo de libro. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PRESTAMO"."ID_ESTUDIANTE" IS 'Clave foránea (FK) que referencia al estudiante que realiza el préstamo. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PRESTAMO"."ID_LIBRO" IS 'Clave foránea (FK) que referencia al libro que se presta. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PRESTAMO"."FECHA_DEVOLUCION_PREVISTA" IS 'Fecha en la que se espera que el libro sea devuelto. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PRESTAMO"."FECHA_DEVOLUCION_REAL" IS 'Fecha en la que el libro fue efectivamente devuelto. Este campo puede estar vacío si el libro aún no se ha devuelto.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."PRESTAMO"  IS 'Tabla que registra los préstamos de libros por parte de los estudiantes, incluyendo fechas de préstamo, devolución prevista y real.';
--------------------------------------------------------
--  DDL for Table PROCESO_TITULACION
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" 
   (	"ID_PROCESO" NUMBER(*,0), 
	"ID_ESTUDIANTE" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0), 
	"MODALIDAD_PROCESO" VARCHAR2(30 BYTE), 
	"TEMA_PROPUESTO" VARCHAR2(300 BYTE), 
	"FECHA_DEFENSA" DATE, 
	"NOTA_FINAL_GRADO" NUMBER(4,2), 
	"ESTADO_PROCESO" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."ID_PROCESO" IS 'Clave primaria (PK) que identifica de manera única cada proceso de titulación. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."ID_ESTUDIANTE" IS 'Clave foránea (FK) que referencia al estudiante que realiza el proceso de titulación. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."ID_DOCENTE" IS 'Clave foránea (FK) que referencia al docente asignado como tutor o evaluador del proceso de titulación. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."MODALIDAD_PROCESO" IS 'Modalidad del proceso de titulación (Trabajo de Grado, Proyecto, Tesis, etc.). Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."TEMA_PROPUESTO" IS 'Tema propuesto por el estudiante para el proceso de titulación. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."FECHA_DEFENSA" IS 'Fecha programada para la defensa del proceso de titulación. Este campo puede estar vacío si aún no se ha programado.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."NOTA_FINAL_GRADO" IS 'Calificación final obtenida por el estudiante en el proceso de titulación. Este campo puede estar vacío hasta que se asigne nota.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."ESTADO_PROCESO" IS 'Estado actual del proceso de titulación (En Proceso, Aprobado, Reprobado, Suspendido, etc.). Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"  IS 'Tabla que registra los procesos de titulación de los estudiantes, incluyendo modalidad, tema propuesto, fechas, calificación final y estado del proceso.';
--------------------------------------------------------
--  DDL for Table PROYECTO_INVESTIGACION
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" 
   (	"ID_PROYECTO" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0), 
	"ID_DEPARTAMENTO" NUMBER(*,0), 
	"CODIGO_PROYECTO" VARCHAR2(20 BYTE), 
	"TITULO_PROYECTO" VARCHAR2(200 BYTE), 
	"LINEA_INVESTIGACION" VARCHAR2(100 BYTE), 
	"PRESUPUESTO_ASIGNADO" NUMBER(10,2), 
	"FECHA_INICIO" DATE, 
	"ESTADO_PROYECTO" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."ID_PROYECTO" IS 'Clave primaria (PK) que identifica de manera única cada proyecto de investigación. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."ID_DOCENTE" IS 'Clave foránea (FK) que referencia al docente responsable del proyecto. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."ID_DEPARTAMENTO" IS 'Clave foránea (FK) que referencia al departamento asociado al proyecto. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."CODIGO_PROYECTO" IS 'Código único asignado al proyecto de investigación. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."TITULO_PROYECTO" IS 'Título oficial del proyecto de investigación. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."LINEA_INVESTIGACION" IS 'Línea de investigación a la que pertenece el proyecto. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."PRESUPUESTO_ASIGNADO" IS 'Monto financiero asignado al proyecto. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."FECHA_INICIO" IS 'Fecha en la que inicia el proyecto de investigación. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."ESTADO_PROYECTO" IS 'Estado actual del proyecto (Activo, Concluido, Cancelado, etc.). Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"  IS 'Tabla que registra los proyectos de investigación de la institución, incluyendo docente responsable, departamento, código, título, línea de investigación, presupuesto, fechas y estado del proyecto.';
--------------------------------------------------------
--  DDL for Table PUBLICACION
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION" 
   (	"ID_PUBLICACION" NUMBER(*,0), 
	"ID_PROYECTO" NUMBER(*,0), 
	"TITULO_PUBLICACION" VARCHAR2(100 BYTE), 
	"DOI" VARCHAR2(100 BYTE), 
	"REVISTA" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PUBLICACION"."ID_PUBLICACION" IS 'Clave primaria (PK) que identifica de manera única cada publicación. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PUBLICACION"."ID_PROYECTO" IS 'Clave foránea (FK) que referencia al proyecto de investigación asociado a la publicación. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PUBLICACION"."TITULO_PUBLICACION" IS 'Título oficial de la publicación. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PUBLICACION"."DOI" IS 'Identificador DOI de la publicación. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PUBLICACION"."REVISTA" IS 'Nombre de la revista donde se publicó el artículo. Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION"  IS 'Tabla que registra las publicaciones derivadas de proyectos de investigación, incluyendo título, DOI y revista donde se publica.';
--------------------------------------------------------
--  DDL for Table TIENE_PRERREQUISITO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" 
   (	"ASI_ID_ASIGNATURA" NUMBER(*,0), 
	"ID_ASIGNATURA" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO"."ASI_ID_ASIGNATURA" IS 'Clave foránea (FK) que referencia la asignatura que tiene prerrequisito. Parte de la clave primaria (PK) compuesta. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO"."ID_ASIGNATURA" IS 'Clave foránea (FK) que referencia la asignatura que actúa como prerrequisito. Parte de la clave primaria (PK) compuesta. Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO"  IS 'Tabla que relaciona las asignaturas con sus prerrequisitos, estableciendo qué asignaturas deben aprobarse antes de cursar otra.';
--------------------------------------------------------
--  DDL for Table TIPO_BECA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."TIPO_BECA" 
   (	"ID_BECA" NUMBER(*,0), 
	"NOMBRE_BECA" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TIPO_BECA"."ID_BECA" IS 'Clave primaria (PK) que identifica de manera única cada tipo de beca. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TIPO_BECA"."NOMBRE_BECA" IS 'Nombre descriptivo del tipo de beca. Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."TIPO_BECA"  IS 'Tabla que almacena los diferentes tipos de becas disponibles, incluyendo su nombre y código identificador.';
--------------------------------------------------------
--  DDL for Table TITULO_ACADEMICO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" 
   (	"ID_TITULO" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0), 
	"NOMBRE_TITULO" VARCHAR2(100 BYTE), 
	"NIVEL_TITULO" VARCHAR2(50 BYTE), 
	"UNIVERSIDAD" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO"."ID_TITULO" IS 'Clave primaria (PK) que identifica de manera única cada título académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO"."ID_DOCENTE" IS 'Clave foránea (FK) que referencia al docente que posee el título académico. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO"."NOMBRE_TITULO" IS 'Nombre oficial del título académico. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO"."NIVEL_TITULO" IS 'Nivel académico del título (Licenciatura, Maestría, Doctorado, etc.). Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO"."UNIVERSIDAD" IS 'Nombre de la universidad que expidió el título académico. Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO"  IS 'Tabla que registra los títulos académicos obtenidos por los docentes, incluyendo nombre, nivel y universidad emisora.';
--------------------------------------------------------
--  DDL for Table TRIBUNAL_GRADO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" 
   (	"ID_PROCESO" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO"."ID_PROCESO" IS 'Clave foránea (FK) que referencia al proceso de titulación. Parte de la clave primaria (PK) compuesta. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO"."ID_DOCENTE" IS 'Clave foránea (FK) que referencia al docente que integra el tribunal de grado. Parte de la clave primaria (PK) compuesta. Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO"  IS 'Tabla que registra los docentes que conforman el tribunal de grado de cada proceso de titulación.';
REM INSERTING into SISTEMA_UNIVERSITARIO.ASIGNACION_BECA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.ASIGNATURA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.AULA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.AUTORIA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.CALIFICACION
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.CARRERA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.COLABORAN_EN
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.CORREQUISITO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.DEPARTAMENTO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.DETALLE_MALLA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.DOCENTE
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.ESTUDIANTE
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.FACULTAD
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.HISTORIAL_ACADEMICO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.HORARIO_CLASE
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.LIBRO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.MALLA_CURRICULAR
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.MATRICULA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.OFERTA_ASIGNATURA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.PERIODO_ACADEMICO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.PRESTAMO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.PROCESO_TITULACION
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.PROYECTO_INVESTIGACION
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.PUBLICACION
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.TIENE_PRERREQUISITO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.TIPO_BECA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.TITULO_ACADEMICO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.TRIBUNAL_GRADO
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index ADMINISTRA_CARRERA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ADMINISTRA_CARRERA_FK" ON "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COLABORAN_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."COLABORAN_EN_FK" ON "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ("ID_PROYECTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COLABORAN_EN2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."COLABORAN_EN2_FK" ON "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CORREQUISITO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."CORREQUISITO_FK" ON "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ("ASI_ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CORREQUISITO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."CORREQUISITO2_FK" ON "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DESIGNADO_OFERTA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."DESIGNADO_OFERTA_FK" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DIRIGE_PROYECTO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."DIRIGE_PROYECTO_FK" ON "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ENSENIAN_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ENSENIAN_EN_FK" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("FAC_ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ESCRIBE_ARTICULO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ESCRIBE_ARTICULO_FK" ON "SISTEMA_UNIVERSITARIO"."AUTORIA" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ES_PARTE_DE_MALLA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ES_PARTE_DE_MALLA_FK" ON "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ("ID_MALLA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ES_PRESTADO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ES_PRESTADO_FK" ON "SISTEMA_UNIVERSITARIO"."PRESTAMO" ("ID_LIBRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ES_TIPO_BECA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ES_TIPO_BECA_FK" ON "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ("ID_BECA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GENERA_CALIFICACIONES_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."GENERA_CALIFICACIONES_FK" ON "SISTEMA_UNIVERSITARIO"."CALIFICACION" ("ID_OFERTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GESTIONA_INVESTIGACION_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."GESTIONA_INVESTIGACION_FK" ON "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_DEPARTAMENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HA_REALIZADO_MATRICULA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."HA_REALIZADO_MATRICULA_FK" ON "SISTEMA_UNIVERSITARIO"."MATRICULA" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index OBTUVO_RESULTADOS_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."OBTUVO_RESULTADOS_EN_FK" ON "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ASIGNACION_BECA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_ASIGNACION_BECA" ON "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ("FECHA_ASIGNACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ASIGNATURA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_ASIGNATURA" ON "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_AULA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_AULA" ON "SISTEMA_UNIVERSITARIO"."AULA" ("ID_AULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_AUTORIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_AUTORIA" ON "SISTEMA_UNIVERSITARIO"."AUTORIA" ("ID_PUBLICACION", "ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CALIFICACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_CALIFICACION" ON "SISTEMA_UNIVERSITARIO"."CALIFICACION" ("ID_CALIFICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CARRERA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_CARRERA" ON "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_CARRERA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_COLABORAN_EN
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_COLABORAN_EN" ON "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ("ID_PROYECTO", "ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CORREQUISITO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_CORREQUISITO" ON "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ("ASI_ID_ASIGNATURA", "ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_DEPARTAMENTO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_DEPARTAMENTO" ON "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" ("ID_DEPARTAMENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_DETALLE_MALLA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_DETALLE_MALLA" ON "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ("ID_ASIGNATURA", "ID_MALLA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_DOCENTE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_DOCENTE" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ESTUDIANTE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_ESTUDIANTE" ON "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_FACULTAD
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_FACULTAD" ON "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_HISTORIAL_ACADEMICO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_HISTORIAL_ACADEMICO" ON "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ("ID_HISTORIAL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_HORARIO_CLASE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_HORARIO_CLASE" ON "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ("ID_HORARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_LIBRO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_LIBRO" ON "SISTEMA_UNIVERSITARIO"."LIBRO" ("ID_LIBRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MALLA_CURRICULAR
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_MALLA_CURRICULAR" ON "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" ("ID_MALLA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MATRICULA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_MATRICULA" ON "SISTEMA_UNIVERSITARIO"."MATRICULA" ("ID_MATRICULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_OFERTA_ASIGNATURA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_OFERTA_ASIGNATURA" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_OFERTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PERIODO_ACADEMICO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PERIODO_ACADEMICO" ON "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PRESTAMO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PRESTAMO" ON "SISTEMA_UNIVERSITARIO"."PRESTAMO" ("FECHA_PRESTAMO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PROCESO_TITULACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PROCESO_TITULACION" ON "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ("ID_PROCESO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PROYECTO_INVESTIGACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PROYECTO_INVESTIGACION" ON "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_PROYECTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PUBLICACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PUBLICACION" ON "SISTEMA_UNIVERSITARIO"."PUBLICACION" ("ID_PUBLICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TIENE_PRERREQUISITO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TIENE_PRERREQUISITO" ON "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ("ASI_ID_ASIGNATURA", "ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TIPO_BECA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TIPO_BECA" ON "SISTEMA_UNIVERSITARIO"."TIPO_BECA" ("ID_BECA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TITULO_ACADEMICO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TITULO_ACADEMICO" ON "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" ("ID_TITULO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TRIBUNAL_GRADO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TRIBUNAL_GRADO" ON "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ("ID_PROCESO", "ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index POSEE_TITULO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."POSEE_TITULO_FK" ON "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCE_PUBLICACION_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."PRODUCE_PUBLICACION_FK" ON "SISTEMA_UNIVERSITARIO"."PUBLICACION" ("ID_PROYECTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RECIBE_BECA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."RECIBE_BECA_FK" ON "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SE_DICTA_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SE_DICTA_EN_FK" ON "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ("ID_OFERTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SE_PRESENTA_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SE_PRESENTA_EN_FK" ON "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SE_REALIZAN_PERIODO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SE_REALIZAN_PERIODO_FK" ON "SISTEMA_UNIVERSITARIO"."MATRICULA" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SOLICITA_LIBRO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SOLICITA_LIBRO_FK" ON "SISTEMA_UNIVERSITARIO"."PRESTAMO" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SOLICITA_TITULACION_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SOLICITA_TITULACION_FK" ON "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_ASIGNATURA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_ASIGNATURA_FK" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_AUTORES_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_AUTORES_FK" ON "SISTEMA_UNIVERSITARIO"."AUTORIA" ("ID_PUBLICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_CARRERA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_CARRERA_FK" ON "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" ("ID_CARRERA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_COORDINADOR_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_COORDINADOR_FK" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_CARRERA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_COORDINADOR2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_COORDINADOR2_FK" ON "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DECANO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DECANO_FK" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DECANO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DECANO2_FK" ON "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DEPARTAMENTOS_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DEPARTAMENTOS_FK" ON "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DETALLE_NOTAS_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DETALLE_NOTAS_FK" ON "SISTEMA_UNIVERSITARIO"."CALIFICACION" ("ID_MATRICULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_HISTORIALES_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_HISTORIALES_FK" ON "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_HORARIO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_HORARIO_FK" ON "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ("ID_AULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_PERIODO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_PERIODO_FK" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_PRERREQUISITO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO_FK" ON "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ("ASI_ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_PRERREQUISITO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO2_FK" ON "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TRIBUNAL_GRADO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO_FK" ON "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ("ID_PROCESO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TRIBUNAL_GRADO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO2_FK" ON "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TUTORA_PROCESO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TUTORA_PROCESO_FK" ON "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ASIGNACION_BECA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_ASIGNACION_BECA" ON "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ("FECHA_ASIGNACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RECIBE_BECA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."RECIBE_BECA_FK" ON "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ES_TIPO_BECA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ES_TIPO_BECA_FK" ON "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ("ID_BECA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ASIGNATURA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_ASIGNATURA" ON "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_AULA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_AULA" ON "SISTEMA_UNIVERSITARIO"."AULA" ("ID_AULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_AUTORIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_AUTORIA" ON "SISTEMA_UNIVERSITARIO"."AUTORIA" ("ID_PUBLICACION", "ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ESCRIBE_ARTICULO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ESCRIBE_ARTICULO_FK" ON "SISTEMA_UNIVERSITARIO"."AUTORIA" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_AUTORES_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_AUTORES_FK" ON "SISTEMA_UNIVERSITARIO"."AUTORIA" ("ID_PUBLICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CALIFICACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_CALIFICACION" ON "SISTEMA_UNIVERSITARIO"."CALIFICACION" ("ID_CALIFICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DETALLE_NOTAS_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DETALLE_NOTAS_FK" ON "SISTEMA_UNIVERSITARIO"."CALIFICACION" ("ID_MATRICULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GENERA_CALIFICACIONES_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."GENERA_CALIFICACIONES_FK" ON "SISTEMA_UNIVERSITARIO"."CALIFICACION" ("ID_OFERTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CARRERA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_CARRERA" ON "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_CARRERA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ADMINISTRA_CARRERA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ADMINISTRA_CARRERA_FK" ON "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_COORDINADOR2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_COORDINADOR2_FK" ON "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_COLABORAN_EN
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_COLABORAN_EN" ON "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ("ID_PROYECTO", "ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COLABORAN_EN2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."COLABORAN_EN2_FK" ON "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COLABORAN_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."COLABORAN_EN_FK" ON "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ("ID_PROYECTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CORREQUISITO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_CORREQUISITO" ON "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ("ASI_ID_ASIGNATURA", "ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CORREQUISITO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."CORREQUISITO2_FK" ON "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CORREQUISITO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."CORREQUISITO_FK" ON "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ("ASI_ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_DEPARTAMENTO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_DEPARTAMENTO" ON "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" ("ID_DEPARTAMENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DEPARTAMENTOS_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DEPARTAMENTOS_FK" ON "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ES_PARTE_DE_MALLA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ES_PARTE_DE_MALLA_FK" ON "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ("ID_MALLA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SE_PRESENTA_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SE_PRESENTA_EN_FK" ON "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_DETALLE_MALLA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_DETALLE_MALLA" ON "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ("ID_ASIGNATURA", "ID_MALLA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_DOCENTE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_DOCENTE" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DECANO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DECANO_FK" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ENSENIAN_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ENSENIAN_EN_FK" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("FAC_ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_COORDINADOR_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_COORDINADOR_FK" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_CARRERA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ESTUDIANTE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_ESTUDIANTE" ON "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_FACULTAD
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_FACULTAD" ON "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DECANO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DECANO2_FK" ON "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_HISTORIAL_ACADEMICO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_HISTORIAL_ACADEMICO" ON "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ("ID_HISTORIAL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_HISTORIALES_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_HISTORIALES_FK" ON "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index OBTUVO_RESULTADOS_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."OBTUVO_RESULTADOS_EN_FK" ON "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_HORARIO_CLASE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_HORARIO_CLASE" ON "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ("ID_HORARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_HORARIO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_HORARIO_FK" ON "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ("ID_AULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SE_DICTA_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SE_DICTA_EN_FK" ON "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ("ID_OFERTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_LIBRO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_LIBRO" ON "SISTEMA_UNIVERSITARIO"."LIBRO" ("ID_LIBRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MALLA_CURRICULAR
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_MALLA_CURRICULAR" ON "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" ("ID_MALLA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_CARRERA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_CARRERA_FK" ON "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" ("ID_CARRERA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HA_REALIZADO_MATRICULA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."HA_REALIZADO_MATRICULA_FK" ON "SISTEMA_UNIVERSITARIO"."MATRICULA" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SE_REALIZAN_PERIODO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SE_REALIZAN_PERIODO_FK" ON "SISTEMA_UNIVERSITARIO"."MATRICULA" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MATRICULA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_MATRICULA" ON "SISTEMA_UNIVERSITARIO"."MATRICULA" ("ID_MATRICULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_OFERTA_ASIGNATURA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_OFERTA_ASIGNATURA" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_OFERTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_PERIODO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_PERIODO_FK" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_ASIGNATURA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_ASIGNATURA_FK" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DESIGNADO_OFERTA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."DESIGNADO_OFERTA_FK" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PERIODO_ACADEMICO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PERIODO_ACADEMICO" ON "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PRESTAMO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PRESTAMO" ON "SISTEMA_UNIVERSITARIO"."PRESTAMO" ("FECHA_PRESTAMO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SOLICITA_LIBRO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SOLICITA_LIBRO_FK" ON "SISTEMA_UNIVERSITARIO"."PRESTAMO" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ES_PRESTADO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ES_PRESTADO_FK" ON "SISTEMA_UNIVERSITARIO"."PRESTAMO" ("ID_LIBRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PROCESO_TITULACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PROCESO_TITULACION" ON "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ("ID_PROCESO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SOLICITA_TITULACION_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SOLICITA_TITULACION_FK" ON "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TUTORA_PROCESO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TUTORA_PROCESO_FK" ON "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PROYECTO_INVESTIGACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PROYECTO_INVESTIGACION" ON "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_PROYECTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DIRIGE_PROYECTO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."DIRIGE_PROYECTO_FK" ON "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GESTIONA_INVESTIGACION_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."GESTIONA_INVESTIGACION_FK" ON "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_DEPARTAMENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PUBLICACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PUBLICACION" ON "SISTEMA_UNIVERSITARIO"."PUBLICACION" ("ID_PUBLICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCE_PUBLICACION_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."PRODUCE_PUBLICACION_FK" ON "SISTEMA_UNIVERSITARIO"."PUBLICACION" ("ID_PROYECTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_PRERREQUISITO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO_FK" ON "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ("ASI_ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TIENE_PRERREQUISITO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TIENE_PRERREQUISITO" ON "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ("ASI_ID_ASIGNATURA", "ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_PRERREQUISITO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO2_FK" ON "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TIPO_BECA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TIPO_BECA" ON "SISTEMA_UNIVERSITARIO"."TIPO_BECA" ("ID_BECA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TITULO_ACADEMICO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TITULO_ACADEMICO" ON "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" ("ID_TITULO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index POSEE_TITULO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."POSEE_TITULO_FK" ON "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TRIBUNAL_GRADO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TRIBUNAL_GRADO" ON "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ("ID_PROCESO", "ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TRIBUNAL_GRADO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO2_FK" ON "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TRIBUNAL_GRADO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO_FK" ON "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ("ID_PROCESO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ASIGNACION_BECA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" MODIFY ("FECHA_ASIGNACION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" MODIFY ("PORCENTAJE_COBERTURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ADD CONSTRAINT "PK_ASIGNACION_BECA" PRIMARY KEY ("FECHA_ASIGNACION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ASIGNATURA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" MODIFY ("ID_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" MODIFY ("CODIGO_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" MODIFY ("NOMBRE_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" MODIFY ("NUMERO_CREDITOS" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" MODIFY ("TIPO_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" MODIFY ("AREA_CONOCIMIENTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ADD CONSTRAINT "PK_ASIGNATURA" PRIMARY KEY ("ID_ASIGNATURA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table AULA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" MODIFY ("ID_AULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" MODIFY ("EDIFICIO_AULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" MODIFY ("PISO_AULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" MODIFY ("NUMERO_AULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" MODIFY ("CAPACIDAD_ESTUDIANTES" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" MODIFY ("TIPO_AULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" MODIFY ("TIENE_PROYECTOR" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" ADD CONSTRAINT "PK_AULA" PRIMARY KEY ("ID_AULA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table AUTORIA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA" MODIFY ("ID_PUBLICACION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA" MODIFY ("ID_DOCENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA" MODIFY ("ORDEN_AUTOR" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA" ADD CONSTRAINT "PK_AUTORIA" PRIMARY KEY ("ID_PUBLICACION", "ID_DOCENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CALIFICACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CALIFICACION" MODIFY ("ID_CALIFICACION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CALIFICACION" MODIFY ("NOTA_PARCIAL_1" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CALIFICACION" MODIFY ("ASISTENCIA_PORCENTAJE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CALIFICACION" ADD CONSTRAINT "PK_CALIFICACION" PRIMARY KEY ("ID_CALIFICACION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CARRERA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" MODIFY ("ID_CARRERA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" MODIFY ("NOMBRE_CARRERA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" MODIFY ("NIVEL_CARRERA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" MODIFY ("MODALIDAD_CARRERA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" MODIFY ("DURACION_SEMESTRES" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" ADD CONSTRAINT "PK_CARRERA" PRIMARY KEY ("ID_CARRERA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COLABORAN_EN
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" MODIFY ("ID_PROYECTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" MODIFY ("ID_DOCENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ADD CONSTRAINT "PK_COLABORAN_EN" PRIMARY KEY ("ID_PROYECTO", "ID_DOCENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CORREQUISITO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CORREQUISITO" MODIFY ("ASI_ID_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CORREQUISITO" MODIFY ("ID_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ADD CONSTRAINT "PK_CORREQUISITO" PRIMARY KEY ("ASI_ID_ASIGNATURA", "ID_ASIGNATURA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DEPARTAMENTO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" MODIFY ("ID_DEPARTAMENTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" MODIFY ("NOMBRE_DEPARTAMENTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" ADD CONSTRAINT "PK_DEPARTAMENTO" PRIMARY KEY ("ID_DEPARTAMENTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DETALLE_MALLA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" MODIFY ("ID_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" MODIFY ("ID_MALLA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" MODIFY ("SEMESTRE_SUGERIDO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" MODIFY ("HORAS_TEORICAS" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" MODIFY ("HORAS_PRACTICAS" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ADD CONSTRAINT "PK_DETALLE_MALLA" PRIMARY KEY ("ID_ASIGNATURA", "ID_MALLA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DOCENTE
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("ID_DOCENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("NUMERO_UNICO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("CEDULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("NOMBRES_DOCENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("APELLIDOS_DOCENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("EMAIL_INSTITUCIONAL" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("TIPO_PROFESOR" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("CATEGORIA_DOCENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("FECHA_INGRESO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" ADD CONSTRAINT "PK_DOCENTE" PRIMARY KEY ("ID_DOCENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ESTUDIANTE
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("ID_ESTUDIANTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("NUMERO_UNICO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("CEDULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("NOMBRES_ESTUDIANTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("APELLIDOS_ESTUDIANTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("EMAIL_INSTITUCIONAL" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("FECHA_INGRESO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("ESTADO_ESTUDIANTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ADD CONSTRAINT "PK_ESTUDIANTE" PRIMARY KEY ("ID_ESTUDIANTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FACULTAD
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."FACULTAD" MODIFY ("ID_FACULTAD" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."FACULTAD" MODIFY ("NOMBRE_FACULTAD" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."FACULTAD" MODIFY ("NUMERO_EDIFICIO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."FACULTAD" ADD CONSTRAINT "PK_FACULTAD" PRIMARY KEY ("ID_FACULTAD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table HISTORIAL_ACADEMICO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" MODIFY ("ID_HISTORIAL" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" MODIFY ("NOTA_DEFINITIVA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" MODIFY ("ESTADO_MATERIA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ADD CONSTRAINT "PK_HISTORIAL_ACADEMICO" PRIMARY KEY ("ID_HISTORIAL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table HORARIO_CLASE
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" MODIFY ("ID_HORARIO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" MODIFY ("DIA_SEMANA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" MODIFY ("HORA_INICIO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" MODIFY ("HORA_FIN" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ADD CONSTRAINT "PK_HORARIO_CLASE" PRIMARY KEY ("ID_HORARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LIBRO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" MODIFY ("ID_LIBRO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" MODIFY ("ISBN" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" MODIFY ("TITULO_LIBRO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" MODIFY ("AUTOR" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" MODIFY ("EDITORIAL" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" MODIFY ("STOCK_DISPONIBLE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" ADD CONSTRAINT "PK_LIBRO" PRIMARY KEY ("ID_LIBRO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MALLA_CURRICULAR
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" MODIFY ("ID_MALLA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" MODIFY ("CODIGO_COHORTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" MODIFY ("FECHA_APROBACION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" MODIFY ("TOTAL_CREDITOS" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" MODIFY ("ESTADO_MALLA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" ADD CONSTRAINT "PK_MALLA_CURRICULAR" PRIMARY KEY ("ID_MALLA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MATRICULA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA" MODIFY ("ID_MATRICULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA" MODIFY ("FECHA_REGISTRO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA" MODIFY ("FORMA_MATRICULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA" ADD CONSTRAINT "PK_MATRICULA" PRIMARY KEY ("ID_MATRICULA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table OFERTA_ASIGNATURA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" MODIFY ("ID_OFERTA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" MODIFY ("CODIGO_PARALELO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" MODIFY ("CUPO_MAXIMO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" MODIFY ("CUPO_DISPONIBLE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ADD CONSTRAINT "PK_OFERTA_ASIGNATURA" PRIMARY KEY ("ID_OFERTA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PERIODO_ACADEMICO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" MODIFY ("ID_PERIODO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" MODIFY ("CODIGO_PERIODO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" MODIFY ("NOMBRE_PERIODO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" MODIFY ("FECHA_INICIO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" MODIFY ("FECHA_FIN" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" MODIFY ("ESTADO_PERIODO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" ADD CONSTRAINT "PK_PERIODO_ACADEMICO" PRIMARY KEY ("ID_PERIODO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRESTAMO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PRESTAMO" MODIFY ("FECHA_PRESTAMO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PRESTAMO" MODIFY ("FECHA_DEVOLUCION_PREVISTA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PRESTAMO" ADD CONSTRAINT "PK_PRESTAMO" PRIMARY KEY ("FECHA_PRESTAMO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROCESO_TITULACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" MODIFY ("ID_PROCESO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" MODIFY ("MODALIDAD_PROCESO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" MODIFY ("TEMA_PROPUESTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" MODIFY ("ESTADO_PROCESO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ADD CONSTRAINT "PK_PROCESO_TITULACION" PRIMARY KEY ("ID_PROCESO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROYECTO_INVESTIGACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" MODIFY ("ID_PROYECTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" MODIFY ("CODIGO_PROYECTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" MODIFY ("TITULO_PROYECTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" MODIFY ("LINEA_INVESTIGACION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" MODIFY ("PRESUPUESTO_ASIGNADO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" MODIFY ("FECHA_INICIO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" MODIFY ("ESTADO_PROYECTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ADD CONSTRAINT "PK_PROYECTO_INVESTIGACION" PRIMARY KEY ("ID_PROYECTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PUBLICACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION" MODIFY ("ID_PUBLICACION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION" MODIFY ("TITULO_PUBLICACION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION" MODIFY ("DOI" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION" MODIFY ("REVISTA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION" ADD CONSTRAINT "PK_PUBLICACION" PRIMARY KEY ("ID_PUBLICACION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TIENE_PRERREQUISITO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" MODIFY ("ASI_ID_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" MODIFY ("ID_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ADD CONSTRAINT "PK_TIENE_PRERREQUISITO" PRIMARY KEY ("ASI_ID_ASIGNATURA", "ID_ASIGNATURA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TIPO_BECA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIPO_BECA" MODIFY ("ID_BECA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIPO_BECA" MODIFY ("NOMBRE_BECA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIPO_BECA" ADD CONSTRAINT "PK_TIPO_BECA" PRIMARY KEY ("ID_BECA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TITULO_ACADEMICO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" MODIFY ("ID_TITULO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" MODIFY ("NOMBRE_TITULO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" MODIFY ("NIVEL_TITULO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" MODIFY ("UNIVERSIDAD" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" ADD CONSTRAINT "PK_TITULO_ACADEMICO" PRIMARY KEY ("ID_TITULO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TRIBUNAL_GRADO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" MODIFY ("ID_PROCESO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" MODIFY ("ID_DOCENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ADD CONSTRAINT "PK_TRIBUNAL_GRADO" PRIMARY KEY ("ID_PROCESO", "ID_DOCENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ASIGNACION_BECA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ADD CONSTRAINT "FK_ASIGNACI_ES_TIPO_B_TIPO_BEC" FOREIGN KEY ("ID_BECA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."TIPO_BECA" ("ID_BECA") ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ADD CONSTRAINT "FK_ASIGNACI_RECIBE_BE_ESTUDIAN" FOREIGN KEY ("ID_ESTUDIANTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ("ID_ESTUDIANTE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table AUTORIA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA" ADD CONSTRAINT "FK_AUTORIA_ESCRIBE_A_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA" ADD CONSTRAINT "FK_AUTORIA_TIENE_AUT_PUBLICAC" FOREIGN KEY ("ID_PUBLICACION")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."PUBLICACION" ("ID_PUBLICACION") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CALIFICACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CALIFICACION" ADD CONSTRAINT "FK_CALIFICA_TIENE_DET_MATRICUL" FOREIGN KEY ("ID_MATRICULA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."MATRICULA" ("ID_MATRICULA") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CALIFICACION" ADD CONSTRAINT "FK_CALIFICA_GENERA_CA_OFERTA_A" FOREIGN KEY ("ID_OFERTA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_OFERTA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CARRERA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" ADD CONSTRAINT "FK_CARRERA_ADMINISTR_FACULTAD" FOREIGN KEY ("ID_FACULTAD")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_FACULTAD") ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" ADD CONSTRAINT "FK_CARRERA_TIENE_COO_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COLABORAN_EN
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ADD CONSTRAINT "FK_COLABORA_COLABORAN_PROYECTO" FOREIGN KEY ("ID_PROYECTO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_PROYECTO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ADD CONSTRAINT "FK_COLABORA_COLABORAN_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CORREQUISITO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ADD CONSTRAINT "FK_CORREQ_ASIG_A" FOREIGN KEY ("ASI_ID_ASIGNATURA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ADD CONSTRAINT "FK_CORREQ_ASIG_B" FOREIGN KEY ("ID_ASIGNATURA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEPARTAMENTO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" ADD CONSTRAINT "FK_DEPARTAM_TIENE_DEP_FACULTAD" FOREIGN KEY ("ID_FACULTAD")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_FACULTAD") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DETALLE_MALLA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ADD CONSTRAINT "FK_DETALLE__ES_PARTE__MALLA_CU" FOREIGN KEY ("ID_MALLA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" ("ID_MALLA") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ADD CONSTRAINT "FK_DETALLE__SE_PRESEN_ASIGNATU" FOREIGN KEY ("ID_ASIGNATURA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DOCENTE
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" ADD CONSTRAINT "FK_DOCENTE_ENSENIAN__FACULTAD" FOREIGN KEY ("FAC_ID_FACULTAD")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_FACULTAD") ON DELETE SET NULL ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" ADD CONSTRAINT "FK_DOCENTE_TIENE_COO_CARRERA" FOREIGN KEY ("ID_CARRERA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_CARRERA") ON DELETE SET NULL ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" ADD CONSTRAINT "FK_DOCENTE_TIENE_DEC_FACULTAD" FOREIGN KEY ("ID_FACULTAD")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_FACULTAD") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FACULTAD
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."FACULTAD" ADD CONSTRAINT "FK_FACULTAD_TIENE_DEC_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HISTORIAL_ACADEMICO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ADD CONSTRAINT "FK_HISTORIA_TIENE_HIS_ESTUDIAN" FOREIGN KEY ("ID_ESTUDIANTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ("ID_ESTUDIANTE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ADD CONSTRAINT "FK_HISTORIA_OBTUVO_RE_PERIODO_" FOREIGN KEY ("ID_PERIODO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" ("ID_PERIODO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HORARIO_CLASE
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ADD CONSTRAINT "FK_HORARIO__SE_DICTA__OFERTA_A" FOREIGN KEY ("ID_OFERTA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_OFERTA") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ADD CONSTRAINT "FK_HORARIO__TIENE_HOR_AULA" FOREIGN KEY ("ID_AULA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."AULA" ("ID_AULA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MALLA_CURRICULAR
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" ADD CONSTRAINT "FK_MALLA_CU_TIENE_CAR_CARRERA" FOREIGN KEY ("ID_CARRERA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_CARRERA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MATRICULA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA" ADD CONSTRAINT "FK_MATRICUL_HA_REALIZ_ESTUDIAN" FOREIGN KEY ("ID_ESTUDIANTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ("ID_ESTUDIANTE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA" ADD CONSTRAINT "FK_MATRICUL_SE_REALIZ_PERIODO_" FOREIGN KEY ("ID_PERIODO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" ("ID_PERIODO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OFERTA_ASIGNATURA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ADD CONSTRAINT "FK_OFERTA_A_DESIGNADO_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE SET NULL ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ADD CONSTRAINT "FK_OFERTA_A_TIENE_ASI_ASIGNATU" FOREIGN KEY ("ID_ASIGNATURA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ADD CONSTRAINT "FK_OFERTA_A_TIENE_PER_PERIODO_" FOREIGN KEY ("ID_PERIODO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" ("ID_PERIODO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRESTAMO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PRESTAMO" ADD CONSTRAINT "FK_PRESTAMO_SOLICITA__ESTUDIAN" FOREIGN KEY ("ID_ESTUDIANTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ("ID_ESTUDIANTE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PRESTAMO" ADD CONSTRAINT "FK_PRESTAMO_ES_PRESTA_LIBRO" FOREIGN KEY ("ID_LIBRO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."LIBRO" ("ID_LIBRO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROCESO_TITULACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ADD CONSTRAINT "FK_PROCESO__TUTORA_PR_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE SET NULL ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ADD CONSTRAINT "FK_PROCESO__SOLICITA__ESTUDIAN" FOREIGN KEY ("ID_ESTUDIANTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ("ID_ESTUDIANTE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROYECTO_INVESTIGACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ADD CONSTRAINT "FK_PROYECTO_DIRIGE_PR_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE SET NULL ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ADD CONSTRAINT "FK_PROYECTO_GESTIONA__DEPARTAM" FOREIGN KEY ("ID_DEPARTAMENTO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" ("ID_DEPARTAMENTO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PUBLICACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION" ADD CONSTRAINT "FK_PUBLICAC_PRODUCE_P_PROYECTO" FOREIGN KEY ("ID_PROYECTO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_PROYECTO") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TIENE_PRERREQUISITO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ADD CONSTRAINT "FK_PRERREQ_ASIG_HIJA" FOREIGN KEY ("ID_ASIGNATURA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ADD CONSTRAINT "FK_PRERREQ_ASIG_PADRE" FOREIGN KEY ("ASI_ID_ASIGNATURA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TITULO_ACADEMICO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" ADD CONSTRAINT "FK_TITULO_A_POSEE_TIT_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRIBUNAL_GRADO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ADD CONSTRAINT "FK_TRIBUNAL_TRIBUNAL__PROCESO_" FOREIGN KEY ("ID_PROCESO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ("ID_PROCESO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ADD CONSTRAINT "FK_TRIBUNAL_TRIBUNAL__DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE CASCADE ENABLE;

/*
TERCERA FASE: Data Seeder. Se definen los dominios como estados de estudiantes, en el cual se crean
las inserciones de datos base: 8 facultades, 35 carreras, 450 docentes y 200 asignaturas.
*/

SET DEFINE OFF;
SET SERVEROUTPUT ON;

--- 1. CARGANDO DOMINIOS (CATALOGOS)

-- TIPO_BECA: Valores reales de negocio
INSERT INTO TIPO_BECA (ID_BECA, NOMBRE_BECA) VALUES (SEQ_TIPO_BECA.NEXTVAL, 'EXCELENCIA ACADEMICA');
INSERT INTO TIPO_BECA (ID_BECA, NOMBRE_BECA) VALUES (SEQ_TIPO_BECA.NEXTVAL, 'DEPORTIVA DE ALTO RENDIMIENTO');
INSERT INTO TIPO_BECA (ID_BECA, NOMBRE_BECA) VALUES (SEQ_TIPO_BECA.NEXTVAL, 'AYUDA SOCIOECONOMICA');
INSERT INTO TIPO_BECA (ID_BECA, NOMBRE_BECA) VALUES (SEQ_TIPO_BECA.NEXTVAL, 'INVESTIGACION CIENTIFICA');
INSERT INTO TIPO_BECA (ID_BECA, NOMBRE_BECA) VALUES (SEQ_TIPO_BECA.NEXTVAL, 'PUEBLOS Y NACIONALIDADES');
INSERT INTO TIPO_BECA (ID_BECA, NOMBRE_BECA) VALUES (SEQ_TIPO_BECA.NEXTVAL, 'DISCAPACIDAD');

COMMIT;

--- 2. INSERTANDO 8 FACULTADES (SIN DECANO AUN)

-- Insertamos con ID_DOCENTE en NULL para evitar error de FK (El huevo y la gallina)
-- Usamos nombres formales de facultades.
BEGIN
    INSERT INTO FACULTAD VALUES (SEQ_FACULTAD.NEXTVAL, NULL, 'FACULTAD DE INGENIERIA Y CIENCIAS APLICADAS', 1);
    INSERT INTO FACULTAD VALUES (SEQ_FACULTAD.NEXTVAL, NULL, 'FACULTAD DE CIENCIAS MEDICAS', 2);
    INSERT INTO FACULTAD VALUES (SEQ_FACULTAD.NEXTVAL, NULL, 'FACULTAD DE CIENCIAS ADMINISTRATIVAS', 3);
    INSERT INTO FACULTAD VALUES (SEQ_FACULTAD.NEXTVAL, NULL, 'FACULTAD DE JURISPRUDENCIA Y CIENCIAS POLITICAS', 4);
    INSERT INTO FACULTAD VALUES (SEQ_FACULTAD.NEXTVAL, NULL, 'FACULTAD DE ARQUITECTURA Y URBANISMO', 5);
    INSERT INTO FACULTAD VALUES (SEQ_FACULTAD.NEXTVAL, NULL, 'FACULTAD DE FILOSOFIA Y LETRAS', 6);
    INSERT INTO FACULTAD VALUES (SEQ_FACULTAD.NEXTVAL, NULL, 'FACULTAD DE CIENCIAS ECONOMICAS', 7);
    INSERT INTO FACULTAD VALUES (SEQ_FACULTAD.NEXTVAL, NULL, 'FACULTAD DE COMUNICACION SOCIAL', 8);
    COMMIT;
END;
/

--- 3. INSERTANDO 35 CARRERAS (SIN COORDINADOR AUN)

DECLARE
    -- Definimos las carreras agrupadas para asignarlas a las facultades creadas arriba (IDs 1 al 8)
    TYPE t_lista IS VARRAY(35) OF VARCHAR2(100);
    v_carreras t_lista := t_lista(
        -- Facultad 1: Ingenieria (7 carreras)
        'Ingeniería en Sistemas de Información', 'Ingeniería Civil', 'Ingeniería Industrial', 'Ingeniería Mecatrónica', 'Ingeniería Electrónica y Telecomunicaciones', 'Ingeniería Ambiental', 'Ingeniería en Software',
        -- Facultad 2: Medicina (5 carreras)
        'Medicina General', 'Enfermería', 'Odontología', 'Terapia Física', 'Laboratorio Clínico',
        -- Facultad 3: Administración (5 carreras)
        'Administración de Empresas', 'Contabilidad y Auditoría', 'Marketing', 'Gestión del Talento Humano', 'Negocios Internacionales',
        -- Facultad 4: Jurisprudencia (3 carreras)
        'Derecho', 'Ciencias Políticas', 'Sociología',
        -- Facultad 5: Arquitectura (3 carreras)
        'Arquitectura', 'Diseño Gráfico', 'Diseño de Interiores',
        -- Facultad 6: Filosofía (4 carreras)
        'Psicología Clínica', 'Psicología Educativa', 'Pedagogía de los Idiomas', 'Educación Inicial',
        -- Facultad 7: Economía (4 carreras)
        'Economía', 'Finanzas', 'Estadística', 'Ingeniería Comercial',
        -- Facultad 8: Comunicación (4 carreras)
        'Periodismo', 'Comunicación Organizacional', 'Publicidad', 'Producción Audiovisual'
    );
    
    v_facultad_id NUMBER;
BEGIN
    FOR i IN 1..35 LOOP
        -- Lógica simple para asignar facultades basándonos en el orden de la lista
        IF i <= 7 THEN v_facultad_id := 1;
        ELSIF i <= 12 THEN v_facultad_id := 2;
        ELSIF i <= 17 THEN v_facultad_id := 3;
        ELSIF i <= 20 THEN v_facultad_id := 4;
        ELSIF i <= 23 THEN v_facultad_id := 5;
        ELSIF i <= 27 THEN v_facultad_id := 6;
        ELSIF i <= 31 THEN v_facultad_id := 7;
        ELSE v_facultad_id := 8;
        END IF;

        INSERT INTO CARRERA (ID_CARRERA, ID_FACULTAD, ID_DOCENTE, NOMBRE_CARRERA, NIVEL_CARRERA, MODALIDAD_CARRERA, DURACION_SEMESTRES)
        VALUES (
            SEQ_CARRERA.NEXTVAL, 
            v_facultad_id, 
            NULL, -- Se actualiza luego
            v_carreras(i), 
            'GRADO', 
            CASE WHEN MOD(i,5)=0 THEN 'HIBRIDA' ELSE 'PRESENCIAL' END, -- Variamos modalidad
            CASE WHEN v_facultad_id = 2 THEN 10 ELSE 9 END -- Medicina dura más
        );
    END LOOP;
    COMMIT;
END;
/

--- 4. GENERANDO 450 DOCENTES

DECLARE
    -- Arrays para combinaciones de nombres
    v_nombres  SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('Juan', 'Maria', 'Carlos', 'Ana', 'Luis', 'Sofia', 'Jose', 'Paula', 'Jorge', 'Elena', 'Pedro', 'Lucia', 'Miguel', 'Carmen', 'David', 'Laura', 'Fernando', 'Andrea', 'Ricardo', 'Isabel');
    v_apellidos SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('Perez', 'Gomez', 'Rodriguez', 'Fernandez', 'Lopez', 'Diaz', 'Martinez', 'Garcia', 'Sanchez', 'Romero', 'Torres', 'Ramirez', 'Vargas', 'Ruiz', 'Castro', 'Herrera', 'Morales', 'Ortega', 'Mendoza', 'Flores');
    
    v_nombre_completo VARCHAR2(100);
    v_apellido_completo VARCHAR2(100);
    v_email VARCHAR2(100);
    v_cedula_base NUMBER := 170000000;
    v_facultad_random NUMBER;
    v_carrera_random NUMBER;
    v_tipo_profe VARCHAR2(50);
BEGIN
    FOR i IN 1..450 LOOP
        -- Generar nombres aleatorios combinando dos elementos de las listas
        v_nombre_completo := v_nombres(TRUNC(DBMS_RANDOM.VALUE(1, 21))); 
        v_apellido_completo := v_apellidos(TRUNC(DBMS_RANDOM.VALUE(1, 21))) || ' ' || v_apellidos(TRUNC(DBMS_RANDOM.VALUE(1, 21)));
        
        -- Generar email realista: juan.perez45@universidad.edu.ec
        v_email := LOWER(SUBSTR(v_nombre_completo, 1, INSTR(v_nombre_completo, ' ')-1)) || '.' || 
                   LOWER(SUBSTR(v_apellido_completo, 1, INSTR(v_apellido_completo, ' ')-1)) || i || '@universidad.edu.ec';
        
        -- Limpiar espacios en email si es nombre simple
        IF v_email LIKE '.%' THEN v_email := LOWER(v_nombre_completo) || i || '@universidad.edu.ec'; END IF;

        -- Asignar facultad aleatoria (1-8)
        v_facultad_random := TRUNC(DBMS_RANDOM.VALUE(1, 9));
        
        -- Intentar asignar una carrera que pertenezca a esa facultad (simplificado: carrera random 1-35)
        -- En un entorno real haríamos un query, aquí asignamos carrera random para data seeder
        v_carrera_random := TRUNC(DBMS_RANDOM.VALUE(1, 36));

        -- Determinar tipo
        IF MOD(i, 10) < 6 THEN v_tipo_profe := 'TITULAR TIEMPO COMPLETO';
        ELSIF MOD(i, 10) < 8 THEN v_tipo_profe := 'MEDIO TIEMPO';
        ELSE v_tipo_profe := 'OCASIONAL';
        END IF;

        INSERT INTO DOCENTE (
            ID_DOCENTE, ID_FACULTAD, FAC_ID_FACULTAD, ID_CARRERA, 
            NUMERO_UNICO, CEDULA, NOMBRES_DOCENTE, APELLIDOS_DOCENTE, 
            EMAIL_INSTITUCIONAL, TIPO_PROFESOR, CATEGORIA_DOCENTE, FECHA_INGRESO
        ) VALUES (
            SEQ_DOCENTE.NEXTVAL,
            v_facultad_random,
            v_facultad_random,
            v_carrera_random,
            'D-' || LPAD(i, 5, '0'),
            TO_CHAR(v_cedula_base + i), -- Cédula única
            v_nombre_completo,
            v_apellido_completo,
            v_email,
            v_tipo_profe,
            CASE WHEN i < 50 THEN 'PRINCIPAL 1' ELSE 'AGREGADO' END,
            ADD_MONTHS(SYSDATE, -TRUNC(DBMS_RANDOM.VALUE(12, 240))) -- Fecha ingreso hace 1 a 20 años
        );
    END LOOP;
    COMMIT;
END;
/

--- 5. ACTUALIZACION DE AUTORIDADES (DECANOS Y COORDINADORES)

-- Ahora que existen docentes, asignamos Decanos a Facultades
BEGIN
    FOR r IN (SELECT ID_FACULTAD FROM FACULTAD) LOOP
        UPDATE FACULTAD 
        SET ID_DOCENTE = (
            SELECT ID_DOCENTE FROM (
                SELECT ID_DOCENTE FROM DOCENTE WHERE ID_FACULTAD = r.ID_FACULTAD ORDER BY DBMS_RANDOM.VALUE
            ) WHERE ROWNUM = 1
        )
        WHERE ID_FACULTAD = r.ID_FACULTAD;
    END LOOP;
    COMMIT;
END;
/

-- Asignamos Coordinadores a Carreras
BEGIN
    FOR r IN (SELECT ID_CARRERA FROM CARRERA) LOOP
        UPDATE CARRERA 
        SET ID_DOCENTE = (
            SELECT ID_DOCENTE FROM (
                -- Buscamos cualquier docente (simplificación para seeder)
                SELECT ID_DOCENTE FROM DOCENTE ORDER BY DBMS_RANDOM.VALUE
            ) WHERE ROWNUM = 1
        )
        WHERE ID_CARRERA = r.ID_CARRERA;
    END LOOP;
    COMMIT;
END;
/

--- 6. GENERANDO 200 ASIGNATURAS

DECLARE
    v_prefijos SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('Fundamentos de', 'Introducción a', 'Taller de', 'Laboratorio de', 'Gerencia de', 'Teoría de', 'Historia de', 'Metodología de');
    v_temas SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('Programación', 'Cálculo Diferencial', 'Derecho Romano', 'Marketing Digital', 'Anatomía Humana', 'Física Cuántica', 'Bases de Datos', 'Inteligencia Artificial', 'Estadística', 'Microeconomía', 'Diseño Urbano', 'Psicología Infantil', 'Contabilidad de Costos', 'Redes de Datos', 'Legislación Laboral');
    v_sufijos SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('I', 'II', 'III', 'Avanzado', 'Aplicado', 'General', 'Estratégico');
    
    v_nombre_asig VARCHAR2(100);
    v_area VARCHAR2(50);
BEGIN
    FOR i IN 1..200 LOOP
        -- Construir nombre tipo: "Fundamentos de Bases de Datos I"
        v_nombre_asig := v_prefijos(TRUNC(DBMS_RANDOM.VALUE(1, 9))) || ' ' || 
                         v_temas(TRUNC(DBMS_RANDOM.VALUE(1, 16))) || ' ' || 
                         v_sufijos(TRUNC(DBMS_RANDOM.VALUE(1, 8)));
                         
        -- Asignar área basada en el nombre generado (lógica simple)
        IF v_nombre_asig LIKE '%Programación%' OR v_nombre_asig LIKE '%Datos%' OR v_nombre_asig LIKE '%Redes%' OR v_nombre_asig LIKE '%Inteligencia%' THEN v_area := 'TECNOLOGIA';
        ELSIF v_nombre_asig LIKE '%Derecho%' OR v_nombre_asig LIKE '%Legislación%' THEN v_area := 'LEGAL';
        ELSIF v_nombre_asig LIKE '%Anatomía%' THEN v_area := 'SALUD';
        ELSIF v_nombre_asig LIKE '%Marketing%' OR v_nombre_asig LIKE '%Gerencia%' OR v_nombre_asig LIKE '%Economía%' OR v_nombre_asig LIKE '%Contabilidad%' THEN v_area := 'ADMINISTRATIVA';
        ELSE v_area := 'CIENCIAS BASICAS';
        END IF;

        INSERT INTO ASIGNATURA (
            ID_ASIGNATURA, CODIGO_ASIGNATURA, NOMBRE_ASIGNATURA, 
            NUMERO_CREDITOS, TIPO_ASIGNATURA, AREA_CONOCIMIENTO
        ) VALUES (
            SEQ_ASIGNATURA.NEXTVAL,
            'ASIG-' || LPAD(i, 4, '0'), -- Ejemplo: ASIG-0001
            v_nombre_asig,
            TRUNC(DBMS_RANDOM.VALUE(2, 6)), -- Créditos entre 2 y 5
            CASE WHEN MOD(i, 4) = 0 THEN 'OPTATIVA' ELSE 'OBLIGATORIA' END,
            v_area
        );
    END LOOP;
    COMMIT;
END;
/

/*
CUARTA FASE: Generacion de datos transaccionales, en donde se generan 12000 estudiantes, 1000 matriculas activas y
3000 registros historicos.
*/

--PARA ESTUDIANTE
--Nombres y Apellidos aleatorios 

DECLARE
  -- Listas de datos
  nombres SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST(
    'María', 'José', 'Luis', 'Ana', 'Javier', 'Paula', 'Diego', 'Lucía', 'Miguel', 'Carmen',
    'Sara', 'Antonio', 'Laura', 'Daniel', 'Julio', 'Andrea', 'Fernando', 'Patricia', 'Juan', 'Sofía',
    'Gabriel', 'Isabel', 'Iván', 'Marta', 'Santiago', 'Rosa', 'Pedro', 'Angela', 'Cristina', 'Manuel'
  );
  
  apellidos SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST(
    'García', 'Fernández', 'López', 'Martínez', 'Sánchez', 'Rodríguez', 'Pérez', 'Morales', 'Gómez', 'Ruiz',
    'Díaz', 'Hernández', 'Muñoz', 'Jiménez', 'Romero', 'Vázquez', 'Alonso', 'Domínguez', 'Castro', 'Torres'
  );

  -- Variables temporales para asegurar consistencia
  v_nombre_seleccionado VARCHAR2(100);
  v_apellido_seleccionado VARCHAR2(100);
  v_email_generado VARCHAR2(150);
  
BEGIN
  -- Para insertar 2000 registros
  FOR i IN 1 .. 2000 LOOP
    
    -- 1. Seleccionamos nombre y apellido UNA sola vez por iteración
    -- Nota: Usamos .COUNT + 1 para que TRUNC pueda incluir el último elemento de la lista
    v_nombre_seleccionado := nombres(TRUNC(DBMS_RANDOM.VALUE(1, nombres.COUNT + 1)));
    v_apellido_seleccionado := apellidos(TRUNC(DBMS_RANDOM.VALUE(1, apellidos.COUNT + 1)));
    
    -- 2. Generamos el email ÚNICO agregando el número 'i' al final
    -- Esto soluciona el error ORA-00001
    v_email_generado := LOWER(v_nombre_seleccionado || '.' || v_apellido_seleccionado || i || '@universidad.edu.ec');

    INSERT INTO ESTUDIANTE (
      ID_ESTUDIANTE, 
      NUMERO_UNICO, 
      CEDULA, 
      NOMBRES_ESTUDIANTE, 
      APELLIDOS_ESTUDIANTE, 
      EMAIL_INSTITUCIONAL, 
      FECHA_INGRESO, 
      ESTADO_ESTUDIANTE, 
      IRA
    )
    VALUES (
      SEQ_ESTUDIANTE.NEXTVAL,        -- Usamos la secuencia creada en el script
      'E-' || LPAD(i, 5, '0'),       -- Numero unico formateado (ej: E-00123) para evitar duplicados
      TO_CHAR(1000000000 + i),       -- Cédula incremental para evitar duplicados (UQ_EST_CEDULA)
      v_nombre_seleccionado,
      v_apellido_seleccionado,
      v_email_generado,              -- Usamos el email único generado arriba
      TO_DATE('01/09/2023', 'DD/MM/YYYY'),
      'ACTIVO',
      ROUND(DBMS_RANDOM.VALUE(7, 10), 2) -- IRA entre 7 y 10
    );
  END LOOP;
  
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Se insertaron 2000 estudiantes correctamente.');
END;
/

--- Se eliminan tildes y caracteres especiales
UPDATE ESTUDIANTE
SET 
    -- Reemplaza ÁÉÍÓÚáéíóú por AEIOUaeiou y Ññ por Nn
    NOMBRES_ESTUDIANTE = TRANSLATE(NOMBRES_ESTUDIANTE, 'ÁÉÍÓÚáéíóúÑñ', 'AEIOUaeiouNn'),
    APELLIDOS_ESTUDIANTE = TRANSLATE(APELLIDOS_ESTUDIANTE, 'ÁÉÍÓÚáéíóúÑñ', 'AEIOUaeiouNn'),
    -- Es recomendable limpiar también el correo si se generó con caracteres especiales
    EMAIL_INSTITUCIONAL = TRANSLATE(EMAIL_INSTITUCIONAL, 'ÁÉÍÓÚáéíóúÑñ', 'AEIOUaeiouNn');

COMMIT;

--MATRICULA NECESITA DATOS DE PERIDO ACADEMICO ANTES
--PARA PERIODO ACADEMICO
DECLARE
  -- Define las fechas reales de tus 5 periodos
  TYPE fecha_periodo_type IS TABLE OF DATE;
  TYPE codigo_periodo_type IS TABLE OF VARCHAR2(10);

  fechas_inicio fecha_periodo_type := fecha_periodo_type(
    TO_DATE('2025-09-01', 'YYYY-MM-DD'),
    TO_DATE('2026-02-01', 'YYYY-MM-DD'),
    TO_DATE('2026-09-01', 'YYYY-MM-DD'),
    TO_DATE('2027-02-01', 'YYYY-MM-DD'),
    TO_DATE('2027-09-01', 'YYYY-MM-DD')
  );
  fechas_fin fecha_periodo_type := fecha_periodo_type(
    TO_DATE('2026-01-15', 'YYYY-MM-DD'),
    TO_DATE('2026-06-30', 'YYYY-MM-DD'),
    TO_DATE('2027-01-15', 'YYYY-MM-DD'),
    TO_DATE('2027-06-30', 'YYYY-MM-DD'),
    TO_DATE('2028-01-15', 'YYYY-MM-DD')
  );
  codigos codigo_periodo_type := codigo_periodo_type('2025A', '2025B', '2026A', '2026B', '2027A');
BEGIN
  FOR i IN 1..2000 LOOP
    -- Cicla los periodos: cada grupo de registros compartirá fechas de uno de los 5 periodos reales
    DECLARE
      periodo_idx NUMBER := MOD(i-1, 5) + 1;
    BEGIN
      INSERT INTO PERIODO_ACADEMICO (
        ID_PERIODO,
        CODIGO_PERIODO,
        NOMBRE_PERIODO,
        FECHA_INICIO,
        FECHA_FIN,
        ESTADO_PERIODO
      ) VALUES (
        i,
        codigos(periodo_idx) || '-' || i,      -- '2025A-1', '2025B-2', etc.
        'Prd-' || i,
        fechas_inicio(periodo_idx),
        fechas_fin(periodo_idx),
        CASE WHEN MOD(i,2)=0 THEN 'ACTIVO' ELSE 'INACTIVO' END
      );
    END;
  END LOOP;
END;
/

-- PARA MATRICULA
-- LLena exactamente 1000 matrículas con FORMA_MATRICULA='ORDINARIA'
DECLARE
  fecha_base DATE := TO_DATE('2025-09-01', 'YYYY-MM-DD');
  CURSOR c_est IS SELECT ID_ESTUDIANTE FROM ESTUDIANTE ORDER BY ID_ESTUDIANTE FETCH FIRST 1000 ROWS ONLY;
  idx NUMBER := 0;
BEGIN
  FOR r_est IN c_est LOOP
    idx := idx + 1;
    INSERT INTO MATRICULA (
      ID_MATRICULA,
      ID_ESTUDIANTE,
      ID_PERIODO,
      FECHA_REGISTRO,
      FORMA_MATRICULA
    )
    VALUES (
      SEQ_MATRICULA.NEXTVAL,
      r_est.ID_ESTUDIANTE,          -- Solo IDs válidos de estudiante
      MOD(idx-1, 1000) + 1,         -- Periodos académicos entre 1 y 1000 (ajusta si tienes menos/más)
      fecha_base + MOD(idx, 90),    -- Fechas distribuidas dentro de los 3 primeros meses
      'ORDINARIA'                   -- Todas las matrículas activas
    );
    EXIT WHEN idx = 1000;           -- Asegura que solo se inserten 1,000
  END LOOP;
END;
/

--PARA HISTORIAL ACADEMICO
-- Llenar 3000 registros simulados en HISTORIAL_ACADEMICO

DECLARE
  CURSOR c_est IS SELECT ID_ESTUDIANTE FROM ESTUDIANTE ORDER BY ID_ESTUDIANTE FETCH FIRST 3000 ROWS ONLY;
  idx NUMBER := 0;
  fecha_base DATE := TO_DATE('2025-11-23', 'YYYY-MM-DD'); -- Fecha actual como referencia
BEGIN
  FOR r_est IN c_est LOOP
    idx := idx + 1;
    INSERT INTO HISTORIAL_ACADEMICO (
      ID_HISTORIAL,        -- Clave primaria autoincremental por secuencia
      ID_ESTUDIANTE,       -- Solo IDs válidos de la tabla ESTUDIANTE
      ID_PERIODO,          -- Periodos académicos existentes (ajusta el rango según tus datos)
      NOTA_DEFINITIVA,     -- Calificación entre 7 y 10, dos decimales
      ESTADO_MATERIA       -- Estado: alterna entre 'APROBADO' y 'REPROBADO'
    )
    VALUES (
      idx,                               -- Usa contador como PK; si tienes una secuencia, reemplaza por historial_seq.NEXTVAL
      r_est.ID_ESTUDIANTE,
      MOD(idx-1, 1000) + 1,              -- Periodo entre 1 y 1000 (ajusta a tu rango de periodos disponibles)
      ROUND(DBMS_RANDOM.VALUE(7, 10), 2),
      CASE WHEN MOD(idx,2)=0 THEN 'APROBADO' ELSE 'REPROBADO' END
    );
    EXIT WHEN idx = 3000;                -- Solo se insertan 3,000 registros
  END LOOP;
END;
/

--- Transacciones masivas de matricula para el nuevo periodo academico
SET SERVEROUTPUT ON;

DECLARE
    v_id_periodo NUMBER;
    v_id_matricula NUMBER;
    v_cnt_ofertas NUMBER;
    v_existe_periodo NUMBER;
BEGIN
    -- ==========================================
    -- 1. GESTIÓN DEL PERIODO ACADÉMICO (CORREGIDO)
    -- ==========================================
    
    -- Verificamos si ya existe un periodo ACTIVO para no repetir el INSERT
    SELECT COUNT(*) INTO v_existe_periodo 
    FROM PERIODO_ACADEMICO 
    WHERE ESTADO_PERIODO = 'ACTIVO';

    IF v_existe_periodo > 0 THEN
        -- Si ya existe, obtenemos su ID para usarlo
        SELECT ID_PERIODO INTO v_id_periodo 
        FROM PERIODO_ACADEMICO 
        WHERE ESTADO_PERIODO = 'ACTIVO' 
        FETCH FIRST 1 ROWS ONLY;
        
        DBMS_OUTPUT.PUT_LINE('>> Ya existía un periodo activo (ID: ' || v_id_periodo || '). Se usará este.');
    ELSE
        -- Si no existe, lo creamos
        v_id_periodo := SEQ_PERIODO.NEXTVAL;
        
        INSERT INTO PERIODO_ACADEMICO (
            ID_PERIODO, CODIGO_PERIODO, NOMBRE_PERIODO, FECHA_INICIO, FECHA_FIN, ESTADO_PERIODO
        ) VALUES (
            v_id_periodo, '2025-01', 'MAY-SEP', SYSDATE, SYSDATE + 120, 'ACTIVO'
        );
        DBMS_OUTPUT.PUT_LINE('>> Periodo Activo creado exitosamente (ID: ' || v_id_periodo || ').');
    END IF;

    -- ==========================================
    -- 2. GESTIÓN DE OFERTA ACADÉMICA
    -- ==========================================
    
    -- Verificamos si ya hay ofertas para este periodo para no duplicar
    SELECT COUNT(*) INTO v_cnt_ofertas FROM OFERTA_ASIGNATURA WHERE ID_PERIODO = v_id_periodo;
    
    IF v_cnt_ofertas = 0 THEN
        -- Si no hay ofertas, abrimos las 200 materias
        FOR r_asig IN (SELECT ID_ASIGNATURA FROM ASIGNATURA) LOOP
            INSERT INTO OFERTA_ASIGNATURA (
                ID_OFERTA, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, CODIGO_PARALELO, CUPO_MAXIMO, CUPO_DISPONIBLE
            ) VALUES (
                SEQ_OFERTA.NEXTVAL,
                v_id_periodo,
                r_asig.ID_ASIGNATURA,
                (SELECT ID_DOCENTE FROM (SELECT ID_DOCENTE FROM DOCENTE ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1),
                'A',
                30,
                30
            );
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('>> Se abrieron asignaturas para el periodo.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('>> Las ofertas académicas ya existían. Saltando este paso.');
    END IF;

    -- ==========================================
    -- 3. MATRICULACIÓN MASIVA
    -- ==========================================
    DBMS_OUTPUT.PUT_LINE('>> Iniciando proceso de matriculación...');
    
    -- Tomaremos 500 estudiantes al azar
    FOR r_est IN (SELECT ID_ESTUDIANTE FROM ESTUDIANTE ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 500 ROWS ONLY) LOOP
        
        -- Verificar si el estudiante ya tiene matrícula en este periodo para no duplicar
        DECLARE
            v_tiene_matricula NUMBER;
        BEGIN
            SELECT COUNT(*) INTO v_tiene_matricula 
            FROM MATRICULA 
            WHERE ID_ESTUDIANTE = r_est.ID_ESTUDIANTE AND ID_PERIODO = v_id_periodo;
            
            IF v_tiene_matricula = 0 THEN
                -- A. Crear Cabecera de Matrícula
                v_id_matricula := SEQ_MATRICULA.NEXTVAL;
                
                INSERT INTO MATRICULA (
                    ID_MATRICULA, ID_ESTUDIANTE, ID_PERIODO, FECHA_REGISTRO, FORMA_MATRICULA
                ) VALUES (
                    v_id_matricula, r_est.ID_ESTUDIANTE, v_id_periodo, SYSDATE, 'EN LINEA'
                );

                -- B. Inscribir materias (Calificaciones vacías)
                FOR r_oferta IN (
                    SELECT ID_OFERTA FROM OFERTA_ASIGNATURA 
                    WHERE ID_PERIODO = v_id_periodo 
                    ORDER BY DBMS_RANDOM.VALUE 
                    FETCH FIRST 4 ROWS ONLY
                ) LOOP
                    INSERT INTO CALIFICACION (
                        ID_CALIFICACION, ID_MATRICULA, ID_OFERTA, 
                        NOTA_PARCIAL_1, ASISTENCIA_PORCENTAJE
                    ) VALUES (
                        SEQ_CALIFICACION.NEXTVAL,
                        v_id_matricula,
                        r_oferta.ID_OFERTA,
                        ROUND(DBMS_RANDOM.VALUE(5, 20), 2), -- Nota inicial aleatoria
                        100
                    );
                    
                    -- Actualizar cupo (opcional)
                    UPDATE OFERTA_ASIGNATURA SET CUPO_DISPONIBLE = CUPO_DISPONIBLE - 1 WHERE ID_OFERTA = r_oferta.ID_OFERTA;
                END LOOP;
            END IF;
        END;
        
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('=== PROCESO FINALIZADO EXITOSAMENTE ===');
    DBMS_OUTPUT.PUT_LINE('Ahora puedes ejecutar tu SELECT con los JOINs.');
END;
/
--- Terminada fase cuatro

/*
QUINTA FASE: Consultas Q1-Q8. Consultas de Joins y subconsultas (listado de alumnos, docentes con sobrecarga, riesgo de desercion)
*/

-- AGREGAR COLUMNA ID_CARRERA A ESTUDIANTE Y ASIGNAR VALORES ALEATORIOS
-- 1. Agregar la columna faltante a la tabla
ALTER TABLE ESTUDIANTE ADD ID_CARRERA INTEGER;

-- 2. Crear la relación (Foreign Key) para mantener la integridad
ALTER TABLE ESTUDIANTE 
ADD CONSTRAINT FK_ESTUDIANTE_CARRERA 
FOREIGN KEY (ID_CARRERA) REFERENCES CARRERA(ID_CARRERA);

-- 3. Asignar una carrera aleatoria a los estudiantes que ya existen (Data Seeder)
BEGIN
  FOR r IN (SELECT ID_ESTUDIANTE FROM ESTUDIANTE) LOOP
    UPDATE ESTUDIANTE 
    SET ID_CARRERA = TRUNC(DBMS_RANDOM.VALUE(1, 36)) -- Asigna carrera random de la 1 a la 35
    WHERE ID_ESTUDIANTE = r.ID_ESTUDIANTE;
  END LOOP;
  COMMIT;
END;
/

--Q1: LISTADO DE ESTUDIANTES MATRICULADOS (PERIODO ACTUAL)
--Muestra: Estudiante, Carrera, Asignatura, Docente y Paralelo
SELECT 
    e.NOMBRES_ESTUDIANTE || ' ' || e.APELLIDOS_ESTUDIANTE AS NOMBRE_COMPLETO,
    c.NOMBRE_CARRERA,
    asig.NOMBRE_ASIGNATURA,
    d.NOMBRES_DOCENTE || ' ' || d.APELLIDOS_DOCENTE AS DOCENTE_ASIGNADO,
    oa.CODIGO_PARALELO
FROM ESTUDIANTE e
-- 1. Unimos con la carrera para saber qué estudia
JOIN CARRERA c ON e.ID_CARRERA = c.ID_CARRERA
-- 2. Unimos con matrícula para ver si está inscrito
JOIN MATRICULA m ON e.ID_ESTUDIANTE = m.ID_ESTUDIANTE
-- 3. Filtramos solo el PERIODO ACTUAL (ACTIVO)
JOIN PERIODO_ACADEMICO pa ON m.ID_PERIODO = pa.ID_PERIODO
-- 4. Unimos con CALIFICACION, que es la tabla que conecta al alumno con la oferta específica
JOIN CALIFICACION cal ON m.ID_MATRICULA = cal.ID_MATRICULA
-- 5. Llegamos a la OFERTA para saber paralelo y docente
JOIN OFERTA_ASIGNATURA oa ON cal.ID_OFERTA = oa.ID_OFERTA
-- 6. Obtenemos el nombre de la materia
JOIN ASIGNATURA asig ON oa.ID_ASIGNATURA = asig.ID_ASIGNATURA
-- 7. Obtenemos el docente (LEFT JOIN por si alguna materia aún no tiene profe asignado)
LEFT JOIN DOCENTE d ON oa.ID_DOCENTE = d.ID_DOCENTE
WHERE pa.ESTADO_PERIODO = 'ACTIVO'
ORDER BY e.APELLIDOS_ESTUDIANTE, asig.NOMBRE_ASIGNATURA;

--Q2: docentes con su carga horaria actual,incluyendo: nombres, categoría académica, tipo de dedicación, total de horas de docencia
--semanales, número de asignaturas que imparte.
SELECT 
    d.NOMBRES_DOCENTE || ' ' || d.APELLIDOS_DOCENTE AS NOMBRE_DOCENTE,
    d.CATEGORIA_DOCENTE,
    d.TIPO_PROFESOR AS TIPO_DEDICACION,
    NVL(ROUND(SUM(CASE 
        WHEN pa.ESTADO_PERIODO = 'ACTIVO' 
        THEN (h.HORA_FIN - h.HORA_INICIO) * 24 
        ELSE 0 
    END), 2), 0) AS TOTAL_HORAS_SEMANALES,
    COUNT(DISTINCT CASE 
        WHEN pa.ESTADO_PERIODO = 'ACTIVO' 
        THEN oa.ID_ASIGNATURA 
    END) AS NUMERO_ASIGNATURAS
FROM DOCENTE d
LEFT JOIN OFERTA_ASIGNATURA oa ON d.ID_DOCENTE = oa.ID_DOCENTE
LEFT JOIN PERIODO_ACADEMICO pa ON oa.ID_PERIODO = pa.ID_PERIODO
LEFT JOIN HORARIO_CLASE h ON oa.ID_OFERTA = h.ID_OFERTA
GROUP BY d.ID_DOCENTE, d.NOMBRES_DOCENTE, d.APELLIDOS_DOCENTE, d.CATEGORIA_DOCENTE, d.TIPO_PROFESOR
ORDER BY TOTAL_HORAS_SEMANALES DESC;

/* ============================================================
   REPARACIÓN AUTÓNOMA PARA Q3 - INTEGRANTE 5
   Asegura Asignaturas -> Mallas -> Prerrequisitos
   ============================================================ */
SET SERVEROUTPUT ON;

BEGIN
    -- 1. ASEGURAR ASIGNATURAS (Padres)
    -- Insertamos IDs del 1 al 20 si no existen
    FOR i IN 1..20 LOOP
        MERGE INTO ASIGNATURA a USING (SELECT i ID, 'MAT-'||i C, 'Asignatura '||i N FROM DUAL) b
        ON (a.ID_ASIGNATURA = b.ID)
        WHEN NOT MATCHED THEN
        INSERT (ID_ASIGNATURA, CODIGO_ASIGNATURA, NOMBRE_ASIGNATURA, NUMERO_CREDITOS, TIPO_ASIGNATURA, AREA_CONOCIMIENTO)
        VALUES (b.ID, b.C, b.N, 4, 'OBLIGATORIA', 'CIENCIAS');
    END LOOP;

    -- 2. ASEGURAR MALLAS (Padres)
    -- Creamos Malla 1 y 2 vinculadas a carreras existentes (o genéricas)
    MERGE INTO MALLA_CURRICULAR a USING (SELECT 1 ID, 1 CARRERA FROM DUAL) b
    ON (a.ID_MALLA = b.ID) WHEN NOT MATCHED THEN 
    INSERT (ID_MALLA, ID_CARRERA, CODIGO_COHORTE, FECHA_APROBACION, TOTAL_CREDITOS, ESTADO_MALLA)
    VALUES (b.ID, b.CARRERA, '2025', SYSDATE, 100, 'ACTIVA');

    MERGE INTO MALLA_CURRICULAR a USING (SELECT 2 ID, 2 CARRERA FROM DUAL) b
    ON (a.ID_MALLA = b.ID) WHEN NOT MATCHED THEN 
    INSERT (ID_MALLA, ID_CARRERA, CODIGO_COHORTE, FECHA_APROBACION, TOTAL_CREDITOS, ESTADO_MALLA)
    VALUES (b.ID, b.CARRERA, '2025', SYSDATE, 100, 'ACTIVA');

    -- 3. VINCULAR ASIGNATURAS A MALLAS (Detalle)
    FOR i IN 1..20 LOOP
        MERGE INTO DETALLE_MALLA a USING (SELECT i ASIG, CASE WHEN i<=10 THEN 1 ELSE 2 END MALLA FROM DUAL) b
        ON (a.ID_ASIGNATURA = b.ASIG AND a.ID_MALLA = b.MALLA) WHEN NOT MATCHED THEN
        INSERT (ID_ASIGNATURA, ID_MALLA, SEMESTRE_SUGERIDO, HORAS_TEORICAS, HORAS_PRACTICAS)
        VALUES (b.ASIG, b.MALLA, 1, 4, 2);
    END LOOP;

    -- 4. CREAR PRERREQUISITOS
    -- Materia 2 requiere a la 1, la 4 a la 3, etc.
    DELETE FROM TIENE_PRERREQUISITO; 
    FOR i IN 2..20 LOOP
        IF MOD(i, 2) = 0 THEN
            INSERT INTO TIENE_PRERREQUISITO (ASI_ID_ASIGNATURA, ID_ASIGNATURA)
            VALUES (i, i-1); 
        END IF;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('¡Datos reparados! Ahora puedes ejecutar la consulta Q3.');
END;
/

--Q3: Listado de Asignaturas con Prerrequisitos
SELECT 
    c.NOMBRE_CARRERA,
    main.CODIGO_ASIGNATURA AS COD_MATERIA,
    main.NOMBRE_ASIGNATURA AS MATERIA,
    pre.CODIGO_ASIGNATURA AS COD_PRERREQUISITO,
    pre.NOMBRE_ASIGNATURA AS PRERREQUISITO_REQUERIDO
FROM ASIGNATURA main
JOIN TIENE_PRERREQUISITO tp ON main.ID_ASIGNATURA = tp.ASI_ID_ASIGNATURA
JOIN ASIGNATURA pre ON tp.ID_ASIGNATURA = pre.ID_ASIGNATURA
JOIN DETALLE_MALLA dm ON main.ID_ASIGNATURA = dm.ID_ASIGNATURA
JOIN MALLA_CURRICULAR mc ON dm.ID_MALLA = mc.ID_MALLA
JOIN CARRERA c ON mc.ID_CARRERA = c.ID_CARRERA
ORDER BY c.NOMBRE_CARRERA, main.CODIGO_ASIGNATURA;

/* ============================================================
   INYECCIÓN QUIRÚRGICA - SOLUCIÓN ORA-00001
   Usa IDs altos (900000+) para evitar conflictos de clave primaria.
   TODO ESTO PARA EJECUTAR Q4 SIN ERRORES NI VACIOS
   ============================================================ */
SET SERVEROUTPUT ON;

BEGIN
    -- 1. ASEGURAR PERIODO ACTIVO
    MERGE INTO PERIODO_ACADEMICO a USING (SELECT 1 ID, '2025-A' C FROM DUAL) b
    ON (a.ID_PERIODO = b.ID)
    WHEN MATCHED THEN UPDATE SET ESTADO_PERIODO = 'ACTIVO'
    WHEN NOT MATCHED THEN INSERT (ID_PERIODO, CODIGO_PERIODO, NOMBRE_PERIODO, FECHA_INICIO, FECHA_FIN, ESTADO_PERIODO)
    VALUES (1, '2025-A', 'ACTUAL', SYSDATE, SYSDATE+100, 'ACTIVO');

    UPDATE PERIODO_ACADEMICO SET ESTADO_PERIODO = 'CERRADO' WHERE ID_PERIODO <> 1;

    -- 2. ASEGURAR ESTUDIANTES 1, 2, 3
    FOR i IN 1..3 LOOP
        MERGE INTO ESTUDIANTE a USING (SELECT i ID FROM DUAL) b
        ON (a.ID_ESTUDIANTE = b.ID)
        WHEN MATCHED THEN UPDATE SET IRA = 5.5, ID_CARRERA = 1
        WHEN NOT MATCHED THEN INSERT (ID_ESTUDIANTE, NUMERO_UNICO, CEDULA, NOMBRES_ESTUDIANTE, APELLIDOS_ESTUDIANTE, EMAIL_INSTITUCIONAL, FECHA_INGRESO, ESTADO_ESTUDIANTE, IRA, ID_CARRERA)
        VALUES (i, 'RIESGO-'||i, '170000000'||i, 'Estudiante', 'Riesgo '||i, 'riesgo'||i||'@epn.edu.ec', SYSDATE-200, 'ACTIVO', 5.5, 1);
    END LOOP;

    -- 3. LIMPIEZA SEGURA (Borrar hijos primero)
    DELETE FROM CALIFICACION WHERE ID_MATRICULA IN (1, 2, 3);
    DELETE FROM MATRICULA WHERE ID_MATRICULA IN (1, 2, 3);

    -- 4. RECREAR MATRÍCULAS
    FOR i IN 1..3 LOOP
        INSERT INTO MATRICULA (ID_MATRICULA, ID_ESTUDIANTE, ID_PERIODO, FECHA_REGISTRO, FORMA_MATRICULA)
        VALUES (i, i, 1, SYSDATE, 'ORDINARIA');
    END LOOP;

    -- Asegurar Oferta Dummy
    MERGE INTO OFERTA_ASIGNATURA a USING (SELECT 999 ID FROM DUAL) b
    ON (a.ID_OFERTA = b.ID)
    WHEN NOT MATCHED THEN INSERT (ID_OFERTA, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, CODIGO_PARALELO, CUPO_MAXIMO, CUPO_DISPONIBLE)
    VALUES (999, 1, 1, 1, 'GR-RIESGO', 10, 10);

    -- 5. INSERTAR CALIFICACIONES (Con IDs seguros 900000+)
    FOR i IN 1..3 LOOP
        INSERT INTO CALIFICACION (
            ID_CALIFICACION, 
            ID_MATRICULA, 
            ID_OFERTA, 
            NOTA_PARCIAL_1, 
            NOTA_FINAL, 
            ASISTENCIA_PORCENTAJE
        )
        VALUES (
            900000 + i,  -- ID MUY ALTO para evitar ORA-00001
            i, 
            999, 
            5.0, 
            5.0, 
            60.00
        ); 
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('¡Datos de riesgo inyectados correctamente! Ahora ejecuta Q4.');
END;
/

--Q4: Desercion de Estudiantes (IRA < 6.0)
SELECT 
    m.ID_MATRICULA,
    e.NOMBRES_ESTUDIANTE || ' ' || e.APELLIDOS_ESTUDIANTE AS ESTUDIANTE,
    c.NOMBRE_CARRERA,
    e.IRA AS PROMEDIO_ACUMULADO_GPA,
    ROUND(AVG(cal.ASISTENCIA_PORCENTAJE), 2) || '%' AS ASISTENCIA_PROMEDIO
FROM ESTUDIANTE e
JOIN CARRERA c ON e.ID_CARRERA = c.ID_CARRERA
JOIN MATRICULA m ON e.ID_ESTUDIANTE = m.ID_ESTUDIANTE
JOIN PERIODO_ACADEMICO pa ON m.ID_PERIODO = pa.ID_PERIODO
JOIN CALIFICACION cal ON m.ID_MATRICULA = cal.ID_MATRICULA
WHERE pa.ESTADO_PERIODO = 'ACTIVO' 
  AND e.IRA < 7.0
GROUP BY m.ID_MATRICULA, e.NOMBRES_ESTUDIANTE, e.APELLIDOS_ESTUDIANTE, c.NOMBRE_CARRERA, e.IRA
HAVING AVG(cal.ASISTENCIA_PORCENTAJE) < 75
ORDER BY e.IRA ASC;

/* ============================================================
   GENERANDO INFRAESTRUCTURA (AULAS) Y HORARIOS
   NECESARIO PARA Q5
   ============================================================ */

SET SERVEROUTPUT ON;

DECLARE
    v_id_aula NUMBER;
    v_cnt_aulas NUMBER;
    v_cnt_horarios NUMBER;
    v_hora_inicio DATE;
    v_fecha_base DATE := TRUNC(SYSDATE); -- Usamos la fecha de hoy como base para las horas
BEGIN
    -- 1. GENERAR AULAS (Si no existen)
    SELECT COUNT(*) INTO v_cnt_aulas FROM AULA;
    
    IF v_cnt_aulas = 0 THEN
        FOR i IN 1..50 LOOP
            INSERT INTO AULA (ID_AULA, EDIFICIO_AULA, PISO_AULA, NUMERO_AULA, CAPACIDAD_ESTUDIANTES, TIPO_AULA, TIENE_PROYECTOR, DETALLE_EQUIPAMIENTO)
            VALUES (
                SEQ_AULA.NEXTVAL,
                'EDIF-' || TRUNC(DBMS_RANDOM.VALUE(1, 9)), -- Edificios 1 al 8
                TRUNC(DBMS_RANDOM.VALUE(1, 5)), -- Pisos 1 al 4
                'A-' || LPAD(i, 3, '0'),
                35,
                CASE WHEN MOD(i, 5) = 0 THEN 'LABORATORIO' ELSE 'CLASE TEORICA' END,
                1, -- Sí tiene proyector
                'Pizarra, Proyector, PC Docente, Aire Acondicionado'
            );
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('>> Se crearon 50 Aulas.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('>> Las aulas ya existían.');
    END IF;

    -- 2. GENERAR HORARIOS PARA LA OFERTA ACTIVA
    SELECT COUNT(*) INTO v_cnt_horarios FROM HORARIO_CLASE;
    
    IF v_cnt_horarios = 0 THEN
        -- Recorremos todas las ofertas del periodo activo
        FOR r_oferta IN (
            SELECT oa.ID_OFERTA 
            FROM OFERTA_ASIGNATURA oa
            JOIN PERIODO_ACADEMICO pa ON oa.ID_PERIODO = pa.ID_PERIODO
            WHERE pa.ESTADO_PERIODO = 'ACTIVO'
        ) LOOP
            -- Asignamos un aula aleatoria
            v_id_aula := NULL;
            SELECT ID_AULA INTO v_id_aula FROM (SELECT ID_AULA FROM AULA ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1;
            
            -- Definir hora base aleatoria (entre las 7am y las 18pm)
            -- Nota: Usamos una fecha fija + horas para simular el campo DATE que guarda hora
            v_hora_inicio := TO_DATE('01/01/2000', 'DD/MM/YYYY') + (TRUNC(DBMS_RANDOM.VALUE(7, 18)) / 24);

            -- Insertar SESIÓN 1 (Ej: Lunes) - 2 Horas de clase
            INSERT INTO HORARIO_CLASE (ID_HORARIO, ID_AULA, ID_OFERTA, DIA_SEMANA, HORA_INICIO, HORA_FIN)
            VALUES (
                SEQ_HORARIO.NEXTVAL,
                v_id_aula,
                r_oferta.ID_OFERTA,
                'LUNES',
                v_hora_inicio,
                v_hora_inicio + (2/24) -- Sumar 2 horas
            );

            -- Insertar SESIÓN 2 (Ej: Miércoles) - 2 Horas de clase
            INSERT INTO HORARIO_CLASE (ID_HORARIO, ID_AULA, ID_OFERTA, DIA_SEMANA, HORA_INICIO, HORA_FIN)
            VALUES (
                SEQ_HORARIO.NEXTVAL,
                v_id_aula,
                r_oferta.ID_OFERTA,
                'MIERCOLES',
                v_hora_inicio,
                v_hora_inicio + (2/24) -- Sumar 2 horas
            );
            
            -- Total generado por materia: 4 horas semanales.
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('>> Horarios generados (4 horas por asignatura).');
    ELSE
        DBMS_OUTPUT.PUT_LINE('>> Los horarios ya existían.');
    END IF;
    
    COMMIT;
END;
/

--Q5: Docentes con sobrecarga
SELECT 
    d.NUMERO_UNICO AS CODIGO_DOCENTE,
    d.NOMBRES_DOCENTE || ' ' || d.APELLIDOS_DOCENTE AS NOMBRE_COMPLETO,
    d.TIPO_PROFESOR AS DEDICACION,
    ROUND(SUM((h.HORA_FIN - h.HORA_INICIO) * 24), 2) AS TOTAL_HORAS_SEMANALES,
    COUNT(DISTINCT oa.ID_ASIGNATURA) AS NUMERO_ASIGNATURAS,
    LISTAGG(asig.NOMBRE_ASIGNATURA, ', ') WITHIN GROUP (ORDER BY asig.NOMBRE_ASIGNATURA) AS DETALLE_ASIGNATURAS
FROM DOCENTE d
JOIN OFERTA_ASIGNATURA oa ON d.ID_DOCENTE = oa.ID_DOCENTE
JOIN PERIODO_ACADEMICO pa ON oa.ID_PERIODO = pa.ID_PERIODO
JOIN HORARIO_CLASE h ON oa.ID_OFERTA = h.ID_OFERTA
JOIN ASIGNATURA asig ON oa.ID_ASIGNATURA = asig.ID_ASIGNATURA
WHERE pa.ESTADO_PERIODO = 'ACTIVO'
GROUP BY d.NUMERO_UNICO, d.NOMBRES_DOCENTE, d.APELLIDOS_DOCENTE, d.TIPO_PROFESOR
HAVING SUM((h.HORA_FIN - h.HORA_INICIO) * 24) > 1
ORDER BY TOTAL_HORAS_SEMANALES DESC;

--Q6: Asignaturas con Alta Reprobación (>30%) en últimos 3 periodos
SELECT 
    a.CODIGO_ASIGNATURA,
    a.NOMBRE_ASIGNATURA,
    c.NOMBRE_CARRERA,
    COUNT(cal.ID_CALIFICACION) AS TOTAL_ESTUDIANTES,
    SUM(CASE WHEN cal.NOTA_FINAL < 7.0 THEN 1 ELSE 0 END) AS ESTUDIANTES_REPROBADOS,
    ROUND((SUM(CASE WHEN cal.NOTA_FINAL < 7.0 THEN 1 ELSE 0 END) / COUNT(cal.ID_CALIFICACION)) * 100, 2) || '%' AS TASA_REPROBACION
FROM ASIGNATURA a
JOIN OFERTA_ASIGNATURA oa ON a.ID_ASIGNATURA = oa.ID_ASIGNATURA
JOIN PERIODO_ACADEMICO pa ON oa.ID_PERIODO = pa.ID_PERIODO
JOIN CALIFICACION cal ON oa.ID_OFERTA = cal.ID_OFERTA
LEFT JOIN DETALLE_MALLA dm ON a.ID_ASIGNATURA = dm.ID_ASIGNATURA
LEFT JOIN MALLA_CURRICULAR mc ON dm.ID_MALLA = mc.ID_MALLA
LEFT JOIN CARRERA c ON mc.ID_CARRERA = c.ID_CARRERA
WHERE pa.ID_PERIODO IN (1, 2, 3) -- Usamos IDs fijos ya que los acabamos de crear
GROUP BY a.CODIGO_ASIGNATURA, a.NOMBRE_ASIGNATURA, c.NOMBRE_CARRERA
HAVING (SUM(CASE WHEN cal.NOTA_FINAL < 7.0 THEN 1 ELSE 0 END) / COUNT(cal.ID_CALIFICACION)) > 0.30
ORDER BY TASA_REPROBACION DESC;

--Q7: Aulas con mayor ocupacion
SELECT 
    a.EDIFICIO_AULA, 
    a.NUMERO_AULA, 
    a.CAPACIDAD_ESTUDIANTES,
    NVL(ROUND(SUM(CASE WHEN pa.ESTADO_PERIODO = 'ACTIVO' THEN (h.HORA_FIN - h.HORA_INICIO) * 24 ELSE 0 END), 2), 0) AS HORAS_USADAS,
    70 AS HORAS_DISPONIBLES,
    ROUND((NVL(SUM(CASE WHEN pa.ESTADO_PERIODO = 'ACTIVO' THEN (h.HORA_FIN - h.HORA_INICIO) * 24 ELSE 0 END), 0) / 70) * 100, 1) || '%' AS PORCENTAJE_OCUPACION
FROM AULA a
LEFT JOIN HORARIO_CLASE h ON a.ID_AULA = h.ID_AULA
LEFT JOIN OFERTA_ASIGNATURA oa ON h.ID_OFERTA = oa.ID_OFERTA
LEFT JOIN PERIODO_ACADEMICO pa ON oa.ID_PERIODO = pa.ID_PERIODO
GROUP BY a.ID_AULA, a.EDIFICIO_AULA, a.NUMERO_AULA, a.CAPACIDAD_ESTUDIANTES
ORDER BY HORAS_USADAS DESC;

--Q8: Reporte de Matrícula y Becas por Carrera
SELECT 
    f.NOMBRE_FACULTAD,
    c.NOMBRE_CARRERA,
    c.NIVEL_CARRERA,
    c.MODALIDAD_CARRERA,
    COUNT(DISTINCT e.ID_ESTUDIANTE) AS ESTUDIANTES_ACTIVOS,
    ROUND(AVG(e.IRA), 2) AS PROMEDIO_GPA_CARRERA,
    ROUND((COUNT(DISTINCT ab.ID_ESTUDIANTE) / NULLIF(COUNT(DISTINCT e.ID_ESTUDIANTE),0)) * 100, 2) || '%' AS PORCENTAJE_BECADOS
FROM CARRERA c
JOIN FACULTAD f ON c.ID_FACULTAD = f.ID_FACULTAD
JOIN ESTUDIANTE e ON c.ID_CARRERA = e.ID_CARRERA
JOIN MATRICULA m ON e.ID_ESTUDIANTE = m.ID_ESTUDIANTE
JOIN PERIODO_ACADEMICO pa ON m.ID_PERIODO = pa.ID_PERIODO
LEFT JOIN ASIGNACION_BECA ab ON e.ID_ESTUDIANTE = ab.ID_ESTUDIANTE
WHERE pa.ESTADO_PERIODO = 'ACTIVO'
GROUP BY f.NOMBRE_FACULTAD, c.NOMBRE_CARRERA, c.NIVEL_CARRERA, c.MODALIDAD_CARRERA
ORDER BY ESTUDIANTES_ACTIVOS DESC;

-- Fin de la quinta fase

/*
SEXTA FASE: Consultas complejas Q9-Q15 de agregacion y analisis (eficiencia terminal, ranking de estudiantes, uso de espacios).
Definir roles de usuarios (admin, docente, estudiante) y permisos en la DB.
*/

---Definicion de roles y permisos
-- 1. ROL ADMINISTRADOR (Control total)
CREATE ROLE ROLE_ADMINISTRADOR;
GRANT ALL PRIVILEGES TO ROLE_ADMINISTRADOR;

-- 2. ROL DOCENTE
CREATE ROLE ROLE_DOCENTE;
GRANT CONNECT TO ROLE_DOCENTE;
GRANT CREATE SESSION TO ROLE_DOCENTE;

-- Permisos de lectura de catálogos
GRANT SELECT ON CARRERA TO ROLE_DOCENTE;
GRANT SELECT ON ASIGNATURA TO ROLE_DOCENTE;
GRANT SELECT ON PERIODO_ACADEMICO TO ROLE_DOCENTE;
GRANT SELECT ON AULA TO ROLE_DOCENTE;
-- Permisos de gestión académica (notas)
GRANT SELECT, INSERT, UPDATE ON CALIFICACION TO ROLE_DOCENTE;
GRANT SELECT ON ESTUDIANTE TO ROLE_DOCENTE;

-- 3. ROL ESTUDIANTE
CREATE ROLE ROLE_ESTUDIANTE;
GRANT CONNECT TO ROLE_ESTUDIANTE;
GRANT CREATE SESSION TO ROLE_ESTUDIANTE;

-- El estudiante solo lee su información (Conceptualmente)
GRANT SELECT ON CARRERA TO ROLE_ESTUDIANTE;
GRANT SELECT ON MALLA_CURRICULAR TO ROLE_ESTUDIANTE;
GRANT SELECT ON HORARIO_CLASE TO ROLE_ESTUDIANTE;
-- Solo puede ver calificaciones, no tocar
GRANT SELECT ON HISTORIAL_ACADEMICO TO ROLE_ESTUDIANTE;

-- Q9: Análisis de Eficiencia Terminal (Tasa de graduación por carrera)
SELECT 
    c.NOMBRE_CARRERA,
    COUNT(e.ID_ESTUDIANTE) AS TOTAL_ESTUDIANTES,
    SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'GRADUADO' THEN 1 ELSE 0 END) AS GRADUADOS,
    ROUND((SUM(CASE WHEN e.ESTADO_ESTUDIANTE = 'GRADUADO' THEN 1 ELSE 0 END) / COUNT(e.ID_ESTUDIANTE)) * 100, 2) || '%' AS TASA_EFICIENCIA
FROM CARRERA c
JOIN ESTUDIANTE e ON c.ID_CARRERA = e.ID_CARRERA -- Nota: El script Proyect.sql no asigna ID_CARRERA en el insert, verificar si da NULL
GROUP BY c.NOMBRE_CARRERA
ORDER BY TASA_EFICIENCIA DESC;

-- Q10: Ranking Académico (Top 3 mejores estudiantes por Facultad según IRA)
SELECT * FROM (
    SELECT 
        f.NOMBRE_FACULTAD,
        e.NOMBRES_ESTUDIANTE || ' ' || e.APELLIDOS_ESTUDIANTE AS ESTUDIANTE,
        e.IRA,
        DENSE_RANK() OVER (PARTITION BY f.ID_FACULTAD ORDER BY e.IRA DESC) AS RANKING
    FROM ESTUDIANTE e
    -- Unimos con carrera y facultad (Asumiendo que ID_CARRERA en estudiante no sea nulo)
    JOIN CARRERA c ON e.ID_CARRERA = c.ID_CARRERA 
    JOIN FACULTAD f ON c.ID_FACULTAD = f.ID_FACULTAD
    WHERE e.IRA IS NOT NULL
) WHERE RANKING <= 3;

-- Q11: Análisis de Uso de Espacios (Aulas con mayor carga horaria)
SELECT 
    a.EDIFICIO_AULA,
    a.NUMERO_AULA,
    a.TIPO_AULA,
    COUNT(h.ID_HORARIO) AS CLASES_PROGRAMADAS
FROM AULA a
LEFT JOIN HORARIO_CLASE h ON a.ID_AULA = h.ID_AULA
GROUP BY a.EDIFICIO_AULA, a.NUMERO_AULA, a.TIPO_AULA
ORDER BY CLASES_PROGRAMADAS DESC;

-- Q12: Desempeño Docente (Promedio de notas finales en sus clases)
SELECT 
    d.NOMBRES_DOCENTE || ' ' || d.APELLIDOS_DOCENTE AS DOCENTE,
    COUNT(cal.ID_CALIFICACION) AS TOTAL_EVALUADOS,
    ROUND(AVG(cal.NOTA_FINAL), 2) AS PROMEDIO_CLASE
FROM DOCENTE d
JOIN OFERTA_ASIGNATURA oa ON d.ID_DOCENTE = oa.ID_DOCENTE
JOIN CALIFICACION cal ON oa.ID_OFERTA = cal.ID_OFERTA
GROUP BY d.NOMBRES_DOCENTE, d.APELLIDOS_DOCENTE
ORDER BY PROMEDIO_CLASE DESC;


-- GENERACION ASIGNACIONES DE BECAS
SET SERVEROUTPUT ON;

DECLARE
    v_cnt_becas NUMBER;
    v_fecha_unica DATE := SYSDATE;
    v_monto NUMBER;
    v_porcentaje NUMBER;
    v_id_beca NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_cnt_becas FROM ASIGNACION_BECA;
    
    IF v_cnt_becas = 0 THEN
        FOR r_est IN (
            SELECT ID_ESTUDIANTE 
            FROM ESTUDIANTE 
            ORDER BY DBMS_RANDOM.VALUE 
            FETCH FIRST 300 ROWS ONLY
        ) LOOP
            
            v_id_beca := TRUNC(DBMS_RANDOM.VALUE(1, 7)); 
            
            IF v_id_beca = 1 THEN -- Excelencia
                -- CAMBIO AQUI: Usamos 99.99 porque 100 no cabe en NUMBER(4,2)
                v_porcentaje := 99.99; 
                v_monto := 150.00;
            ELSIF v_id_beca = 3 THEN 
                v_porcentaje := 50;
                v_monto := 100.00;
            ELSE
                v_porcentaje := 25;
                v_monto := 50.00;
            END IF;

            v_fecha_unica := v_fecha_unica - (1/1440); 

            INSERT INTO ASIGNACION_BECA (
                FECHA_ASIGNACION, ID_ESTUDIANTE, ID_BECA, PORCENTAJE_COBERTURA, MONTO_ALIMENTACION
            ) VALUES (
                v_fecha_unica, r_est.ID_ESTUDIANTE, v_id_beca, v_porcentaje, v_monto
            );
            
        END LOOP;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('>> Se han asignado 300 becas.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('>> La tabla de asignacion de becas ya tenia datos.');
    END IF;
END;
/

-- Q13: Análisis Financiero de Becas (Cobertura promedio e inversión)
SELECT 
    tb.NOMBRE_BECA,
    COUNT(ab.ID_ESTUDIANTE) AS BENEFICIARIOS,
    ROUND(AVG(ab.PORCENTAJE_COBERTURA), 1) || '%' AS COBERTURA_PROM,
    TO_CHAR(SUM(ab.MONTO_ALIMENTACION), '$99,999.00') AS INVERSION_TOTAL
FROM ASIGNACION_BECA ab
JOIN TIPO_BECA tb ON ab.ID_BECA = tb.ID_BECA
GROUP BY tb.NOMBRE_BECA;

--- GENERANDO MODULO DE INVESTIGACION (DEPARTAMENTOS, PROYECTOS, PAPERS)
SET SERVEROUTPUT ON;

DECLARE
    v_id_dep NUMBER;
    v_id_proy NUMBER;
    v_cnt_dep NUMBER;
    
    -- Listas para generar nombres realistas
    TYPE t_lista IS VARRAY(20) OF VARCHAR2(100);
    v_nombres_dep t_lista := t_lista(
        'Departamento de Inteligencia Artificial', 'Departamento de Robótica', 
        'Departamento de Salud Pública', 'Departamento de Cirugía',
        'Departamento de Finanzas', 'Departamento de Marketing',
        'Departamento de Derecho Penal', 'Departamento de Derechos Humanos',
        'Departamento de Urbanismo', 'Departamento de Historia',
        'Departamento de Psicología Clínica', 'Departamento de Sociología',
        'Departamento de Economía Aplicada', 'Departamento de Periodismo Digital'
    );
    
    v_titulos_proy t_lista := t_lista(
        'Análisis de Big Data en Salud', 'Impacto de la IA en la Educación',
        'Nuevos Tratamientos para Diabetes', 'Economía Circular en Pymes',
        'Derecho Digital y Privacidad', 'Sostenibilidad Urbana',
        'Salud Mental Post-Pandemia', 'Automatización Industrial',
        'Marketing en Redes Sociales', 'Historia Económica del Ecuador'
    );
    
BEGIN
    -- 1. CREAR DEPARTAMENTOS (Si no existen)
    SELECT COUNT(*) INTO v_cnt_dep FROM DEPARTAMENTO;
    
    IF v_cnt_dep = 0 THEN
        -- Creamos departamentos asignándolos cíclicamente a las 8 facultades
        FOR i IN 1..v_nombres_dep.COUNT LOOP
            INSERT INTO DEPARTAMENTO (ID_DEPARTAMENTO, ID_FACULTAD, NOMBRE_DEPARTAMENTO)
            VALUES (
                SEQ_DEPARTAMENTO.NEXTVAL,
                MOD(i, 8) + 1, -- Asignar a facultades 1-8
                v_nombres_dep(i)
            );
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('>> Se crearon ' || v_nombres_dep.COUNT || ' Departamentos de Investigación.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('>> Los departamentos ya existían.');
    END IF;

    -- 2. CREAR PROYECTOS DE INVESTIGACIÓN
    -- Generamos 40 proyectos aleatorios
    FOR i IN 1..40 LOOP
        v_id_proy := SEQ_PROYECTO.NEXTVAL;
        
        INSERT INTO PROYECTO_INVESTIGACION (
            ID_PROYECTO, ID_DOCENTE, ID_DEPARTAMENTO, 
            CODIGO_PROYECTO, TITULO_PROYECTO, LINEA_INVESTIGACION, 
            PRESUPUESTO_ASIGNADO, FECHA_INICIO, ESTADO_PROYECTO
        ) VALUES (
            v_id_proy,
            (SELECT ID_DOCENTE FROM (SELECT ID_DOCENTE FROM DOCENTE ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1), -- Docente Random
            TRUNC(DBMS_RANDOM.VALUE(1, 14)), -- Departamento Random (1-14)
            'INV-' || LPAD(i, 4, '0'),
            v_titulos_proy(TRUNC(DBMS_RANDOM.VALUE(1, 11))) || ' - Fase ' || i,
            'Ciencia y Tecnología',
            ROUND(DBMS_RANDOM.VALUE(5000, 50000), 2), -- Presupuesto entre $5k y $50k
            SYSDATE - TRUNC(DBMS_RANDOM.VALUE(100, 500)), -- Fecha inicio hace tiempo
            CASE WHEN MOD(i, 3) = 0 THEN 'FINALIZADO' ELSE 'EN EJECUCION' END
        );

        -- 3. CREAR PUBLICACIONES (PAPERS) PARA ESTE PROYECTO
        -- Algunos proyectos tienen papers, otros no.
        IF DBMS_RANDOM.VALUE > 0.3 THEN -- 70% de probabilidad de tener paper
            INSERT INTO PUBLICACION (
                ID_PUBLICACION, ID_PROYECTO, TITULO_PUBLICACION, DOI, REVISTA
            ) VALUES (
                SEQ_PUBLICACION.NEXTVAL,
                v_id_proy,
                'Estudio de Caso: ' || v_titulos_proy(TRUNC(DBMS_RANDOM.VALUE(1, 11))),
                '10.1016/j.science.' || i,
                CASE WHEN MOD(i, 2) = 0 THEN 'Nature Science' ELSE 'IEEE Transactions' END
            );
        END IF;
        
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('>> Se generaron 40 Proyectos y sus Publicaciones asociadas.');
END;
/

-- Q14: Productividad Científica por Departamento
SELECT 
    dep.NOMBRE_DEPARTAMENTO,
    COUNT(DISTINCT pi.ID_PROYECTO) AS PROYECTOS_ACTIVOS,
    SUM(pi.PRESUPUESTO_ASIGNADO) AS PRESUPUESTO_TOTAL,
    COUNT(pub.ID_PUBLICACION) AS PUBLICACIONES_INDEXADAS
FROM DEPARTAMENTO dep
LEFT JOIN PROYECTO_INVESTIGACION pi ON dep.ID_DEPARTAMENTO = pi.ID_DEPARTAMENTO
LEFT JOIN PUBLICACION pub ON pi.ID_PROYECTO = pub.ID_PROYECTO
GROUP BY dep.NOMBRE_DEPARTAMENTO
ORDER BY PRESUPUESTO_TOTAL DESC;

--- GENERANDO PROCESOS DE TITULACION (SIMULACION DE EGRESADOS)

SET SERVEROUTPUT ON;

DECLARE
    v_id_proceso NUMBER;
    v_fecha_ingreso_antigua DATE;
    v_fecha_defensa DATE;
    v_cnt_titulados NUMBER;
    
    -- Temas de tesis aleatorios
    TYPE t_temas IS VARRAY(10) OF VARCHAR2(100);
    v_lista_temas t_temas := t_temas(
        'Implementación de Algoritmos Genéticos', 'Diseño de Centros Culturales', 
        'Análisis de Mercado Post-Pandemia', 'Derecho Constitucional Comparado',
        'Impacto de la Telemedicina', 'Automatización de Procesos',
        'Estudio de Suelos Volcánicos', 'Psicología del Consumidor',
        'Periodismo de Datos', 'Gestión de Talento Humano'
    );
BEGIN
    -- Verificamos si ya hay datos
    SELECT COUNT(*) INTO v_cnt_titulados FROM PROCESO_TITULACION;
    
    IF v_cnt_titulados = 0 THEN
        
        -- Seleccionamos 50 estudiantes para graduarlos
        FOR r_est IN (SELECT ID_ESTUDIANTE FROM ESTUDIANTE ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 50 ROWS ONLY) LOOP
            
            -- TRUCO IMPORTANTE: "Envejecer" al estudiante.
            -- Actualizamos su fecha de ingreso a hace 4 o 5 años (entre 48 y 60 meses atrás)
            v_fecha_ingreso_antigua := ADD_MONTHS(SYSDATE, -TRUNC(DBMS_RANDOM.VALUE(48, 65)));
            
            UPDATE ESTUDIANTE 
            SET FECHA_INGRESO = v_fecha_ingreso_antigua,
                ESTADO_ESTUDIANTE = 'GRADUADO' -- Lo marcamos como graduado
            WHERE ID_ESTUDIANTE = r_est.ID_ESTUDIANTE;
            
            -- Calculamos la fecha de defensa (aprox 4.5 a 5.5 años después del ingreso)
            -- Esto asegurará que tu consulta dé resultados lógicos (ej: 4.5 años)
            v_fecha_defensa := ADD_MONTHS(v_fecha_ingreso_antigua, TRUNC(DBMS_RANDOM.VALUE(50, 60))); 
            
            -- Insertar el proceso de titulación
            INSERT INTO PROCESO_TITULACION (
                ID_PROCESO, ID_ESTUDIANTE, ID_DOCENTE, 
                MODALIDAD_PROCESO, TEMA_PROPUESTO, 
                FECHA_DEFENSA, NOTA_FINAL_GRADO, ESTADO_PROCESO
            ) VALUES (
                SEQ_PROCESO_TIT.NEXTVAL,
                r_est.ID_ESTUDIANTE,
                (SELECT ID_DOCENTE FROM (SELECT ID_DOCENTE FROM DOCENTE ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1),
                CASE WHEN MOD(SEQ_PROCESO_TIT.CURRVAL, 2) = 0 THEN 'TESIS DE GRADO' ELSE 'PROYECTO TECNICO' END,
                v_lista_temas(TRUNC(DBMS_RANDOM.VALUE(1, 11))),
                v_fecha_defensa,
                ROUND(DBMS_RANDOM.VALUE(8, 10), 2), -- Notas altas para graduados
                'APROBADO'
            );
            
        END LOOP;
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('>> Se generaron 50 graduados con fechas históricas corregidas.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('>> Ya existían procesos de titulación.');
    END IF;
END;
/

-- Q15: Tiempo Promedio de Titulación (Análisis de eficiencia de egreso)
SELECT 
    ROUND(AVG(MONTHS_BETWEEN(pt.FECHA_DEFENSA, e.FECHA_INGRESO) / 12), 2) AS ANIOS_PROMEDIO_TITULACION,
    MIN(ROUND(MONTHS_BETWEEN(pt.FECHA_DEFENSA, e.FECHA_INGRESO) / 12, 1)) AS TIEMPO_MINIMO,
    MAX(ROUND(MONTHS_BETWEEN(pt.FECHA_DEFENSA, e.FECHA_INGRESO) / 12, 1)) AS TIEMPO_MAXIMO
FROM PROCESO_TITULACION pt
JOIN ESTUDIANTE e ON pt.ID_ESTUDIANTE = e.ID_ESTUDIANTE
WHERE pt.ESTADO_PROCESO = 'APROBADO';

---Fin de la sexta fase

/*
INSERCION DE DATOS PREVIA A LA SEPTIMA FASE:
LLENANDO TABLAS RESTANTES (BIBLIOTECA, TITULOS, MALLAS, RELACIONES)
*/

SET SERVEROUTPUT ON;

DECLARE
    v_id_libro NUMBER;
    v_id_malla NUMBER;
    v_cnt_libros NUMBER;
    v_cnt_titulos NUMBER;
    v_fecha_prestamo DATE; 
    
    TYPE t_libros IS VARRAY(10) OF VARCHAR2(100);
    v_titulos_libros t_libros := t_libros('Clean Code', 'Inteligencia Artificial', 'Principios de Economía', 'Anatomía de Gray', 'Derecho Penal', 'Cálculo de Stewart', 'Física Universitaria', 'Metodología Investigación', 'Diseño de Patrones', 'Psicología Social');
BEGIN
    
    -- =============================================
    -- 1. BIBLIOTECA (LIBROS Y PRESTAMOS)
    -- =============================================
    SELECT COUNT(*) INTO v_cnt_libros FROM LIBRO;
    
    IF v_cnt_libros = 0 THEN
        FOR i IN 1..100 LOOP
            BEGIN
                v_id_libro := SEQ_LIBRO.NEXTVAL;
                
                INSERT INTO LIBRO (ID_LIBRO, ISBN, TITULO_LIBRO, AUTOR, EDITORIAL, STOCK_DISPONIBLE)
                VALUES (
                    v_id_libro,
                    '978-3-' || LPAD(i, 6, '0'),
                    v_titulos_libros(TRUNC(DBMS_RANDOM.VALUE(1, 11))) || ' Vol. ' || i,
                    'Autor Generico ' || i,
                    CASE WHEN MOD(i, 2) = 0 THEN 'Pearson' ELSE 'McGraw Hill' END,
                    TRUNC(DBMS_RANDOM.VALUE(5, 20))
                );
                
                IF MOD(i, 4) = 0 THEN
                    -- Fecha única garantizada restando minutos
                    v_fecha_prestamo := (SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1, 30))) - (i / 1440);

                    INSERT INTO PRESTAMO (FECHA_PRESTAMO, ID_ESTUDIANTE, ID_LIBRO, FECHA_DEVOLUCION_PREVISTA, FECHA_DEVOLUCION_REAL)
                    VALUES (
                        v_fecha_prestamo,
                        (SELECT ID_ESTUDIANTE FROM (SELECT ID_ESTUDIANTE FROM ESTUDIANTE ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1),
                        v_id_libro,
                        SYSDATE + 7,
                        NULL
                    );
                END IF;
            EXCEPTION
                WHEN DUP_VAL_ON_INDEX THEN NULL; -- Ignorar si libro o prestamo ya existe
            END;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('>> Biblioteca verificada/generada.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('>> Biblioteca ya tenía datos.');
    END IF;

    -- =============================================
    -- 2. TITULOS ACADEMICOS DE DOCENTES
    -- =============================================
    SELECT COUNT(*) INTO v_cnt_titulos FROM TITULO_ACADEMICO;
    
    IF v_cnt_titulos = 0 THEN
        FOR r_doc IN (SELECT ID_DOCENTE FROM DOCENTE) LOOP
            BEGIN
                INSERT INTO TITULO_ACADEMICO (ID_TITULO, ID_DOCENTE, NOMBRE_TITULO, NIVEL_TITULO, UNIVERSIDAD)
                VALUES (
                    SEQ_TITULO.NEXTVAL,
                    r_doc.ID_DOCENTE,
                    CASE WHEN MOD(r_doc.ID_DOCENTE, 5) = 0 THEN 'PhD en Ciencias' ELSE 'Magister en Educación' END,
                    CASE WHEN MOD(r_doc.ID_DOCENTE, 5) = 0 THEN 'DOCTORADO' ELSE 'MAESTRIA' END,
                    'Universidad Internacional ' || TRUNC(DBMS_RANDOM.VALUE(1, 10))
                );
            EXCEPTION
                WHEN DUP_VAL_ON_INDEX THEN NULL; -- Si ya tiene titulo, seguir
            END;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('>> Títulos académicos asignados.');
    END IF;

    -- =============================================
    -- 3. MALLAS CURRICULARES (AQUÍ ESTABA EL ERROR)
    -- =============================================
    FOR r_car IN (SELECT ID_CARRERA FROM CARRERA) LOOP
        DECLARE 
            v_existe_malla NUMBER; 
        BEGIN
            -- Verificar si la carrera YA tiene malla asignada
            SELECT COUNT(*) INTO v_existe_malla FROM MALLA_CURRICULAR WHERE ID_CARRERA = r_car.ID_CARRERA;
            
            IF v_existe_malla = 0 THEN
                BEGIN
                    -- Intentamos insertar la malla
                    v_id_malla := SEQ_MALLA.NEXTVAL;
                    
                    INSERT INTO MALLA_CURRICULAR (ID_MALLA, ID_CARRERA, CODIGO_COHORTE, FECHA_APROBACION, TOTAL_CREDITOS, ESTADO_MALLA)
                    VALUES (v_id_malla, r_car.ID_CARRERA, '2023-2027', TO_DATE('01/01/2023','DD/MM/YYYY'), 120, 'ACTIVA');
                    
                    -- Asignar materias a la malla
                    FOR r_asig IN (SELECT ID_ASIGNATURA FROM ASIGNATURA ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 10 ROWS ONLY) LOOP
                        BEGIN
                            INSERT INTO DETALLE_MALLA (ID_ASIGNATURA, ID_MALLA, SEMESTRE_SUGERIDO, HORAS_TEORICAS, HORAS_PRACTICAS)
                            VALUES (r_asig.ID_ASIGNATURA, v_id_malla, TRUNC(DBMS_RANDOM.VALUE(1, 9)), 64, 32);
                        EXCEPTION 
                            WHEN DUP_VAL_ON_INDEX THEN NULL; -- Ignorar materia duplicada en la misma malla
                        END;
                    END LOOP;
                EXCEPTION
                    -- Si falla la inserción de la malla (ej: ID duplicado), capturamos el error aquí y seguimos
                    WHEN DUP_VAL_ON_INDEX THEN 
                        DBMS_OUTPUT.PUT_LINE('>> Advertencia: ID de Malla duplicado o carrera ya asignada. Saltando.');
                END;
            END IF;
        END;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('>> Mallas curriculares procesadas.');

    -- =============================================
    -- 4. RELACIONES (AUTORIA, TRIBUNALES, PROYECTOS)
    -- =============================================
    
    -- Autoria
    FOR r_pub IN (SELECT ID_PUBLICACION FROM PUBLICACION) LOOP
       BEGIN
          INSERT INTO AUTORIA (ID_PUBLICACION, ID_DOCENTE, ORDEN_AUTOR)
          VALUES (r_pub.ID_PUBLICACION, (SELECT ID_DOCENTE FROM (SELECT ID_DOCENTE FROM DOCENTE ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1), 1);
       EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL;
       END;
    END LOOP;

    -- Tribunales
    FOR r_proc IN (SELECT ID_PROCESO FROM PROCESO_TITULACION) LOOP
        FOR i IN 1..3 LOOP
            BEGIN
                INSERT INTO TRIBUNAL_GRADO (ID_PROCESO, ID_DOCENTE)
                VALUES (r_proc.ID_PROCESO, (SELECT ID_DOCENTE FROM (SELECT ID_DOCENTE FROM DOCENTE ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1));
            EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL;
            END;
        END LOOP;
    END LOOP;
    
    -- Colaboradores en Proyectos
    FOR r_proy IN (SELECT ID_PROYECTO FROM PROYECTO_INVESTIGACION) LOOP
       BEGIN
          INSERT INTO COLABORAN_EN (ID_PROYECTO, ID_DOCENTE)
          VALUES (r_proy.ID_PROYECTO, (SELECT ID_DOCENTE FROM (SELECT ID_DOCENTE FROM DOCENTE ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1));
       EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL;
       END;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('=== BASE DE DATOS COMPLETAMENTE POBLADA (FINAL) ===');
END;
/

/*
SEPTIMA FASE: Verificar que el modelo cumpla los 88 reglas del documento base
*/

------------------------------------------------------------------------------------------------------
-- Reglas sobre estructura organizacional
------------------------------------------------------------------------------------------------------
-- La universidad tiene facultades que agrupan carreras(violacion de 2.1.1)
INSERT INTO SISTEMA_UNIVERSITARIO.CARRERA (
  ID_CARRERA, ID_FACULTAD, NOMBRE_CARRERA, NIVEL_CARRERA, MODALIDAD_CARRERA
) VALUES (
  9001, NULL, 'Ingeniería Industrial', 'GRADO', 'PRESENCIAL'
);

------------------------------------------------------------------------------------------------------
-- Facultad sin decano (violacion de 2.1.2)
INSERT INTO SISTEMA_UNIVERSITARIO.FACULTAD (ID_FACULTAD, ID_DOCENTE, NOMBRE_FACULTAD, NUMERO_EDIFICIO)
VALUES (10, NULL, 'Facultad de Sistemas', 3);

------------------------------------------------------------------------------------------------------
-- Una facultad puede tener DEPARTAMENTOS académicos (violacion de 2.1.3)
INSERT INTO SISTEMA_UNIVERSITARIO.DEPARTAMENTO (	
    ID_DEPARTAMENTO, ID_FACULTAD, NOMBRE_DEPARTAMENTO
)VALUES(
  2001, NULL, "Departamento de Matematicas"
) 

------------------------------------------------------------------------------------------------------
-- Carrera sin facultad (violación de 2.1.4)
INSERT INTO SISTEMA_UNIVERSITARIO.CARRERA (ID_CARRERA, ID_FACULTAD, ID_DOCENTE, NOMBRE_CARRERA, NIVEL_CARRERA, MODALIDAD_CARRERA, DURACION_SEMESTRES)
VALUES (1001, NULL, 501, 'Ingeniería C', 'GRADO', 'PRESENCIAL', 8);

------------------------------------------------------------------------------------------------------
-- Las carreras tienen niveles (violación de 2.1.5)
INSERT INTO SISTEMA_UNIVERSITARIO.CARRERA (ID_CARRERA, ID_FACULTAD, ID_DOCENTE, NOMBRE_CARRERA, NIVEL_CARRERA, MODALIDAD_CARRERA, DURACION_SEMESTRES ) 
VALUES (1001, "Facultad de Ciencias", "1002", "MATEMATICAS", NULL, "PRESENCIAL", 9)

------------------------------------------------------------------------------------------------------
-- Cada carrera tiene un COORDINADOR (violación de 2.1.6)
INSERT INTO SISTEMA_UNIVERSITARIO.CARRERA (ID_CARRERA, ID_FACULTAD, ID_DOCENTE, NOMBRE_CARRERA, NIVEL_CARRERA, MODALIDAD_CARRERA, DURACION_SEMESTRES ) 
VALUES (1001, "Facultad de Ciencias", NULL, "MATEMATICAS", "GRADO", "PRESENCIAL", 9)

------------------------------------------------------------------------------------------------------
-- Una carrera puede ofrecer diferentes modalidades (violación de 2.1.7)
INSERT INTO SISTEMA_UNIVERSITARIO.CARRERA (ID_CARRERA, ID_FACULTAD, ID_DOCENTE, NOMBRE_CARRERA, NIVEL_CARRERA, MODALIDAD_CARRERA, DURACION_SEMESTRES ) 
VALUES (1001, "Facultad de Ciencias", "1010", "MATEMATICAS", "GRADO", NULL, 9)

------------------------------------------------------------------------------------------------------
-- Cada carrera tiene una MALLA CURRICULAR versionada por cohorte (violación de 2.1.8)
INSERT INTO SISTEMA_UNIVERSITARIO.MALLA_CURRICULAR (ID_MALLA, ID_CARRERA, DESCRIPCION)
VALUES (NULL, 9801, 'Malla sin cohorte especificado');
 

------------------------------------------------------------------------------------------------------
-- Reglas sobre asignaturas y mallas curriculares
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
 -- Cada asignatura tiene: código único, nombre, número de créditos, tipo (violación de 2.2.1)
 INSERT INTO SISTEMA_UNIVERSITARIO.ASIGNATURA (ID_ASIGNATURA, CODIGO_ASIGNATURA, NOMBRE_ASIGNATURA, NUMERO_CREDITOS, TIPO_ASIGNATURA, AREA_CONOCIMIENTO)
 VALUES (NULL, "4007", "Redes y Conectividad", 3, "DE CARRERA", "INFORMATICA")

 INSERT INTO SISTEMA_UNIVERSITARIO.ASIGNATURA (ID_ASIGNATURA, CODIGO_ASIGNATURA, NOMBRE_ASIGNATURA, NUMERO_CREDITOS, TIPO_ASIGNATURA, AREA_CONOCIMIENTO)
 VALUES ("4001", "4007", NULL, 3, "DE CARRERA", "INFORMATICA")

------------------------------------------------------------------------------------------------------
-- Tipos de asignatura: OBLIGATORIA, OPTATIVA, LIBRE_ELECCIÓN(violación de 2.2.2)
INSERT INTO SISTEMA_UNIVERSITARIO.ASIGNATURA (ID_ASIGNATURA, CODIGO_ASIGNATURA, NOMBRE_ASIGNATURA, NUMERO_CREDITOS, TIPO_ASIGNATURA, AREA_CONOCIMIENTO)
 VALUES ("4001", "4007", "Sistemas Operativos", 3, NULL, "INFORMATICA")

------------------------------------------------------------------------------------------------------
-- Una asignatura puede tener PRERREQUISITOS (violación de 2.2.3)
INSERT INTO SISTEMA_UNIVERSITARIO.TIENE_PRERREQUISITO (ASI_ID_ASIGNATURA, ID_ASIGNATURA)
VALUES (9999, 8888); -- 8888 no existe en ASIGNATURA

------------------------------------------------------------------------------------------------------
-- Una asignatura puede tener CORREQUISITOS (violación de 2.2.4)
INSERT INTO SISTEMA_UNIVERSITARIO.CORREQUISITO (ASI_ID_ASIGNATURA, ID_ASIGNATURA)
VALUES(1001, NULL);

------------------------------------------------------------------------------------------------------
-- El prerrequisito puede ser: asignatura específica OR aprobación de N créditos en el área (violación de 2.2.5)
-- Un estudiante se matricula en una materia sin haber aprobado la asignatura prerrequisito
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA 
(ID_MATRICULA, ID_ESTUDIANTE, ID_PERIODO, FECHA_REGISTRO, FORMA_MATRICULA)
VALUES (90001, 400, 20241, SYSDATE, 'PRESENCIAL');
-- Si 3001 es OPTATIVA pero si en la malla esta como OBLIGATORIA ocurre la violacion

------------------------------------------------------------------------------------------------------
-- Las asignaturas OBLIGATORIAS son iguales para todos los estudiantes de la carrera-cohorte (violación de 2.2.6)
INSERT INTO SISTEMA_UNIVERSITARIO.DETALLE_MALLA (ID_ASIGNATURA, ID_MALLA, SEMESTRE_SUGERIDO, HORAS_TEORICAS, HORAS_PRACTICAS)
VALUES (3001, 4001, 1, 40, 0);

------------------------------------------------------------------------------------------------------
-- Las asignaturas OPTATIVAS: el estudiante debe elegir M asignaturas de un grupo de N opciones (violación de 2.2.7)
INSERT INTO SISTEMA_UNIVERSITARIO.DETALLE_MALLA (ID_ASIGNATURA, ID_MALLA, SEMESTRE_SUGERIDO, HORAS_TEORICAS, HORAS_PRACTICAS)
VALUES (3001, 4001, 1, 40, 0);

------------------------------------------------------------------------------------------------------
-- Las asignaturas de LIBRE_ELECCIÓN: el estudiante puede elegir cualquiera de otras carreras (violación de 2.2.8)
INSERT INTO SISTEMA_UNIVERSITARIO.DETALLE_MALLA (ID_ASIGNATURA, ID_MALLA, SEMESTRE_SUGERIDO, HORAS_TEORICAS, HORAS_PRACTICAS)
VALUES (3001, 4001, 1, 40, 0);

------------------------------------------------------------------------------------------------------
-- Una malla curricular define: carrera, año de vigencia, semestres, asignaturas por semestre (violación de 2.2.9)
INSERT INTO SISTEMA_UNIVERSITARIO.MALLA_CURRICULAR (	ID_MALLA, ID_CARRERA, CODIGO_COHORTE, FECHA_APROBACION, TOTAL_CREDITOS, ESTADO_MALLA)
VALUES (3001, NULL, 1, 40, 0); --No existe carrera

INSERT INTO SISTEMA_UNIVERSITARIO.MALLA_CURRICULAR (	ID_MALLA, ID_CARRERA, CODIGO_COHORTE, FECHA_APROBACION, TOTAL_CREDITOS, ESTADO_MALLA)
VALUES (3001, 4001, 1, 40, NULL); --No existe fecha de vigencia


------------------------------------------------------------------------------------------------------
-- Cada asignatura en la malla tiene: semestre recomendado, horas teóricas, horas prácticas (violación de 2.2.10)
INSERT INTO SISTEMA_UNIVERSITARIO.DETALLE_MALLA (ID_ASIGNATURA, ID_MALLA, SEMESTRE_SUGERIDO, HORAS_TEORICAS, HORAS_PRACTICAS)
VALUES (2001, 7000, 0, 40, 0);


------------------------------------------------------------------------------------------------------
-- El total de créditos para TÉCNICO: mínimo 120, TECNOLÓGICO: 180, GRADO: 240, POSGRADO: depende del programa (violación de 2.2.11)
INSERT INTO SISTEMA_UNIVERSITARIO.MALLA_CURRICULAR (ID_MALLA, ID_CARRERA, CODIGO_COHORTE, FECHA_APROBACION, TOTAL_CREDITOS, ESTADO_MALLA)
VALUES (8000, 300, '2025-B', TO_DATE('2025-02-01','YYYY-MM-DD'), 200, 'ACTIVA');

------------------------------------------------------------------------------------------------------
-- Reglas sobre personal docente
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Cada docente tiene: código único, cédula, nombres, apellidos, email institucional, fecha de ingreso (violación de 2.3.12)
INSERT INTO SISTEMA_UNIVERSITARIO.DOCENTE (
  ID_DOCENTE, ID_FACULTAD, ID_CARRERA, NUMERO_UNICO, CEDULA, NOMBRES_DOCENTE, APELLIDOS_DOCENTE, EMAIL_INSTITUCIONAL, TIPO_PROFESOR, CATEGORIA_DOCENTE, FECHA_INGRESO
) VALUES (
  9001, NULL, NULL, 'DOC100', '0102030405', 'Ana', 'Pérez', 'ana.perez@epn.edu.ec', 'HONORARIOS', 'AUXILIAR', TO_DATE('2019-03-01','YYYY-MM-DD')
);

INSERT INTO SISTEMA_UNIVERSITARIO.DOCENTE (
  ID_DOCENTE, ID_FACULTAD, ID_CARRERA, NUMERO_UNICO, CEDULA, NOMBRES_DOCENTE, APELLIDOS_DOCENTE, EMAIL_INSTITUCIONAL, TIPO_PROFESOR, CATEGORIA_DOCENTE, FECHA_INGRESO
) VALUES (
  9002, NULL, NULL, 'DOC100', '0203040506', 'Luis', 'Gómez', 'luis.gomez@epn.edu.ec', 'HONORARIOS', 'AUXILIAR', TO_DATE('2020-08-15','YYYY-MM-DD')
);

------------------------------------------------------------------------------------------------------
-- Tipos de dedicación: TIEMPO_COMPLETO (40 horas/semana), MEDIO_TIEMPO (20 horas), HONORARIOS (por horas), (violación de 2.3.13)
INSERT INTO SISTEMA_UNIVERSITARIO.DOCENTE (
  ID_DOCENTE, ID_FACULTAD, ID_CARRERA, NUMERO_UNICO, CEDULA, NOMBRES_DOCENTE, APELLIDOS_DOCENTE, EMAIL_INSTITUCIONAL, TIPO_PROFESOR, CATEGORIA_DOCENTE, FECHA_INGRESO
) VALUES (
  9003, NULL, NULL, 'DOC101', '0304050607', 'María', 'Rojas', 'maria.rojas@epn.edu.ec', 'JORNADA_COMPLETA_INEXISTENTE', 'AUXILIAR', TO_DATE('2021-01-10','YYYY-MM-DD')
);

------------------------------------------------------------------------------------------------------
-- Categoría académica: TITULAR (PhD + 10 años experiencia), AGREGADO (PhD + 5 años), AUXILIAR (Maestría), (violación de 2.3.14)
INSERT INTO SISTEMA_UNIVERSITARIO.DOCENTE (
  ID_DOCENTE, ID_FACULTAD, ID_CARRERA, NUMERO_UNICO, CEDULA, NOMBRES_DOCENTE, APELLIDOS_DOCENTE, EMAIL_INSTITUCIONAL, TIPO_PROFESOR, CATEGORIA_DOCENTE, FECHA_INGRESO
) VALUES (
  9004, NULL, NULL, 'DOC102', '0405060708', 'Carlos', 'Méndez', 'carlos.mendez@epn.edu.ec', 'TIEMPO_COMPLETO', 'TITULAR', TO_DATE('2023-02-01','YYYY-MM-DD')
);

------------------------------------------------------------------------------------------------------
-- Un docente puede tener MÚLTIPLES títulos registrados: nivel (Grado, Maestría, PhD), área, universidad, año (violación de 2.3.15)
INSERT INTO SISTEMA_UNIVERSITARIO.TITULO_ACADEMICO (
  ID_TITULO, ID_DOCENTE, NOMBRE_TITULO, NIVEL_TITULO, UNIVERSIDAD
) VALUES (
  7001, 9005, 'Título inventado', 'SIN_NIVEL', 'Universidad XD'
);

------------------------------------------------------------------------------------------------------
-- La carga horaria se distribuye en: DOCENCIA, INVESTIGACIÓN, GESTIÓN (coordinaciones), VINCULACIÓN (violación de 2.3.16)
CREATE TABLE SISTEMA_UNIVERSITARIO.CARGA_HORARIA_DOCENTE (
  ID_CARGA NUMBER,
  ID_DOCENTE NUMBER,
  PORC_DOCENCIA NUMBER,
  PORC_INVESTIGACION NUMBER,
  PORC_GESTION NUMBER,
  PORC_VINCULACION NUMBER,
  CONSTRAINT PK_CARGA PRIMARY KEY (ID_CARGA)
);

INSERT INTO SISTEMA_UNIVERSITARIO.CARGA_HORARIA_DOCENTE (ID_CARGA, ID_DOCENTE, PORC_DOCENCIA, PORC_INVESTIGACION, PORC_GESTION, PORC_VINCULACION)
VALUES (8001, 9001, 120, 80, 30, 20);

------------------------------------------------------------------------------------------------------
-- Docentes TIEMPO_COMPLETO: mínimo 50% docencia, resto distribuido (violación de 2.3.17)
INSERT INTO SISTEMA_UNIVERSITARIO.CARGA_HORARIA_DOCENTE (ID_CARGA, ID_DOCENTE, PORC_DOCENCIA, PORC_INVESTIGACION, PORC_GESTION, PORC_VINCULACION)
VALUES (8002, 9004, 30, 50, 10, 10);

------------------------------------------------------------------------------------------------------
-- Docentes MEDIO_TIEMPO: 80% docencia, 20% investigación/gestión (violación de 2.3.18)
INSERT INTO SISTEMA_UNIVERSITARIO.DOCENTE (
  ID_DOCENTE, NUMERO_UNICO, CEDULA, NOMBRES_DOCENTE, APELLIDOS_DOCENTE, EMAIL_INSTITUCIONAL, TIPO_PROFESOR, CATEGORIA_DOCENTE, FECHA_INGRESO
) VALUES (
  9006, 'DOC104', '0607080910', 'Pedro', 'Salas', 'pedro.salas@epn.edu.ec', 'MEDIO_TIEMPO', 'AUXILIAR', TO_DATE('2020-09-10','YYYY-MM-DD')
);

------------------------------------------------------------------------------------------------------
-- Docentes HONORARIOS: 100% docencia (violación de 2.3.19)
INSERT INTO SISTEMA_UNIVERSITARIO.DOCENTE (
  ID_DOCENTE, NUMERO_UNICO, CEDULA, NOMBRES_DOCENTE, APELLIDOS_DOCENTE, EMAIL_INSTITUCIONAL, TIPO_PROFESOR, CATEGORIA_DOCENTE, FECHA_INGRESO
) VALUES (
  9007, 'DOC105', '0708091011', 'Lucía', 'Vargas', 'lucia.vargas@epn.edu.ec', 'HONORARIOS', 'AUXILIAR', TO_DATE('2022-03-20','YYYY-MM-DD')
);

------------------------------------------------------------------------------------------------------
-- La carga de docencia se mide en horas semanales por período académico (violación de 2.3.20)
INSERT INTO SISTEMA_UNIVERSITARIO.OFERTA_ASIGNATURA (ID_OFERTA, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, CODIGO_PARALELO, CUPO_MAXIMO, CUPO_DISPONIBLE)
VALUES (6001, 1, 101, 9001, 'A', 30, 30);

INSERT INTO SISTEMA_UNIVERSITARIO.HORARIO_CLASE (ID_HORARIO, ID_OFERTA, DIA_SEMANA, HORA_INICIO, HORA_FIN, ID_AULA)
VALUES (5001, 6001, 'LUNES', TO_DATE('08:00','HH24:MI'), TO_DATE('07:00','HH24:MI'), 10);

------------------------------------------------------------------------------------------------------
-- Un docente NO puede tener más de 20 horas de clase por semana (TIEMPO_COMPLETO), (violación de 2.3.21)
INSERT INTO SISTEMA_UNIVERSITARIO.DOCENTE (
  ID_DOCENTE, NUMERO_UNICO, CEDULA, NOMBRES_DOCENTE, APELLIDOS_DOCENTE, EMAIL_INSTITUCIONAL, TIPO_PROFESOR, CATEGORIA_DOCENTE, FECHA_INGRESO
) VALUES (
  9008, 'DOC106', '0809101112', 'Roberto', 'Quispe', 'roberto.quispe@epn.edu.ec', 'TIEMPO_COMPLETO', 'AGREGADO', TO_DATE('2010-05-01','YYYY-MM-DD')
);

INSERT INTO SISTEMA_UNIVERSITARIO.OFERTA_ASIGNATURA (ID_OFERTA, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, CODIGO_PARALELO, CUPO_MAXIMO, CUPO_DISPONIBLE)
VALUES (6003, 1, 103, 9008, 'A', 35, 35);

------------------------------------------------------------------------------------------------------
-- Un docente puede impartir asignaturas de MÚLTIPLES carreras en el mismo período (violación de 2.3.22)
INSERT INTO SISTEMA_UNIVERSITARIO.OFERTA_ASIGNATURA (ID_OFERTA, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, CODIGO_PARALELO, CUPO_MAXIMO, CUPO_DISPONIBLE)
VALUES (6006, 1, 201, 9002, 'A', 30, 30);

------------------------------------------------------------------------------------------------------
-- Reglas sobre estudiantes
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Cada estudiante tiene: matrícula única, cédula, nombres, apellidos, email institucional, fecha de ingreso (violación de 2.4.23)
INSERT INTO SISTEMA_UNIVERSITARIO.ESTUDIANTE (
  ID_ESTUDIANTE, MATRICULA, CEDULA, NOMBRES, APELLIDOS, EMAIL_INSTITUCIONAL, FECHA_INGRESO, ID_CARRERA, ESTADO_ESTUDIANTE, TIPO_ESTUDIANTE, GPA
) VALUES (
  10001, 'MATR-2025001', '1701234567', 'Andrés', 'Paredes', 'andres.paredes@epn.edu.ec', TO_DATE('2023-03-01','YYYY-MM-DD'), 101, 'ACTIVO', 'REGULAR', 8.2
);
-- Insertamos otro estudiante con la *misma* matrícula -> violación regla 23
INSERT INTO SISTEMA_UNIVERSITARIO.ESTUDIANTE (
  ID_ESTUDIANTE, MATRICULA, CEDULA, NOMBRES, APELLIDOS, EMAIL_INSTITUCIONAL, FECHA_INGRESO, ID_CARRERA, ESTADO_ESTUDIANTE, TIPO_ESTUDIANTE, GPA
) VALUES (
  10002, 'MATR-2025001', '1802345678', 'Beatriz', 'Flores', 'beatriz.flores@epn.edu.ec', TO_DATE('2024-02-15','YYYY-MM-DD'), 102, 'ACTIVO', 'REGULAR', 7.5
);

------------------------------------------------------------------------------------------------------
-- Un estudiante pertenece a UNA carrera principal (puede estar en doble titulación con dos carreras) (violación de 2.4.24)
INSERT INTO SISTEMA_UNIVERSITARIO.ESTUDIANTE (
  ID_ESTUDIANTE, MATRICULA, CEDULA, NOMBRES, APELLIDOS, EMAIL_INSTITUCIONAL, FECHA_INGRESO, ID_CARRERA, ESTADO_ESTUDIANTE, TIPO_ESTUDIANTE, GPA
) VALUES (
  10003, 'MATR-2025003', '1903456789', 'Carlos', 'Ramos', 'carlos.ramos@epn.edu.ec', TO_DATE('2024-08-01','YYYY-MM-DD'), NULL, 'ACTIVO', 'ESPECIAL', 6.8
);

------------------------------------------------------------------------------------------------------
-- Estados del estudiante: ACTIVO, INACTIVO (suspensión temporal), GRADUADO, RETIRADO, SUSPENDIDO (sanción) (violación de 2.4.25)
INSERT INTO SISTEMA_UNIVERSITARIO.ESTUDIANTE (
  ID_ESTUDIANTE, MATRICULA, CEDULA, NOMBRES, APELLIDOS, EMAIL_INSTITUCIONAL, FECHA_INGRESO, ID_CARRERA, ESTADO_ESTUDIANTE, TIPO_ESTUDIANTE, GPA
) VALUES (
  10004, 'MATR-2025004', '1712345670', 'Diana', 'Molina', 'diana.molina@epn.edu.ec', TO_DATE('2022-01-10','YYYY-MM-DD'), 103, 'PENDIENTE', 'REGULAR', 7.9
);

------------------------------------------------------------------------------------------------------
-- Tipos de estudiante: REGULAR (cumple requisitos académicos), ESPECIAL (cursa asignaturas sin carrera), OYENTE (solo asiste) violación de 2.4.26)
INSERT INTO SISTEMA_UNIVERSITARIO.ESTUDIANTE (
  ID_ESTUDIANTE, MATRICULA, CEDULA, NOMBRES, APELLIDOS, EMAIL_INSTITUCIONAL, FECHA_INGRESO, ID_CARRERA, ESTADO_ESTUDIANTE, TIPO_ESTUDIANTE, GPA
) VALUES (
  10005, 'MATR-2025005', '1723456781', 'Elena', 'Suárez', 'elena.suarez@epn.edu.ec', TO_DATE('2021-07-20','YYYY-MM-DD'), 101, 'ACTIVO', 'INTERINO', 8.0
);

------------------------------------------------------------------------------------------------------
-- Un estudiante REGULAR debe mantener promedio  7.0 para continuar activo (violación de 2.4.27) 
INSERT INTO SISTEMA_UNIVERSITARIO.ESTUDIANTE (
  ID_ESTUDIANTE, MATRICULA, CEDULA, NOMBRES, APELLIDOS, EMAIL_INSTITUCIONAL, FECHA_INGRESO, ID_CARRERA, ESTADO_ESTUDIANTE, TIPO_ESTUDIANTE, GPA
) VALUES (
  10006, 'MATR-2025006', '1734567892', 'Fernando', 'Castillo', 'fernando.castillo@epn.edu.ec', TO_DATE('2020-02-01','YYYY-MM-DD'), 101, 'ACTIVO', 'REGULAR', 6.30
);

------------------------------------------------------------------------------------------------------
-- Estudiantes con promedio < 7.0 en dos períodos consecutivos pasan a SUSPENDIDO (violación de 2.4.28)
INSERT INTO SISTEMA_UNIVERSITARIO.HISTORIAL_ACADEMICO (ID_HISTORIAL, ID_ESTUDIANTE, ID_PERIODO, ID_ASIGNATURA, NOTA_DEFINITIVA, ESTADO_MATERIA)
VALUES (21001, 10007, 20241, 301, 6.5, 'REPROBADO');

    -- Período 20242: promedio 6.0
INSERT INTO SISTEMA_UNIVERSITARIO.HISTORIAL_ACADEMICO (ID_HISTORIAL, ID_ESTUDIANTE, ID_PERIODO, ID_ASIGNATURA, NOTA_DEFINITIVA, ESTADO_MATERIA)
VALUES (21002, 10007, 20242, 302, 6.0, 'REPROBADO');

    -- Pero el alumno 10007 aparece como ACTIVO (violación): insertamos su registro ACTIVO
INSERT INTO SISTEMA_UNIVERSITARIO.ESTUDIANTE (
  ID_ESTUDIANTE, MATRICULA, CEDULA, NOMBRES, APELLIDOS, EMAIL_INSTITUCIONAL, FECHA_INGRESO, ID_CARRERA, ESTADO_ESTUDIANTE, TIPO_ESTUDIANTE, GPA
) VALUES (
  10007, 'MATR-2025007', '1745678903', 'Gabriela', 'Navarro', 'gabriela.navarro@epn.edu.ec', TO_DATE('2019-03-15','YYYY-MM-DD'), 102, 'ACTIVO', 'REGULAR', 6.25
);

------------------------------------------------------------------------------------------------------
-- Un estudiante puede tener BECAS: MÉRITO_ACADÉMICO (promedio  9.0), SOCIOECONÓMICA (nivel económico), DEPORTIVA, CULTURAL (violación de 2.4.29)
INSERT INTO SISTEMA_UNIVERSITARIO.ESTUDIANTE_BECAS (
  ID_BECAS, ID_ESTUDIANTE, TIPO_BECA, PORC_MATRICULA, PORC_COLEGIATURA, MONTO_ALIMENTACION, FECHA_INICIO, FECHA_FIN
) VALUES (
  40001, 10006, 'MERITO_ACADEMICO', 50, 50, 100, TO_DATE('2025-01-01','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD')
);

------------------------------------------------------------------------------------------------------
-- La beca cubre: matrícula (%), colegiatura (%), alimentación (monto mensual) (violación de 2.4.30)
INSERT INTO SISTEMA_UNIVERSITARIO.ESTUDIANTE_BECAS (
  ID_BECAS, ID_ESTUDIANTE, TIPO_BECA, PORC_MATRICULA, PORC_COLEGIATURA, MONTO_ALIMENTACION, FECHA_INICIO, FECHA_FIN
) VALUES (
  40002, 10008, 'SOCIOECONOMICA', -10, 20, 50, TO_DATE('2025-02-01','YYYY-MM-DD'), TO_DATE('2025-07-31','YYYY-MM-DD')
);

------------------------------------------------------------------------------------------------------
-- Un estudiante puede tener MÚLTIPLES becas simultáneas (los porcentajes se suman hasta 100%) (violación de 2.4.31)
INSERT INTO SISTEMA_UNIVERSITARIO.ESTUDIANTE_BECAS (
  ID_BECAS, ID_ESTUDIANTE, TIPO_BECA, PORC_MATRICULA, PORC_COLEGIATURA, MONTO_ALIMENTACION, FECHA_INICIO, FECHA_FIN
) VALUES (
  40004, 10009, 'SOCIOECONOMICA', 50, 0, 0, TO_DATE('2025-03-01','YYYY-MM-DD'), TO_DATE('2025-12-31','YYYY-MM-DD')
);

------------------------------------------------------------------------------------------------------
-- Se registra el historial académico completo: período, asignatura, docente, calificación final (violación de 2.4.32)
INSERT INTO SISTEMA_UNIVERSITARIO.HISTORIAL_ACADEMICO (
  ID_HISTORIAL, ID_ESTUDIANTE, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, NOTA_DEFINITIVA, ESTADO_MATERIA
) VALUES (
  21010, 10010, NULL, 401, NULL, 8.5, 'APROBADO'
);

------------------------------------------------------------------------------------------------------
-- Cada estudiante tiene un GPA (Grade Point Average) (violación de 2.4.33)
INSERT INTO SISTEMA_UNIVERSITARIO.HISTORIAL_ACADEMICO (ID_HISTORIAL, ID_ESTUDIANTE, ID_PERIODO, ID_ASIGNATURA, NOTA_DEFINITIVA, ESTADO_MATERIA)
VALUES (21101, 10011, 20241, 501, 9.0, 'APROBADO');

INSERT INTO SISTEMA_UNIVERSITARIO.HISTORIAL_ACADEMICO (ID_HISTORIAL, ID_ESTUDIANTE, ID_PERIODO, ID_ASIGNATURA, NOTA_DEFINITIVA, ESTADO_MATERIA)
VALUES (21102, 10011, 20241, 502, 7.0, 'APROBADO'); 

------------------------------------------------------------------------------------------------------
-- Reglas sobre gestion academica
------------------------------------------------------------------------------------------------------
--------------------------------- ---------------------------------------------------------------------
-- El año académico se divide en PERÍODOS: dos semestres ordinarios (sept-feb, marzo-julio) y uno intensivo (agosto) (violación de 2.5.34)
INSERT INTO SISTEMA_UNIVERSITARIO.PERIODO_ACADEMICO
(ID_PERIODO, FECHA_INICIO, FECHA_FIN, ESTADO)
VALUES (3001, DATE '2025-04-01', DATE '2025-12-31', 'PLANIFICACION');

------------------------------------------------------------------------------------------------------
-- Cada período académico tiene: código, nombre, fecha inicio, fecha fin, estado (PLANIFICACIÓN, MATRÍCULA, EN_CURSO, FINALIZADO) (violación de 2.5.35)
INSERT INTO SISTEMA_UNIVERSITARIO.PERIODO_ACADEMICO
(ID_PERIODO, FECHA_INICIO, FECHA_FIN, ESTADO)
VALUES (3001, DATE '2025-04-01', DATE '2025-12-31', 'PLANIFICACION');

------------------------------------------------------------------------------------------------------
-- Durante PLANIFICACIÓN se asignan: asignaturas, docentes, horarios, aulas (violación de 2.5.36)
    -- Período en curso
INSERT INTO SISTEMA_UNIVERSITARIO.PERIODO_ACADEMICO
(ID_PERIODO, FECHA_INICIO, FECHA_FIN, ESTADO)
VALUES (3003, DATE '2025-03-01', DATE '2025-07-30', 'EN_CURSO');

    -- Se asigna una oferta (solo permitido en PLANIFICACIÓN)
INSERT INTO SISTEMA_UNIVERSITARIO.OFERTA_ASIGNATURA
(ID_OFERTA, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, CODIGO_PARALELO, CUPO_MAXIMO, CUPO_DISPONIBLE)
VALUES (8001, 3003, 101, 9001, 'A', 30, 30);

------------------------------------------------------------------------------------------------------
-- Una asignatura se oferta en PARALELOS (grupos) identificados por letra: A, B, C, etc. (violación de 2.5.37)
INSERT INTO SISTEMA_UNIVERSITARIO.OFERTA_ASIGNATURA
(ID_OFERTA, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, CODIGO_PARALELO, CUPO_MAXIMO, CUPO_DISPONIBLE)
VALUES (8002, 3003, 101, 9001, 'ZZ', 30, 30);

------------------------------------------------------------------------------------------------------
-- Cada paralelo tiene: cupo máximo (25-40 estudiantes según asignatura), docente asignado, horario (violación de 2.5.38)
INSERT INTO SISTEMA_UNIVERSITARIO.OFERTA_ASIGNATURA
(ID_OFERTA, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, CODIGO_PARALELO, CUPO_MAXIMO, CUPO_DISPONIBLE)
VALUES (8003, 3003, 102, 9001, 'B', 10, 10); -- cupo 10 < 25

------------------------------------------------------------------------------------------------------
-- El horario especifica: día de la semana, hora inicio, hora fin, aula (violación de 2.5.39)
INSERT INTO SISTEMA_UNIVERSITARIO.HORARIO_CLASE
(ID_HORARIO, ID_OFERTA, DIA_SEMANA, HORA_INICIO, HORA_FIN, ID_AULA)
VALUES (9001, 8001, 'LUNES', TO_DATE('10:00','HH24:MI'), TO_DATE('09:00','HH24:MI'), 10);

------------------------------------------------------------------------------------------------------
-- NO puede haber dos paralelos de diferentes asignaturas en la misma aula al mismo tiempo (violación de 2.5.40)
-- Paralelo 1
INSERT INTO SISTEMA_UNIVERSITARIO.HORARIO_CLASE
(ID_HORARIO, ID_OFERTA, DIA_SEMANA, HORA_INICIO, HORA_FIN, ID_AULA)
VALUES (9002, 8001, 'MARTES', TO_DATE('08:00','HH24:MI'), TO_DATE('10:00','HH24:MI'), 20);

    -- Paralelo 2 diferente pero mismo horario y aula
INSERT INTO SISTEMA_UNIVERSITARIO.HORARIO_CLASE
(ID_HORARIO, ID_OFERTA, DIA_SEMANA, HORA_INICIO, HORA_FIN, ID_AULA)
VALUES (9003, 8002, 'MARTES', TO_DATE('09:00','HH24:MI'), TO_DATE('11:00','HH24:MI'), 20);

------------------------------------------------------------------------------------------------------
-- Un docente NO puede tener dos clases simultáneas (violación de 2.5.41)
INSERT INTO SISTEMA_UNIVERSITARIO.OFERTA_ASIGNATURA (ID_OFERTA, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, CODIGO_PARALELO, CUPO_MAXIMO, CUPO_DISPONIBLE)
VALUES (70005, 9992, 703, 9008, 'A', 30, 30);

INSERT INTO SISTEMA_UNIVERSITARIO.HORARIO_CLASE (ID_HORARIO, ID_OFERTA, DIA_SEMANA, HORA_INICIO, HORA_FIN, ID_AULA)
VALUES (80004, 70005, 'MARTES', TO_DATE('08:00','HH24:MI'), TO_DATE('10:00','HH24:MI'), 25);

INSERT INTO SISTEMA_UNIVERSITARIO.OFERTA_ASIGNATURA (ID_OFERTA, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, CODIGO_PARALELO, CUPO_MAXIMO, CUPO_DISPONIBLE)
VALUES (70006, 9992, 704, 9008, 'B', 30, 30);

INSERT INTO SISTEMA_UNIVERSITARIO.HORARIO_CLASE (ID_HORARIO, ID_OFERTA, DIA_SEMANA, HORA_INICIO, HORA_FIN, ID_AULA)
VALUES (80005, 70006, 'MARTES', TO_DATE('09:30','HH24:MI'), TO_DATE('11:30','HH24:MI'), 26);

------------------------------------------------------------------------------------------------------
-- Un estudiante NO puede matricularse en asignaturas con horarios que se crucen (violación de 2.5.42)
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA)
VALUES (60001, 50001, 70005);

INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA)
VALUES (60002, 50001, 70006);


------------------------------------------------------------------------------------------------------
-- Durante MATRÍCULA, el estudiante se inscribe en las asignaturas del período (violación de 2.5.43)
INSERT INTO SISTEMA_UNIVERSITARIO.PERIODO (ID_PERIODO, NOMBRE_PERIODO, FECHA_INICIO, FECHA_FIN, ESTADO_PERIODO)
VALUES (9993, '2025-INTENSIVO', TO_DATE('2025-08-01','YYYY-MM-DD'), TO_DATE('2025-08-31','YYYY-MM-DD'), 'EN_CURSO');

INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA (ID_MATRICULA, ID_ESTUDIANTE, ID_PERIODO, FECHA_REGISTRO)
VALUES (50002, 10011, 9993, SYSDATE);

------------------------------------------------------------------------------------------------------
-- Un estudiante NO puede matricularse en una asignatura si no ha aprobado los prerrequisitos (violación de 2.5.44)
INSERT INTO SISTEMA_UNIVERSITARIO.TIENE_PRERREQUISITO (ID, ASIG_ID, PREREQ_ID)
VALUES (81001, 801, 701);

-- Matricular estudiante 10012 en asignatura 801 sin haber aprobado 701
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA)
VALUES (60003, 50002, 70007);

------------------------------------------------------------------------------------------------------
-- Carga académica normal: 5-6 asignaturas por semestre (18-24 créditos) (violación de 2.5.45)
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA (ID_MATRICULA, ID_ESTUDIANTE, ID_PERIODO, FECHA_REGISTRO)
VALUES (50003, 10013, 20251, SYSDATE);

INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (61001,50003,70010);
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (61002,50003,70011);
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (61003,50003,70012);
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (61004,50003,70013);
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (61005,50003,70014);
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (61006,50003,70015);
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (61007,50003,70016);
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (61008,50003,70017);

------------------------------------------------------------------------------------------------------
-- Carga máxima permitida: 7 asignaturas (28 créditos) solo con promedio  8.0 (violación de 2.5.46)
INSERT INTO SISTEMA_UNIVERSITARIO.ESTUDIANTE (ID_ESTUDIANTE, MATRICULA, CEDULA, NOMBRES, APELLIDOS, EMAIL_INSTITUCIONAL, FECHA_INGRESO, ESTADO, TIPO_ESTUDIANTE, PROMEDIO_ACTUAL)
VALUES (10014, 'M2025011', '1213141516', 'Gina', 'Paredes', 'gina.paredes@uni.edu', TO_DATE('2019-09-09','YYYY-MM-DD'), 'ACTIVO', 'REGULAR', 7.5);

INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA (ID_MATRICULA, ID_ESTUDIANTE, ID_PERIODO, FECHA_REGISTRO)
VALUES (50004, 10014, 20251, SYSDATE);

INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (62001,50004,70020);
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (62002,50004,70021);
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (62003,50004,70022);
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (62004,50004,70023);
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (62005,50004,70024);
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (62006,50004,70025);
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA) VALUES (62007,50004,70026);

------------------------------------------------------------------------------------------------------
-- Se registra la ASISTENCIA de estudiantes por cada clase (violación de 2.5.47)
INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA (ID_MATRICULA, ID_ESTUDIANTE, ID_PERIODO, FECHA_REGISTRO)
VALUES (50005, 10015, 20251, SYSDATE);

------------------------------------------------------------------------------------------------------
-- Asistencia mínima requerida: 75% de las clases para aprobar la asignatura (violación de 2.5.48)
INSERT INTO SISTEMA_UNIVERSITARIO.ASISTENCIA (ID_ASISTENCIA, ID_MATRICULA, ID_OFERTA, PORC_ASISTENCIA)
VALUES (90001, 50005, 70020, 60);

------------------------------------------------------------------------------------------------------
-- Estudiantes con asistencia < 75% reprueban automáticamente (nota = 0) (violación de 2.5.49)
INSERT INTO SISTEMA_UNIVERSITARIO.CALIFICACION (ID_CALIF, ID_MATRICULA, ID_OFERTA, NOTA_FINAL, TIPO_NOTA)
VALUES (100001, 50005, 70020, 8.0, 'FINAL');

------------------------------------------------------------------------------------------------------
-- Reglas sobre evaluaciones y calicaciones
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Cada asignatura tiene evaluaciones: PARCIAL_1 (30%), PARCIAL_2 (30%), FINAL (40%) (violación de 2.6.50)
INSERT INTO SISTEMA_UNIVERSITARIO.PONDERACIONES_EVALUACION (ID_PONDER, ID_ASIGNATURA, PARCIAL_1_PCT, PARCIAL_2_PCT, FINAL_PCT)
VALUES (25001, 1001, 30, 20, 30);  

------------------------------------------------------------------------------------------------------
-- La nota mínima para aprobar una asignatura es 7.0 sobre 10 (violación de 2.6.51)
INSERT INTO SISTEMA_UNIVERSITARIO.CALIFICACION (ID_CALIF, ID_MATRICULA, ID_OFERTA, NOTA_FINAL, ESTADO_FINAL, TIPO_NOTA)
VALUES (25101, 51010, 70110, 7.0, 'REPROBADO', 'FINAL');

------------------------------------------------------------------------------------------------------
-- Un estudiante con nota < 7.0 en el examen FINAL puede rendir SUPLETORIO (violación de 2.6.52)
INSERT INTO SISTEMA_UNIVERSITARIO.CALIFICACION (ID_CALIF, ID_MATRICULA, ID_OFERTA, NOTA_FINAL, ESTADO_FINAL, TIPO_NOTA)
VALUES (25102, 51011, 70111, 8.2, 'APROBADO', 'FINAL');

INSERT INTO SISTEMA_UNIVERSITARIO.CALIFICACION_SUPLETORIO (ID_SUPL, ID_CALIF, NOTA_SUPLETORIO, FECHA_SUPLETORIO)
VALUES (25201, 25102, 7.0, SYSDATE);

------------------------------------------------------------------------------------------------------
-- El SUPLETORIO evalúa todo el contenido de la asignatura, ponderación 100% (violación de 2.6.53)
INSERT INTO SISTEMA_UNIVERSITARIO.CALIFICACION_SUPLETORIO (ID_SUPL, ID_CALIF, NOTA_SUPLETORIO, OBSERVACIONES)
VALUES (25202, 25103, 6.5, 'Aplicado solo sobre contenidos de PARCIAL_1');

------------------------------------------------------------------------------------------------------
-- Si después del SUPLETORIO la nota es < 7.0, el estudiante puede rendir MEJORAMIENTO (siguiente período) (violación de 2.6.54)
INSERT INTO SISTEMA_UNIVERSITARIO.CALIFICACION (ID_CALIF, ID_MATRICULA, ID_OFERTA, NOTA_FINAL, ESTADO_FINAL, TIPO_NOTA)
VALUES (25104, 51012, 70112, 6.4, 'REPROBADO', 'SUPLETORIO');

INSERT INTO SISTEMA_UNIVERSITARIO.CALIFICACION_MEJORAMIENTO (ID_MEJ, ID_CALIF, NOTA_MEJORAMIENTO, FECHA_MEJORAMIENTO)
VALUES (25301, 25104, 7.0, SYSDATE);

------------------------------------------------------------------------------------------------------
-- Durante el MEJORAMIENTO el estudiante debe asistir a clases (no paga matrícula extra) (violación de 2.6.55)
INSERT INTO SISTEMA_UNIVERSITARIO.CALIFICACION_MEJORAMIENTO (ID_MEJ, ID_CALIF, NOTA_MEJORAMIENTO, FECHA_MEJORAMIENTO, ASISTIO)
VALUES (25302, 25105, 6.8, SYSDATE, 'N');   

------------------------------------------------------------------------------------------------------
-- Máximo DOS intentos de MEJORAMIENTO, luego debe repetir la asignatura pagando (violación de 2.6.56)
INSERT INTO SISTEMA_UNIVERSITARIO.CALIFICACION_MEJORAMIENTO (ID_MEJ, ID_CALIF, NOTA_MEJORAMIENTO, FECHA_MEJORAMIENTO)
VALUES (25303, 25106, 6.1, TO_DATE('2024-09-01','YYYY-MM-DD'));
INSERT INTO SISTEMA_UNIVERSITARIO.CALIFICACION_MEJORAMIENTO (ID_MEJ, ID_CALIF, NOTA_MEJORAMIENTO, FECHA_MEJORAMIENTO)
VALUES (25304, 25106, 6.4, TO_DATE('2025-02-01','YYYY-MM-DD'));
    -- Tercer intento → violación
INSERT INTO SISTEMA_UNIVERSITARIO.CALIFICACION_MEJORAMIENTO (ID_MEJ, ID_CALIF, NOTA_MEJORAMIENTO, FECHA_MEJORAMIENTO)
VALUES (25305, 25106, 7.0, TO_DATE('2025-08-01','YYYY-MM-DD'));

------------------------------------------------------------------------------------------------------
-- La nota máxima con SUPLETORIO o MEJORAMIENTO es 7.0 (nota mínima aprobatoria) (violación de 2.6.57)
INSERT INTO SISTEMA_UNIVERSITARIO.CALIFICACION_SUPLETORIO (ID_SUPL, ID_CALIF, NOTA_SUPLETORIO, FECHA_SUPLETORIO)
VALUES (25203, 25107, 8.0, SYSDATE);  

INSERT INTO SISTEMA_UNIVERSITARIO.CALIFICACION_MEJORAMIENTO (ID_MEJ, ID_CALIF, NOTA_MEJORAMIENTO, FECHA_MEJORAMIENTO)
VALUES (25306, 25108, 9.0, SYSDATE)

------------------------------------------------------------------------------------------------------
-- Las asignaturas reprobadas DEBEN repetirse antes de cursar asignaturas que las tengan como prerrequisito (violación de 2.6.58)
INSERT INTO SISTEMA_UNIVERSITARIO.HISTORIAL_ACADEMICO (ID_HIST, ID_ESTUDIANTE, ID_PERIODO, ID_ASIGNATURA, NOTA_FINAL, ESTADO_MATERIA)
VALUES (33101, 10150, 20241, 2001, 5.5, 'REPROBADO');

INSERT INTO SISTEMA_UNIVERSITARIO.TIENE_PRERREQUISITO (ID, ASIG_ID, PREREQ_ID)
VALUES (83001, 2002, 2001);

INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA (ID_MATRICULA, ID_ESTUDIANTE, ID_PERIODO, FECHA_REGISTRO)
VALUES (52001, 10150, 20251, SYSDATE);

INSERT INTO SISTEMA_UNIVERSITARIO.MATRICULA_OFERTA (ID, ID_MATRICULA, ID_OFERTA)
VALUES (73001, 52001, 70200);


------------------------------------------------------------------------------------------------------
-- Reglas sobre proceso de titulacion
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Para graduarse, el estudiante debe: aprobar TODAS las asignaturas de la malla, completar prácticas preprofesionales (480 horas) (violación de 2.7.59)
INSERT INTO SISTEMA_UNIVERSITARIO.PROCESO_TITULACION (ID_TIT, ID_ESTUDIANTE, TIPO_TITULACION, ESTADO_PROCESO, HORAS_PRACTICAS, PROYECTO_ENTREGADO)
VALUES (41001, 10200, 'TESIS', 'APROBADO', 300, 'S');

------------------------------------------------------------------------------------------------------
-- Opciones de titulación: TESIS (investigación original), PROYECTO_INTEGRADOR (aplicación práctica), EXAMEN_COMPLEXIVO (violación de 2.7.60)
INSERT INTO SISTEMA_UNIVERSITARIO.PROCESO_TITULACION (ID_TIT, ID_ESTUDIANTE, TIPO_TITULACION, ESTADO_PROCESO)
VALUES (41002, 10201, 'OTRA_MODALIDAD', 'EN_PROCESO');

------------------------------------------------------------------------------------------------------
-- Modalidad TESIS: requiere tutor (docente), revisión de pares, defensa pública (violación de 2.7.61)
INSERT INTO SISTEMA_UNIVERSITARIO.TESIS (ID_TESIS, ID_TITULACION, ID_ESTUDIANTE, TITULO, TUTOR_DOCENTE_ID, REVISADO_PARES, FECHA_DEFENSA)
VALUES (42001, 41003, 10300, 'Estudio X', NULL, 'N', NULL);

------------------------------------------------------------------------------------------------------
-- Modalidad PROYECTO_INTEGRADOR: tutor, presentación ante tribunal (violación de 2.7.62)
INSERT INTO SISTEMA_UNIVERSITARIO.PROYECTO_INTEGRADOR (ID_PROY, ID_TITULACION, ID_ESTUDIANTE, TITULO, TUTOR_DOCENTE_ID, PRESENTADO_TRIBUNAL)
VALUES (43001, 41004, 10301, 'Proyecto Y', 9001, 'N'); -- marcado luego como aprobado:
UPDATE SISTEMA_UNIVERSITARIO.PROCESO_TITULACION SET ESTADO_PROCESO = 'APROBADO' WHERE ID_TIT = 41004;

------------------------------------------------------------------------------------------------------
-- Modalidad EXAMEN_COMPLEXIVO: examen escrito de 100 preguntas, 80% correcto para aprobar (violación de 2.7.63)
INSERT INTO SISTEMA_UNIVERSITARIO.EXAMEN_COMPLEXIVO (ID_EXAM, ID_TITULACION, ID_ESTUDIANTE, TOTAL_PREGUNTAS, RESPUESTAS_CORRECTAS, PORC_ACIERTO)
VALUES (44001, 41005, 10302, 100, 75, 75);

INSERT INTO SISTEMA_UNIVERSITARIO.PROCESO_TITULACION (ID_TIT, ID_ESTUDIANTE, TIPO_TITULACION, ESTADO_PROCESO)
VALUES (41005, 10302, 'EXAMEN_COMPLEXIVO', 'APROBADO');

 ------------------------------------------------------------------------------------------------------
-- El proceso de titulación tiene etapas: ANTEPROYECTO, DESARROLLO, REVISIÓN, CORRECCIONES, DEFENSA, APROBADO/RECHAZADO (violación de 2.7.64)
INSERT INTO SISTEMA_UNIVERSITARIO.PROCESO_TITULACION (ID_TIT, ID_ESTUDIANTE, TIPO_TITULACION, ETAPA_ACTUAL)
VALUES (41006, 10303, 'TESIS', 'DEFENSA');

------------------------------------------------------------------------------------------------------
-- El tutor debe ser docente TITULAR o AGREGADO de la carrera (violación de 2.7.65)
INSERT INTO SISTEMA_UNIVERSITARIO.TESIS (ID_TESIS, ID_TITULACION, ID_ESTUDIANTE, TITULO, TUTOR_DOCENTE_ID)
VALUES (42002, 41007, 10304, 'Tesis Z', 9005);

------------------------------------------------------------------------------------------------------
-- La defensa es ante un TRIBUNAL de 3 docentes (presidente, vocal 1, vocal 2) (violación de 2.7.66)
INSERT INTO SISTEMA_UNIVERSITARIO.TRIBUNAL_DEFENSA (ID_TRIB, ID_TESIS, PRESIDENTE_ID, VOCAL1_ID, VOCAL2_ID)
VALUES (45001, 42003, 9001, 9002, NULL);

------------------------------------------------------------------------------------------------------
-- Calificación de titulación: EXCELENTE (9.5-10), MUY_BUENO (9.0-9.4), BUENO (8.0-8.9), APROBADO (7.0-7.9) (violación de 2.7.67)
INSERT INTO SISTEMA_UNIVERSITARIO.TITULACION_RESULTADO (ID_RES, ID_TITULACION, CALIFICACION_NUMERICA, CALIFICACION_LETRA)
VALUES (46001, 41008, 6.5, 'APROBADO');

------------------------------------------------------------------------------------------------------
-- Reglas sobre proyectos de investigacion
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Cada proyecto de investigación tiene: código, título, línea de investigación, fecha inicio, fecha fin prevista, estado (violación de 2.8.68)
INSERT INTO SISTEMA_UNIVERSITARIO.PROYECTO (ID_PROYECTO, CODIGO_PROYECTO, TITULO, LINEA_INVESTIGACION, FECHA_INICIO, FECHA_FIN_PREVISTA, ESTADO)
VALUES (80001, 'P-2025-001', NULL, NULL, TO_DATE('2025-01-01','YYYY-MM-DD'), TO_DATE('2026-12-31','YYYY-MM-DD'), 'PROPUESTO');

------------------------------------------------------------------------------------------------------
-- Estados: PROPUESTO, APROBADO, EN_EJECUCIÓN, FINALIZADO, CANCELADO (violación de 2.8.69)
INSERT INTO SISTEMA_UNIVERSITARIO.PROYECTO (ID_PROYECTO, CODIGO_PROYECTO, TITULO, LINEA_INVESTIGACION, FECHA_INICIO, FECHA_FIN_PREVISTA, ESTADO)
VALUES (80002, 'P-2025-002', 'Estudio Z', 'IA', TO_DATE('2025-02-01','YYYY-MM-DD'), TO_DATE('2025-08-01','YYYY-MM-DD'), 'EN_REVISION_PENDIENTE');

------------------------------------------------------------------------------------------------------
-- Un proyecto tiene un DIRECTOR (docente) y puede tener COLABORADORES (docentes, estudiantes, externos) (violación de 2.8.70)
INSERT INTO SISTEMA_UNIVERSITARIO.PROYECTO (ID_PROYECTO, CODIGO_PROYECTO, TITULO, LINEA_INVESTIGACION, FECHA_INICIO, FECHA_FIN_PREVISTA, ESTADO, DIRECTOR_DOCENTE_ID)
VALUES (80003, 'P-2025-003', 'Proyecto Sin Director', 'Robótica', TO_DATE('2025-03-01','YYYY-MM-DD'), TO_DATE('2026-03-01','YYYY-MM-DD'), 'APROBADO', NULL);

------------------------------------------------------------------------------------------------------
-- Las líneas de investigación están asociadas a carreras/facultades (violación de 2.8.71)
INSERT INTO SISTEMA_UNIVERSITARIO.LINEA_INVESTIGACION (ID_LINEA, NOMBRE_LINEA, ID_CARRERA, ID_FACULTAD)
VALUES (90001, 'Linea Libre', NULL, NULL);

------------------------------------------------------------------------------------------------------
-- Cada proyecto tiene presupuesto asignado con categorías: PERSONAL, EQUIPOS, MATERIALES, VIAJES, SERVICIOS (violación de 2.8.72)
INSERT INTO SISTEMA_UNIVERSITARIO.PRESUPUESTO_PROYECTO (ID_PRES, ID_PROYECTO, CATEGORIA, MONTO_PLANIFICADO, MONTO_EJECUTADO)
VALUES (100001, 80001, 'SUBCONTRATOS_ILIMITADOS', 50000, 0);

------------------------------------------------------------------------------------------------------
-- Se registra la ejecución presupuestaria: categoría, monto planificado, monto ejecutado, porcentaje ejecución (violación de 2.8.73)
INSERT INTO SISTEMA_UNIVERSITARIO.EJECUCION_PRESUPUESTARIA (ID_EJEC, ID_PROYECTO, CATEGORIA, MONTO_PLAN, MONTO_EJEC, PORC_EJEC)
VALUES (110001, 80002, 'EQUIPOS', 20000, 25000, 125);

------------------------------------------------------------------------------------------------------
-- Un proyecto puede generar PUBLICACIONES: artículos, libros, capítulos de libro (violación de 2.8.74)
INSERT INTO SISTEMA_UNIVERSITARIO.PUBLICACION (ID_PUB, ID_PROYECTO, TIPO_PUBLICACION, TITULO, REVISTA, DOI, INDEXACION)
VALUES (120001, 80003, 'ARTICULO', 'Resultados Dos', NULL, NULL, 'SCOPUS');

------------------------------------------------------------------------------------------------------
-- Cada publicación tiene: título, autores (orden), revista/editorial, DOI, indexación (Scopus, WoS, Latindex) (violación de 2.8.75)
INSERT INTO SISTEMA_UNIVERSITARIO.AUTOR_PUBLICACION (ID_AUT, ID_PUB, AUTOR_ID, ORDEN_AUTOR)
VALUES (130001, 120001, 9001, 1);
INSERT INTO SISTEMA_UNIVERSITARIO.AUTOR_PUBLICACION (ID_AUT, ID_PUB, AUTOR_ID, ORDEN_AUTOR)
VALUES (130002, 120001, 9002, 1); 

------------------------------------------------------------------------------------------------------
-- Los docentes con proyectos activos tienen reducción de 20% en carga de docencia (violación de 2.8.76)
INSERT INTO SISTEMA_UNIVERSITARIO.PROYECTO (ID_PROYECTO, CODIGO_PROYECTO, TITULO, LINEA_INVESTIGACION, FECHA_INICIO, FECHA_FIN_PREVISTA, ESTADO, DIRECTOR_DOCENTE_ID)
VALUES (80004, 'P-2025-004', 'Investigacion Activa', 'Sistemas', TO_DATE('2024-09-01','YYYY-MM-DD'), TO_DATE('2026-09-01','YYYY-MM-DD'), 'EN_EJECUCIÓN', 9008);
  -- Aseguramos que docente 9008 existe (puede existir en datos previos); registramos que no tiene reducción aplicada
UPDATE SISTEMA_UNIVERSITARIO.DOCENTE SET REDUCCION_POR_PROYECTO = 0 WHERE ID_DOCENTE = 9008;

------------------------------------------------------------------------------------------------------
-- Reglas sobre infraestructura
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--	La universidad tiene AULAS identificadas por: edificio, piso, número (violación de 2.9.77)
INSERT INTO SISTEMA_UNIVERSITARIO.AULA (ID_AULA, EDIFICIO, PISO, NUMERO_AULA, CAPACIDAD, TIPO_AULA)
VALUES (200001, NULL, NULL, '101', 30, 'AULA_NORMAL');

------------------------------------------------------------------------------------------------------
--	Cada aula tiene: capacidad, tipo (AULA_NORMAL, LABORATORIO_COMPUTACIÓN, LABORATORIO_FÍSICA, AUDITORIO) (violación de 2.9.78)
INSERT INTO SISTEMA_UNIVERSITARIO.AULA (ID_AULA, EDIFICIO, PISO, NUMERO_AULA, CAPACIDAD, TIPO_AULA)
VALUES (200002, 'Edificio B', 2, '201', -5, 'SALA_MULTIUSO_X');

------------------------------------------------------------------------------------------------------
--	Aulas tienen equipamiento: proyector, computador, pizarra digital, sistema de audio (sí/no) (violación de 2.9.79)
INSERT INTO SISTEMA_UNIVERSITARIO.EQUIPAMIENTO_AULA (ID_EQ, ID_AULA, PROYECTOR, COMPUTADOR, PIZARRA_DIGITAL, AUDIO)
VALUES (210001, 200002, 'PRESENTE_PARTE', 'SI', 'NO', 'PARCIAL'); 

------------------------------------------------------------------------------------------------------
--	Los LABORATORIOS tienen inventario de EQUIPOS: nombre, marca, modelo, serie, estado, fecha de adquisición (violación de 2.9.80)
INSERT INTO SISTEMA_UNIVERSITARIO.INVENTARIO_EQUIPO (ID_EQUIPO, ID_AULA, NOMBRE_EQUIPO, MARCA, MODELO, SERIE, ESTADO_EQUIPO, FECHA_ADQUISICION)
VALUES (220001, 300, 'Osciloscopio', 'MarcaX', 'M-1', 'SN123', 'DESCONOCIDO', TO_DATE('2030-01-01','YYYY-MM-DD'));

------------------------------------------------------------------------------------------------------
--	Estados de equipos: OPERATIVO, MANTENIMIENTO, DAÑADO, BAJA (violación de 2.9.81)
INSERT INTO SISTEMA_UNIVERSITARIO.INVENTARIO_EQUIPO (ID_EQUIPO, ID_AULA, NOMBRE_EQUIPO, MARCA, MODELO, SERIE, ESTADO_EQUIPO, FECHA_ADQUISICION)
VALUES (220002, 300, 'PC Laboratorio', 'BrandY', 'B-2', 'SN999', 'CONDICIONAL', TO_DATE('2019-05-05','YYYY-MM-DD'));

------------------------------------------------------------------------------------------------------
--	La BIBLIOTECA tiene catálogo de LIBROS: físicos y digitales (violación de 2.9.82)
INSERT INTO SISTEMA_UNIVERSITARIO.LIBRO (ID_LIBRO, ISBN, TITULO, AUTOR, EDITORIAL, ANIO, CATEGORIA, NUM_EJEMPLARES)
VALUES (230001, '978-0-00-000000-0', 'Libro X', 'Autor A', 'Ed', 2020, 'Ciencia', NULL);

------------------------------------------------------------------------------------------------------
--	Cada libro: ISBN, título, autor, editorial, año, categoría, número de ejemplares (físicos) (violación de 2.9.83)
INSERT INTO SISTEMA_UNIVERSITARIO.LIBRO (ID_LIBRO, ISBN, TITULO, AUTOR, EDITORIAL, ANIO, CATEGORIA, NUM_EJEMPLARES)
VALUES (230002, 'INVALID_ISBN', 'Libro Y', 'Autor B', 'EdB', 3025, 'Historia', 3);

------------------------------------------------------------------------------------------------------
--	Los préstamos de libros físicos: estudiante, libro, fecha préstamo, fecha devolución prevista, fecha devolución real (violación de 2.9.84)
INSERT INTO SISTEMA_UNIVERSITARIO.PRESTAMO (ID_PRESTAMO, ID_LIBRO, ID_ESTUDIANTE, FECHA_PRESTAMO, FECHA_DEVOL_PREVISTA, FECHA_DEVOL_REAL)
VALUES (240001, 230002, 10011, TO_DATE('2025-10-20','YYYY-MM-DD'), TO_DATE('2025-10-10','YYYY-MM-DD'), NULL);

------------------------------------------------------------------------------------------------------
--	Plazo de préstamo: 15 días, renovable una vez si no hay reservas (violación de 2.9.85)
INSERT INTO SISTEMA_UNIVERSITARIO.RENOVACION (ID_REN, ID_PRESTAMO, NUM_RENOVACIONES, HAY_RESERVA)
VALUES (250001, 240001, 3, 'N');

------------------------------------------------------------------------------------------------------
--	Mora por día de retraso: $0.50, máximo $10 por libro (violación de 2.9.86)
UPDATE SISTEMA_UNIVERSITARIO.PRESTAMO SET FECHA_DEVOL_REAL = TO_DATE('2026-01-01','YYYY-MM-DD') WHERE ID_PRESTAMO = 240001;

------------------------------------------------------------------------------------------------------
--	Los ESPACIOS (aulas, auditorios, laboratorios) pueden RESERVARSE para eventos (violación de 2.9.87)
INSERT INTO SISTEMA_UNIVERSITARIO.RESERVA (ID_RESERVA, ID_ESPACIO, ID_SOLICITANTE, FECHA, HORA_INICIO, HORA_FIN, MOTIVO, ESTADO)
VALUES (260001, 200001, NULL, TO_DATE('2025-12-01','YYYY-MM-DD'), TO_DATE('09:00','HH24:MI'), TO_DATE('12:00','HH24:MI'), NULL, 'SOLICITADA');

------------------------------------------------------------------------------------------------------
--	La reserva requiere: solicitante (docente/estudiante), espacio, fecha, hora inicio, hora fin, motivo, estado (SOLICITADA, APROBADA, RECHAZADA) (violación de 2.9.88)
INSERT INTO SISTEMA_UNIVERSITARIO.RESERVA (ID_RESERVA, ID_ESPACIO, ID_SOLICITANTE, FECHA, HORA_INICIO, HORA_FIN, MOTIVO, ESTADO)
VALUES (260002, 200002, 10011, TO_DATE('2025-12-02','YYYY-MM-DD'), TO_DATE('14:00','HH24:MI'), TO_DATE('13:00','HH24:MI'), 'Evento Z', 'PENDIENTE_VERIFICAR');

/*
FIN DEL SCRIPT
*/
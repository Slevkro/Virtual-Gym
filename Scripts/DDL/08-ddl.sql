--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      HP Inc.
-- Project :      Modelo-VG.DM1
-- Author :       mrkyloren_117@gmail.com
--
-- Date Created : Tuesday, January 17, 2023 21:35:28
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: ADMINISTRADOR 
--

CREATE TABLE GIMNASIO_USR.ADMINISTRADOR(
    EMPLEADO_ID  NUMBER(10, 0)    NOT NULL,
    USERNAME           VARCHAR2(20)     NOT NULL,
    PASSWORD           VARCHAR2(20)     NOT NULL,
    DESCRIPCION_ROL    VARCHAR2(140)    NOT NULL,
    CERTIFICADO        BLOB             NOT NULL,
    CONSTRAINT ADMINISTRADOR_PK PRIMARY KEY (EMPLEADO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX EMPLEADO_PK_IUK ON ADMINISTRADOR(EMPLEADO_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    ),
    CONSTRAINT ADMINISTRADOR_USERNAME_UK UNIQUE (USERNAME)
    USING INDEX (
        CREATE UNIQUE INDEX ADMINISTRADOR_USERNAME_IUK ON ADMINISTRADOR(USERNAME)
        TABLESPACE EMP_GIM_IDXS_TS
    )
) TABLESPACE EMPLEADO_TS
LOB (CERTIFICADO) SRORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
;



-- 
-- TABLE: APARATO 
--

CREATE TABLE GIMNASIO_USR.APARATO(
    APARATO_ID             NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS           DATE             NOT NULL,
    NO_INVENTARIO          CHAR(18)         NOT NULL,
    NOMBRE                 VARCHAR2(25)     NOT NULL,
    FECHA_ADQUISICION      DATE             NOT NULL,
    DESCRIPCION            VARCHAR2(140)    NOT NULL,
    TIPO_DISPOSITIVO_ID    NUMBER(10, 0)    NOT NULL,
    STATUS_ID              NUMBER(10, 0)    NOT NULL,
    SALA_ID                NUMBER(10, 0)    NOT NULL,
    CONSTRAINT APARATO_PK PRIMARY KEY (APARATO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX APARATO_PK_IUK ON APARATO(APARATO_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    ), 
    CONSTRAINT APARATO_NO_INVENTARIO_UK UNIQUE (NO_INVENTARIO)
    USING INDEX (
        CREATE UNIQUE INDEX APARATO_NO_INVENTARIO_IUK ON APARATO(NO_INVENTARIO)
        TABLESPACE EMP_GIM_IDXS_TS
    )
) TABLESPACE GIMNASIO_TS
;

CREATE INDEX APARATO_NOMBRE_IX APARATO(NOMBRE)
  TABLESPACE EMP_GIM_IDXS_TS;

-- 
-- TABLE: BIOMETRICO 
--

CREATE TABLE GIMNASIO_USR.BIOMETRICO(
    BIOMETRICO_ID      NUMBER(10, 0)    NOT NULL,
    FOTO                BLOB             NOT NULL,
    PULGAR_DERECHO      BLOB             NOT NULL,
    INDICE_DERECHO      BLOB             NOT NULL,
    MEDIO_DERECHO       BLOB             NOT NULL,
    ANULAR_DERECHO      BLOB             NOT NULL,
    MENIQUE_DERECHO     BLOB             NOT NULL,
    PULGAR_IZQUIERDO    BLOB             NOT NULL,
    INDICE_IZQUIERDO    BLOB             NOT NULL,
    MEDIO_IZQUIERDO     BLOB             NOT NULL,
    ANULAR_IZQUIERDO    BLOB             NOT NULL,
    MENIQUE_IZQUIERDO    BLOB             NOT NULL,
    EMPLEADO_ID   NUMBER(10, 0)    NOT NULL,
    CONSTRAINT BIOMETRICO_PK PRIMARY KEY (BIOMETRICO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX BIOMETRICO_PK_IUK ON BIOMETRICO(BIOMETRICO_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    )
) TABLESPACE EMPLEADO_TS
LOB (FOTO) STORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
LOB (PULGAR_DERECHO) SRORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
LOB (INDICE_DERECHO) SRORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
LOB (MEDIO_DERECHO) SRORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
LOB (ANULAR_DERECHO) SRORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
LOB (MENIQUE_DERECHO) SRORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
LOB (PULGAR_IZQUIERDO) STORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
LOB (INDICE_IZQUIERDO) STORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
LOB (MEDIO_IZQUIERDO) STORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
LOB (ANULAR_IZQUIERDO) STORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
LOB (MENIQUE_IZQUIERDO) STORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
;



-- 
-- TABLE: CALORIAS_SESION 
--

CREATE TABLE CLIENTE_USR.CALORIAS_SESION(
    CALORIAS_SESION_ID    NUMBER(10, 0)    NOT NULL,
    CALORIAS              NUMBER(5, 2)     NOT NULL,
    FECHA_MEDICION        TIMESTAMP(6)     NOT NULL,
    CLIENTE_ID            NUMBER(10, 0)    NOT NULL,
    NO_SESION             NUMBER(10, 0)    NOT NULL,
    CONSTRAINT CALORIAS_SESION_PK PRIMARY KEY (CALORIAS_SESION_ID)
    USING INDEX (
        CREATE UNIQUE INDEX CALORIAS_SESION_PK_IUK ON CALORIAS_SESION(CALORIAS_SESION_ID)
        TABLESPACE CLIENTE_IDXS_TS
    )
) TABLESPACE CLIENTE_TS
;



-- 
-- TABLE: CLIENTE 
--

CREATE TABLE CLIENTE_USR.CLIENTE(
    CLIENTE_ID          NUMBER(10, 0)    NOT NULL,
    NOMBRE              VARCHAR2(25)     NOT NULL,
    AP_PATERNO          VARCHAR2(50)     NOT NULL,
    AP_MATERNO          VARCHAR2(50)     NOT NULL,
    EMAIL               VARCHAR2(40)     NOT NULL,
    USERNAME            VARCHAR2(25)     NOT NULL,
    PASSWORD            VARCHAR2(20)     NOT NULL,
    FECHA_NACIMIENTO    DATE             NOT NULL,
    CURP                VARCHAR2(18)     NOT NULL,
    FOTO                BLOB             NOT NULL,
    DIRECCION           VARCHAR2(140)    NOT NULL,
    CONSTRAINT CLIENTE_PK PRIMARY KEY (CLIENTE_ID)
    USING INDEX (
        CREATE UNIQUE INDEX CLIENTE_PK_IUK ON CLIENTE(CLIENTE_ID)
        TABLESPACE CLIENTE_IDXS_TS
    ),
    CONSTRAINT CLIENTE_EMAIL_UK UNIQUE (EMAIL) 
    USING INDEX (
        CREATE UNIQUE INDEX CLIENTE_EMAIL_IUK ON CLIENTE(EMAIL)
        TABLESPACE CLIENTE_IDXS_TS
    ), 
    CONSTRAINT CLIENTE_CURP_UK UNIQUE (CURP) 
    USING INDEX (
        CREATE UNIQUE INDEX CLIENTE_CURP_IUK ON CLIENTE(CURP)
        TABLESPACE CLIENTE_IDXS_TS
    ),
    CONSTRAINT CLIENTE_USERNAME_UK UNIQUE (USERNAME) 
    USING INDEX (
        CREATE UNIQUE INDEX CLIENTE_USERNAME_IUK ON CLIENTE(USERNAME)
        TABLESPACE CLIENTE_IDXS_TS
    ),
) TABLESPACE CLIENTE_TS
LOB (FOTO) STORE AS SECUREFILE (TABLESPACE CLIENTE_LOB_TS)
;

--CREATE UNIQUE INDEX CLIE_USERNAME_IUK CLIENTE(USERNAME)
--  TABLESPACE CLIENTE_IDXS_TS;

-- 
-- TABLE: CLIENTE_GIMNASIO 
--

CREATE TABLE CLIENTE_USR.CLIENTE_GIMNASIO(
    CLIENTE_GIMNASIO_ID    NUMBER(10, 0)    NOT NULL,
    CLIENTE_ID             NUMBER(10, 0)    NOT NULL,
    GIMNASIO_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT CLIENTE_GIMNASIO_PK PRIMARY KEY (CLIENTE_GIMNASIO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX CLIENTE_GIMNASIO_PK_IUK ON CLIENTE_GIMNASIO(CLIENTE_GIMNASIO_ID)
        TABLESPACE CLIENTE_IDXS_TS
    )
) TABLESPACE CLIENTE_TS
;



-- 
-- TABLE: CREDENCIAL 
--

CREATE TABLE CLIENTE_USR.CREDENCIAL(
    CREDENCIAL_ID       NUMBER(10, 0)    NOT NULL,
    FOLIO               CHAR(8)          NOT NULL,
    FECHA_EXPEDICION    DATE             NOT NULL,
    VIGENCIA            NUMBER(2, 0)     NOT NULL,
    CODIGO_BARRAS       BLOB             NOT NULL,
    CLIENTE_ID          NUMBER(10, 0)    NOT NULL,
    CONSTRAINT CREDENCIAL_PK PRIMARY KEY (CREDENCIAL_ID)
    USING INDEX (
        CREATE UNIQUE INDEX CREDENCIAL_PK_IUK ON CREDENCIAL(CREDENCIAL_ID)
        TABLESPACE CLIENTE_IDXS_TS
    ),
    CONSTRAINT CREDENCIAL_FOLIO_UK UNIQUE (FOLIO)
    USING INDEX (
        CREATE UNIQUE INDEX CREDENCIAL_FOLIO_IUK ON CREDENCIAL(FOLIO)
        TABLESPACE CLIENTE_IDXS_TS
    )
) TABLESPACE CLIENTE_TS
LOB (CODIGO_BARRAS) STORE AS SECUREFILE (TABLESPACE CLIENTE_LOB_TS)
;

--CREATE UNIQUE INDEX CRE_FOLIO_IUK CREDENCIAL(FOLIO)
--  TABLESPACE CLIENTE_IDXS_TS;

-- 
-- TABLE: DICIPLINA 
--

CREATE TABLE GIMNASIO_USR.DISCIPLINA(
    DISCIPLINA_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE           CHAR(5)          NOT NULL,
    NOMBRE          VARCHAR2(25)     NOT NULL,
    DESCRIPCION     VARCHAR2(140)    NOT NULL,
    ICONO           BLOB             NOT NULL,
    CONSTRAINT DISCIPLINA_PK PRIMARY KEY (DISCIPLINA_ID)
    USING INDEX (
        CREATE UNIQUE INDEX DISCIPLINA_PK_IUK ON DISCIPLINA(DISCIPLINA_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    ),
    CONSTRAINT DISCIPLINA_CLAVE_UK UNIQUE (CLAVE)
    USING INDEX (
        CREATE UNIQUE INDEX DISCIPLINA_CLAVE_IUK ON DISCIPLINA(CLAVE)
        TABLESPACE EMP_GIM_IDXS_TS
    )
) TABLESPACE GIMNASIO_TS
LOB (ICONO) STORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
;



-- 
-- TABLE: DICIPLINA_SALAS 
--

CREATE TABLE GIMNASIO_USR.DISCIPLINA_SALA(
    DISCIPLINA_SALA_ID    NUMBER(10, 0)    NOT NULL,
    DISCIPLINA_ID          NUMBER(10, 0)    NOT NULL,
    SALA_ID               NUMBER(10, 0)    NOT NULL,
    CONSTRAINT DISCIPLINA_SALA PRIMARY KEY (DISCIPLINA_SALA_ID)
    USING INDEX (
        CREATE UNIQUE INDEX DISCIPLINA_SALA_PK_IUK ON DISCIPLINA_SALA(DISCIPLINA_SALA_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    )
) TABLESPACE GIMNASIO_TS
;



-- 
-- TABLE: EMPLEADO 
--

CREATE TABLE GIMNASIO_USR.EMPLEADO(
    EMPLEADO_ID   NUMBER(10, 0)    NOT NULL,
    TIPO_EMPLEADO       CHAR(1)          NOT NULL,
    EMAIL               VARCHAR2(40)     NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    AP_PATERNO          VARCHAR2(50)     NOT NULL,
    AP_MATERNO          VARCHAR2(50)     NOT NULL,
    CURP                VARCHAR2(18)     NOT NULL,
    FECHA_NACIMIENTO    DATE             NOT NULL,
    NO_EMPLEADO         NUMBER(10, 0)    NOT NULL,
    PUESTO_ID           NUMBER(10, 0)    NOT NULL,
    CONSTRAINT EMPLEADO_PK PRIMARY KEY (EMPLEADO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX EMPLEADO_PK_IUK ON EMPLEADO(EMPLEADO_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    ),
    CONSTRAINT EMPLEADO_CURP_UK UNIQUE (CURP)
    USING INDEX (
        CREATE UNIQUE INDEX EMPLEADO_CURP_IUK ON EMPLEADO(CURP)
        TABLESPACE EMP_GIM_IDXS_TS
    ),
    CONSTRAINT EMPLEADO_NO_EMPLEADO_UK UNIQUE (NO_EMPLEADO)
    USING INDEX (
        CREATE UNIQUE INDEX EMPLEADO_NO_EMPLEADO_IUK ON EMPLEADO(NO_EMPLEADO)
        TABLESPACE EMP_GIM_IDXS_TS
    ),
    CONSTRAINT EMPLEADO_TIPO_EMPLEADO_CHK CHECK (TIPO_EMPLEADO IN ('A', 'I'))
) TABLESPACE EMPLEADO_TS
;

--CREATE UNIQUE INDEX EMP_NO_EMPLEADO_IUK EMPLEADO(NO_EMPLEADO) 
--  TABLESPACE EMP_GIM_IDXS_TS;



-- 
-- TABLE: GIMNASIO 
--

CREATE TABLE GIMNASIO_USR.GIMNASIO(
    GIMNASIO_ID    NUMBER(10, 0)    NOT NULL,
    PAGINA_WEB     VARCHAR2(50)     NOT NULL,
    FOLIO          VARCHAR2(5)      NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    DIRECCION      VARCHAR2(100)    NOT NULL,
    LATITUD        VARCHAR2(15)     NOT NULL,
    LONGITUD       VARCHAR2(15)     NOT NULL,
    TELEFONO       NUMBER(12, 0)    NOT NULL,
    GERENTE        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT GIMNASIO_PK PRIMARY KEY (GIMNASIO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX GIMNASIO_PK_IUK ON GIMNASIO(GIMNASIO_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    ), 
    CONSTRAINT GIMNASIO_FOLIO_UK UNIQUE (FOLIO)
    USING INDEX (
        CREATE UNIQUE INDEX GIMNASIO_FOLIO_IUK ON GIMNASIO(FOLIO)
        TABLESPACE EMP_GIM_IDXS_TS
    )
) TABLESPACE GIMNASIO_TS
;

--CREATE UNIQUE INDEX GIM_FOLIO_IUK GIMNASIO(FOLIO)
--  TABLESPACE EMP_GIM_IDXS_TS;

-- 
-- TABLE: INSTRUCTOR 
--

CREATE TABLE GIMNASIO_USR.INSTRUCTOR(
    EMPLEADO_ID  NUMBER(10, 0)    NOT NULL,
    CEDULA             BLOB             NOT NULL,
    ANIOS_EXP          NUMBER(2, 0)     NOT NULL,
    SUPLENTE           NUMBER(10, 0),
    CONSTRAINT INSTRUCTOR_PK PRIMARY KEY (EMPLEADO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX INSTRUCTOR_PK_IUK ON INSTRUCTOR(EMPLEADO_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    )
) TABLESPACE EMPLEADO_TS
LOB (CEDULA) STORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
;



-- 
-- TABLE: MEDIDA 
--

CREATE TABLE CLIENTE_USR.MEDIDA(
    MEDIDA_ID       NUMBER(10, 0)    NOT NULL,
    FECHA            TIMESTAMP(6)     NOT NULL,
    PESO             NUMBER(5, 2)     NOT NULL,
    MASA_CORPORAL    NUMBER(5, 2)     NOT NULL,
    ESTATURA         NUMBER(5, 2)     NOT NULL,
    CLIENTE_ID       NUMBER(10, 0)    NOT NULL,
    CONSTRAINT MEDIDA_PK PRIMARY KEY (MEDIDA_ID)
    USING INDEX (
        CREATE UNIQUE INDEX MEDIDA_PK_IUK ON MEDIDA(MEDIDA_ID)
        TABLESPACE CLIENTE_IDXS_TS
    )
) TABLESPACE CLIENTE_TS
;



-- 
-- TABLE: MULTIMEDIA 
--

CREATE TABLE GIMNASIO_USR.MULTIMEDIA(
    MULTIMEDIA_ID    NUMBER(10, 0)    NOT NULL,
    TIPO             CHAR(1)          NOT NULL,
    CONTENIDO        BLOB             NOT NULL,
    FECHA_INICIO     TIMESTAMP(6)     NOT NULL,
    FECHA_FIN        TIMESTAMP(6)     NOT NULL,
    GIMNASIO_ID      NUMBER(10, 0)    NOT NULL,
    CONSTRAINT MULTIMEDIA_PK PRIMARY KEY (MULTIMEDIA_ID)
    USING INDEX (
        CREATE UNIQUE INDEX MULTIMEDIA_PK_IUK ON MULTIMEDIA(MULTIMEDIA_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    ), 
    CONSTRAINT MULTIMEDIA_TIPO_CHK CHECK(TIPO IN ('F', 'V'))
) TABLESPACE GIMNASIO_TS
LOB (CONTENIDO) STORE AS SECUREFILE (TABLESPACE GIMNASIO_LOB_TS)
;



-- 
-- TABLE: PUESTO 
--

CREATE TABLE GIMNASIO_USR.PUESTO(
    PUESTO_ID      NUMBER(10, 0)    NOT NULL,
    NOMBRE         VARCHAR2(30)     NOT NULL,
    CLAVE          CHAR(5)          NOT NULL,
    DESCRIPCION    VARCHAR2(140)    NOT NULL,
    CONSTRAINT PUESTO_PK PRIMARY KEY (PUESTO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX PUESTO_PK_IUK ON PUESTO(PUESTO_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    ),
    CONSTRAINT PUESTO_CLAVE_UK UNIQUE (CLAVE)
    USING INDEX (
        CREATE UNIQUE INDEX PUESTO_CLAVE_IUK ON PUESTO(CLAVE)
        TABLESPACE EMP_GIM_IDXS_TS
    )
) TABLESPACE EMPLEADO_TS
;



-- 
-- TABLE: SALA 
--

CREATE TABLE GIMNASIO_USR.SALA(
    SALA_ID        NUMBER(10, 0)    NOT NULL,
    CLAVE          CHAR(3)          NOT NULL,
    NOMBRE         VARCHAR2(20)     NOT NULL,
    CAPACIDAD      NUMBER(3, 0)     NOT NULL,
    RESPONSABLE    NUMBER(10, 0)    NOT NULL,
    GIMNASIO_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT SALA_PK PRIMARY KEY (SALA_ID)
    USING INDEX (
        CREATE UNIQUE INDEX SALA_PK_IUK ON SALA(SALA_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    ),
    CONSTRAINT SALA_CLAVE_UK UNIQUE (CLAVE)
    USING INDEX (
        CREATE UNIQUE INDEX SALA_CLAVE_IUK ON SALA(SALA_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    )
) TABLESPACE GIMNASIO_TS
;



-- 
-- TABLE: SENSOR 
--

CREATE TABLE CLIENTE_USR.SENSOR(
    SENSOR_ID       NUMBER(10, 0)    NOT NULL,
    NO_SERIE        NUMBER(10, 0)    NOT NULL,
    FECHA_COMPRA    DATE             NOT NULL,
    MARCA           DATE             NOT NULL,
    CLIENTE_ID      NUMBER(10, 0)    NOT NULL,
    CONSTRAINT SENSOR_PK PRIMARY KEY (SENSOR_ID)
    USING INDEX (
        CREATE UNIQUE INDEX SENSOR_PK_IUK ON SENSOR(SENSOR_ID)
        TABLESPACE CLIENTE_IDXS_TS
    ),
    CONSTRAINT SENSOR_NO_SERIE_UK UNIQUE (NO_SERIE)
    USING INDEX (
        CREATE UNIQUE INDEX SENSOR_NO_SERIE_IUK ON SENSOR(NO_SERIE)
        TABLESPACE CLIENTE_IDXS_TS
    )
) TABLESPACE CLIENTE_TS
;

--CREATE UNIQUE INDEX SEN_NO_SERIE_IUK SENSOR(NO_SERIE)
--   TABLESPACE CLIENTE_IDXS_TS;

-- 
-- TABLE: SESION 
--

CREATE TABLE CLIENTE_USR.SESION(
    CLIENTE_ID      NUMBER(10, 0)    NOT NULL,
    NO_SESION       NUMBER(10, 0)    NOT NULL,
    FECHA_INICIO    TIMESTAMP(6)     NOT NULL,
    DURACION        NUMBER(4, 0)     NOT NULL,
    MODALIDAD       VARCHAR2(15)     NOT NULL,
    INSTRUCTOR      NUMBER(10, 0)    NOT NULL,
    SALA_ID         NUMBER(10, 0),
    CONSTRAINT SESION_PK PRIMARY KEY (CLIENTE_ID, NO_SESION)
    USING INDEX (
        CREATE UNIQUE INDEX SESION_PK_IUK ON SESION(CLIENTE_ID, NO_SESION)
        TABLESPACE CLIENTE_IDXS_TS
    ), 
    CONSTRAINT SESION_MODALIDAD_CHK CHECK (MODALIDAD IN ('PRESENCIAL', 'EN LINEA'))
) TABLESPACE CLIENTE_TS
;



-- 
-- TABLE: SESION_SENSOR 
--

CREATE TABLE CLIENTE_USR.SESION_SENSOR(
    SESION_SENSOR_ID    NUMBER(10, 0)    NOT NULL,
    CLIENTE_ID          NUMBER(10, 0)    NOT NULL,
    NO_SESION           NUMBER(10, 0)    NOT NULL,
    APARATO_ID          NUMBER(10, 0)    NOT NULL,
    CONSTRAINT SESION_SENSOR_PK PRIMARY KEY (SESION_SENSOR_ID)
    USING INDEX (
        CREATE UNIQUE INDEX SESION_SENSOR_PK_IUK ON SESION_SENSOR(SESION_SENSOR_ID)
        TABLESPACE CLIENTE_IDXS_TS
    )
) TABLESPACE CLIENTE_TS
;



-- 
-- TABLE: STATUS_APARATO 
--

CREATE TABLE GIMNASIO_USR.STATUS_APARATO(
    STATUS_ID      NUMBER(10, 0)    NOT NULL,
    DESCRIPCION    VARCHAR2(40)     NOT NULL,
    STATUS         VARCHAR2(20)     NOT NULL,
    CONSTRAINT STATUS_APARATO_PK PRIMARY KEY (STATUS_ID)
    USING INDEX (
        CREATE UNIQUE INDEX STATUS_APARATO_PK_IUK ON STATUS_APARATO(STATUS_APARATO_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    ),
    CONSTRAINT STATUS_APARATO_STATUS_UK UNIQUE (STATUS)
    USING INDEX (
        CREATE UNIQUE INDEX STATUS_APARATO_STATUS_IUK ON STATUS_APARATO(STATUS)
        TABLESPACE EMP_GIM_IDXS_TS
    )
) TABLESPACE GIMNASIO_TS
;



-- 
-- TABLE: STATUS_APARTO_HISTORICO 
--

CREATE TABLE GIMNASIO_USR.STATUS_APARATO_HISTORICO(
    STATUS_APARATO_ID    NUMBER(10, 0)    NOT NULL,
    FECHA                TIMESTAMP(6)     NOT NULL,
    APARATO_ID           NUMBER(10, 0)    NOT NULL,
    STATUS_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT STATUS_APARATO_HISTORICO_PK PRIMARY KEY (STATUS_APARATO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX STATUS_APARATO_HISTORICO_PK_IUK ON STATUS_APARATO_HISTORICO(STATUS_APARATO_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    )
) TABLESPACE GIMNASIO_TS
;



-- 
-- TABLE: TIPO_APARATO 
--

CREATE TABLE GIMNASIO_USR.TIPO_APARATO(
    TIPO_DISPOSITIVO_ID    NUMBER(10, 0)    NOT NULL,
    DESCRIPCION            VARCHAR2(140)    NOT NULL,
    TIPO                   VARCHAR2(20)     NOT NULL,
    CONSTRAINT TIPO_APARATO_PK PRIMARY KEY (TIPO_DISPOSITIVO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX TIPO_APARATO_PK_IUK ON TIPO_APARATO(TIPO_DISPOSITIVO_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    ),
    CONSTRAINT TIPO_APARATO_TIPO_UK UNIQUE (TIPO)
    USING INDEX (
        CREATE UNIQUE INDEX TIPO_APARATO_TIPO_IUK ON TIPO_APARATO(TIPO)
        TABLESPACE EMP_GIM_IDXS_TS
    )
) TABLESPACE GIMNASIO_TS
;



-- 
-- TABLE: URL_INSTRUCTOR 
--

CREATE TABLE GIMNASIO_USR.URL_INSTRUCTOR(
    URL_INSTRUCTOR_ID    NUMBER(10, 0)    NOT NULL,
    URL                  VARCHAR2(50)     NOT NULL,
    INSTRUCTOR           NUMBER(10, 0),
    CONSTRAINT URL_INSTRUCTOR_PK PRIMARY KEY (URL_INSTRUCTOR_ID)
    USING INDEX (
        CREATE UNIQUE INDEX URL_INSTRUCTOR_PK_IUK ON URL_INSTRUCTOR(URL_INSTRUCTOR_ID)
        TABLESPACE EMP_GIM_IDXS_TS
    )
) TABLESPACE EMPLEADO_TS
;

-- PERMISOS REFERENCES
GRANT REFERENCES ON TABLA CLIENTE_USR.SESION TO GIMNASIO_USR;
GRANT REFERENCES ON TABLA CLIENTE_USR.SESION_SENSOR TO GIMNASIO_USR;
GRANT REFERENCES ON TABLA CLIENTE_USR.CLIENTE_GIMNASIO TO GIMNASIO_USR;

-- 
-- TABLE: ADMINISTRADOR 
--

ALTER TABLE GIMNASIO_USR.ADMINISTRADOR ADD CONSTRAINT ADMINISTRADOR_EMPLEADO_ID_FK
    FOREIGN KEY (EMPLEADO_ID)
    REFERENCES GIMNASIO_USR.EMPLEADO(EMPLEADO_ID)
;


-- 
-- TABLE: APARATO 
--

ALTER TABLE GIMNASIO_USR.APARATO ADD CONSTRAINT APARATO_TIPO_DISPOSITIVO_ID_FK 
    FOREIGN KEY (TIPO_DISPOSITIVO_ID)
    REFERENCES GIMNASIO_USR.TIPO_APARATO(TIPO_DISPOSITIVO_ID)
;

ALTER TABLE GIMNASIO_USR.APARATO ADD CONSTRAINT APARATO_STATUS_ID_FK 
    FOREIGN KEY (STATUS_ID)
    REFERENCES GIMNASIO_USR.STATUS_APARATO(STATUS_ID)
;

ALTER TABLE GIMNASIO_USR.APARATO ADD CONSTRAINT APARATO_SALA_ID_FK 
    FOREIGN KEY (SALA_ID)
    REFERENCES GIMNASIO_USR.SALA(SALA_ID)
;


-- 
-- TABLE: BIOMETRICO 
--

ALTER TABLE GIMNASIO_USR.BIOMETRICO ADD CONSTRAINT BIOMETRICO_EMPLEADO_ID 
    FOREIGN KEY (EMPLEADO_ID)
    REFERENCES GIMNASIO_USR.EMPLEADO(EMPLEADO_ID)
;


-- 
-- TABLE: CALORIAS_SESION 
--

ALTER TABLE CALORIAS_SESION ADD CONSTRAINT CALORIAS_SESION_CLIENTE_ID_NO_SESION_FK 
    FOREIGN KEY (CLIENTE_ID, NO_SESION)
    REFERENCES SESION(CLIENTE_ID, NO_SESION)
;


-- 
-- TABLE: CLIENTE_GIMNASIO 
--

ALTER TABLE CLIENTE_USR.CLIENTE_GIMNASIO ADD CONSTRAINT CLIENTE_GIMNASIO_CLIENTE_ID_FK 
    FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE_USR.CLIENTE(CLIENTE_ID)
;
--***************************************************************************
ALTER TABLE CLIENTE_USR.CLIENTE_GIMNASIO ADD CONSTRAINT CLIENTE_GIMNASIO_GIMNASIO_ID_FK 
    FOREIGN KEY (GIMNASIO_ID)
    REFERENCES GIMNASIO_USR.GIMNASIO(GIMNASIO_ID)
;


-- 
-- TABLE: CREDENCIAL 
--

ALTER TABLE CLIENTE_USR.CREDENCIAL ADD CONSTRAINT CREDENCIAL_CLIENTE_ID_FK 
    FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE_USR.CLIENTE(CLIENTE_ID)
;


-- 
-- TABLE: DISCIPLINA_SALAS 
--

ALTER TABLE GIMNASIO_USR.DISCIPLINA_SALA ADD CONSTRAINT DISCIPLINA_SALA_DISCIPLINA_ID_FK 
    FOREIGN KEY (DISCIPLINA_ID)
    REFERENCES GIMNASIO_USR.DISCIPLINA(DISCIPLINA_ID)
;

ALTER TABLE GIMNASIO_USR.DISCIPLINA_SALA ADD CONSTRAINT DISCIPLINA_SALA_SALA_ID_FK 
    FOREIGN KEY (SALA_ID)
    REFERENCES GIMNASIO_USR.SALA(SALA_ID)
;


-- 
-- TABLE: EMPLEADO 
--

ALTER TABLE GIMNASIO_USR.EMPLEADO ADD CONSTRAINT EMPLEADO_PUESTO_ID_FK 
    FOREIGN KEY (PUESTO_ID)
    REFERENCES GIMNASIO_USR.PUESTO(PUESTO_ID)
;


-- 
-- TABLE: GIMNASIO 
--

ALTER TABLE GIMNASIO_USR.GIMNASIO ADD CONSTRAINT GIMNASIO_GERENTE_FK 
    FOREIGN KEY (GERENTE)
    REFERENCES GIMNASIO_USR.ADMINISTRADOR(EMPLEADO_ID)
;


-- 
-- TABLE: INSTRUCTOR 
--

ALTER TABLE GIMNASIO_USR.INSTRUCTOR ADD CONSTRAINT INSTRUCTOR_EMPLEADO_ID_FK 
    FOREIGN KEY (EMPLEADO_ID)
    REFERENCES GIMNASIO_USR.EMPLEADO(EMPLEADO_ID)
;

ALTER TABLE GIMNASIO_USR.INSTRUCTOR ADD CONSTRAINT INSTRUCTOR_SUPLENTE_FK 
    FOREIGN KEY (SUPLENTE)
    REFERENCES GIMNASIO_USR.INSTRUCTOR(EMPLEADO_ID)
;


-- 
-- TABLE: MEDIDA 
--

ALTER TABLE CLIENTE_USR.MEDIDA ADD CONSTRAINT MEDIDA_CLIENTE_ID_FK 
    FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE_USR.CLIENTE(CLIENTE_ID)
;


-- 
-- TABLE: MULTIMEDIA 
--

ALTER TABLE GIMNASIO_USR.MULTIMEDIA ADD CONSTRAINT MULTIMEDIA_GIMNASIO_ID_FK 
    FOREIGN KEY (GIMNASIO_ID)
    REFERENCES GIMNASIO_USR.GIMNASIO(GIMNASIO_ID)
;


-- 
-- TABLE: SALA 
--

ALTER TABLE GIMNASIO_USR.SALA ADD CONSTRAINT SALA_RESPONSABLE_FK 
    FOREIGN KEY (RESPONSABLE)
    REFERENCES GIMNASIO_USR.ADMINISTRADOR(EMPLEADO_ID)
;

ALTER TABLE GIMNASIO_USR.SALA ADD CONSTRAINT SALA_GIMNASIO_ID_FK 
    FOREIGN KEY (GIMNASIO_ID)
    REFERENCES GIMNASIO_USR.GIMNASIO(GIMNASIO_ID)
;


-- 
-- TABLE: SENSOR 
--

ALTER TABLE CLIENTE_USR.SENSOR ADD CONSTRAINT SENSOR_CLIENTE_ID_FK 
    FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE_USR.CLIENTE(CLIENTE_ID)
;


-- 
-- TABLE: SESION 
--
--******************************************************
ALTER TABLE CLIENTE_USR.SESION ADD CONSTRAINT SESION_INSTRUCTOR_FK 
    FOREIGN KEY (INSTRUCTOR)
    REFERENCES GIMNASIO_USR.INSTRUCTOR(EMPLEADO_ID)
;
--******************************************************
ALTER TABLE CLIENTE_USR.SESION ADD CONSTRAINT SESION_SALA_ID_FK 
    FOREIGN KEY (SALA_ID)
    REFERENCES GIMNASIO_USR.SALA(SALA_ID)
;

ALTER TABLE CLIENTE_USR.SESION ADD CONSTRAINT SESION_CLIENTE_ID_FK 
    FOREIGN KEY (CLIENTE_ID)
    REFERENCES CLIENTE_USR.CLIENTE(CLIENTE_ID)
;


-- 
-- TABLE: SESION_SENSOR 
--

ALTER TABLE CLIENTE_USR.SESION_SENSOR ADD CONSTRAINT SESION_SENSOR_APARATO_ID_FK 
    FOREIGN KEY (APARATO_ID)
    REFERENCES GIMNASIO_USR.APARATO(APARATO_ID)
;

ALTER TABLE CLIENTE_USR.SESION_SENSOR ADD CONSTRAINT SESION_SENSOR_CLIENTE_ID_NO_SESION_FK 
    FOREIGN KEY (CLIENTE_ID, NO_SESION)
    REFERENCES CLIENTE_USR.SESION(CLIENTE_ID, NO_SESION)
;


-- 
-- TABLE: STATUS_APARTO_HISTORICO 
--

ALTER TABLE GIMNASIO_USR.STATUS_APARATO_HISTORICO ADD CONSTRAINT STATUS_APARATO_HISTORICO_APARATO_ID_FK 
    FOREIGN KEY (APARATO_ID)
    REFERENCES GIMNASIO_USR.APARATO(APARATO_ID)
;

ALTER TABLE GIMNASIO_USR.STATUS_APARATO_HISTORICO ADD CONSTRAINT STATUS_APARATO_HISTORICO_STATUS_ID_FK 
    FOREIGN KEY (STATUS_ID)
    REFERENCES GIMNASIO_USR.STATUS_APARATO(STATUS_ID)
;


-- 
-- TABLE: URL_INSTRUCTOR 
--

ALTER TABLE GIMNASIO_USR.URL_INSTRUCTOR ADD CONSTRAINT URL_INSTRUCTOR_INSTRUCTOR_FK
    FOREIGN KEY (INSTRUCTOR)
    REFERENCES GIMNASIO_USR.INSTRUCTOR(EMPLEADO_ID)
;


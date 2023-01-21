-- @Autor: Brandon Cervantes, Josmar Sandoval
-- @Fecha: 19/01/2023
-- @Descripcion: Creación del Diccionario de datos

set serveroutput on 

prompt Iniciando sesión como SYS 
connect sys/systemgym as sysdba 

prompt Ejecución delos primeros 3 scripts
@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
@?/rdbms/admin/utlrp.sql

prompt Conectando como SYSTEM
connect system/systemgym 

prompt Ejecución de último script 
@?/sqlplus/admin/pupbld.sql
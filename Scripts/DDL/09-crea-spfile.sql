-- @Autor Brandon Cervantes
-- @Fecha 18/09/2022
-- @Descripcion Creación de un SPFILE

connect sys/systemgym as sysdba

Prompt Creacion del SPFILE
create spfile from pfile;

Prompt Comprobacion del SPFILE
!ls ${ORACLE_HOME}/dbs/spfilecesaproy.ora






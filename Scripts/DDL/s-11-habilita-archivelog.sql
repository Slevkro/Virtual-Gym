--@Autor: Brandon Cervantes , Josmar Sandoval
--@Fecha creación: 19/01/2023
--@Descripción: Script para configurar el modo archivelog

--cd /unam-bda/archivelogs
--sudo mkdir -p CESAPROY/disk_a
--sudo chown -R oracle:oinstall CESAPROY
--sudo chmod -R 750 CESAPROY

Prompt Creando respaldo del pfile en /tmp/pfile2.ora
create pfile='/tmp/pfile2.ora' from spfile;

Prompt Configurando parametros del modo archivelog
-- 2 procesos ARC
alter system set log_archive_max_processes = 2 scope = spfile;
-- 2 copias, la primera obligatoria
alter system
  set log_archive_dest_1 = 'LOCATION=/unam-bda/archivelogs/CESAPROY/disk_a MANDATORY'
  scope = spfile;
alter system
  set log_archive_dest_2 = 'LOCATION=USE_DB_RECOVERY_FILE_DEST'
  scope = spfile;
-- Nombrado de los archivos
alter system
  set log_archive_format = 'arch_cesaproy_%t_%s_%r.arc' scope = spfile;
-- Por lo menos una copia exitosa
alter system
  set log_archive_min_succeed_dest = 1 scope = spfile;

Prompt Ejecutar los siguientes comandos en el orden propuesto 
Prompt shutdown 
Prompt startup mount 
Prompt alter database archivelog;
Prompt alter database open;
Prompt archive log list;
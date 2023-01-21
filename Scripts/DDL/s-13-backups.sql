--@Autor: Brandon Cervantes , Josmar Sandoval
--@Fecha creación: 19/01/2023
--@Descripción: Script para configurar el modo archivelog

-- COMANDOS DE RMAN
-- #] rman
-- RMAN> connect target "backup_usr@cesaproy as sysbackup"
-- configure channel device type disk clear maxpiecesize 2G;
-- configure retention policy to recovery window of 7 days;
-- list backup


-- LINEA PARA FULL BACKUP (20 DEL MES)
backup database plus archivelog tag gym_full_25;

-- BACKUP INCREMENTAL NIVEL 0 (LUNES)
backup as backupset incremental level 0 database 
plus archivelog tag gym_backup_nivel_0_1;

-- BACKUP INCREMNTAL NIVEL 1 (MARTES - DOMINGO)
backup as backupset incremental level 1 database 
plus archivelog tag gym_backup_nivel_1_1;

--Cambiar el tag de los backups incrementales


--consulta de backup sets (CONTROL FILE EN BACKUP)
--select start_time, backup_type, controlfile_included, pieces from v$backup_set;

--consulta del tamaño de redo logs en los backups
/* select backup.tag, sum(redo.block_size/1024/1024)
 from v$backup_redolog redo 
 join v$backup_piece backup
 on redo.stamp = backup.stamp
 group by backup.tag;*/

--consulta del tamaño de los backups
/*
 select tag, start_time, status, bytes, is_recovery_dest_file,
 bytes/1024/1024 as size_mb
 from v$backup_piece;
*/



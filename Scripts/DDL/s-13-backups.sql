--@Autor: Brandon Cervantes , Josmar Sandoval
--@Fecha creación: 19/01/2023
--@Descripción: Script para configurar el modo archivelog

-- COMANDOS DE RMAN
-- #] rman
-- RMAN> connect target "backup_usr@cesaproy as sysbackup"
-- configure channel device type disk clear maxpiecesize 2G;
-- configure retention policy to recovery window of 7 days;


-- LINEA PARA FULL BACKUP (20 DEL MES)
backup database plus archivelog tag gym_full_25;

-- BACKUP INCREMENTAL NIVEL 0 (LUNES)
backup as backupset incremental level 0 database 
plus archivelog tag gym_backup_nivel_0_1;

-- BACKUP INCREMNTAL NIVEL 1 (MARTES - DOMINGO)
backup as backupset incremental level 1 database 
plus archivelog tag autos_backup_nivel_1_1;

--Cambiar el tag de los backups incrementales
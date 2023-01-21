--@Autor: Brandon Cervantes , Josmar Sandoval
--@Fecha creación: 19/01/2023
--@Descripción: Script para configurar la fast recovery 
--                area (FRA)

connect sys/systemgym as sysdba

Prompt Cambiando parametros para la FRA

alter system set db_recovery_file_dest_size = 5000m scope = both;
alter system set db_recovery_file_dest = '/unam-bda/fast_reco_area/CESAPROY/' scope = both;
alter system set db_flashback_retention_target = 2880 scope = both;

-- Agrega un miembro a cada grupo Redo 

alter database
  add logfile
    group 4 
    size 50m blocksize 512;

-- Agrega controlfile a la FRA
-- #] rman
-- RMAN> connect target "backup_usr@cesaproy as sysbackup"
-- configure controlfile autobackup format for device type disk clear
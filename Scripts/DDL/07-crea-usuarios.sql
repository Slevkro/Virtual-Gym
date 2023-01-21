--@Autor: Brandon Cervantes Rubí, Josmar Sandoval
--@Fecha creación: 18/01/2023
--@Descripción: Creacion del usuarios por por modulo

Prompt Conectando con Sys
connect sys/systemgym as sysdba 
whenever sqlerror exit rollback;

Prompt Creando usuario para el modulo de Gimnasio
drop user gimnasio_usr cascade;
create user gimnasio_usr identified by gimnasio123 
  default tablespace gimnasio_ts
  temporary tablespace temp_gimnasio_ts
  quota unlimited on gimnasio_ts
  quota unlimited on empleado_ts
  quota unlimited on gimnasio_lob_ts
  quota unlimited on emp_gim_idxs_ts
  ;

grant create session, create table, create any index to gimnasio_usr;

Prompt Creando usuario para el modulo de Cliente 
drop user cliente_usr cascade;
create user cliente_usr identified by cliente123 
  default tablespace cliente_ts
  temporary tablespace temp_cliente_ts
  quota unlimited on cliente_ts
  quota unlimited on cliente_idxs_ts
  quota unlimited on cliente_lob_ts;

grant create session, create table, create any index to cliente_usr;

Prompt Creando usuario para los backups
drop user backup_usr cascade;
create user backup_usr identified by backup123 
  quota unlimited on users;

grant sysbackup to backup_usr;
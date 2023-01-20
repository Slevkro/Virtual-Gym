--@Autor: Brandon Cervantes Rubí, Josmar Sandoval
--@Fecha creación: 18/08/2022
--@Descripción: Creacion del usuarios por por modulo

Prompt Conectando con Sys
connect sys/systemgym as sysdba 
whenever sqlerror exit rollback;

Prompt Creando usuario para el modulo de Gimnasio
drop user gimnasio_usr cascade;
create user gimnasio_usr identified by gimnasio123 
  default tablespace gimnasio_ts
  temporary tablespace temp_gimnasio_ts
  quota unlimited on gimnasio_ts;

grant create session, create table, create any index to gimnasio_usr;

Prompt Creando usuario para el modulo de Cliente 
--drop user cliente_usr cascade;
create user cliente_usr identified by cliente123 
  default tablespace cliente_ts
  temporary tablespace temp_cliente_ts
  quota unlimited on cliente_ts;

grant create session, create table, create any index to cliente_usr;
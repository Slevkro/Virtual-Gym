-- @Autor Brandon Cervantes
-- @Fecha 18/09/2022
-- @Descripcion Creación de la base de datos

Prompt Conectando como Sys
connect sys/1q2w3e4r as sysdba

Prompt Iniciando la instancia en nomount
startup nomount

whenever sqlerror exit rollback;

Prompt Creacion de la base de datos

create database CEPROYSA
  user sys identified by 1q2w3e4r
  user system identified by 1q2w3e4r
  logfile group 1 (
    '/unam-bda/d11/ctrl_files/CEPROYSA/redo01a.log',
    '/unam-bda/d12/ctrl_files/CEPROYSA/BCRBDA2/redo01b.log',
    '/unam-bda/d13/ctrl_files/CEPROYSA/redo01c.log') size 50m
blocksize 512,
  group 2 (
    '/unam-bda/d11/ctrl_files/CEPROYSA/redo02a.log',
    '/unam-bda/d12/ctrl_files/CEPROYSA/BCRBDA2/redo02b.log',
    '/unam-bda/d13/ctrl_files/CEPROYSA/redo02c.log') size 50m
blocksize 512,
  group 3 (
  '/unam-bda/d11/ctrl_files/CEPROYSA/redo03a.log',
  '/unam-bda/d12/ctrl_files/CEPROYSA/BCRBDA2/redo03b.log',
  '/unam-bda/d13/ctrl_files/CEPROYSA/redo03c.log') size 50m
blocksize 512
  maxloghistory 1
  maxlogfiles 16
  maxlogmembers 3
  maxdatafiles 1024
  character set AL32UTF8
  national character set AL16UTF16
  extent management local
  datafile '/unam-bda/d11/datafiles/CEPROYSA/system01.dbf' size 700m,
      '/unam-bda/d12/datafiles/CEPROYSA/system02.dbf' size 700m,
      '/unam-bda/d13/datafiles/CEPROYSA/system03.dbf' size 700m
      reuse autoextend on next 10240k maxsize unlimited
  sysaux datafile '/unam-bda/d11/datafiles/CEPROYSA/sysaux01.dbf' size 550m,
      '/unam-bda/d12/datafiles/CEPROYSA/sysaux02.dbf' size 550m,
      '/unam-bda/d13/datafiles/CEPROYSA/sysaux03.dbf' size 550m
    reuse autoextend on next 10240k maxsize unlimited
  default tablespace users
    datafile '/unam-bda/d11/datafiles/CEPROYSA/users_df_01.dbf' size 500m,
      '/unam-bda/d12/datafiles/CEPROYSA/users_df_02.dbf' size 550m,
      '/unam-bda/d13/datafiles/CEPROYSA/users_df_03.dbf' size 550m
    reuse autoextend on maxsize unlimited
  default temporary tablespace temp_gimnasio_ts
    tempfile '/unam-bda/d11/datafiles/temp_gimnasio_df_01.dbf' size 20m 
      
    reuse autoextend on next 640k maxsize unlimited
  undo tablespace undo_gimnasio_ts
    datafile '/unam-bda/d11/datafiles/undo_gimnasio_df_01.dbf'
    size 200m reuse autoextend on next 5120k maxsize unlimited;

Prompt Cambiando las contraseñas a sys y system
alter user sys identified by 1q2w3e4r;
alter user system identified by 1q2w3e4r;

Prompt Finalizo!
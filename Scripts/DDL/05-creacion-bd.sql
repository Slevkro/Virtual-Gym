-- @Autor Brandon Cervantes, Josmar Sandoval
-- @Fecha 18/09/2022
-- @Descripcion Creación de la base de datos

Prompt Conectando como Sys
connect sys/hola1234* as sysdba

Prompt Iniciando la instancia en nomount
startup nomount

whenever sqlerror exit rollback;

Prompt Creacion de la base de datos

create database cesaproy
  user sys identified by systemgym
  user system identified by systemgym
  logfile group 1 (
    '/unam-bda/d14/ctrl_files_redo/CESAPROY/redo01a.log',
    '/unam-bda/d15/ctrl_files_redo/CESAPROY/redo01b.log',
    '/unam-bda/d16/ctrl_files_redo/CESAPROY/redo01c.log') size 50m
blocksize 512,
  group 2 (
    '/unam-bda/d14/ctrl_files_redo/CESAPROY/redo02a.log',
    '/unam-bda/d15/ctrl_files_redo/CESAPROY/redo02b.log',
    '/unam-bda/d16/ctrl_files_redo/CESAPROY/redo02c.log') size 50m
blocksize 512,
  group 3 (
    '/unam-bda/d14/ctrl_files_redo/CESAPROY/redo03a.log',
    '/unam-bda/d15/ctrl_files_redo/CESAPROY/redo03b.log',
    '/unam-bda/d16/ctrl_files_redo/CESAPROY/redo03c.log') size 50m
blocksize 512
  maxloghistory 1
  maxlogfiles 16
  maxlogmembers 3
  maxdatafiles 1024
  character set AL32UTF8
  national character set AL16UTF16
  extent management local
  datafile '/unam-bda/d11/datafiles/CESAPROY/system01.dbf' size 50m,
      '/unam-bda/d12/datafiles/CESAPROY/system02.dbf' size 50m
      reuse autoextend on next 10240k maxsize unlimited
  sysaux datafile '/unam-bda/d11/datafiles/CESAPROY/sysaux01.dbf' size 30m,
      '/unam-bda/d12/datafiles/CESAPROY/sysaux02.dbf' size 30m
      reuse autoextend on next 10240k maxsize unlimited
  default tablespace users
    datafile '/unam-bda/d11/datafiles/CESAPROY/users_df_01.dbf' size 40m,
      '/unam-bda/d12/datafiles/CESAPROY/users_df_02.dbf' size 40m
      reuse autoextend on maxsize unlimited
  default temporary tablespace temp_gimnasio_ts
    tempfile '/unam-bda/d11/datafiles/CESAPROY/temp_gimnasio_df_01.dbf' size 30m   
      reuse autoextend on next 640k maxsize unlimited
  undo tablespace undo_gimnasio_ts
    datafile '/unam-bda/d11/datafiles/CESAPROY/undo_gimnasio_df_01.dbf'
    size 45m reuse autoextend on next 5120k maxsize unlimited;

Prompt Cambiando las contraseñas a sys y system
alter user sys identified by systemgym;
alter user system identified by systemgym;

Prompt Finalizo!
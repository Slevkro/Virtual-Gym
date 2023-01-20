
connect sys/systemgym as sysdba;
whenever sqlerror exit rollback;

Prompt creando empleado_ts
drop tablespace empleado_ts including contents;
create tablespace empleado_ts 
  datafile '/unam-bda/d11/datafiles/CESAPROY/empleado_df_01.dbf' size 20m reuse, 
    '/unam-bda/d12/datafiles/CESAPROY/empleado_df_02.dbf' size 20m
    reuse
    autoextend on 
    maxsize unlimited
  extent management local autoallocate;

Prompt creando gimnasio_lob_ts
drop tablespace gimnasio_lob_ts including contents;
create bigfile tablespace gimnasio_lob_ts 
  datafile '/unam-bda/d13/datafiles/CESAPROY/gimnasio_lob_df_01.dbf' size 100m
    reuse
    autoextend on 
    next 1m  
    maxsize unlimited
  extent management local autoallocate;

Prompt creando gimnasio_ts
drop tablespace gimnasio_ts including contents;
create tablespace gimnasio_ts 
  datafile '/unam-bda/d11/datafiles/CESAPROY/gimnasio_df_01.dbf' size 20m reuse, 
    '/unam-bda/d12/datafiles/CESAPROY/gimnasio_df_02.dbf' size 20m reuse, 
    '/unam-bda/d13/datafiles/CESAPROY/gimnasio_df_03.dbf' size 20m 
    reuse
    autoextend on 
    maxsize unlimited
  extent management local autoallocate;

Prompt creando emp_gim_idxs_ts
drop tablespace emp_gim_idxs_ts including contents;
create tablespace emp_gim_idxs_ts 
  datafile '/unam-bda/d11/datafiles/CESAPROY/empleado_idx_df_01.dbf' size 10m reuse, 
    '/unam-bda/d12/datafiles/CESAPROY/empleado_idx_df_02.dbf' size 10m reuse, 
    '/unam-bda/d13/datafiles/CESAPROY/empleado_idx_df_03.dbf' size 10m
    reuse
    autoextend on 
    maxsize unlimited
  extent management local autoallocate;

Prompt creando cliente_ts
drop tablespace cliente_ts including contents;
create tablespace cliente_ts 
  datafile '/unam-bda/d11/datafiles/CESAPROY/cliente_df_01.dbf' size 20m reuse, 
    '/unam-bda/d12/datafiles/CESAPROY/cliente_df_02.dbf' size 20m reuse, 
    '/unam-bda/d13/datafiles/CESAPROY/cliente_df_01.dbf' size 20m
    reuse
    autoextend on 
    maxsize unlimited
  extent management local autoallocate;

Prompt creando cliente_idxs_ts
drop tablespace cliente_idxs_ts including contents;
create tablespace cliente_idxs_ts 
  datafile '/unam-bda/d11/datafiles/CESAPROY/cliente_idx_df_01.dbf' size 10m reuse, 
    '/unam-bda/d12/datafiles/CESAPROY/cliente_idx_df_02.dbf' size 10m
    reuse
    autoextend on 
    maxsize unlimited
  extent management local autoallocate;

Prompt creando cliente_lob_ts
drop tablespace cliente_lob_ts including contents;
create bigfile tablespace cliente_lob_ts 
  datafile '/unam-bda/d13/datafiles/CESAPROY/cliente_lob_df_01.dbf' size 80m
    reuse
    autoextend on 
    next 1m  
    maxsize unlimited
  extent management local autoallocate;
  
-- ESTE SE VA A BORRAR MUY PROBABLEMENTE
Prompt creando undo_cliente_ts
drop tablespace undo_cliente_ts including contents;
create undo tablespace undo_cliente_ts 
  datafile '/unam-bda/d13/datafiles/CESAPROY/undo_cliente_df_01.dbf' size 30m
    reuse
    autoextend on 
    maxsize unlimited
  extent management local autoallocate;

Prompt creando temp_cliente_ts
--drop tablespace temp_cliente_ts including contents;
create temporary tablespace temp_cliente_ts 
  tempfile '/unam-bda/d13/datafiles/CESAPROY/temp_cliente_df_01.dbf' size 30m
    reuse
    autoextend on 
    maxsize unlimited
  extent management local uniform size 512k;




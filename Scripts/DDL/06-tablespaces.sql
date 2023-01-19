
connect sys/systemgym as sysdba;

create tablespace empleado_ts 
  datafile '/unam-bda/d11/datafiles/CEPROYSA/empleado_df_01.dbf' size 20m, 
    '/unam-bda/d12/datafiles/CEPROYSA/empleado_df_02.dbf' size 20m, 
    '/unam-bda/d13/datafiles/CEPROYSA/empleado_df_03.dbf' size 20m
    reuse
    autoextend on 
    maxsize unlimited
  extend management local autoallocate;

create bigfile tablespace gimnasio_lob_ts 
  datafile '/unam-bda/d13/datafiles/CEPROYSA/biometricos_df_01.dbf' size 100m
    reuse
    autoextend on 
    next 1m  
    maxsize unlimited
  extend management local autoallocate;

create tablespace gimnasio_ts 
  datafile '/unam-bda/d11/datafiles/CEPROYSA/gimnasio_df_01.dbf' size 20m, 
    '/unam-bda/d12/datafiles/CEPROYSA/gimnasio_df_02.dbf' size 20m, 
    '/unam-bda/d13/datafiles/CEPROYSA/gimnasio_df_03.dbf' size 20m
    reuse
    autoextend on 
    maxsize unlimited
  extend management local autoallocate;

create tablespace emp_gim_idxs_ts 
  datafile '/unam-bda/d11/datafiles/CEPROYSA/empleado_idx_df_01.dbf' size 10m, 
    '/unam-bda/d12/datafiles/CEPROYSA/empleado_idx_df_02.dbf' size 10m, 
    '/unam-bda/d13/datafiles/CEPROYSA/empleado_idx_df_03.dbf' size 10m
    reuse
    autoextend on 
    maxsize unlimited
  extend management local autoallocate;

create tablespace cliente_ts 
  datafile '/unam-bda/d11/datafiles/CEPROYSA/cliente_df_01.dbf' size 20m, 
    '/unam-bda/d12/datafiles/CEPROYSA/cliente_df_02.dbf' size 20m, 
    '/unam-bda/d13/datafiles/CEPROYSA/cliente_df_01.dbf' size 20m
    reuse
    autoextend on 
    maxsize unlimited
  extend management local autoallocate;

create tablespace cliente_idxs_ts 
  datafile '/unam-bda/d11/datafiles/CEPROYSA/cliente_idx_df_01.dbf' size 10m, 
    '/unam-bda/d12/datafiles/CEPROYSA/cliente_idx_df_02.dbf' size 10m, 
    '/unam-bda/d13/datafiles/CEPROYSA/cliente_idx_df_03.dbf' size 10m
    reuse
    autoextend on 
    maxsize unlimited
  extend management local autoallocate;

create bigfile tablespace cliente_lob_ts 
  datafile '/unam-bda/d13/datafiles/CEPROYSA/biometricos_df_01.dbf' size 100m
    reuse
    autoextend on 
    next 1m  
    maxsize unlimited
  extend management local autoallocate;

create undo tablespace undo_cliente_ts 
  datafile '/unam-bda/d13/datafiles/CEPROYSA/undo_cliente_df_01.dbf' size 30m
    reuse
    autoextend on 
    maxsize unlimited
  extend management local autoallocate;

create temporary tablespace temp_cliente_ts 
  tempfile '/unam-bda/d13/datafiles/CEPROYSA/temp_cliente_df_01.dbf' size 30m
    reuse
    autoextend on 
    maxsize unlimited
  extend management local autoallocate;




whenever sqlerror exit rollback;

Prompt Cargando datos
CONNECT GIMNASIO_USR/gimnasio123
@s-12-catalogos.sql
@s-12-carga-empleado.sql
@s-12-carga-biometrico.sql
@s-12-carga-admin-instr.sql
@s-12-carga-gim-mul.sql

--CONNECT CLIENTE_USR/cliente123
--@s-12-carga-cliente.sql
--@s-12-carga-medida-sensor.sql
--@s-12-carga-credencial.sql

--CONNECT GIMNASIO_USR/gimnasio123
--@s-12-carga-sala.sql

--CONNECT CLIENTE_USR/cliente123
--@s-12-carga-sesion.sql
--@s-12-muchos-muchos.sql
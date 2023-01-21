--@Autor: Brandon Cervantes , Josmar Sandoval
--@Fecha creación: 19/01/2023
--@Descripción: Script para configurar el modo compartido


whenever sqlerror exit rollback;

--Conectando con sys
Prompt conectando como usuario sys
connect sys/systemgym as sysdba


Prompt configuracion previa
show parameter shared_servers;
show parameter dispatchers;
-- 5 shared_servers (conexiones concurrentes) por cada dispatcher
alter system set shared_servers = 30 scope=both;
alter system set dispatchers='(dispatchers=6)(protocol=tcp)' scope=both;

Prompt configuracion actual
show parameter shared_servers;
show parameter dispatchers;

Prompt actualizando configuracion del listener
alter system register;

Prompt mostrando lista de servicios en el listener
!lsnrctl services

select program,pid,pname
from v$process
where pname like'S0%'
or pname like 'D0%'
order by program;


--select server, status, username, port
--from v$session 
--where username = 'SYS' and type = 'USER';
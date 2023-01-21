
CONNECT GIMNASIO_USR/gimnasio123
drop table ADMINISTRADOR cascade constraints; --
drop table APARATO cascade constraints; --
drop table BIOMETRICO cascade constraints; --
drop table DISCIPLINA cascade constraints; --
drop table DISCIPLINA_SALA cascade constraints; --*
drop table EMPLEADO cascade constraints; --
drop table GIMNASIO cascade constraints; --
drop table INSTRUCTOR cascade constraints; --
drop table MULTIMEDIA cascade constraints; --
drop table PUESTO cascade constraints; --
drop table SALA cascade constraints; --
drop table STATUS_APARATO cascade constraints; --
drop table STATUS_APARATO_HISTORICO cascade constraints; --*
drop table TIPO_APARATO cascade constraints; --
drop table URL_INSTRUCTOR cascade constraints; --

CONNECT CLIENTE_USR/cliente123
drop table SENSOR cascade constraints; --
drop table SESION cascade constraints; --*
drop table SESION_SENSOR cascade constraints; --*
drop table CALORIAS_SESION cascade constraints; --*
drop table CLIENTE cascade constraints; --
drop table MEDIDA cascade constraints; --
drop table CLIENTE_GIMNASIO cascade constraints; --*
drop table CREDENCIAL cascade constraints; --


#!/bin/bash
# @Autor Brandon Cervantes, Josmar Sandoval
# @Fecha 01/09/2022
# @Descripcion Creación de directorios para la base

export ORACLE_SID=CESAPROY

echo Creacion de directorio para Data Files
mkdir -p /unam-bda/d11/datafiles
cd /unam-bda/d11/datafiles
mkdir ${ORACLE_SID^^}
chown oracle:oinstall ${ORACLE_SID^^}
chmod 750 ${ORACLE_SID^^}

mkdir -p /unam-bda/d12/datafiles
cd /unam-bda/d12/datafiles
mkdir ${ORACLE_SID^^}
chown oracle:oinstall ${ORACLE_SID^^}
chmod 750 ${ORACLE_SID^^}

mkdir -p /unam-bda/d13/datafiles
cd /unam-bda/d13/datafiles
mkdir ${ORACLE_SID^^}
chown oracle:oinstall ${ORACLE_SID^^}
chmod 750 ${ORACLE_SID^^}

echo "Creacion de directorios para Redo Logs y Control Files"
cd /unam-bda/d14/
mkdir -p ctrl_files_redo/CESAPROY/
chown -R oracle:oinstall ctrl_files_redo
chmod -R 750 ctrl_files_redo

cd /unam-bda/d15
mkdir -p ctrl_files_redo/CESAPROY/
chown -R oracle:oinstall ctrl_files_redo
chmod -R 750 ctrl_files_redo

cd /unam-bda/d16
mkdir -p ctrl_files_redo/CESAPROY/
chown -R oracle:oinstall ctrl_files_redo
chmod -R 750 ctrl_files_redo

cd /unam-bda 
mkdir -p fast_reco_area/CESAPROY
chown -R oracle:oinstall fast_reco_area
chmod -R 750 fast_reco_area

echo "Mostrando directorio de data files"
ls -l /unam-bda/d11/
ls -l /unam-bda/d12/
ls -l /unam-bda/d13/

echo "Mostrando directorios para control files y Redo Logs"
ls -l /unam-bda/d1*/ctrl_files_redo/


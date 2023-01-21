#!/bin/bash
# @Autor Brandon Cervantes
# @Fecha 18/09/2022
# @Descripcion Creación de un PFILE

echo "1. Creando un archivo de parámetros básico"
export ORACLE_SID=cesaproy
pfile=$ORACLE_HOME/dbs/init${ORACLE_SID}.ora

if [ -f "${pfile}" ]; then
  read -p "El archivo ${pfile} ya existe, [enter] para sobrescribir"
fi;

echo \
"db_name='${ORACLE_SID}'
memory_target=1024M
control_files=(
/unam-bda/d14/ctrl_files_redo/${ORACLE_SID^^}/control01.ctl,
/unam-bda/fast_reco_area/CESAPROY/control02.ctl,
/unam-bda/d15/ctrl_files_redo/${ORACLE_SID^^}/control03.ctl
)" >$pfile

echo "Listo"
echo "Comprobando la existencia y contenido del PFILE"
echo ""

cat ${pfile}
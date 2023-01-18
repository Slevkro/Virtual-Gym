#/bin/bash
#@Autor: Brandon Cervantes Rubí
#@Fecha creación: 17/08/2022
#@Descripción: Creacion del archivo de passwords

echo "CREANDO ARCHIVO DE PASSWORDS"

echo "CONFIGURANDO ORACLE_SID"
export ORACLE_SID=CEPROYSA

ehco "ORACLE_SID=${ORACLE_SID}"

echo "CREANDO ARCHIVO DE PASSWORD, SE SOBREESCRIBE SI EXISTE"
orapwd FORCE=Y \
  FILE='${ORACLE_HOME}/dbs/orapw${ORACLE_SID}' \
  FORMAT=12.2 \
  SYS=password

echo "COMPROBANDO LA CREACION DEL ARCHIVO"
ls -l ${ORACLE_HOME}/dbs/orapw${ORACLE_SID}

#!/bin/bash

SET=OEORGANICEPRINTS
ROOT=/home/workflow
METADATA=${ROOT}/repository/LOM/

INPUTDIR=${METADATA}/${SET}
OUTPUTDIR=${ROOT}/repository/LOM_PROC/${SET}


cd ${INPUTDIR}
for lom in *.xml
do
  cat ${lom} | \
  sed 's/<location>/<location><![CDATA[/'  | \
  sed 's/<\/location>/]]><\/location>/' > ${OUTPUTDIR}/${lom}
done
echo "Done!"

#!/bin/bash

SET=oeorganiceprints
ROOT=/home/workflow
METADATA=${ROOT}/dataflows/010ingestion/metadata

INPUTDIR=${METADATA}/050postprocessed/${SET}
OUTPUTDIR=${METADATA}/060available/${SET}
BROKENDIR=${METADATA}/061broken/${SET}
RULESDIR=/home/workflow/java/agrolinkchecker

JAVA=/usr/bin/java
LINKCHECKER=${ROOT}/java/agrolinkchecker/agro-linkchecker-1.0-SNAPSHOT.jar

${JAVA} -jar ${LINKCHECKER} -errorFolder ${BROKENDIR} -format akif -mode live -rootFolder ${INPUTDIR} -rulesPath ${RULESDIR} -successFolder ${OUTPUTDIR}


echo "Done!"

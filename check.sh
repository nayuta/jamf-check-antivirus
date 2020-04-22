#!/bin/bash

# Add Antivirus info ("AV_NAME AV_PKG_IDENTIFIER")
# You can check package identifier with `pkgutil --pkgs`
AV_LIST=(
# "BitDefender com.bitdefender.antivirusformac"
"ESET com.eset.esetEndpointAntivirus"
"Mcafee com.mcafee.virusscan"
"Avast com.avast.AACM"
"CrowdStrikeFalcon com.crowdstrike.falcon.sensor"
)

for _item in "${AV_LIST[@]}"
do
  item=($_item)

  if [ $(pkgutil --pkgs | grep ${item[1]} | wc -l) -ge 1 ]; then
    RESULT=${RESULT}${item[0]},
  fi
done

RESULT=`echo $RESULT | sed 's/\,*$//'`

if [ -n $RESULT ]; then
  RESULT='NO ANTIVIRUS DETECTED'
fi

echo "<result>$RESULT</result>"

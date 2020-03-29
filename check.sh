#!/bin/bash

# Add Antivirus info ("AV_NAME AV_PKG_IDENTIFIER")
# You can check package identifier with `pkgutil --pkgs`
AV_LIST=(
"BitDefender com.bitdefender.antivirusformac"
"ESET com.eset.esetEndpointAntivirus"
"Mcafee com.mcafee.virusscan"
"Avast com.avast.AACM"
)

RESULT="No Antivirus Detected"

for _item in "${AV_LIST[@]}"
do
  item=($_item)

  if [ $(pkgutil --pkgs | grep ${item[1]} | wc -l) -eq 1 ]; then
    RESULT=${item[0]}
  fi
done

echo "<result>$RESULT</result>"

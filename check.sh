#!/bin/bash

# Add Antivirus info ("AV_NAME AV_PATH AV_TEAM_IDENTIFIER")
# You can check team identifier like `codesign -d -v /Library/Bitdefender/AVP/BDLDaemon`
AV_LIST=(
"BitDefender /Library/Bitdefender/AVP/BDLDaemon GUNFMW623Y"
)

RESULT="No Antivirus Detected"

check_team_identifier() {
  test `codesign -d -v $1 2>&1 | grep TeamIdentifier | awk -F= '{print $2}'` == $2
}

for _item in "${AV_LIST[@]}"
do
  item=($_item)

  if [ -f ${item[1]} ]; then
    check_team_identifier ${item[1]} ${item[2]}
    if [ $? -eq 0 ]; then
      RESULT=${item[0]}
    fi
  fi
done

echo "<result>$RESULT</result>"

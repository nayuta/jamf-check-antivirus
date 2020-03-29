# jamf-check-antivirus

Detect installed antivirus software by package list.

## Usage

Create new extension attribute with script at Jamf Pro, and paste code from **check.sh**

## Add Antivirus Software

1. Get package identifier of the antivirus software: `pkgutil --pkgs`
2. Add item in *AV_LIST*: "AV_NAME PACKAGE_IDENTIFIER"

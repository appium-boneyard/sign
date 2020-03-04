#!/bin/bash

set -ex

version=0.0.1-SNAPSHOT
if [[ -n "$1" ]]; then
  version=$1
fi

awk "NR==1,/<version>.+<\/version>/{sub(/<version>.+<\/version>/, \"<version>$version<\/version>\")} 1" pom.xml > pom_new.xml
mv -f pom_new.xml pom.xml
mvn clean
mvn package
mvn -DmainClass=orig.SignApk -DnamePrefix=signapk package

#!/bin/bash
mvn package
cp ./target/apks-0.0.1-SNAPSHOT.jar ./dist/sign.jar
zip -d ./dist/sign.jar META-INF*

cp ./dist/sign.jar ./dist/signapk.jar


cd ./signapk_jar/
zip ./../dist/signapk.jar ./META-INF/MANIFEST.MF

cd ..
cd ./sign_jar/
zip ./../dist/sign.jar ./META-INF/MANIFEST.MF

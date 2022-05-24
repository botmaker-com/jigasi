#!/bin/sh

#rm -fR target/

#mvn -Dmaven.test.skip clean install

cp target/jigasi-1.1-SNAPSHOT.jar ./jigasi.jar
cp java-libs/aspectjrt-1.9.7.jar java-libs/aspectjweaver-1.9.7.jar ./

gcloud builds submit

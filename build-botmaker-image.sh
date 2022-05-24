#!/bin/sh

#rm -fR target/

#mvn -Dmaven.test.skip clean install

cp target/jigasi-1.1-SNAPSHOT.jar ./jigasi.jar

gcloud builds submit

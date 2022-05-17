#!/bin/sh

rm -fR ./file.java target/
mvn  -Dmaven.test.skip clean install

cp target/jigasi-1.1-SNAPSHOT.jar ./file.java

gcloud builds submit

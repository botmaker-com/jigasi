#!/bin/sh

mvn -Dmaven.test.skip clean install

cp target/jigasi-1.1-SNAPSHOT.jar ./jigasi.jar

cp src/output.alaw ./output.alaw

gcloud builds submit

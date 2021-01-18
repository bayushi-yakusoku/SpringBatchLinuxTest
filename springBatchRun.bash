#!/usr/bin/bash

JAR_FILE=$(find . -name "SpringBatchHelloWorld*.jar" -printf "%T@#%Tc#%p\n" \
           | sort -n \
           | cut -d# -f3 \
           | tail -1)
JAR_PARAMETERS="fileName=toto.csv name=pouf executionDate(date)=2021/01/18"

echo "Start Java"
echo "Jar selected : $JAR_FILE"
echo "Parameters   : $JAR_PARAMETERS"
echo
java -jar $JAR_FILE $JAR_PARAMETERS

echo
echo "End of script"


#!/bin/sh
# Script to load log4j2 jars and configuration from extras dir

# The log4j2 jars required to run
LOG4J2_JARS="log4j-core-2.5.0.redhat-2.jar log4j-api-2.5.0.redhat-2.jar log4j-jul-2.5.0.redhat-2.jar"
# Load LogManager from log4j-jul
LOGGING_MANAGER="-Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager"
# Point to extras/log4j2.properties for default properties
JAVA_OPTS="$JAVA_OPTS -Dlog4j.configurationFile=$CATALINA_HOME/extras/log4j2.properties"

# Add the log4j2 jars to the classpath
for j in $LOG4J2_JARS; do
    if [ -r "$CATALINA_HOME/extras/$j" ] ; then
        CLASSPATH="$CLASSPATH:$CATALINA_HOME/extras/$j"
    else
        echo "$CATALINA_HOME/extras/$j not found. Log4j2 was not loaded, exiting..."
        exit 1
    fi
done


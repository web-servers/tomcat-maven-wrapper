This is a maven wrapper for the tomcat ant build which allows you to build tomcat with maven. It uses the AntRun plugin and the assembly plugin to create a distribution, but also installs each of the jars and their sources separately.

We had a need to produce a tomcat build with a maven system, so I wrote a wrapper to do so. This project by itself is useless, but drop the pom.xml and mvn-modules dir into tomcat (this builds with 8.5.13) and it will produce maven artifacts and a handful of zips.

In addition to the bin distribution (e.g. tomcat-build-8.5.13-dist.zip), this project produces the following artifacts:

* tomcat-build-8.5.13-docs.zip
* tomcat-build-8.5.13-embed.zip
* tomcat-build-8.5.13-examples.zip
* tomcat-build-8.5.13-src.zip

The docs.zip includes the javadocs for the APIs (like the ASF fulldocs zip), the embed.zip includes the tomcat embedded jars, the examples.zip includes the examples webapps, and the src.zip includes all of the sources from this directory excluding the poms, output dir, and the mvn-modules dir. All of these unzip into the same basedir (e.g. apache-tomcat-8.5.13), so you can unzip them all in place to recreate the full tomcat distribution.

One thing that is included here that isn't in the ASF at all is the log4j2 libraries; they're in the extras dir that this build creates in the dist.zip along with a log4j2.properties example (which presently isn't working) and a setenv.sh script to allow you to use them all in place.

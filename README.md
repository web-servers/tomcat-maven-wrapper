This is a maven wrapper for the tomcat ant build which allows you to build tomcat with maven. It uses the AntRun plugin and the assembly plugin to create a distribution, but also installs each of the jars and their sources separately.

We had a need to produce a tomcat build with a maven system, so I wrote a wrapper to do so. To use the project, copy the pom.xml and mvn-modules directory into your tomcat sources directory (this builds with 8.5.13), apply the maven-build-with-ant.patch to the build.xml (which adds the ant jar to the compile classpath), then build with `mvn package`. The package goal produces individual jars and sources jars in each of the child modules and also creates a handful of zip files containing the build artifacts in the build module.

In addition to the bin distribution (e.g. tomcat-8.5.13.zip), this project produces the following artifacts:

* tomcat-8.5.13-docs.zip
* tomcat-8.5.13-embed.zip
* tomcat-8.5.13-examples.zip
* tomcat-8.5.13-src.zip

The docs.zip includes the javadocs for the APIs (like the ASF fulldocs zip), the embed.zip includes the tomcat embedded jars, the examples.zip includes the examples webapps, and the src.zip includes all of the sources from this directory excluding the parent pom, output dir, and the mvn-modules dir. All of these unzip into the same basedir (e.g. apache-tomcat-8.5.13), so you can unzip them all in place to recreate the full tomcat distribution.

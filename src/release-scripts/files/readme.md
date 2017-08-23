Sample Release letter of version xy
=============================

## Install modules

* Copy files opencms/*.zip to {TOMCAT_HOME}/webapps/{WEBAPPNAME}/WEB-INF/packages/modules/
* Check if owner and group of all jars in `{TOMCAT_HOME}/webapps/{WEBAPPNAME}{WEBAPPNAME}/WEB-INF/lib` are `{TOMCAT_USER}`.
* Install Modules
    * my.module.one_1.0.zip
    * my.modul.two_1.0.zip

## Import content

* Copy file opencms/db-export/example.zip to {TOMCAT_HOME}/webapps/{WEBAPPNAME}/WEB-INF/packages/
* Change site to /
* Import file (OpenCms Database import from server) example.zip
* Publish folder 'example'

## Configuration

* Stop Tomcat and do following configurations:

    * rm -R {TOMCAT_HOME}/work/Catalina/localhost/{WEBAPPNAME}/
    * Copy `version.properties` to `{TOMCAT_HOME}/webapps/{WEBAPPNAME}/WEB-INF/classes/org/opencms/main`
* Start Tomcat

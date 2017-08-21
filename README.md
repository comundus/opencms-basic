OpenCms Basic - Maven based OpenCms
===================================

This project may be used as a template for developing OpenCms projects using the [(OpenCms)VFS Maven Plugin](https://opencms-maven.comundus.com/).

Create database
--------------- 
in MySQL with:
CREATE DATABASE opencms DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;

Changes in $MAVEN_HOME/settings.xml
-----------------------------------
This is a one-time-change. It does not have to be done for every OpenCms project.

Repositories:

		<repositories>
			<repository>
				<id>maven-vfs-plugin-github</id>
				<url>https://comundus.github.io/maven2-repository</url>
			</repository>
		</repositories>
		<pluginRepositories>
			<pluginRepository>
				<id>maven-vfs-plugin-github</id>
				<url>https://comundus.github.io/maven2-repository</url>
				<snapshots>
					<enabled>false</enabled>
				</snapshots>
			</pluginRepository>
		</pluginRepositories>
    

Declare plugin group:
    
    <pluginGroups>
        <pluginGroup>com.comundus.maven</pluginGroup>
    </pluginGroups>
    
    
Project configuration
---------------------

You may want to start by changing the tags **groupId**, **version** and maybe **name**, **url** and the contents of 
**distributionManagement**, as well as **developers** and **scm** (Or remove it, if it is not needed) in all POM files:

* pom.xml
* parent/general-pom.xml
* parent/pom.xml
* webapp/pom.xml
* system/pom.xml
* content/pom.xml
* orgunits/pom.xml

Afterwards, some configuration can be done in the `<properties>` in **parent/pom.xml**:

* `opencms.db.user`
* `opencms.db.password`
* `opencms.db.name`
* `opencms.webapp.path`
* `java.version`





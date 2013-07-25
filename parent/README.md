Create database
--------------- 
in MySQL with:
CREATE DATABASE opencms DEFAULT CHARACTER SET utf8;

Changes in $MAVEN_HOME/settings.xml
-----------------------------------

Plugin repository:

    <pluginRepositories>
        <pluginRepository>
            <id>comundus-github</id>
	        <url>https://raw.github.com/comundus/maven2-repository/master</url>
        </pluginRepository>
    </pluginRepositories>

Declare plugin group:
    
    <pluginGroups>
        <pluginGroup>com.comundus.maven</pluginGroup>
    </pluginGroups>
    